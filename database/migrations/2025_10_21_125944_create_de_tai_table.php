<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDeTaiTable extends Migration
{
    public function up()
    {
        Schema::create('DeTai', function (Blueprint $table) {
            $table->string('MaDT', 50)->primary();
            $table->string('TenDeTai', 255);
            $table->integer('SoLuong')->default(0);
            $table->enum('TrangThai', ['Mở','Đóng','Chờ'])->default('Chờ');
            $table->string('MaGV', 20)->nullable();
            $table->timestamps();
            $table->foreign('MaGV')->references('MaGV')->on('GiangVien')->onDelete('set null');
        });
    }

    public function down()
    {
        Schema::dropIfExists('DeTai');
    }
}
