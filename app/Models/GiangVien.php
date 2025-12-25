<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class GiangVien extends Model
{

    protected $table = 'giangvien';

    protected $primaryKey = 'MaGV';
    public $incrementing = false;
    protected $keyType = 'string';

    public $timestamps = true;

    protected $fillable = [
        'MaGV',
        'Ho_va_Ten',
        'HocVi',
        'NoiCongTac',
        'email',
        'sdt',
        'Ngay_Sinh',
        'So_luong_sinh_vien',
        'user_id',
    ];

    protected $casts = [
        'So_luong_sinh_vien' => 'integer',
        'Ngay_Sinh' => 'date',
    ];

    public function sinhViens()
{
    return $this->hasMany(
        SinhVien::class,
        'Giang_vien_huong_dan',
        'MaGV'
    );
}

    public function getFullNameAttribute(): ?string
    {
        return $this->Ho_va_Ten ? trim($this->Ho_va_Ten) : null;
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id');
    }
    public function hoiDongs()
{
    return $this->belongsToMany(
        HoiDong::class,
        'chi_tiet_hoi_dong',
        'MaGV',
        'MaHD'
    )->withPivot('ChucVu')->withTimestamps();
}

}
