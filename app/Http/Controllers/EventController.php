<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class EventController extends Controller
{
     public function index(Request $r)
    {
        $start = $r->query('start');
        $end   = $r->query('end');
        $q = Event::query();
        if ($start) $q->where('start', '>=', $start);
        if ($end) $q->where('end', '<=', $end);
        return $q->get()->map(function($e){
            return [
                'id'=>$e->id,
                'title'=>$e->title,
                'start'=>$e->start->toIso8601String(),
                'end'=>$e->end?->toIso8601String(),
                'allDay'=>$e->all_day
            ];
        });
    }

    public function store(Request $r)
    {
        $data = $r->validate([
            'title'=>'required|string|max:191',
            'start'=>'required|date',
            'end'=>'nullable|date',
            'all_day'=>'sometimes|boolean',
            'description'=>'nullable|string'
        ]);
        $data['created_by'] = auth()->id();
        $e = Event::create($data);
        return response()->json($e, 201);
    }

    public function destroy(Event $event)
    {
        $event->delete();
        return response()->json(null, 204);
    }
}
