<?php

namespace App\Exports;

use App\Models\SinhVien;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithStyles;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Events\AfterSheet;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;
use PhpOffice\PhpSpreadsheet\Style\Border;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Style\Fill;

class StudentsExport implements
    FromCollection,
    WithHeadings,
    WithStyles,
    ShouldAutoSize,
    WithEvents
{
    public function collection()
    {
        // Lấy dữ liệu với quan hệ
        $students = SinhVien::with(['giangVienHuongDan', 'deTai'])
            ->get()
            ->map(function ($s) {
                return [
                    'MSSV'    => $s->MSSV,
                    'HoTen'   => trim($s->Ho_va_Ten),
                    'Nhom'    => $s->Nhom,
                    'DeTai'   => $s->MaDT ? ($s->deTai->TenDeTai ?? '') : '',
                    'GVHD'    => $s->giangVienHuongDan->Ho_va_Ten ?? '',
                    'GhiChu'  => $s->GhiChu ?? '',
                ];
            });

        // Sort: null Nhom first, then by Nhom (numerically if possible)
        $students = $students->sortBy(function($s) {
            if (is_null($s['Nhom'])) {
                return -1; // nulls first
            }
            return is_numeric($s['Nhom']) ? (int)$s['Nhom'] : $s['Nhom'];
        })->values();

        return $students;
    }

    public function headings(): array
    {
        return [
            'MSSV',
            'Họ và tên sinh viên',
            'Nhóm',
            'Đề tài LVTN',
            'GVHD',
            'Ghi chú',
        ];
    }

    public function styles(Worksheet $sheet)
    {
        return [
            1 => [
                'font' => ['bold' => true, 'size' => 12],
                'alignment' => [
                    'horizontal' => Alignment::HORIZONTAL_CENTER,
                    'vertical' => Alignment::VERTICAL_CENTER,
                ],
                'fill' => [
                    'fillType' => Fill::FILL_SOLID,
                    'startColor' => ['rgb' => 'FFFF00'],
                ],
            ],
        ];
    }

    public function registerEvents(): array
    {
        return [
            AfterSheet::class => function (AfterSheet $event) {
                $sheet = $event->sheet->getDelegate();

                // Freeze header
                $sheet->freezePane('A2');

                // Wrap text cho Đề tài và Ghi chú
                $sheet->getStyle('D:F')
                    ->getAlignment()
                    ->setWrapText(true);

                // Center alignment cho MSSV, Họ tên, Nhóm
                $sheet->getStyle('A:C')
                    ->getAlignment()
                    ->setHorizontal(Alignment::HORIZONTAL_CENTER);

                // Border toàn sheet
                $highestRow = $sheet->getHighestRow();
                $highestCol = $sheet->getHighestColumn();
                $sheet->getStyle("A1:{$highestCol}{$highestRow}")
                    ->getBorders()
                    ->getAllBorders()
                    ->setBorderStyle(Border::BORDER_THIN);

                // Merge cells theo Nhóm, Đề tài, GVHD
                $currentGroup = null;
                $startRow = 2; // row đầu tiên dữ liệu

                for ($row = 2; $row <= $highestRow + 1; $row++) {
                    $nhom = $sheet->getCell("C$row")->getValue(); // cột Nhóm

                    if ($nhom !== $currentGroup) {
                        // Merge nhóm trước đó nếu >1 row
                        if ($currentGroup !== null && $row - 1 > $startRow) {
                            foreach (['C', 'D', 'E'] as $col) {
                                $sheet->mergeCells("{$col}{$startRow}:{$col}" . ($row - 1));
                                $sheet->getStyle("{$col}{$startRow}:{$col}" . ($row - 1))
                                    ->getAlignment()
                                    ->setVertical(Alignment::VERTICAL_CENTER)
                                    ->setHorizontal(Alignment::HORIZONTAL_CENTER);
                            }
                        }
                        $currentGroup = $nhom;
                        $startRow = $row;
                    }
                }
            },
        ];
    }
}
