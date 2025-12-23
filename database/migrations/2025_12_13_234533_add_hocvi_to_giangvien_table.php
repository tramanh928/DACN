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
        Schema::table('GiangVien', function (Blueprint $table) {
            $table->string('HocVi', 100)->nullable()->after('Ho_va_Ten');
            $table->string('NoiCongTac', 255)->nullable()->after('HocVi');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('GiangVien', function (Blueprint $table) {
            $table->dropColumn(['HocVi', 'NoiCongTac']);
        });
    }
};
