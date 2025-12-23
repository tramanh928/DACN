<?php

namespace App\Imports;

use App\Models\TempImport as TempImportModel;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\WithChunkReading;
use Maatwebsite\Excel\Concerns\WithBatchInserts;
use Maatwebsite\Excel\Imports\HeadingRowFormatter;

HeadingRowFormatter::default('none');

class TempImport implements ToModel, WithHeadingRow, WithChunkReading, WithBatchInserts
{
    public function headingRow(): int
    {
        return 1;
    }

    public function model(array $row)
    {
        if (empty($row['MSSV']) && empty($row['HỌ TÊN SINH VIÊN'])) {
            return null;
        }

        $trangThai = null;

        if (!empty($row['Cảnh cáo'])) {
            $trangThai = 'Cảnh Cáo';
        } elseif (!empty($row['Đình chỉ'])) {
            $trangThai = 'Đình Chỉ';
        } elseif (!empty($row['Ý kiến khác'])) {
            $trangThai = $row['Ý kiến khác'];
        }
        else
            $trangThai = "Được tiếp tục";

        return new TempImportModel([
            'MSSV'        => $row['MSSV'] ?? null,
            'HoTenSV'     => $row['HỌ TÊN SINH VIÊN'] ?? null,
            'Lop'         => $row['LỚP'] ?? null,
            'SDT'         => $row['SĐT'] ?? null,
            'Email'       => $row['Email'] ?? null,
            'HuongDeTai'  => $row['Hướng đề tài'] ?? null,
            'Nhom'        => $row['Nhóm'] ?? null,
            'GVHD'        => $row['GVHD'] ?? null,

            'HocVi'       => $row['HH-HV'] ?? null,
            'TenDeTai'    => $row['Tên đề tài'] ?? null,
            'NoiCongTac'  => $row['Nơi công tác'] ?? null,

            'Diem'        => $row['Điểm'] ?? null,
            'TrangThai'   => $trangThai,
            'GhiChu'      => $row['Ghi chú'] ?? null,
            'MoTa'        => $row['Mô tả'] ?? null
        ]);
    }

    public function chunkSize(): int
    {
        return 100;
    }

    public function batchSize(): int
    {
        return 100;
    }
}
