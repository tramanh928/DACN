<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('chi_tiet_hoi_dong', function (Blueprint $table) {
            $table->id();

            $table->string('MaHD', 20);
            $table->string('MaGV', 20);
            $table->text('ChucVu');

            $table->timestamps();

            $table->foreign('MaHD')
                  ->references('MaHD')
                  ->on('hoi_dong')
                  ->cascadeOnDelete();

            $table->foreign('MaGV')
                  ->references('MaGV')
                  ->on('giangvien')
                  ->cascadeOnDelete();

            $table->unique(['MaHD', 'MaGV']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('chi_tiet_hoi_dong');
    }
};
