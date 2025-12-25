<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('DeTai', function (Blueprint $table) {

            // Thêm cột MaGVPB (Giảng viên phản biện)
            $table->string('MaGVPB', 20)
                  ->nullable()
                  ->after('MaGV');

            // Khóa ngoại tới bảng GiangVien
            $table->foreign('MaGVPB')
                  ->references('MaGV')
                  ->on('GiangVien')
                  ->nullOnDelete()
                  ->cascadeOnUpdate();
        });
    }

    public function down(): void
    {
        Schema::table('DeTai', function (Blueprint $table) {

            // Xóa foreign key trước
            $table->dropForeign(['MaGVPB']);

            // Xóa cột
            $table->dropColumn('MaGVPB');
        });
    }
};
