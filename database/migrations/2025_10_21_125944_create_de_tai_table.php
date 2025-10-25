<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDeTaiTable extends Migration
{
    public function up()
    {
        Schema::create('DeTai', function (Blueprint $table) {
            $table->id();
            $table->string('MaDT', 50)->unique();
            $table->string('TenDeTai', 255);
            $table->foreignId('mssv')->nullable()->constrained('sinhvien')->nullOnDelete()->cascadeOnUpdate();
            $table->foreignId('MaGV')->nullable()->constrained('giangvien')->nullOnDelete()->cascadeOnUpdate();
            $table->integer('SoLuong')->default(0);
            $table->enum('TrangThai', ['Mở','Đóng','Chờ'])->default('Chờ');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('DeTai');
    }
}
