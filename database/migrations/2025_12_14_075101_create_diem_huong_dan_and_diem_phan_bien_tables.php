<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDiemHuongDanAndDiemPhanBienTables extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('diem_huong_dan', function (Blueprint $table) {
            $table->id();
            $table->string('MSSV', 20);
            $table->float('pttk')->nullable();
            $table->float('tkvd')->nullable();
            $table->float('htvd')->nullable();
            $table->float('ktsp')->nullable();
            $table->float('tong')->nullable();
            $table->timestamps();

            // optional: index on MSSV for faster lookups
            $table->index('MSSV');
        });

        Schema::create('diem_phan_bien', function (Blueprint $table) {
            $table->id();
            $table->string('MSSV', 20);
            $table->float('pttk')->nullable();
            $table->float('tkvd')->nullable();
            $table->float('htvd')->nullable();
            $table->float('ktsp')->nullable();
            $table->float('tong')->nullable();
            $table->timestamps();

            // optional: index on MSSV for faster lookups
            $table->index('MSSV');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('diem_phan_bien');
        Schema::dropIfExists('diem_huong_dan');
    }
}
