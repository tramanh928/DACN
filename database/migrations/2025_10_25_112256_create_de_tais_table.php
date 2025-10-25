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
        Schema::create('detai', function (Blueprint $table) {
            $table->id();
            $table->string('MaDT')->unique();
            $table->string('TenDT');
            $table->text('MoTa')->nullable();
            $table->unsignedBigInteger('MaGV')->nullable();
            $table->integer('SoLuong')->default(1);
            $table->string('TrangThai')->default('Chờ sinh viên chọn');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('de_tais');
    }
};
