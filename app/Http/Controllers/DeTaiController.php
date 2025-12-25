<?php

namespace App\Http\Controllers;

use App\Models\DeTai;
use Illuminate\Http\Request;
use App\Models\SinhVien;
use Illuminate\Support\Facades\DB;


class DeTaiController extends Controller
{
    // Liệt kê tất cả đề tài
    public function index()
    {
        return DeTai::with('giangVien')->get()->map(function($d) {
            return [
                'MaDT'     => $d->MaDT,
                'TenDeTai' => $d->TenDeTai,
                'MaGV'     => $d->MaGV,
                'GiangVien'=> $d->MaGV ? $d->giangVien->Ho_va_Ten : '',
                'MaGVPB'   => $d->MaGVPB,
                'GiangVienPhanBien' => $d->MaGVPB ? $d->giangVienPhanBien->Ho_va_Ten : '',
                'TrangThai'=> $d->TrangThai,
                'MoTa'     => $d->MoTa,
            ];
        });
    }

    public function getTopicsByTeacher($MaGV)
    {
        return DeTai::where('MaGV', $MaGV)->with('giangVien')->get()->map(function($d) {
            return [
                'MaDT'     => $d->MaDT,
                'TenDeTai' => $d->TenDeTai,
                'MaGV'     => $d->MaGV,
                'GiangVien'=> $d->MaGV ? $d->giangVien->Ho_va_Ten : '',
                'MaGVPB'   => $d->MaGVPB,
                'GiangVienPhanBien' => $d->MaGVPB ? $d->giangVienPhanBien->Ho_va_Ten : '',
                'TrangThai'=> $d->TrangThai,
                'MoTa'     => $d->MoTa,
            ];
        });
    }

    public function getTopicsByReviewTeacher($MaGV)
    {
        return DeTai::where('MaGVPB', $MaGV)->with('giangVien')->get()->map(function($d) {
            return [
                'MaDT'     => $d->MaDT,
                'TenDeTai' => $d->TenDeTai,
                'MaGV'     => $d->MaGV,
                'GiangVien'=> $d->MaGV ? $d->giangVien->Ho_va_Ten : '',
                'MaGVPB'   => $d->MaGVPB,
                'GiangVienPhanBien' => $d->MaGVPB ? $d->giangVienPhanBien->Ho_va_Ten : '',
                'TrangThai'=> $d->TrangThai,
                'MoTa'     => $d->MoTa,
            ];
        });
    }

    // Hiển thị thông tin một đề tài
    public function show(DeTai $detai)
    {
        return $detai->load('giangVien');
    }

    // Tạo mới đề tài
    public function store(Request $request)
    {
        $validated = $request->validate([
            'MaDT'    => 'required|string|unique:DeTai,MaDT',
            'TenDeTai'    => 'required|string|max:255',
            'MaGV'     => 'nullable|string|exists:GiangVien,MaGV',
        ]);
        return DeTai::create($validated);
    }

