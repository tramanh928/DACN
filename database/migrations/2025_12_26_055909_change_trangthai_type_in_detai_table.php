<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('DeTai', function (Blueprint $table) {
            $table->string('TrangThai', 50)->change();
        });
    }

    public function down(): void
    {
        Schema::table('DeTai', function (Blueprint $table) {
            $table->enum('TrangThai', ['DangLam', 'HoanThanh'])->change();
        });
    }
};
