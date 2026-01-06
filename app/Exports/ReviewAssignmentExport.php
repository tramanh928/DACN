<?php

namespace App\Exports;

use App\Models\DeTai;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithStyles;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Events\AfterSheet;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Style\Border;
use PhpOffice\PhpSpreadsheet\Style\Fill;

class ReviewAssignmentExport implements
    FromCollection,
    WithHeadings,
    WithStyles,
    ShouldAutoSize,
    WithEvents
{
    public function collection()
    {
        $rows = [];
        $stt  = 1;

        $topics = DeTai::with('SinhVien')->get();

        foreach ($topics as $topic) {
            foreach ($topic->SinhVien as $sv) {
                $rows[] = [
                    $stt,
                    $sv->MSSV,
                    $sv->Ho_va_Ten,
                    $sv->HuongDeTai,
                    $topic->TenDeTai,
                    $topic->GiangVienPhanBien->Ho_va_Ten ?? '',
                ];
            }
            $stt++;
        }

        return collect($rows);
    }

    public function headings(): array
    {
        return [
            'STT',
            'MSSV',
            'Họ và tên sinh viên',
            'Hướng đề tài',
            'Tên đề tài',
            'Giảng viên phản biện',
        ];
    }

    public function styles(Worksheet $sheet)
    {
        return [
            1 => [
                'font' => [
                    'bold' => true,
                    'size' => 12,
                ],
                'alignment' => [
                    'horizontal' => Alignment::HORIZONTAL_CENTER,
                    'vertical'   => Alignment::VERTICAL_CENTER,
                ],
                'fill' => [
                    'fillType' => Fill::FILL_SOLID,
                    'startColor' => [
                        'rgb' => 'FFFF00', 
                    ],
                ],
            ],
        ];
    }

    public function registerEvents(): array
    {
        return [
            AfterSheet::class => function (AfterSheet $event) {
                $sheet = $event->sheet->getDelegate();

                $sheet->freezePane('A2');

                $sheet->getStyle('A:F')
                    ->getAlignment()
                    ->setVertical(Alignment::VERTICAL_CENTER);

                $highestRow = $sheet->getHighestRow();
                $highestCol = $sheet->getHighestColumn();

                $sheet->getStyle("A1:{$highestCol}{$highestRow}")
                    ->getBorders()
                    ->getAllBorders()
                    ->setBorderStyle(Border::BORDER_THIN);
            },
        ];
    }
}
