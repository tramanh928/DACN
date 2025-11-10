<?php

namespace App\Http\Controllers;

use App\Models\ThuKy;
use App\Models\SinhVien;
use App\Models\GiangVien;
use App\Models\DeTai;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class AssistantController extends Controller
{
    // List all assistants
    public function index()
    {
        return ThuKy::all()->map(function ($assistant) {
            return [
                'MaTK' => $assistant->MaTK,
                'name' => $assistant->full_name, // Ho_va_Ten from ThuKy
                'email' => $assistant->email,
                'sdt' => $assistant->sdt ?? '',
                'Ngay_Sinh' => $assistant->Ngay_Sinh ? $assistant->Ngay_Sinh->toDateString() : null,
            ];
        });
    }

    // Show a single assistant
    public function show(ThuKy $assistant)
    {
        return $assistant;
    }

    // Create a new assistant
    public function store(Request $request)
    {
        $data = $request->validate([
            'MaTK'      => 'required|string|unique:ThuKy,MaTK',
            'Ho_va_Ten' => 'required|string|max:120',
            'email'     => 'nullable|email|unique:ThuKy,email',
            'sdt'       => 'nullable|string|max:15',
            'Ngay_Sinh' => 'nullable|date',
        ]);

        return ThuKy::create($data);
    }

    // Update an assistant
    public function update(Request $request, ThuKy $assistant)
    {
        $data = $request->validate([
            'MaTK'      => 'required|string|unique:ThuKy,MaTK,' . $assistant->MaTK . ',MaTK',
            'Ho_va_Ten' => 'required|string|max:120',
            'email'     => 'nullable|email|unique:ThuKy,email,' . $assistant->MaTK . ',MaTK',
            'sdt'       => 'nullable|string|max:15',
            'Ngay_Sinh' => 'nullable|date',
        ]);

        $assistant->update($data);

        return $assistant;
    }

    // Delete an assistant
    public function destroy(ThuKy $assistant)
    {
        return $assistant->delete();
    }

    // Get basic stats
    public function getStats()
    {
        try {
            $totalStudents = class_exists(SinhVien::class) ? SinhVien::count() : DB::table('SinhVien')->count();
            $totalTeachers = class_exists(GiangVien::class) ? GiangVien::count() : DB::table('GiangVien')->count();
            $totalTopics   = class_exists(DeTai::class) ? DeTai::count() : DB::table('DeTai')->count();

            return response()->json([
                'students' => (int) $totalStudents,
                'teachers' => (int) $totalTeachers,
                'topics'   => (int) $totalTopics,
            ]);
        } catch (\Throwable $e) {
            Log::error('AssistantController@getStats error: '.$e->getMessage(), ['trace'=>$e->getTraceAsString()]);
            return response()->json(['error' => 'Unable to get stats'], 500);
        }
    }
}
