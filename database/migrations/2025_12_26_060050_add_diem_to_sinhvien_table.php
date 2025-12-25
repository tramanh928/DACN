<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('sinhvien', function (Blueprint $table) {
            $table->unsignedTinyInteger('Diem')->nullable()->after('MaDT');
        });
    }

    public function down(): void
    {
        Schema::table('sinhvien', function (Blueprint $table) {
            $table->dropColumn('Diem');
        });
    }
};
