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
    Schema::create('temp_import', function (Blueprint $table) {
        $table->id();
        $table->string('MSSV')->nullable();
        $table->string('HoTenSV')->nullable();
        $table->string('Lop')->nullable();
        $table->string('SDT')->nullable();
        $table->string('Email')->nullable();
        $table->string('HuongDeTai')->nullable();
        $table->string('Nhom')->nullable();
        $table->string('GVHD')->nullable();
        $table->timestamps();
    });
}


    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('temp_import');
    }
};
