<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use App\Http\Controllers\StudentController;
use App\Http\Controllers\TeacherController;
use App\Http\Controllers\EventController;
use App\Http\Controllers\AssistantController;

Route::get('/', function () {
    return Inertia::render('Welcome', [
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
    ]);
});

Route::get('/dashboard', function () {
    $user = auth()->user();
    if (!$user) {
        return redirect()->route('login');
    }

    switch ($user->role) {
        case 'GiangVien':
            return Inertia::render('Teachers/Index', ['user' => $user]);
        case 'ThuKy':
            return Inertia::render('Assistants/Index', ['user' => $user]);
        case 'SinhVien':
        default:
            return Inertia::render('Students/Index', ['user' => $user]);
    }
})->middleware(['auth', 'verified'])->name('dashboard');

Route::resource('students', StudentController::class)->middleware(['auth', 'verified']);
Route::resource('teachers', TeacherController::class)->middleware(['auth', 'verified']);
Route::resource('events', EventController::class)->middleware(['auth', 'verified']);
Route::resource('assistants', AssistantController::class)->middleware(['auth', 'verified']);

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
