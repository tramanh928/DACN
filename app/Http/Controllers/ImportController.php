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

class ImportController extends Controller
{
    private function generateEmailFromName(string $name): string
    {
        $ascii = Str::ascii($name);
        $ascii = strtolower(trim($ascii));

        $parts = preg_split('/\s+/', $ascii, -1, PREG_SPLIT_NO_EMPTY);

        if (count($parts) < 2) {
            return "{$ascii}@stu.edu.vn";
        }

        $lastName = array_pop($parts);        
        $firstNames = implode('', $parts);   

        $lastName = preg_replace('/[^a-z0-9]/', '', $lastName);
        $firstNames = preg_replace('/[^a-z0-9]/', '', $firstNames);

        return "{$lastName}.{$firstNames}@stu.edu.vn";
    }

    public function import(Request $request)
    {
        try {
            if (!$request->hasFile('file')) {
                return response()->json(['error' => 'Không có file được tải lên'], 400);
            }

            $file = $request->file('file');

            TempImportModel::truncate();

            Excel::import(new TempImport, $file);

            DB::transaction(function () {

                DB::table('sinhvien')->delete();
                DB::table('giangvien')->delete();


                $giangViens = TempImportModel::select('GVHD')
                    ->whereNotNull('GVHD')
                    ->where('GVHD', '!=', '')
                    ->distinct()
                    ->get();

                $counter = 1;
                foreach ($giangViens as $g) {
                    $gvName = trim($g->GVHD);
                    if ($gvName === '') continue;

                    $email = $this->generateEmailFromName($gvName);

                    $baseEmail = $email;
                    $dup = 1;
                    while (GiangVien::where('email', $email)->exists()) {
                        $email = str_replace('@stu.edu.vn', "{$dup}@stu.edu.vn", $baseEmail);
                        $dup++;
                    }

                    GiangVien::create([
                        'MaGV' => 'GV' . $counter,
                        'Ho_va_Ten' => $gvName,
                        'email' => $email,
                        'sdt' => null,
                        'So_luong_sinh_vien' => 0,
                        'user_id' => null,
                    ]);

                    $counter++;
                }

                $students = TempImportModel::all();

                foreach ($students as $s) {
                    $gv = GiangVien::where('Ho_va_Ten', trim($s->GVHD))->first();

                    $email = trim($s->Email);
                    if ($email === '' || $email === '#N/A' || $email === null || !str_contains($email, '@')) {
                        $email = strtolower($s->MSSV) . '@student.stu.edu.vn';
                    }

                    $sdt = trim($s->SDT);
                    if ($sdt === '' || $sdt === '#N/A' || $sdt === null) {
                        $sdt = null;
                    }

                    SinhVien::create([
                        'MSSV' => $s->MSSV,
                        'Ho_va_Ten' => $s->HoTenSV,
                        'Lop' => $s->Lop,
                        'sdt' => $sdt,
                        'email' => $email,
                        'HuongDeTai' => $s->HuongDeTai,
                        'Nhom' => $s->Nhom,
                        'Giang_vien_huong_dan' => $gv ? $gv->MaGV : null,
                        'Da_phan_cong' => 1,
                        'user_id' => null, 
                    ]);
                }
            });

            return response()->json([
                'message' => 'File imported and data synchronized successfully!',
            ]);

        } catch (\Throwable $e) {
            Log::error('Import failed', [
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString(),
            ]);

            return response()->json([
                'error' => 'Import failed: ' . $e->getMessage(),
            ], 500);
        }
    }
}
