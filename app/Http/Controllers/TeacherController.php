<?php

namespace App\Http\Controllers;

use App\Models\GiangVien;
use Illuminate\Http\Request;
use App\Exports\TeachersExport;
use Maatwebsite\Excel\Facades\Excel;

class TeacherController extends Controller
{
    // List all teachers
    public function index()
    {
        return GiangVien::all()->map(function ($teacher) {
            return [
                'MaGV' => $teacher->MaGV,
                'name' => $teacher->Ho_va_Ten,
                'email' => $teacher->email,
                'So_luong_sinh_vien' => $teacher->So_luong_sinh_vien ?? 0,
            ];
        });
    }

    // Show a single teacher
    public function show(GiangVien $teacher)
    {
        return $teacher;
    }

    // Create a new teacher
    public function store(Request $request)
    {
        $data = $request->validate([
            'MaGV'               => 'required|string|unique:GiangVien,MaGV',
            'Ho_va_Ten'          => 'required|string|max:120',
            'email'              => 'nullable|email|unique:GiangVien,email',
            'sdt'                => 'nullable|string|max:15',
            'Ngay_Sinh'          => 'nullable|date',
            'So_luong_sinh_vien' => 'nullable|integer|min:0',
        ]);

        return GiangVien::create($data);
    }

    // Update a teacher
    public function update(Request $request, GiangVien $teacher)
    {
        $data = $request->validate([
            'MaGV'               => 'required|string|unique:GiangVien,MaGV,' . $teacher->MaGV . ',MaGV',
            'Ho_va_Ten'          => 'required|string|max:120',
            'email'              => 'nullable|email|unique:GiangVien,email,' . $teacher->MaGV . ',MaGV',
            'sdt'                => 'nullable|string|max:15',
            'Ngay_Sinh'          => 'nullable|date',
            'So_luong_sinh_vien' => 'nullable|integer|min:0',
        ]);

        $teacher->update($data);

        return $teacher;
    }

    // Delete a teacher
    public function destroy(GiangVien $teacher)
    {
        return $teacher->delete();
    }

    // Optional: Export teachers to Excel
    public function export()
    {
        return Excel::download(new TeachersExport, 'GiangVien.xlsx');
    }
}