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
        $table->string('MSSV', 20)->primary();
        $table->string('Ho_va_Ten', 120);
        $table->string('email')->unique()->nullable(); 
        $table->string('sdt')->nullable();
        $table->string('Lop')->nullable(); 
        $table->string('Nhom')->nullable();
        $table->string('MaDT', 50)->nullable();
        $table->string('HuongDeTai')->nullable();
        $table->string('Giang_vien_huong_dan', 20)->nullable();
        $table->boolean('Da_phan_cong')->default(false);
        $table->timestamps();
        $table->foreignId('user_id')->unique()->constrained('users')->onDelete('cascade');
        $table->foreign('Giang_vien_huong_dan')->references('MaGV')->on('GiangVien')->onUpdate('cascade')->onDelete('set null');
        $table->foreign('MaDT')->references('MaDT')->on('DeTai')->onUpdate('cascade')->onDelete('set null');
});
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('SinhVien');
    }
};
