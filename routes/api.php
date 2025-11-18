<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ImportController;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

//Route cho Import Excel
Route::post('/import-temp', [ImportController::class, 'import'])->name('import.temp');
Route::post('/process-temp', [ImportController::class, 'process'])->name('process.temp');