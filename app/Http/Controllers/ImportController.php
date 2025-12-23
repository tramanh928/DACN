<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Maatwebsite\Excel\Facades\Excel;

use App\Imports\TempImport;
use App\Models\TempImport as TempImportModel;
use App\Models\SinhVien;
use App\Models\GiangVien;
use App\Models\DeTai;
use App\Models\User;

class ImportController extends Controller
{
    private function generateEmailFromName(string $name): string
    {
        $ascii = strtolower(Str::ascii(trim($name)));
        $parts = preg_split('/\s+/', $ascii, -1, PREG_SPLIT_NO_EMPTY);

        if (count($parts) < 2) {
            return "{$ascii}@stu.edu.vn";
        }

        $last = array_pop($parts);
        $first = implode('', $parts);

        return "{$last}.{$first}@stu.edu.vn";
    }

    /**
     * Deterministic MaDT generator based on a key (short, stable).
     */
    private function generateMaDTForKey(string $key): string
    {
        $norm = strtolower(Str::ascii(trim($key)));
        $hex = strtoupper(substr(dechex(crc32($norm)), 0, 4)); // 4 hex chars
        $prefix = 'DT';
        $candidate = null;
        $suffix = 0;

        do {
            $candidate = $prefix . $hex . ($suffix ? (string)$suffix : '');
            $exists = DeTai::where('MaDT', $candidate)->exists();
            $suffix++;
        } while ($exists);

        return $candidate;
    }

    /**
     * Deterministic MaGV generator based on lecturer name.
     */
    private function generateMaGVForName(string $name, array &$usedMaGVs): string
    {
        $norm = strtolower(Str::ascii(trim($name)));
        $hex = strtoupper(substr(dechex(crc32($norm)), 0, 3)); // 3 hex chars
        $prefix = 'GV';
        $candidateBase = $prefix . $hex;

        $candidate = $candidateBase;
        $suffix = 0;

        while (isset($usedMaGVs[$candidate]) || GiangVien::where('MaGV', $candidate)->exists()) {
            $suffix++;
            $candidate = $candidateBase . $suffix;
        }

        $usedMaGVs[$candidate] = true;
        return $candidate;
    }

