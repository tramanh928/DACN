<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GiangVien extends Model
{
    protected $fillable = ['Ho', 'Ten', 'email', 'sdt', 'Ngay_Sinh', 'So_luong_sinh_vien', 'MaGV', 'Khoa'];
    protected $table = 'giangvien';
     public function getFullNameAttribute()
    {
        return trim($this->Ho . ' ' . $this->Ten);
    }
}
