<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DiemHuongDan extends Model
{
    protected $table = 'diem_huong_dan';

    protected $primaryKey = 'id';

    public $incrementing = true;

    protected $keyType = 'int';

    protected $fillable = [
        'MSSV',

        'pttk',
        'tkvd',
        'htvd',
        'ktsp',
        'tong',

        'danh_gia',
        'dieu_chinh',
        'uu',
        'nhuoc',
        'cau_hoi',

        'bao_ve',

        'ghi_chu'
    ];

    protected $casts = [
        'pttk' => 'double',
        'tkvd' => 'double',
        'htvd' => 'double',
        'ktsp' => 'double',
        'tong' => 'double',
    ];
}
