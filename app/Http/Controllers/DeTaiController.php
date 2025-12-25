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

    // CASE 1: Student already has a topic → just update allowed fields
    if ($hasOldTopic) {
        $oldTopic = DeTai::find($student->MaDT);

        // Only update fields like TrangThai or MoTa (not TenDT or MaGV)
        $oldTopic->TrangThai = $request->TrangThai;
        if ($request->MoTa) {
            $oldTopic->MoTa = $request->MoTa;
        }
        $oldTopic->save();

        return response()->json([
            'message' => 'Cập nhật đề tài thành công',
            'data' => $oldTopic
        ]);
    }

    // CASE 2: Student does NOT have a topic yet
    $existingTopic = DeTai::where('TenDeTai', $request->TenDT)->first();
    $mustCreateNew = false;

    if ($existingTopic) {
        // Create new only if topic is full or has a different advisor
        $countSV = SinhVien::where('MaDT', $existingTopic->MaDT)->count();
        if ($countSV >= 2 || $existingTopic->MaGV !== $request->MaGV) {
            $mustCreateNew = true;
        }
    }

    if (!$existingTopic || $mustCreateNew) {
        // Create new topic
        $newTopic = DeTai::create([
            'MaDT'     => $this->generateMaDT(),
            'TenDeTai' => $request->TenDT,
            'MoTa'     => $request->MoTa,
            'TrangThai'=> $request->TrangThai,
            'MaGV'     => $request->MaGV
        ]);

        foreach ($groupMembers as $sv) {
            $sv->MaDT = $newTopic->MaDT;
            $sv->save();
        }

        return response()->json([
            'message' => 'Tạo đề tài mới và gán cho nhóm thành công',
            'data' => $newTopic
        ]);
    }

    // Use existing topic
    foreach ($groupMembers as $sv) {
        $sv->MaDT = $existingTopic->MaDT;
        $sv->save();
    }

    return response()->json([
        'message' => 'Gán đề tài đã tồn tại cho nhóm thành công',
        'data' => $existingTopic
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
