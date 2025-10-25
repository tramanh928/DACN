<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Faker\Factory as Faker;

class GiangVienSeeder extends Seeder
{
    public function run(): void
    {
        $faker = Faker::create('vi_VN'); // Vietnamese locale
        DB::statement('SET @TRG_DISABLED = 0');

        for ($i = 0; $i < 20; $i++) {
            DB::table('giangvien')->insert([
                'Ho' => $faker->lastName,
                'Ten' => $faker->firstName,
                'email' => $faker->unique()->safeEmail,
                'sdt' => $faker->phoneNumber,
                'Ngay_Sinh' => $faker->date('Y-m-d', '1980-12-31'),
                'MaGV' => 'GV' . str_pad(rand(1, 9999), 4, '0', STR_PAD_LEFT),
                'Khoa' => $faker->randomElement(['CNTT', 'Kinh tế', 'Ngoại ngữ', 'Luật', 'Xây dựng']),
                'So_luong_sinh_vien' => rand(0, 50),
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
