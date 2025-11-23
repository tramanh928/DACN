<?php

namespace App\Http\Controllers;

use App\Models\SinhVien;
use Illuminate\Http\Request;
use App\Exports\StudentsExport;
use Maatwebsite\Excel\Facades\Excel;

class StudentController extends Controller
{
    // Liệt kê tất cả sinh viên
    public function index()
    {
        return SinhVien::with(['giangVienHuongDan', 'deTai'])->get()->map(function($s) {
            return [
                'mssv'               => $s->MSSV,
                'name'               => $s->Ho_va_Ten,
                'Lop'                => $s->Lop,
                'group'              => $s->Nhom,
                'topic'              => $s->deTai ? $s->deTai->TenDT : '',
                'email'              => $s->email,
                'phone'              => $s->sdt,
                'lecturer'           => $s->giangVienHuongDan ? $s->giangVienHuongDan->Ho_va_Ten : '',
                'status'             => $s->deTai ? $s->deTai->TrangThai : '-',
                'score'              => $s->Diem,
                'note'               => $s->GhiChu,
            ];
        });
    }

    // Hiển thị thông tin một sinh viên
    public function show(SinhVien $student)
    {
        return $student->load(['giangVienHuongDan', 'deTai']);
    }

    public function getStudentsByTeacher(Request $request, $MaGV)
    {
        return SinhVien::where('Giang_vien_huong_dan', $MaGV)->get()->map(function($s) {
            return [
                'mssv'               => $s->MSSV,
                'name'               => $s->Ho_va_Ten,
                'Lop'                => $s->Lop,
                'group'              => $s->Nhom,
                'topic'              => $s->deTai ? $s->deTai->TenDeTai : '',
                'description'        => $s->deTai ? $s->deTai->MoTa : '',
                'email'              => $s->email,
                'phone'              => $s->sdt,
                'lecturer'           => $s->giangVienHuongDan ? $s->giangVienHuongDan->Ho_va_Ten : '',
                'status'             => $s->deTai ? $s->deTai->TrangThai : '-',
                'score'              => $s->Diem,
                'note'               => $s->GhiChu,
            ];
        });
    }

    // Tạo mới sinh viên
    public function store(Request $request)
    {
        $data = $request->validate([
            'MSSV'                 => 'required|string|unique:SinhVien,MSSV',
            'Ho_va_Ten'            => 'required|string|max:120',
            'email'                => 'nullable|email|unique:SinhVien,email',
            'sdt'                  => 'nullable|string|max:15',
            'Lop'                  => 'nullable|string|max:50',
            'Nhom'                 => 'nullable|string|max:50',
            'MaDT'                 => 'nullable|string|exists:DeTai,MaDT',
            'Giang_vien_huong_dan' => 'nullable|string|exists:GiangVien,MaGV',
        ]);

        return SinhVien::create($data);
    }

    // Cập nhật thông tin sinh viên
   public function update(Request $request, $MSSV)
    {
        $student = SinhVien::where('MSSV', $MSSV)->firstOrFail();

        $data = $request->validate([
            'Ho_va_Ten'            => 'required|string|max:120',
            'email'                => 'nullable|email|unique:SinhVien,email,' . $student->MSSV . ',MSSV',
            'sdt'                  => 'nullable|string|max:15',
            'Lop'                  => 'nullable|string|max:50',
            'Nhom'                 => 'nullable|string|max:50',
            'MaDT'                 => 'nullable|string|exists:DeTai,MaDT',
            'Giang_vien_huong_dan' => 'nullable|string|exists:GiangVien,MaGV',
        ]);

        $student->update($data);

        return $student->load(['giangVienHuongDan', 'deTai']);
    }

    public function updateScore(Request $request)
    {
        $data = $request->validate([
            'Diem' => 'required|numeric|min:0|max:100',
            'MSSV' => 'required|string|exists:SinhVien,MSSV',
        ]);
        $MSSV = $request->MSSV;
        $student = SinhVien::where('MSSV', $MSSV)->firstOrFail();
        $student->update($data);
        return $student->load(['giangVienHuongDan', 'deTai']);
    }

    public function updateNote(Request $request)
    {
        $data = $request->validate([
            'GhiChu' => 'nullable|string|max:255',
            'MSSV' => 'required|string|exists:SinhVien,MSSV',
        ]);
        $MSSV = $request->MSSV;
        $student = SinhVien::where('MSSV', $MSSV)->firstOrFail();
        $student->update($data);
        return $student->load(['giangVienHuongDan', 'deTai']);
    }


    public function edit(Request $request, $MSSV)
    {
        $student = SinhVien::where('MSSV', $MSSV)->firstOrFail();
        $data = $request->validate([
            'Giang_vien_huong_dan' => 'required|string|exists:GiangVien,MaGV'
        ]);
        $student->update($data);
        return $student->load(['giangVienHuongDan', 'deTai']);
    }

    //Tạo nhóm, gộp nhóm sinh viên
    public function updateStudentGroup(Request $request){
        $data = $request->validate([
            'mssv' => 'required|string|exists:SinhVien,MSSV',
            'group' => 'required|string|max:50',
        ]);

        $mssv = $request->mssv;
        $group = $request->group;

        $student = SinhVien::where('MSSV', $mssv)->first();
        if (!$student) {
            return response()->json(['error' => 'Sinh viên không tồn tại'], 404);
        }

        $sameGroup = SinhVien::where('Nhom', $group)->get();

        // CASE 1: group empty → OK
        if ($sameGroup->count() === 0) {
            $student->Nhom = $group;
            $student->save();
            return response()->json(['success' => true]);
        }

        // Check if same Giang Vien Huong Dan
        foreach ($sameGroup as $sv) {
            if ($sv->Giang_vien_huong_dan !== $student->Giang_vien_huong_dan) {
                return response()->json([
                    'error' => 'Nhóm này thuộc giảng viên khác!'
                ], 400);
            }
        }

        // Check if group already full (max 2 members)
        if ($sameGroup->count() >= 2) {
            return response()->json([
                'error' => 'Nhóm này đã đủ 2 thành viên!'
            ], 400);
        }

        // If everything is OK → update
        $student->Nhom = $group;
        $student->save();

        return response()->json(['success' => true]);
    }

    // Xóa một sinh viên
    public function destroy(Request $request)
    {
        $student = SinhVien::where('MSSV', $request->mssv)->firstOrFail();
        return $student->delete();
    }

    // Xuất danh sách sinh viên ra file Excel
    public function export()
    {
        return Excel::download(new StudentsExport, 'DSSV.xlsx');
    }
}
