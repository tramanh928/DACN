<?php

namespace App\Http\Controllers;

use App\Models\ThuKy;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class AssistantController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $assistants = ThuKy::all();
        return view('assistants.index', compact('assistants'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('assistants.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $data = $request->validate([
            'Ho'=>'required|string|max:120',
            'Ten'=>'nullable|string|max:120',
            'email'=>'nullable|email|unique:thu_kys,email',
            'MaTK'=>'nullable|unique:thu_kys,MaTK',
            'sdt'=>'nullable|string|max:15',
            'Ngay_Sinh'=>'nullable|date',
        ]);
        ThuKy::create($data);
        return redirect()->route('assistants.index')->with('success','Assistant created.');
    }

    /**
     * Display the specified resource.
     */
    public function show(Assistant $assistant)
    {
        return view('assistants.show', compact('assistant'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Assistant $assistant)
    {
        return view('assistants.edit', compact('assistant'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Assistant $assistant)
    {
        $data = $request->validate([
            'Ho'=>'required|string|max:120',
            'Ten'=>'nullable|string|max:120',
            'email'=>'nullable|email|unique:thu_kys,email,'.$assistant->id,
            'MaTK'=>'nullable|unique:thu_kys,MaTK,'.$assistant->id,
            'sdt'=>'nullable|string|max:15',
            'Ngay_Sinh'=>'nullable|date',
        ]);
        $assistant->update($data);
        return redirect()->route('assistants.index')->with('success','Assistant updated.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Assistant $assistant)
    {
        $assistant->delete();
        return redirect()->route('assistants.index')->with('success','Assistant deleted.');
    }

    public function getStats(Request $request)
    {
        try {
            $totalStudents = class_exists(SinhVien::class) ? SinhVien::count() : DB::table('sinhvien')->count();
            $totalTeachers = class_exists(GiangVien::class) ? GiangVien::count() : DB::table('giangvien')->count();
            $totalTopics   = class_exists(DeTai::class) ? DeTai::count() : DB::table('detai')->count();
            return response()->json([
                'students' => (int) $totalStudents,
                'teachers' => (int) $totalTeachers,
                'topics'   => (int) $totalTopics,
            ]);
        } catch (\Throwable $e) {
            \Log::error('StatsController@index error: '.$e->getMessage(), ['trace'=>$e->getTraceAsString()]);
            return response()->json(['error' => 'Unable to get stats'], 500);
        }
    }
}