    public function import(Request $request)
    {
        try {
            if (!$request->hasFile('file')) {
                return response()->json(['error' => 'Không có file được tải lên'], 400);
            }

            set_time_limit(0);
            DB::connection()->disableQueryLog();

            // import into temp table
            TempImportModel::truncate();
            Excel::import(new TempImport, $request->file('file'));

            DB::transaction(function () {
                // clear old data
                DB::table('sinhvien')->delete();
                DB::table('giangvien')->delete();
                DB::table('detai')->delete();

                // build unique giangvien names from temp
                $uniqueGvNames = TempImportModel::query()
                    ->whereNotNull('GVHD')->where('GVHD', '!=', '')
                    ->select('GVHD')
                    ->distinct()
                    ->pluck('GVHD')
                    ->map(fn($v) => trim($v))
                    ->filter()
                    ->values()
                    ->all();

                // prepare giangvien inserts with deterministic MaGV and in-memory uniqueness
                $giangvienInserts = [];
                $usedMaGVs = []; // associative map to avoid duplicates within this run

                foreach ($uniqueGvNames as $name) {
                    $email = $this->generateEmailFromName($name);

                    $user = User::where('email', $email)->first();
                    $maGV = $this->generateMaGVForName($name, $usedMaGVs);

                    $giangvienInserts[] = [
                        'MaGV' => $maGV,
                        'Ho_va_Ten' => $name,
                        'HocVi' => null,
                        'NoiCongTac' => null,
                        'sdt' => null,
                        'So_luong_sinh_vien' => 0,
                        'email' => $email,
                        'user_id' => $user->id,
                        'created_at' => now(),
                        'updated_at' => now(),
                    ];
                }

                // batch insert giangvien (defensive: remove duplicates inside the batch)
                if (!empty($giangvienInserts)) {
                    $seen = [];
                    $filtered = [];
                    foreach ($giangvienInserts as $g) {
                        if (isset($seen[$g['MaGV']])) {
                            continue;
                        }
                        $seen[$g['MaGV']] = true;
                        $filtered[] = $g;
                    }
                    foreach (array_chunk($filtered, 500) as $chunk) {
                        DB::table('giangvien')->insert($chunk);
                    }
                }

                // build map name -> MaGV
                $gvMap = DB::table('giangvien')->select('MaGV', 'Ho_va_Ten')->get()
                    ->pluck('MaGV', 'Ho_va_Ten')->toArray();

                // global map to ensure one DeTai per group (Nhom)
                // KEY RULE: group by Nhom only. If Nhom is empty, fallback to TenDeTai-based key.
                $topicGroupMap = []; // key => MaDT
                $usedMaDTs = []; // track MaDTs generated in-memory

                // process temp in chunks
                TempImportModel::chunk(500, function ($rows) use ($gvMap, &$topicGroupMap, &$usedMaDTs) {
                    $detaiBatch = [];
                    $sinhvienBatch = [];

                    foreach ($rows as $row) {
                        $gvName = trim((string)$row->GVHD);
                        $maGV = $gvMap[$gvName] ?? null;

                        // Primary grouping key: Nhom (group)
                        $nhomRaw = trim((string)$row->Nhom);

                        if ($nhomRaw !== '') {
                            // normalize group key
                            $key = 'NHOM::' . strtolower(Str::ascii($nhomRaw));
                        } else {
                            // fallback: if Nhom is empty, use TenDeTai to avoid merging unrelated blank groups
                            $tenDeTai = trim((string)$row->TenDeTai);
                            $key = 'TOPICFALLBACK::' . strtolower(Str::ascii($tenDeTai));
                        }

                        // Determine MaDT for this key
                        if (isset($topicGroupMap[$key])) {
                            $maDT = $topicGroupMap[$key];
                        } else {
                            // Generate deterministic candidate based on the key
                            $candidate = $this->generateMaDTForKey($key);

                            // If candidate collides with in-memory used ids or DB, append suffix
                            $suffix = 1;
                            $final = $candidate;
                            while (isset($usedMaDTs[$final]) || DeTai::where('MaDT', $final)->exists()) {
                                $final = $candidate . $suffix;
                                $suffix++;
                            }
                            $maDT = $final;

                            // register
                            $topicGroupMap[$key] = $maDT;
                            $usedMaDTs[$maDT] = true;

                            // add detai entry for this unique group key
                            $detaiBatch[] = [
                                'MaDT' => $maDT,
                                'TenDeTai' => $row->TenDeTai,
                                'MoTa' => $row->MoTa,
                                'TrangThai' => $row->TrangThai,
                                'MaGV' => $maGV,
                                'created_at' => now(),
                                'updated_at' => now(),
                            ];
                        }

                        $email = $row->Email;
                        if (!$email || !str_contains($email, '@')) {
                            $email = strtolower($row->MSSV) . '@student.stu.edu.vn';
                        }

                        $sinhvienBatch[] = [
                            'MSSV' => $row->MSSV,
                            'Ho_va_Ten' => $row->HoTenSV,
                            'Lop' => $row->Lop,
                            'sdt' => $row->SDT ?: null,
                            'email' => $email,
                            'HuongDeTai' => $row->HuongDeTai,
                            'Nhom' => $row->Nhom,
                            'Giang_vien_huong_dan' => $maGV,
                            'MaDT' => $maDT,
                            'Diem' => $row->Diem,
                            'GhiChu' => $row->GhiChu,
                            'user_id' => null,
                            'created_at' => now(),
                            'updated_at' => now(),
                        ];
                    }

                    // ensure no duplicate MaDT inside detaiBatch (defensive)
                    if (!empty($detaiBatch)) {
                        $seen = [];
                        $filtered = [];
                        foreach ($detaiBatch as $d) {
                            if (isset($seen[$d['MaDT']])) {
                                continue;
                            }
                            $seen[$d['MaDT']] = true;
                            $filtered[] = $d;
                        }
                        if (!empty($filtered)) {
                            DB::table('detai')->insert($filtered);
                        }
                    }

                    if (!empty($sinhvienBatch)) {
                        DB::table('sinhvien')->insert($sinhvienBatch);
                    }
                });
            });

            return response()->json(['message' => 'Import & sync dữ liệu thành công']);
        } catch (\Throwable $e) {
            Log::error('Import failed', ['error' => $e->getMessage()]);
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
