<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class DeTai extends Model
{
    use HasFactory;

    protected $table = 'detai';

    // Khóa chính
    protected $primaryKey = 'MaDT';
    public $incrementing = false; 
    protected $keyType = 'string';

    protected $fillable = [
        'MaDT',
        'TenDeTai',
        'MaGV',
        'SoLuong',
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
}
