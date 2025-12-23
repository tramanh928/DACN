<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DiemHuongDan extends Model
{
    protected $table = 'diem_huong_dan';

    protected $fillable = [
        'MSSV',
        'pttk',
        'tkvd',
        'htvd',
        'ktsp',
        'tong',
    ];
}
