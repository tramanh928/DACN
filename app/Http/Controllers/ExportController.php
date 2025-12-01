<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use PhpOffice\PhpWord\TemplateProcessor;
use App\Models\DeTai;

class ExportController extends Controller
{
    public function downloadTemplate($MaDT)
    {
        $topic = DeTai::with(['SinhVien', 'GiangVien'])
            ->where('MaDT', $MaDT)
            ->firstOrFail();

        $sv1 = $topic->SinhVien[0] ?? null;
        $sv2 = $topic->SinhVien[1] ?? null;
        $giangvien = $topic->GiangVien;

        // Build filename
        $originalFilename = $sv1->Ho_va_Ten ?? 'SV1';
        if ($sv2) {
            $originalFilename .= ' - ' . ($sv2->Ho_va_Ten ?? 'SV2');
        }

        // Remove only forbidden filesystem characters
        $filename = preg_replace('/[\\\\\/:*?"<>|]/', '', $originalFilename) . '.docx';

        // Use a clean temp file (avoid template name)
        $tempPath = tempnam(sys_get_temp_dir(), 'nhiemvu_') . '.docx';
        copy(storage_path('app/templates/Form_NhiemvuLVTN - 2SV.docx'), $tempPath);

        // Load template and fill fields
        $template = new TemplateProcessor($tempPath);
        $template->setValue('teacher_name', $giangvien->Ho_va_Ten ?? '');
        $template->setValue('sv1_name', $sv1->Ho_va_Ten ?? '');
        $template->setValue('sv1_mssv', $sv1->MSSV ?? '');
        $template->setValue('sv1_lop', $sv1->Lop ?? '');
        $template->setValue('sv2_name', $sv2->Ho_va_Ten ?? '');
        $template->setValue('sv2_mssv', $sv2->MSSV ?? '');
        $template->setValue('sv2_lop', $sv2->Lop ?? '');
        $template->setValue('ten_detai', $topic->TenDeTai ?? '');

        $lines = preg_split("/\r\n|\n|\r/", $topic->MoTa);
        $template->setValue('task1', $lines[0] ?? '');
        $template->setValue('task2', $lines[1] ?? '');
        $template->setValue('task3', $lines[2] ?? '');
        $template->setValue('task4', $lines[3] ?? '');
        $template->setValue('task5', $lines[4] ?? '');

        $template->saveAs($tempPath);

        $this->updateDocxTitle($tempPath, $filename);

        return response()->download($tempPath, $filename)->deleteFileAfterSend(true);
    }


    private function updateDocxTitle($filePath, $title)
    {
        $zip = new \ZipArchive();
        if ($zip->open($filePath) === true) {
            if (($index = $zip->locateName('docProps/core.xml')) !== false) {
                $data = $zip->getFromIndex($index);
                if (strpos($data, '<dc:title>') !== false) {
                    $data = preg_replace(
                        '/<dc:title>.*<\/dc:title>/',
                        '<dc:title>' . htmlspecialchars($title, ENT_XML1) . '</dc:title>',
                        $data
                    );
                    $zip->addFromString('docProps/core.xml', $data);
                }
            }
            $zip->close();
        }
    }
}
