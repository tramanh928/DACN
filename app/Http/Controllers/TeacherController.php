<?php

namespace App\Http\Controllers;

use App\Models\GiangVien;
use Illuminate\Http\Request;
use App\Exports\TeachersExport;
use Maatwebsite\Excel\Facades\Excel;

class TeacherController extends Controller
{
    // Liệt kê tất cả giáo viên
    public function index()
    {
        return GiangVien::all()->map(function ($teacher) {
            return [
                'MaGV' => $teacher->MaGV,
                'name' => $teacher->Ho_va_Ten,
                'email' => $teacher->email,
                'So_luong_sinh_vien' => $teacher->So_luong_sinh_vien ?? 0,
                'sdt'   => $teacher->sdt ?? '-',
            ];
        });
    }

    // Hiển thị thông tin một giáo viên
    public function show(GiangVien $teacher)
    {
        return $teacher;
    }

    public function getTeacherById(Request $request, $user_id)
    {
        $teacher = GiangVien::where('user_id', $user_id)->firstOrFail();
        return $teacher;
    }

    // Tạo mới giáo viên
    private function generateUniqueMaGV()
    {
        do {
            $number = rand(0, 99); 
            $maGV = 'GV' . $number;
        } while (GiangVien::where('MaGV', $maGV)->exists());

        return $maGV;
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'name'  => 'required|string|max:120',
            'email' => 'nullable|email|unique:GiangVien,email',
            'sdt'   => 'nullable|string|max:15',
        ]);

        $data['Ho_va_Ten'] = $data['name'];
        unset($data['name']);

        $data['MaGV'] = $this->generateUniqueMaGV();

        return GiangVien::create($data);
    }


    // Cập nhật thông tin giáo viên
    public function update(Request $request, $MaGV)
    {
        $teacher = GiangVien::where('MaGV', $MaGV)->firstOrFail();

        $data = $request->validate([
            'Ho_va_Ten' => 'required|string|max:120',
            'email'     => 'nullable|email|unique:GiangVien,email,' . $teacher->MaGV . ',MaGV',
            'sdt'       => 'nullable|string|max:15',
        ]);

        $teacher->update($data);

        return $teacher;
    }


    // Xóa một giáo viên
    public function destroy(Request $request)
    {
        $teacher = GiangVien::where('MaGV', $request->MaGV)->firstOrFail();
        return $teacher->delete();
    }

    // Xuất danh sách giáo viên ra file Excel
    public function export()
    {
        return Excel::download(new TeachersExport, 'GiangVien.xlsx');
    }
}