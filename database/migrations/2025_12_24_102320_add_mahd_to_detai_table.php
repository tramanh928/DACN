<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('detai', function (Blueprint $table) {
            $table->string('MaHD', 20)
                  ->nullable()
                  ->after('MaGV'); // đổi lại nếu bạn muốn sau cột khác
        });
    }

    public function down(): void
    {
        Schema::table('detai', function (Blueprint $table) {
            $table->dropColumn('MaHD');
        });
    }
};
