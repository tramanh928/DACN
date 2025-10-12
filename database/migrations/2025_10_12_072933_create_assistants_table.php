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
            $table->id();
            $table->string('Ho', 120);
            $table->string('Ten', 120);
            $table->string('email')->unique();
            $table->string('sdt')->nullable();
            $table->date('Ngay_Sinh')->nullable();
            $table->string("MaTK")->unique();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('assistants');
    }
};
