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
                'group'              => $s->Nhom,
                'topic'              => $s->deTai ? $s->deTai->TenDT : '',
                'email'              => $s->email,
                'phone'              => $s->sdt,
                'lecturer'           => $s->giangVienHuongDan ? $s->giangVienHuongDan->Ho_va_Ten : '',
                'status'             => $s->Da_phan_cong ? 'Đã phân công' : 'Chưa phân công',
            ];
        });
    }

    // Hiển thị thông tin một sinh viên
    public function show(SinhVien $student)
    {
        return $student->load(['giangVienHuongDan', 'deTai']);
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
