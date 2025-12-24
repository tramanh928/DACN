<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('temp_import', function (Blueprint $table) {
            $table->string('GVPB', 255)->nullable()->after('GVHD'); // Add GVPB after GVHD
        });
    }

    public function down(): void
    {
        Schema::table('temp_import', function (Blueprint $table) {
            $table->dropColumn('GVPB');
        });
    }
};
