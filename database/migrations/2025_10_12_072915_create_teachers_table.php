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
        Schema::create('GiangVien', function (Blueprint $table) {
            $table->id();
            $table->string('Ho', 120);
            $table->string('Ten', 120);
            $table->string('email')->unique();
            $table->string('sdt')->nullable();
            $table->date('Ngay_Sinh')->nullable();
            $table->string("MaGV")->unique();
            $table->string("Khoa")->nullable();
            $table->integer('So_luong_sinh_vien')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('teachers');
    }
};
