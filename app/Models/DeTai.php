<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class DeTai extends Model
{
    use HasFactory;

    protected $table = 'DeTai';

    // Khóa chính
    protected $primaryKey = 'MaDT';
    public $incrementing = false; 
    protected $keyType = 'string';

    protected $fillable = [
        'MaDT',
        'TenDeTai',
        'MaGV',
        'MaGVPB',
        'SoLuong',
        'MoTa',
        'TrangThai',
    ];

    public $timestamps = true;

    protected $casts = [
        'SoLuong' => 'integer',
    ];


    public function giangVien(): BelongsTo
    {
        return $this->belongsTo(GiangVien::class, 'MaGV', 'MaGV');
    }

    public function giangVienPhanBien(): BelongsTo
    {
        return $this->belongsTo(GiangVien::class, 'MaGVPB', 'MaGV');
    }

    public function SinhVien()
    {
        return $this->hasMany(SinhVien::class, 'MaDT', 'MaDT');
    }
    
}
