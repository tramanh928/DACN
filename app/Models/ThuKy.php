<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ThuKy extends Model
{
    protected $fillable = ['Ho', 'Ten', 'email', 'sdt', 'Ngay_Sinh', 'MaTK'];
    protected $table = 'thuky';
     public function getFullNameAttribute()
    {
        return trim($this->Ho . ' ' . $this->Ten);
    }
}
