<?php

namespace App\Http\Controllers;

use App\Models\DeTai;
use Illuminate\Http\Request;

class DeTaiController extends Controller
{
    /**
     * Display a listing of all DeTai.
     */
    public function index()
    {
        // Get all records
        $detais = DeTai::All();
        return response()->json($detais);
    }

    /**
     * Store a newly created DeTai.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'MaDeTai' => 'required|unique:de_tais,MaDeTai|max:50',
            'TenDeTai' => 'required|string|max:255',
            'MoTa' => 'nullable|string',
            'GiangVien' => 'nullable|integer',
            'SoLuong' => 'required|integer|min:1',
            'TrangThai' => 'required|string|max:100',
        ]);

        $detai = DeTai::create($validated);

        return response()->json([
            'message' => 'Đề tài đã được thêm thành công!',
            'data' => $detai
        ], 201);
    }

    /**
     * Display the specified DeTai.
     */
    public function show($id)
    {
        $detai = DeTai::findOrFail($id);
        return response()->json($detai);
    }

    /**
     * Update the specified DeTai.
     */
    public function update(Request $request, $id)
    {
        $detai = DeTai::findOrFail($id);

        $validated = $request->validate([
            'TenDeTai' => 'required|string|max:255',
            'MoTa' => 'nullable|string',
            'GiangVien' => 'nullable|integer',
            'SoLuong' => 'required|integer|min:1',
            'TrangThai' => 'required|string|max:100',
        ]);

        $detai->update($validated);

        return response()->json([
            'message' => 'Cập nhật đề tài thành công!',
            'data' => $detai
        ]);
    }

    /**
     * Remove the specified DeTai.
     */
    public function destroy($id)
    {
        $detai = DeTai::findOrFail($id);
        $detai->delete();

        return response()->json(['message' => 'Đề tài đã được xóa thành công!']);
    }
}
