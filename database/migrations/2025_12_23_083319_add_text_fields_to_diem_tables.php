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
        Schema::table('diem_huong_dan', function (Blueprint $table) {
            $table->text('dieu_chinh')->nullable();
            $table->text('uu')->nullable();
            $table->text('nhuoc')->nullable();
            $table->text('cau_hoi')->nullable();
        });

        Schema::table('diem_phan_bien', function (Blueprint $table) {
            $table->text('dieu_chinh')->nullable();
            $table->text('uu')->nullable();
            $table->text('nhuoc')->nullable();
            $table->text('cau_hoi')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('diem_huong_dan', function (Blueprint $table) {
            $table->dropColumn(['dieu_chinh', 'uu', 'nhuoc', 'cau_hoi']);
        });

        Schema::table('diem_phan_bien', function (Blueprint $table) {
            $table->dropColumn(['dieu_chinh', 'uu', 'nhuoc', 'cau_hoi']);
        });
    }
};
