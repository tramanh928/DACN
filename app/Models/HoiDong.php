<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class HoiDong extends Model
{
    protected $table = 'hoi_dong';

    protected $primaryKey = 'MaHD';
    public $incrementing = false;
    protected $keyType = 'string';

    protected $fillable = [
        'MaHD',
        'ngay_bat_dau',
        'ngay_ket_thuc',
    ];

    protected $casts = [
        'ngay_bat_dau' => 'datetime',
        'ngay_ket_thuc' => 'datetime',
    ];

    public function chiTiet()
    {
        return $this->hasMany(ChiTietHoiDong::class, 'MaHD', 'MaHD');
    }


    public function giangViens()
    {
        return $this->belongsToMany(
            GiangVien::class,
            'chi_tiet_hoi_dong',
            'MaHD',
            'MaGV'
        )->withPivot('ChucVu');
    }
}
