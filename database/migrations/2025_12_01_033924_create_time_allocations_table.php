<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('ThoiGian', function (Blueprint $table) {
            $table->id();
            $table->string('TenSuKien'); // Name of the action/event
            $table->datetime('NgayBatDau'); // Start date of availability
            $table->datetime('NgayKetThuc');   // End date of availability
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('ThoiGian');
    }
};

