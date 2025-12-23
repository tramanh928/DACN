<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddDanhGiaColumnsToDeTaiTable extends Migration
{
    public function up()
    {
        Schema::table('diem_huong_dan', function (Blueprint $table) {
            $table->boolean('Danh_gia')
                  ->default(false);
        });
        Schema::table('diem_phan_bien', function (Blueprint $table) {
            $table->boolean('Danh_gia')
                  ->default(false);
        });
    }

    public function down()
    {
        Schema::table('DeTai', function (Blueprint $table) {
            $table->dropColumn([
                'Danh_gia_huong_dan',
                'Danh_gia_phan_bien'
            ]);
        });
    }
}
