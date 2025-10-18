<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Faker\Factory as Faker;

class SinhVienSeeder extends Seeder
{
    public function run(): void
    {
        $faker = Faker::create('vi_VN'); // Vietnamese locale
        DB::statement('SET @TRG_DISABLED = 0');
        for ($i = 0; $i < 20; $i++) {
            DB::table('SinhVien')->insert([
                'Ho' => $faker->lastName,
                'Ten' => $faker->firstName,
                'email' => $faker->unique()->safeEmail,
                'sdt' => $faker->phoneNumber,
                'Ngay_Sinh' => $faker->date('Y-m-d', '2003-12-31'),
                'mssv' => 'DH522' . str_pad(rand(0, 99999), 5, '0', STR_PAD_LEFT),
                'Lop' => 'CNTT' . rand(1, 4),
                'Nhom' => 'N' . rand(1, 10),
                'Huong_de_tai' => $faker->sentence(3),
                'Giang_vien_huong_dan' => $faker->name,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
