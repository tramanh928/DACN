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
        Schema::create('ThuKy', function (Blueprint $table) {
        $table->string('MaTK', 20)->primary();
        $table->string('Ho_va_Ten', 120);
        $table->string('email')->unique();
        $table->string('sdt')->nullable();
        $table->date('Ngay_Sinh')->nullable();
        $table->timestamps();
        $table->foreignId('user_id')->unique()->constrained('users')->onDelete('cascade');
});

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('ThuKy');
    }
};
