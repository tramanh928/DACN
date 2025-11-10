<?php

namespace App\Http\Controllers;

use App\Models\DeTai;
use Illuminate\Http\Request;

class DeTaiController extends Controller
{
    // List all DeTai
    public function index()
    {
        return DeTai::with('giangVien')->get()->map(function($d) {
            return [
                'MaDT'     => $d->MaDT,
                'TenDeTai' => $d->TenDT,
                'GiangVien'=> $d->giangVien ? $d->giangVien->Ho_va_Ten : '',
                'SoLuong'  => $d->SoLuong,
                'TrangThai'=> $d->TrangThai,
            ];
        });
    }

    // Show single DeTai
    public function show(DeTai $detai)
    {
        return $detai->load('giangVien');
    }

    // Store new DeTai
    public function store(Request $request)
    {
        $validated = $request->validate([
            'MaDT'     => 'required|string|unique:DeTai,MaDT|max:50',
            'TenDT'    => 'required|string|max:255',
            'MaGV'     => 'nullable|string|exists:GiangVien,MaGV',
            'SoLuong'  => 'required|integer|min:1',
            'TrangThai'=> 'required|string|in:Mở,Đóng,Chờ',
        ]);

        return DeTai::create($validated);
    }

    // Update existing DeTai
    public function update(Request $request, DeTai $detai)
    {
        $validated = $request->validate([
            'TenDT'    => 'required|string|max:255',
            'MaGV'     => 'nullable|string|exists:GiangVien,MaGV',
            'SoLuong'  => 'required|integer|min:1',
            'TrangThai'=> 'required|string|in:Mở,Đóng,Chờ',
        ]);

        $detai->update($validated);

        return $detai->load('giangVien');
    }

    // Delete DeTai
    public function destroy(DeTai $detai)
    {
        $detai->delete();
        return ['message' => 'Đề tài đã được xóa thành công!'];
    }
}
