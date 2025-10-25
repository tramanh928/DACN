<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DeTai extends Model
{
    use HasFactory;

    // Table name (optional — only if it’s not the plural form)
    protected $table = 'detai';

    // Columns that can be mass-assigned
    protected $fillable = [
        'MaDT',
        'TenDT',
        'MaGV',
        'SoLuong',
        'TrangThai',
    ];

    // If you don’t want timestamps (created_at, updated_at)
    public $timestamps = true;

    // Optional: define relationship if GiangVien links to a teacher
    public function giangVien()
    {
        return $this->belongsTo(Teacher::class, 'GiangVien', 'MaGV');
    }
}
