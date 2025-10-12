<?php
namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class EnsureUserHasRole
{
    public function handle(Request $request, Closure $next, string $roles)
    {
   
        if (! $request->user()) {
            return redirect()->route('login');
        }

  
        $allowed = array_map('trim', explode(',', $roles));

        if (! $request->user()->hasRole($allowed)) {
            return redirect()->route('home')->with('error', 'Không có quyền.');
        }

        return $next($request);
    }
    
}
