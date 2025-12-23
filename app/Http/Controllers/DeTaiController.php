<?php

namespace App\Http\Controllers;

use App\Models\DeTai;
use Illuminate\Http\Request;
use App\Models\SinhVien;

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
                'SoLuong'  => $d->SoLuong,
                'TrangThai'=> $d->TrangThai,
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
                'SoLuong'  => $d->SoLuong,
                'TrangThai'=> $d->TrangThai,
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
                'SoLuong'  => $d->SoLuong,
                'TrangThai'=> $d->TrangThai,
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
        $request->validate([
            'MSSV'      => 'required|string|exists:SinhVien,MSSV',
            'TenDT'     => 'required|string',
            'MoTa'      => 'nullable|string',
            'TrangThai' => 'required|string',
            'MaGV'      => 'required|string'
        ]);

        $student = SinhVien::where('MSSV', $request->MSSV)->first();
        $groupMembers = SinhVien::where('Nhom', $student->Nhom)->get();
        $hasOldTopic = $student->MaDT !== null;

        // Check existing topic by name
        $existingTopic = DeTai::where('TenDeTai', $request->TenDT)->first();

        // Check constraints
        $mustCreateNew = false;

        if ($existingTopic) {

            // 1) If topic already has 2 students → must create new
            $countSV = SinhVien::where('MaDT', $existingTopic->MaDT)->count();
            if ($countSV >= 2) {
                $mustCreateNew = true;
            }

            // 2) If topic has different MaGV → must create new
            if ($existingTopic->MaGV !== $request->MaGV) {
                $mustCreateNew = true;
            }
        }

        // -----------------------------------
        // CASE 1: Student has NO topic yet
        // -----------------------------------
        if (!$hasOldTopic) {

            if (!$existingTopic || $mustCreateNew) {

                // Create new topic
                $newTopic = DeTai::create([
                    'MaDT'      => $this->generateMaDT(),
                    'TenDeTai'  => $request->TenDT,
                    'MoTa'      => $request->MoTa,
                    'TrangThai' => $request->TrangThai,
                    'MaGV'      => $request->MaGV
                ]);

                // Assign to group
                foreach ($groupMembers as $sv) {
                    $sv->MaDT = $newTopic->MaDT;
                    $sv->save();
                }

                return response()->json([
                    'message' => 'Tạo đề tài mới và gán cho nhóm thành công',
                    'data'    => $newTopic
                ]);
            }

            // Else: use existing topic
            foreach ($groupMembers as $sv) {
                $sv->MaDT = $existingTopic->MaDT;
                $sv->save();
            }

            return response()->json([
                'message' => 'Gán đề tài đã tồn tại cho nhóm thành công',
                'data'    => $existingTopic
            ]);
        }

        // -----------------------------------
        // CASE 2: Student ALREADY has topic
        // -----------------------------------
        $oldTopic = DeTai::where('MaDT', $student->MaDT)->first();

        if ($existingTopic) {

            if ($mustCreateNew) {
                // Create new instead of using full topic
                $newTopic = DeTai::create([
                    'MaDT'      => $this->generateMaDT(),
                    'TenDeTai'  => $request->TenDT,
                    'MoTa'      => $request->MoTa,
                    'TrangThai' => $request->TrangThai,
                    'MaGV'      => $request->MaGV
                ]);

                foreach ($groupMembers as $sv) {
                    $sv->MaDT = $newTopic->MaDT;
                    $sv->save();
                }

                return response()->json([
                    'message' => 'Đề tài cũ đầy hoặc khác GV — Tạo đề tài mới',
                    'data'    => $newTopic
                ]);
            }

            // Otherwise assign existing
            foreach ($groupMembers as $sv) {
                $sv->MaDT = $existingTopic->MaDT;
                $sv->save();
            }

            return response()->json([
                'message' => 'Chuyển nhóm sang đề tài đã tồn tại thành công',
                'data'    => $existingTopic
            ]);
        }

        // If topic name not exist → rename old
        $oldTopic->TenDeTai = $request->TenDT;
        $oldTopic->MoTa     = $request->MoTa;
        $oldTopic->MaGV     = $request->MaGV;
        $oldTopic->save();

        return response()->json([
            'message' => 'Cập nhật tên đề tài cho nhóm thành công',
            'data'    => $oldTopic
        ]);
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
