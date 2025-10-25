<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\DeTai;
use Faker\Factory as Faker;

class DeTaiSeeder extends Seeder
{
    public function run(): void
    {
        $faker = Faker::create('vi_VN');

        for ($i = 1; $i <= 10; $i++) {
            DeTai::create([
                'MaDT' => 'DT' . str_pad($i, 3, '0', STR_PAD_LEFT),
                'TenDT' => $faker->sentence(4),
                'MoTa' => $faker->paragraph(),
                'MaGV' => $faker->numberBetween(1, 5),
                'SoLuong' => $faker->numberBetween(1, 3),
                'TrangThai' => $faker->randomElement(['Chờ sinh viên chọn', 'Đã được chọn', 'Đã khóa']),
            ]);
        }
    }
}
