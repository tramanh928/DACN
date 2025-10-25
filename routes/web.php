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
    $students = \App\Models\SinhVien::all()->map(function($s) {
        return [
            'mssv'     => $s->mssv,
            'name'     => trim($s->Ho . ' ' . ($s->Ten ?? '')),
            'group'    => $s->Nhom,
            'topic'    => $s->Huong_de_tai,
            'lecturer' => $s->Giang_vien_huong_dan ?? '',
            'status'   => $s->Trang_Thai ?? 'Chưa gặp',
            'note'     => $s->Ghi_chu ?? '',
        ];
    });

    return Inertia::render('Assistants/Index', [  // <-- Inertia render, not JSON
        'user' => $user,
        'students' => $students,
    ]);
        case 'SinhVien':
        default:
            return Inertia::render('Students/Index', ['user' => $user]);
    }
})->middleware(['auth', 'verified'])->name('dashboard');

Route::post('/logout', function (Request $request) {
    Auth::logout(); // Đăng xuất user

    // Xóa session & regenerate token
    $request->session()->invalidate();
    $request->session()->regenerateToken();

    // Quay về trang login
    return redirect()->route('login');
})->name('logout');

Route::resource('students', StudentController::class)->middleware(['auth', 'verified']);
Route::resource('teachers', TeacherController::class)->middleware(['auth', 'verified']);
Route::resource('events', EventController::class)->middleware(['auth', 'verified']);
Route::resource('assistants', AssistantController::class)->middleware(['auth', 'verified']);

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

Route::get('/students-export', [StudentController::class, 'export'])->name('students.export');

Route::get('/students-list', [StudentController::class, 'index'])->name('students.list');
require __DIR__.'/auth.php';

Route::post('/teachers/getAll', [TeacherController::class, 'index']);