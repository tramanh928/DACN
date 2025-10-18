<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('SinhVien', function (Blueprint $table) {
            $table->id();
            $table->string('Ho', 120);
            $table->string('Ten', 120);
            $table->string('email')->unique()->nullable(); 
            $table->string('sdt')->nullable();
            $table->date('Ngay_Sinh')->nullable();
            $table->string('mssv')->unique();
            $table->string('Lop')->nullable(); 
            $table->string('Nhom')->nullable();
            $table->string('Huong_de_tai')->nullable();
            $table-> string('Giang_vien_huong_dan')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('students');
    }
};
