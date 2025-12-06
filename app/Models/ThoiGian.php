<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ThoiGian extends Model
{
    use HasFactory;

    protected $table = 'ThoiGian';

    protected $fillable = [
        'TenSuKien',
        'NgayBatDau',
        'NgayKetThuc',
    ];

    protected $casts = [
    'NgayBatDau' => 'datetime',
    'NgayKetThuc' => 'datetime',
    'created_at' => 'datetime',
    'updated_at' => 'datetime',
];

}
