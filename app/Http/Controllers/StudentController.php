<?php

namespace App\Http\Controllers;

use App\Models\SinhVien;
use Illuminate\Http\Request;
use App\Exports\StudentsExport;
use Maatwebsite\Excel\Facades\Excel;

class StudentController extends Controller
{
    // List all students with both lecturers and topic names
    public function index()
    {
        return SinhVien::with(['giangVienHuongDan', 'giangVienPhanBien', 'deTai'])->get()->map(function($s) {
            return [
                'mssv'               => $s->MSSV,
                'name'               => $s->Ho_va_Ten,
                'group'              => $s->Nhom,
                'topic'              => $s->deTai ? $s->deTai->TenDT : '',
                'email'              => $s->email,
                'phone'              => $s->sdt,
                'lecturer'           => $s->giangVienHuongDan ? $s->giangVienHuongDan->Ho_va_Ten : '',
                'reviewer'           => $s->giangVienPhanBien ? $s->giangVienPhanBien->Ho_va_Ten : '',
                'status'             => $s->Da_phan_cong ? 'Đã phân công' : 'Chưa phân công',
            ];
        });
    }

    // Get single student
    public function show(SinhVien $student)
    {
        return $student->load(['giangVienHuongDan', 'giangVienPhanBien', 'deTai']);
    }

    // Create student
    public function store(Request $request)
    {
        $data = $request->validate([
            'MSSV'                 => 'required|string|unique:SinhVien,MSSV',
            'Ho_va_Ten'            => 'required|string|max:120',
            'email'                => 'nullable|email|unique:SinhVien,email',
            'sdt'                  => 'nullable|string|max:15',
            'Ngay_Sinh'            => 'nullable|date',
            'Lop'                  => 'nullable|string|max:50',
            'Nhom'                 => 'nullable|string|max:50',
            'MaDT'                 => 'nullable|string|exists:DeTai,MaDT',
            'Giang_vien_huong_dan' => 'nullable|string|exists:GiangVien,MaGV',
            'Giang_vien_phan_bien' => 'nullable|string|exists:GiangVien,MaGV',
            'Da_phan_cong'         => 'nullable|boolean',
        ]);

        return SinhVien::create($data);
    }

    // Update student
    public function update(Request $request, SinhVien $student)
    {
        $data = $request->validate([
            'MSSV'                 => 'required|string|unique:SinhVien,MSSV,' . $student->MSSV . ',MSSV',
            'Ho_va_Ten'            => 'required|string|max:120',
            'email'                => 'nullable|email|unique:SinhVien,email,' . $student->MSSV . ',MSSV',
            'sdt'                  => 'nullable|string|max:15',
            'Ngay_Sinh'            => 'nullable|date',
            'Lop'                  => 'nullable|string|max:50',
            'Nhom'                 => 'nullable|string|max:50',
            'MaDT'                 => 'nullable|string|exists:DeTai,MaDT',
            'Giang_vien_huong_dan' => 'nullable|string|exists:GiangVien,MaGV',
            'Giang_vien_phan_bien' => 'nullable|string|exists:GiangVien,MaGV',
            'Da_phan_cong'         => 'nullable|boolean',
        ]);

        $student->update($data);

        return $student->load(['giangVienHuongDan', 'giangVienPhanBien', 'deTai']);
    }

    // Delete student
    public function destroy(SinhVien $student)
    {
        return $student->delete();
    }

    // Export students to Excel
    public function export()
    {
        return Excel::download(new StudentsExport, 'DSSV.xlsx');
    }
}
