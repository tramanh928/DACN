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

        // Clear temp + import Excel
        TempImportModel::truncate();
        Excel::import(new TempImport, $request->file('file'));

        DB::transaction(function () {

            // Clear old data
            DB::table('sinhvien')->delete();
            DB::table('giangvien')->delete();
            DB::table('detai')->delete();

            /**
             * ======================================================
             * 1. BUILD UNIQUE GIANG VIEN (GVHD + GVPB)
             * ======================================================
             */
            $uniqueGvNames = TempImportModel::query()
                ->select('GVHD as name')
                ->whereNotNull('GVHD')->where('GVHD', '!=', '')
                ->union(
                    TempImportModel::query()
                        ->select('GVPB as name')
                        ->whereNotNull('GVPB')->where('GVPB', '!=', '')
                )
                ->pluck('name')
                ->map(fn($v) => trim($v))
                ->filter()
                ->unique()
                ->values()
                ->all();

            $giangvienInserts = [];
            $usedMaGVs = [];

            foreach ($uniqueGvNames as $name) {
                $email = $this->generateEmailFromName($name);
                $user = User::where('email', $email)->first();
                $maGV = $this->generateMaGVForName($name, $usedMaGVs);

                $tempRow = TempImportModel::where('GVHD', $name)
                    ->orWhere('GVPB', $name)
                    ->first();

                $giangvienInserts[] = [
                    'MaGV' => $maGV,
                    'Ho_va_Ten' => $name,
                    'HocVi' => $tempRow->HocVi ?? null,
                    'NoiCongTac' => $tempRow->NoiCongTac ?? null,
                    'sdt' => null,
                    'So_luong_sinh_vien' => 0,
                    'email' => $email,
                    'user_id' => $user?->id,
                    'created_at' => now(),
                    'updated_at' => now(),
                ];
            }

            // Insert giangvien
            foreach (array_chunk($giangvienInserts, 500) as $chunk) {
                DB::table('giangvien')->insert($chunk);
            }

            /**
             * ======================================================
             * 2. MAP TEN GV -> MaGV
             * ======================================================
             */
            $gvMap = DB::table('giangvien')
                ->pluck('MaGV', 'Ho_va_Ten')
                ->toArray();

            /**
             * ======================================================
             * 3. IMPORT DETAI + SINHVIEN (CHUNK)
             * ======================================================
             */
            $topicGroupMap = [];
            $usedMaDTs = [];

            TempImportModel::chunk(500, function ($rows) use ($gvMap, &$topicGroupMap, &$usedMaDTs) {

                $detaiBatch = [];
                $sinhvienBatch = [];

                foreach ($rows as $row) {

                    // === GVHD + GVPB ===
                    $maGVHD = $gvMap[trim((string)$row->GVHD)] ?? null;
                    $maGVPB = $gvMap[trim((string)$row->GVPB)] ?? null;

                    // === GROUP KEY ===
                    $nhom = trim((string)$row->Nhom);
                    if ($nhom !== '') {
                        $key = 'NHOM::' . strtolower(Str::ascii($nhom));
                    } else {
                        $key = 'TOPIC::' . strtolower(Str::ascii(trim((string)$row->TenDeTai)));
                    }

                    // === DETAI ===
                    if (!isset($topicGroupMap[$key])) {

                        $baseMaDT = $this->generateMaDTForKey($key);
                        $finalMaDT = $baseMaDT;
                        $i = 1;

                        while (isset($usedMaDTs[$finalMaDT]) || DeTai::where('MaDT', $finalMaDT)->exists()) {
                            $finalMaDT = $baseMaDT . $i++;
                        }

                        $topicGroupMap[$key] = $finalMaDT;
                        $usedMaDTs[$finalMaDT] = true;

                        $detaiBatch[] = [
                            'MaDT' => $finalMaDT,
                            'TenDeTai' => $row->TenDeTai,
                            'MoTa' => $row->MoTa,
                            'TrangThai' => $row->TrangThai,
                            'MaGV' => $maGVHD,   // GVHD
                            'MaGVPB' => $maGVPB, // ✅ GVPB
                            'created_at' => now(),
                            'updated_at' => now(),
                        ];
                    }

                    $maDT = $topicGroupMap[$key];

                    // === SINH VIEN ===
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
                        'Giang_vien_huong_dan' => $maGVHD,
                        'MaDT' => $maDT,
                        'Diem' => $row->Diem,
                        'GhiChu' => $row->GhiChu,
                        'user_id' => null,
                        'created_at' => now(),
                        'updated_at' => now(),
                    ];
                }

                if (!empty($detaiBatch)) {
                    DB::table('detai')->insert($detaiBatch);
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