    private function generateMaDT()
    {
        do {
            $number = str_pad(rand(1, 100), 2, '0', STR_PAD_LEFT); // makes 01, 02, 099, 1234
            $maDT = 'DT' . $number;
        } while (DeTai::where('MaDT', $maDT)->exists());

        return $maDT;
    }

public function saveTopic(Request $request)
{
    // =============================
    // VALIDATION
    // =============================
    $request->validate([
        'MSSV'      => 'required|string|exists:SinhVien,MSSV',
        'TenDT'     => 'required|string',
        'MoTa'      => 'nullable|string',
        'TrangThai' => 'required|string',
        'MaGV'      => 'required|string|exists:GiangVien,MaGV',
    ]);

    // =============================
    // LẤY SINH VIÊN
    // =============================
    $student = SinhVien::where('MSSV', $request->MSSV)->first();
    if (!$student) {
        return response()->json(['message' => 'Sinh viên không tồn tại'], 404);
    }

    // LẤY CÁC THÀNH VIÊN CÙNG NHÓM
    $groupMembers = SinhVien::where('Nhom', $student->Nhom)->get();

    $hasOldTopic = !empty($student->MaDT);

    // =============================
    // TÌM ĐỀ TÀI TRÙNG TÊN
    // =============================
    $existingTopic = DeTai::where('TenDeTai', $request->TenDT)->first();

    $mustCreateNew = false;

    if ($existingTopic) {
        // 1. Đề tài đã đủ 2 SV
        $countSV = SinhVien::where('MaDT', $existingTopic->MaDT)->count();
        if ($countSV >= 2) {
            $mustCreateNew = true;
        }

        // 2. Khác giảng viên hướng dẫn
        if ($existingTopic->MaGV !== $request->MaGV) {
            $mustCreateNew = true;
        }
    }

    // =============================
    // TRANSACTION
    // =============================
    return DB::transaction(function () use (
        $student,
        $groupMembers,
        $hasOldTopic,
        $existingTopic,
        $mustCreateNew,
        $request
    ) {

        // =================================================
        // CASE 1: NHÓM CHƯA CÓ ĐỀ TÀI
        // =================================================
        if (!$hasOldTopic) {

            // Tạo đề tài mới
            if (!$existingTopic || $mustCreateNew) {
                $newTopic = DeTai::create([
                    'MaDT'      => $this->generateMaDT(),
                    'TenDeTai'  => $request->TenDT,
                    'MoTa'      => $request->MoTa,
                    'TrangThai' => $request->TrangThai,
                    'MaGV'      => $request->MaGV,
                ]);

                foreach ($groupMembers as $sv) {
                    $sv->update(['MaDT' => $newTopic->MaDT]);
                }

                return response()->json([
                    'message' => 'Tạo đề tài mới và gán cho nhóm thành công',
                    'data'    => $newTopic
                ]);
            }

            // Dùng lại đề tài cũ
            foreach ($groupMembers as $sv) {
                $sv->update(['MaDT' => $existingTopic->MaDT]);
            }

            return response()->json([
                'message' => 'Gán đề tài đã tồn tại cho nhóm thành công',
                'data'    => $existingTopic
            ]);
        }

        // =================================================
        // CASE 2: NHÓM ĐÃ CÓ ĐỀ TÀI
        // =================================================
        $oldTopic = DeTai::where('MaDT', $student->MaDT)->first();
        if (!$oldTopic) {
            return response()->json(['message' => 'Không tìm thấy đề tài cũ'], 404);
        }

        // Có đề tài trùng tên
        if ($existingTopic) {

            // Phải tạo đề tài mới
            if ($mustCreateNew) {
                $newTopic = DeTai::create([
                    'MaDT'      => $this->generateMaDT(),
                    'TenDeTai'  => $request->TenDT,
                    'MoTa'      => $request->MoTa,
                    'TrangThai' => $request->TrangThai,
                    'MaGV'      => $request->MaGV,
                ]);

                foreach ($groupMembers as $sv) {
                    $sv->update(['MaDT' => $newTopic->MaDT]);
                }

                return response()->json([
                    'message' => 'Đề tài cũ đầy hoặc khác GV — tạo đề tài mới',
                    'data'    => $newTopic
                ]);
            }

            // Chuyển sang đề tài đã tồn tại
            foreach ($groupMembers as $sv) {
                $sv->update(['MaDT' => $existingTopic->MaDT]);
            }

            return response()->json([
                'message' => 'Chuyển nhóm sang đề tài đã tồn tại thành công',
                'data'    => $existingTopic
            ]);
        }

        // =================================================
        // CASE 3: ĐỔI TÊN / CẬP NHẬT ĐỀ TÀI CŨ
        // =================================================
        $oldTopic->update([
            'TenDeTai'  => $request->TenDT,
            'MoTa'      => $request->MoTa,
            'MaGV'      => $request->MaGV,
            'TrangThai' => $request->TrangThai,
        ]);

        return response()->json([
            'message' => 'Cập nhật đề tài cho nhóm thành công',
            'data'    => $oldTopic
        ]);
    });
}

    public function assignReviewer(Request $request, $MaDT)
    {
        $detai = DeTai::where('MaDT', $MaDT)->firstOrFail();

        $validated = $request->validate([
            'MaGVPB' => 'required|string|exists:GiangVien,MaGV',
        ]);

        $detai->MaGVPB = $validated['MaGVPB'];
        $detai->save();

        return response()->json([
            'message' => 'Phân công giảng viên phản biện thành công',
            'data'    => $detai->load('giangVienPhanBien')
        ]);
    }

    // Cập nhật thông tin đề tài
   public function update(Request $request, $MaDT)
    {
            $detai = DeTai::where('MaDT', $MaDT)->firstOrFail();
        {
            $validated = $request->validate([
                'TenDeTai' => 'required|string|max:255',
                'MaGV'     => 'nullable|string|exists:GiangVien,MaGV',
            ]);

            $detai->update($validated);

            return $detai->load('giangVien');
        }
    }

    // Xóa một đề tài
     public function destroy(Request $request)
    {
        $detai = DeTai::where('MaDT', $request->MaDT)->firstOrFail();
        return $detai->delete();
    }
}
