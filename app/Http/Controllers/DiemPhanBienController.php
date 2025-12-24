<?php

namespace App\Http\Controllers;

use App\Models\DiemPhanBien;
use Illuminate\Http\Request;

class DiemPhanBienController extends Controller
{
    public function index()
    {
        return response()->json(DiemPhanBien::all());
    }

    public function show($id)
    {
        return response()->json(DiemPhanBien::findOrFail($id));
    }
    public function showByMSSV($mssv)
    {
        return response()->json(
            DiemPhanBien::where('MSSV', $mssv)->firstOrFail()
        );
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'MSSV'        => 'required|string|max:20',

            'pttk'        => 'nullable|numeric',
            'tkvd'        => 'nullable|numeric',
            'htvd'        => 'nullable|numeric',
            'ktsp'        => 'nullable|numeric',
            'tong'        => 'nullable|numeric',

            'danh_gia'    => 'nullable|string',

            'dieu_chinh'  => 'nullable|string',
            'uu'          => 'nullable|string',
            'nhuoc'       => 'nullable|string',
            'cau_hoi'     => 'nullable|string',

            'bao_ve'      => 'nullable|string',

            'ghi_chu'     => 'nullable|string',
        ]);

        $record = DiemPhanBien::updateOrCreate(
            ['MSSV' => $data['MSSV']],
            $data
        );

        return response()->json($record, 201);
    }
 
    public function update(Request $request, $id)
    {
        $record = DiemPhanBien::findOrFail($id);

        $data = $request->validate([
            'MSSV'        => 'sometimes|string|max:20',

            'pttk'        => 'nullable|numeric',
            'tkvd'        => 'nullable|numeric',
            'htvd'        => 'nullable|numeric',
            'ktsp'        => 'nullable|numeric',
            'tong'        => 'nullable|numeric',

            'danh_gia'    => 'nullable|string',

            'dieu_chinh'  => 'nullable|string',
            'uu'          => 'nullable|string',
            'nhuoc'       => 'nullable|string',
            'cau_hoi'     => 'nullable|string',

            'bao_ve'      => 'nullable|string',

            'ghi_chu'     => 'nullable|string',
        ]);

        $record->update($data);

        return response()->json($record);
    }

    public function destroy($id)
    {
        DiemPhanBien::findOrFail($id)->delete();

        return response()->json([
            'message' => 'Deleted successfully'
        ]);
    }
}
