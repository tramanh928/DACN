<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('temp_import', function (Blueprint $table) {
            $table->string('HocVi', 100)->nullable()->after('GVHD');
            $table->string('NoiCongTac', 255)->nullable()->after('HocVi');
            $table->string('TenDeTai', 255)->nullable()->after('NoiCongTac');
            $table->text('MoTa')->nullable()->after('TenDeTai');
            $table->float('Diem')->nullable()->after('MoTa');
            $table->string('TrangThai', 50)->nullable()->after('Diem');
            $table->text('GhiChu')->nullable()->after('TrangThai');
        });
    }

    public function down(): void
    {
        Schema::table('temp_import', function (Blueprint $table) {
            $table->dropColumn([
                'HocVi',
                'NoiCongTac',
                'TenDeTai',
                'MoTa',   
                'Diem',
                'TrangThai',
                'GhiChu'
            ]);
        });
    }
};
