<?php

namespace App\Http\Controllers;

use App\Models\HoiDong;
use App\Models\ChiTietHoiDong;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use App\Models\DeTai;

class HoiDongController extends Controller
{
    public function index()
    {
        return HoiDong::with('giangViens')->get()
            ->map(function ($hd) {
                return [
                    'id' => $hd->MaHD,
                    'start' => $hd->ngay_bat_dau,
                    'end' => $hd->ngay_ket_thuc,
                    'members' => $hd->giangViens->map(fn ($gv) => [
                        'teacherId'   => $gv->MaGV,
                        'teacherName' => $gv->Ho_va_Ten,
                        'position'    => $gv->pivot->ChucVu,
                    ])->values()->toArray(),
                ];
            })
            ->values()
            ->toArray(); 
    }

    public function assignToTopic(Request $request)
    {
        $data = $request->validate([
            'MaDT' => 'required|exists:DeTai,MaDT',
            'MaHD' => 'required|exists:hoi_dong,MaHD',
        ]);

        $detai = DeTai::where('MaDT', $data['MaDT'])->firstOrFail();
        $detai->MaHD = $data['MaHD'];
        $detai->save();

        return response()->json([
            'message' => 'Phân công hội đồng thành công',
            'MaDT' => $detai->MaDT,
            'MaHD' => $detai->MaHD,
        ]);
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'start_time' => 'required|date',
            'end_time' => 'required|date|after:start_time',
            'members' => 'required|array|min:3',
            'members.*.teacher_id' => 'required|exists:giangvien,MaGV',
            'members.*.position' => 'required|string',
        ]);

        DB::transaction(function () use ($data) {
            $maHD = 'HD' . now()->format('YmdHis') . Str::random(2);

            HoiDong::create([
                'MaHD' => $maHD,
                'ngay_bat_dau' => $data['start_time'],
                'ngay_ket_thuc' => $data['end_time'],
            ]);

            foreach ($data['members'] as $m) {
                ChiTietHoiDong::create([
                    'MaHD' => $maHD,
                    'MaGV' => $m['teacher_id'],
                    'ChucVu' => $m['position'],
                ]);
            }
        });

        return response()->json(['message' => 'Created'], 201);
    }

    public function update(Request $request, $id)
    {
        $data = $request->validate([
            'start_time' => 'required|date',
            'end_time' => 'required|date|after:start_time',
            'members' => 'required|array|min:3',
            'members.*.teacher_id' => 'required|exists:giangvien,MaGV',
            'members.*.position' => 'required|string',
        ]);

        DB::transaction(function () use ($id, $data) {
            $hoiDong = HoiDong::findOrFail($id);

            $hoiDong->update([
                'ngay_bat_dau' => $data['start_time'],
                'ngay_ket_thuc' => $data['end_time'],
            ]);

            ChiTietHoiDong::where('MaHD', $id)->delete();

            foreach ($data['members'] as $m) {
                ChiTietHoiDong::create([
                    'MaHD' => $id,
                    'MaGV' => $m['teacher_id'],
                    'ChucVu' => $m['position'],
                ]);
            }
        });

        return response()->json(['message' => 'Updated']);
    }

    public function destroy($id)
    {
        HoiDong::where('MaHD', $id)->delete();
        return response()->json(['message' => 'Deleted']);
    }
}
