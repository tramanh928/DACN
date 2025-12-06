<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ThoiGian;
use Illuminate\Support\Facades\Log;

class ThoiGianController extends Controller
{
    // Show all events
    public function index()
    {
        $events = ThoiGian::all();
        return response()->json($events);
    }

    // Store a new event
    public function store(Request $request)
    {
        $request->validate([
            'TenSuKien' => 'required|string|max:255',
            'NgayBatDau' => 'required|date',
            'NgayKetThuc' => 'required|date|after_or_equal:NgayBatDau',
        ]);

        $event = ThoiGian::create([
            'TenSuKien' => $request->TenSuKien,
            'NgayBatDau' => $request->NgayBatDau,
            'NgayKetThuc' => $request->NgayKetThuc,
        ]);

        return response()->json([
            'message' => 'Event created successfully',
            'data' => $event
        ]);
    }

    // Optional: update an event
    public function update(Request $request, $id)
    {
        $event = ThoiGian::findOrFail($id);

        $request->validate([
            'TenSuKien' => 'required|string|max:255',
            'NgayBatDau' => 'required|date',
            'NgayKetThuc' => 'required|date|after_or_equal:NgayBatDau',
        ]);

        $event->update($request->only(['TenSuKien', 'NgayBatDau', 'NgayKetThuc']));

        return response()->json([
            'message' => 'Event updated successfully',
            'data' => $event
        ]);
    }

    // Optional: delete an event
    public function destroy($id)
    {
        $event = ThoiGian::findOrFail($id);
        $event->delete();

        return response()->json([
            'message' => 'Event deleted successfully'
        ]);
    }



public function checkAccess($TenSuKien)
{
    $tz = 'Asia/Ho_Chi_Minh';
    $now = now($tz);

    $event = ThoiGian::where('TenSuKien', $TenSuKien)->first();

    if (!$event) {
        return response()->json(['access' => false]);
    }

    $start = $event->NgayBatDau->clone()->timezone($tz);
    $end   = $event->NgayKetThuc->clone()->timezone($tz);

    $access = $now->between($start, $end);

    return response()->json(['access' => $access]);
}



}
