<?php

namespace App\Exports;

use App\Models\DeTai;
use App\Models\HoiDong;
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

class CommitteeAssignmentExport implements
    FromCollection,
    WithHeadings,
    WithStyles,
    ShouldAutoSize,
    WithEvents
{
    /**
     * Map MaHD => Hội đồng index (based on created_at)
     */
    protected function committeeIndexMap()
    {
        return HoiDong::orderBy('created_at')
            ->pluck('MaHD')
            ->values()
            ->mapWithKeys(fn ($mahd, $i) => [$mahd => $i + 1]);
    }

    public function collection()
    {
        $rows = [];
        $committeeMap = $this->committeeIndexMap();

        $topics = DeTai::with(['SinhVien', 'hoiDong'])->get();

        foreach ($topics as $topic) {
            foreach ($topic->SinhVien as $sv) {

                $committeeLabel = '';

                if ($topic->hoiDong && $committeeMap->has($topic->hoiDong->MaHD)) {
                    $committeeLabel = 'Hội đồng ' . $committeeMap[$topic->hoiDong->MaHD];
                }

                $rows[] = [
                    $sv->MSSV,
                    $sv->Ho_va_Ten,
                    $sv->Nhom,
                    $sv->HuongDeTai,
                    $topic->TenDeTai,
                    $committeeLabel,
                ];
            }
        }

        return collect($rows);
    }

    public function headings(): array
    {
        return [
            'MSSV',
            'Họ và tên sinh viên',
            'Nhóm',
            'Hướng đề tài',
            'Đề tài',
            'Hội đồng',
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

                $sheet->getStyle('A:C')
                    ->getAlignment()
                    ->setHorizontal(Alignment::HORIZONTAL_CENTER);

                $sheet->getStyle('D')
                    ->getAlignment()
                    ->setWrapText(true);

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
