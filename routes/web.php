<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use App\Http\Controllers\StudentController;
use App\Http\Controllers\TeacherController;
use App\Http\Controllers\AssistantController;
use App\Http\Controllers\DeTaiController;
use App\Http\Controllers\ImportController;
use App\Http\Controllers\ExportController;
use App\Http\Controllers\ThoiGianController;
use App\Http\Controllers\DiemHuongDanController;
use App\Http\Controllers\DiemPhanBienController;
use App\Http\Controllers\HoiDongController;

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
            return Inertia::render('Teachers/Index', [
                'user' => $user
            ]);
        case 'ThuKy':
            $students = \App\Models\SinhVien::all()->map(function ($s) {

                return [
                    'mssv'     => $s->MSSV,
                    'name'     => $s->Ho_va_Ten,            
                    'group'    => $s->Nhom,                   
                    'topic'    => $s->HuongDeTai,             
                    'lecturer' => $s->Giang_vien_huong_dan,   
                    'status'   => $s->Da_phan_cong ? 'Đã phân công' : 'Chưa phân công',
                    'note'     => null,                   
                ];
            });

            return Inertia::render('Assistants/Index', [
                'user' => $user,
                'students' => $students,
            ]);
        case 'SinhVien':
        default:
            return Inertia::render('Students/Index', [
                'user' => $user
            ]);
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
Route::resource('assistants', AssistantController::class)->middleware(['auth', 'verified']);
Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

Route::get('/students-export', [StudentController::class, 'export'])->name('students.export');

Route::get('/students-list', [StudentController::class, 'index'])->name('students.list');
require __DIR__.'/auth.php';

Route::get('/stats', [AssistantController::class, 'getStats']);

Route::post('/teachers/getAll', [TeacherController::class, 'index']);
Route::post('/students/getAll', [StudentController::class, 'index']);
Route::post('/topics/getAll', [DeTaiController::class, 'index']);

//Route cho Import Excel

Route::post('/import-temp', [ImportController::class, 'import'])->withoutMiddleware(['web']);


//Route để thêm dữ liệu
Route::post('/add-student', [StudentController::class, 'store']);
Route::post('/add-teacher', [TeacherController::class, 'store']);
Route::post('/add-topic', [DeTaiController::class, 'store']);

//Route để xóa dữ liệu
Route::post('/delete-student/{mssv}', [StudentController::class, 'destroy']);
Route::post('/delete-teacher/{MaGV}', [TeacherController::class, 'destroy']);
Route::post('/delete-topic/{MaDT}', [DeTaiController::class, 'destroy']);

//Route để cập nhật dữ liệu
Route::put('/update-student/{mssv}', [StudentController::class, 'update']);
Route::put('/update-teacher/{MaGV}', [TeacherController::class, 'update']);
Route::put('/update-topic/{MaDT}', [DeTaiController::class, 'update']);

//Route phân công
Route::put('/assign-students/{mssv}', [StudentController::class, 'edit']);

//Route lấy dssv theo gv
Route::post('/teacher-by-id/{user_id}', [TeacherController::class, 'getTeacherById']);
Route::post('/students-by-teacher/{MaGV}', [StudentController::class, 'getStudentsByTeacher']);
Route::post('/students-by-reviewer/{MaGV}', [StudentController::class, 'getStudentsByReviewer']);

//Route lấy đề tài theo giảng viên
Route::get('/topics-by-teacher/{MaGV}', [DeTaiController::class, 'getTopicsByTeacher']);
Route::get('/topics-by-review-teacher/{MaGV}', [DeTaiController::class, 'getTopicsByReviewTeacher']);

//Route tạo nhóm, gộp nhóm
Route::post('/update-student-group', [StudentController::class, 'updateStudentGroup']);

//Route phân công
Route::post('/save-topic', [DeTaiController::class, 'saveTopic']);
Route::put('/assign-reviewer/{MaDT}', [DeTaiController::class, 'assignReviewer']);

//Route cập nhật điểm và ghi chú
Route::post('/update-score', [StudentController::class, 'updateScore']);
Route::post('/update-note', [StudentController::class, 'updateNote']);

//Route xuất file mẫu nhiệm vụ, phản biện, hướng dẫn
Route::get('/nhiem-vu-template/{MaDT}', [ExportController::class, 'downloadTemplate']);
Route::get('/export/phan-bien/{MaDT}', [ExportController::class, 'downloadPhanBien']);
Route::get('/export/huong-dan/{MaDT}', [ExportController::class, 'downloadHuongDan']);

//Route quản lý thời gian
Route::get('/thoi-gian', [ThoiGianController::class, 'index'])->name('thoi-gian.index');
Route::post('/thoi-gian', [ThoiGianController::class, 'store'])->name('thoi-gian.store');
Route::get('/check-access/{TenSuKien}', [ThoiGianController::class, 'checkAccess']);
Route::put('/thoi-gian/{id}', [ThoiGianController::class, 'update'])->name('thoi-gian.update');
Route::delete('/thoi-gian/{id}', [ThoiGianController::class, 'destroy'])->name('thoi-gian.destroy');

Route::middleware(['auth'])->group(function () {
    Route::post('/save-review-score', [DiemPhanBienController::class, 'store'])
        ->name('diem-phan-bien.save-review');
    Route::get('/diem-phan-bien/mssv/{mssv}', [DiemPhanBienController::class, 'showByMSSV']);
    Route::post('/save-guide-score', [DiemHuongDanController::class, 'store'])
        ->name('diem-huong-dan.save-guide');
    Route::get('/diem-huong-dan/mssv/{mssv}', [DiemHuongDanController::class, 'showByMSSV']);
});

//Route quản lý hội đồng
Route::get('/committees', [HoiDongController::class, 'index']);
Route::post('/committees', [HoiDongController::class, 'store']);
Route::put('/committees/{id}', [HoiDongController::class, 'update']);
Route::delete('/committees/{id}', [HoiDongController::class, 'destroy']);
Route::post('/committees/assign', [HoiDongController::class, 'assignToTopic']);
