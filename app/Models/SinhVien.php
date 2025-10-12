<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SinhVien extends Model
{
    protected $fillable = ['Ho', 'Ten', 'email', 'sdt', 'Ngay_Sinh', 'mssv', 'Lop', 'Nhom', 'Huong_de_tai'];

     public function getFullNameAttribute()
    {
        return trim($this->Ho . ' ' . $this->Ten);
    }
}
