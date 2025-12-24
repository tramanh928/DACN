<?php

namespace App\Http\Controllers;

use App\Models\DiemHuongDan;
use Illuminate\Http\Request;

class DiemHuongDanController extends Controller
{
    public function index()
    {
        return response()->json(DiemHuongDan::all());
    }

    public function show($id)
    {
        return response()->json(DiemHuongDan::findOrFail($id));
    }
    public function showByMSSV($mssv)
    {
        return response()->json(
            DiemHuongDan::where('MSSV', $mssv)->firstOrFail()
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

        $record = DiemHuongDan::updateOrCreate(
            ['MSSV' => $data['MSSV']],
            $data
        );

        return response()->json($record, 201);
    }
 
    public function update(Request $request, $id)
    {
        $record = DiemHuongDan::findOrFail($id);

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
        DiemHuongDan::findOrFail($id)->delete();

        return response()->json([
            'message' => 'Deleted successfully'
        ]);
    }
}
