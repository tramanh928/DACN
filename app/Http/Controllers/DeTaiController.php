<?php

namespace App\Http\Controllers;

use App\Models\DeTai;
use Illuminate\Http\Request;

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

    // Cập nhật thông tin đề tài
    public function update(Request $request, DeTai $detai)
    {
        $validated = $request->validate([
            'TenDeTai' => 'required|string|max:255',
            'MaGV'     => 'nullable|string|exists:GiangVien,MaGV',
            'SoLuong'  => 'required|integer|min:1',
            'TrangThai'=> 'required|string|in:Mở,Đóng,Chờ',
        ]);

        $detai->update($validated);

        return $detai->load('giangVien');
    }

    // Xóa một đề tài
    public function destroy(DeTai $detai)
    {
        $detai->delete();
        return ['message' => 'Đề tài đã được xóa thành công!'];
    }
}
