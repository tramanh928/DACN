<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SinhVien extends Model
{
    // Allow mass assignment
    protected $fillable = [
        'Ho',
        'Ten',
        'email',
        'sdt',
        'Ngay_Sinh',
        'mssv',
        'Lop',
        'Nhom',
        'Huong_de_tai',
        'Giang_vien_hd', // make sure this matches your actual column name
        'Trang_Thai',
        'Ghi_chu'
    ];

    // Correct table name
    protected $table = 'sinhvien';

    // Optional: if you don't use timestamps
    public $timestamps = false;

    // Accessor to get full name
    public function getFullNameAttribute()
    {
        return trim($this->Ho . ' ' . $this->Ten);
    }
}
