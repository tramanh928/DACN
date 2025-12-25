<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('DeTai', function (Blueprint $table) {
            $table->text('MoTa')
                  ->nullable()
                  ->after('MaGVPB');
        });
    }

    public function down(): void
    {
        Schema::table('DeTai', function (Blueprint $table) {
            $table->dropColumn('MoTa');
        });
    }
};
