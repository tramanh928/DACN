<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class SinhVien extends Model
{

    protected $table = 'SinhVien';


    protected $primaryKey = 'MSSV';
    public $incrementing = false;
    protected $keyType = 'string';

    public $timestamps = true;

    protected $fillable = [
        'MSSV',
        'Ho_va_Ten',
        'email',
        'sdt',
        'Lop',
        'Nhom',
        'MaDT',
        'HuongDeTai',
        'Giang_vien_huong_dan',
        'Da_phan_cong',
        'user_id',
    ];

    protected $casts = [
        'Da_phan_cong' => 'boolean',
        'Ngay_Sinh' => 'date',
    ];

    public function getFullNameAttribute(): ?string
    {
        return $this->Ho_va_Ten ? trim($this->Ho_va_Ten) : null;
    }


    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id');
    }

 
    public function giangVienHuongDan(): BelongsTo
    {
        return $this->belongsTo(GiangVien::class, 'Giang_vien_huong_dan', 'MaGV');
    }

    public function deTai(): BelongsTo
    {
        return $this->belongsTo(DeTai::class, 'MaDT', 'MaDT');
    }
}
