<?php

namespace App\Exports;

use App\Models\SinhVien;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class StudentsExport implements FromCollection, WithHeadings
{
    public function collection()
    {
        return SinhVien::all()->map(function($s) {
            return [
                'MSSV'     => $s->mssv,
                'Họ tên'   => trim($s->Ho . ' ' . ($s->Ten ?? '')),
                'Nhóm'     => $s->Nhom,
                'Đề tài'   => $s->Huong_de_tai,
                'GVHD'     => $s->Giang_vien_hd ?? '',
                'Trạng thái' => $s->Trang_Thai ?? 'Chưa gặp',
                'Ghi chú'  => $s->Ghi_chu ?? '',
            ];
        });
    }

    public function headings(): array
    {
        return ['MSSV', 'Họ tên', 'Nhóm', 'Đề tài', 'GVHD', 'Trạng thái', 'Ghi chú'];
    }
}
