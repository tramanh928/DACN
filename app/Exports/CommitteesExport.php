<?php

namespace App\Exports;

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

class CommitteesExport implements
    FromCollection,
    WithHeadings,
    WithStyles,
    ShouldAutoSize,
    WithEvents
{
    protected array $mergeMap = [];

   public function collection()
    {
        $rows = [];
        $currentRow = 2;

        $committees = HoiDong::with('giangViens')
            ->orderBy('created_at')
            ->get();

        $priority = [
            'chu_tich' => 1,
            'thu_ky'   => 2,
            'uy_vien'  => 3,
        ];

        foreach ($committees as $idx => $hd) {
            $tenHoiDong = 'Hội đồng ' . ($idx + 1);

            $giangViens = $hd->giangViens->sortBy(function ($gv) use ($priority) {
                return $priority[$gv->pivot->ChucVu] ?? 99;
            });

            $gvCount = max($giangViens->count(), 1);

            $this->mergeMap[] = [
                'start' => $currentRow,
                'end'   => $currentRow + $gvCount - 1,
            ];

            if ($giangViens->isEmpty()) {
                $rows[] = [
                    $idx + 1,
                    $tenHoiDong,
                    '',
                    '',
                    optional($hd->ngay_bat_dau)->format('d/m/Y H:i'),
                    optional($hd->ngay_ket_thuc)->format('d/m/Y H:i'),
                ];
                $currentRow++;
                continue;
            }

            foreach ($giangViens as $gv) {
                switch ($gv->pivot->ChucVu) {
                    case 'chu_tich':
                        $position = 'Chủ tịch hội đồng';
                        break;
                    case 'thu_ky':
                        $position = 'Thư ký hội đồng';
                        break;
                    case 'uy_vien':
                        $position = 'Ủy viên hội đồng';
                        break;
                    default:
                        $position = $gv->pivot->ChucVu;
                }

                $rows[] = [
                    $idx + 1,
                    $tenHoiDong,
                    $gv->Ho_va_Ten ?? '',
                    $position,
                    optional($hd->ngay_bat_dau)->format('d/m/Y H:i'),
                    optional($hd->ngay_ket_thuc)->format('d/m/Y H:i'),
                ];

                $currentRow++;
            }
        }

        return collect($rows);
    }

    public function headings(): array
    {
        return [
            'STT',
            'Tên hội đồng',
            'Giảng viên',
            'Chức vụ',
            'Ngày giờ bắt đầu',
            'Ngày giờ kết thúc',
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

                foreach ($this->mergeMap as $m) {
                    if ($m['start'] < $m['end']) {
                        foreach (['A', 'B', 'E', 'F'] as $col) {
                            $range = "{$col}{$m['start']}:{$col}{$m['end']}";

                            $sheet->mergeCells($range);

                            $sheet->getStyle($range)
                                ->getAlignment()
                                ->setHorizontal(Alignment::HORIZONTAL_CENTER)
                                ->setVertical(Alignment::VERTICAL_CENTER);
                        }
                    }
                }

                $sheet->getStyle('A:B')
                    ->getAlignment()
                    ->setHorizontal(Alignment::HORIZONTAL_CENTER)
                    ->setVertical(Alignment::VERTICAL_CENTER);

                $sheet->getStyle('E:F')
                    ->getAlignment()
                    ->setHorizontal(Alignment::HORIZONTAL_CENTER)
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
