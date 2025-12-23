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

    public function store(Request $request)
    {
        $data = $request->validate([
            'MSSV' => 'required|string|max:20',
            'pttk' => 'nullable|numeric',
            'tkvd' => 'nullable|numeric',
            'htvd' => 'nullable|numeric',
            'ktsp' => 'nullable|numeric',
            'tong' => 'nullable|numeric',
        ]);

        $record = DiemHuongDan::create($data);

        return response()->json($record, 201);
    }

    public function update(Request $request, $id)
    {
        $record = DiemHuongDan::findOrFail($id);

        $record->update($request->all());

        return response()->json($record);
    }

    public function destroy($id)
    {
        $record = DiemHuongDan::findOrFail($id);
        $record->delete();

        return response()->json(['message' => 'Deleted successfully']);
    }
}
