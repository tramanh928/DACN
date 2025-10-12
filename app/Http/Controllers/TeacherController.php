<?php

namespace App\Http\Controllers;

use App\Models\GiangVien;
use Illuminate\Http\Request;

class TeacherController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $teachers = GiangVien::all();
        return view('teachers.index', compact('teachers'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('teachers.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $data = $request->validate([
            'Ho'=>'required|string|max:120',
            'Ten'=>'nullable|string|max:120',
            'email'=>'nullable|email|unique:giang_viens,email',
            'MaGV'=>'nullable|unique:giang_viens,MaGV',
            'sdt'=>'nullable|string|max:15',
            'Ngay_Sinh'=>'nullable|date',
            'Khoa'=>'nullable|string|max:100',
            'So_luong_sinh_vien'=>'nullable|integer|min:0',
        ]);
        GiangVien::create($data);
        return redirect()->route('teachers.index')->with('success','Teacher created.');
    }

    /**
     * Display the specified resource.
     */
    public function show(Teacher $teacher)
    {
        return view('teachers.show', compact('teacher'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Teacher $teacher)
    {
            return view('teachers.edit', compact('teacher'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Teacher $teacher)
    {
        $data = $request->validate([
            'Ho'=>'required|string|max:120',
            'Ten'=>'nullable|string|max:120',
            'email'=>'nullable|email|unique:giang_viens,email,'.$teacher->id,
            'MaGV'=>'nullable|unique:giang_viens,MaGV,'.$teacher->id,
            'sdt'=>'nullable|string|max:15',
            'Ngay_Sinh'=>'nullable|date',
            'Khoa'=>'nullable|string|max:100',
            'So_luong_sinh_vien'=>'nullable|integer|min:0',
        ]);
        $teacher->update($data);
        return redirect()->route('teachers.index')->with('success','Teacher updated.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Teacher $teacher)
    {
        $teacher->delete();
        return redirect()->route('teachers.index')->with('success','Teacher deleted.');
    }
}
