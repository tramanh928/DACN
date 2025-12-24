<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ChiTietHoiDong extends Model
{
    protected $table = 'chi_tiet_hoi_dong';

    protected $fillable = [
        'MaHD',
        'MaGV',
        'ChucVu',
    ];

    public function hoiDong(): BelongsTo
    {
        return $this->belongsTo(HoiDong::class, 'MaHD', 'MaHD');
    }


    public function giangVien(): BelongsTo
    {
        return $this->belongsTo(GiangVien::class, 'MaGV', 'MaGV');
    }
}
