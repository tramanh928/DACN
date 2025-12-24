<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('hoi_dong', function (Blueprint $table) {
            $table->string('MaHD', 20)->primary();
            $table->dateTime('ngay_bat_dau');
            $table->dateTime('ngay_ket_thuc')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('hoi_dong');
    }
};
