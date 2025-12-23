<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('diem_huong_dan', function (Blueprint $table) {
            $table->text('ghi_chu')->nullable()->after('tong');
        });

        Schema::table('diem_phan_bien', function (Blueprint $table) {
            $table->text('ghi_chu')->nullable()->after('tong');
        });
    }

    public function down(): void
    {
        Schema::table('diem_huong_dan', function (Blueprint $table) {
            $table->dropColumn('ghi_chu');
        });

        Schema::table('diem_phan_bien', function (Blueprint $table) {
            $table->dropColumn('ghi_chu');
        });
    }
};
