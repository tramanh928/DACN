<?php

namespace App\Http\Controllers;

use App\Models\SinhVien;
use Inertia\Inertia;
use Illuminate\Http\Request;
use App\Exports\StudentsExport;
use Maatwebsite\Excel\Facades\Excel; 

class StudentController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
{
    $students = SinhVien::all()->map(function($s) {
        return [
            'mssv'     => $s->mssv,
            'name'     => trim($s->Ho . ' ' . ($s->Ten ?? '')),
            'group'    => $s->Nhom,
            'topic'    => $s->Huong_de_tai,
            'email'    => $s->email,
            'phone'    => $s->sdt,
            'lecturer' => $s->Giang_vien_hd ?? '',
            'status'   => $s->Trang_Thai ?? 'Chưa gặp',
            'note'     => $s->Ghi_chu ?? '',
        ];
    });
    return response()->json($students);
}

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('students.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $data = $request->validate([
            'Ho'=>'required|string|max:120',
            'Ten'=>'nullable|string|max:120',
            'email'=>'nullable|email|unique:sinh_viens,email',
            'mssv'=>'nullable|unique:sinh_viens,mssv',
            'sdt'=>'nullable|string|max:15',
            'Ngay_Sinh'=>'nullable|date',
            'Lop'=>'nullable|string|max:50',
            'Nhom'=>'nullable|string|max:50',
            'Huong_de_tai'=>'nullable|string|max:255',
        ]);
        SinhVien::create($data);
        return redirect()->route('students.index')->with('success','Student created.');
    }

    /**
     * Display the specified resource.
     */
    public function show(SinhVien $student)
    {
        return view('students.show', compact('student'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(SinhVien $student)
    {
         return view('students.edit', compact('student'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, SinhVien $student)
    {
        $data = $request->validate([
            'Ho'=>'required|string|max:120',
            'Ten'=>'nullable|string|max:120',
            'email'=>'nullable|email|unique:sinh_viens,email,'.$student->id,
            'mssv'=>'nullable|unique:sinh_viens,mssv,'.$student->id,
            'sdt'=>'nullable|string|max:15',
            'Ngay_Sinh'=>'nullable|date',
            'Lop'=>'nullable|string|max:50',
            'Nhom'=>'nullable|string|max:50',
            'Huong_de_tai'=>'nullable|string|max:255',
        ]);
        $student->update($data);
        return redirect()->route('students.index')->with('success','Student updated.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(SinhVien $student)
    {
        $student->delete();
        return redirect()->route('students.index')->with('success','Student deleted.');
    }

    public function export()
    {
        return Excel::download(new StudentsExport, 'DSSV.xlsx');
    }
}
