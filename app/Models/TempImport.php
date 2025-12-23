<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TempImport extends Model
{
    protected $table = 'temp_import';
    protected $fillable = [
        'MSSV', 'HoTenSV','Lop', 'SDT', 'Email', 'HuongDeTai', 'Nhom', 'GVHD',  'HocVi', 'TenDeTai', 'NoiCongTac', 'Diem', 'TrangThai', 'GhiChu', 'MoTa'
    ];
}
