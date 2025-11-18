<?php

namespace App\Imports;

use App\Models\TempImport as TempImportModel;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\WithChunkReading;
use Maatwebsite\Excel\Concerns\WithBatchInserts;
use Maatwebsite\Excel\Imports\HeadingRowFormatter;

HeadingRowFormatter::default('none'); // keep Vietnamese header names exactly

class TempImport implements ToModel, WithHeadingRow, WithChunkReading, WithBatchInserts
{
    /**
     * Define which row is the header (row 1)
     */
    public function headingRow(): int
    {
        return 1;
    }

    /**
     * Map each row to a model
     */
    public function model(array $row)
    {
        // Skip empty rows
        if (empty($row['MSSV']) && empty($row['HỌ TÊN SINH VIÊN'])) {
            return null;
        }

        return new TempImportModel([
            'MSSV'        => $row['MSSV'] ?? null,
            'HoTenSV'     => $row['HỌ TÊN SINH VIÊN'] ?? null,
            'Lop'         => $row['LỚP'] ?? null,
            'SDT'         => $row['SĐT'] ?? null,
            'Email'       => $row['Email'] ?? null,
            'HuongDeTai'  => $row['Hướng đề tài'] ?? null,
            'Nhom'        => $row['Nhóm'] ?? null,
            'GVHD'        => $row['GVHD'] ?? null,
        ]);
    }

    /**
     * Tune for performance
     */
    public function chunkSize(): int
    {
        return 100;
    }

    public function batchSize(): int
    {
        return 100;
    }
}
