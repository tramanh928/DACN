<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use PhpOffice\PhpWord\TemplateProcessor;
use App\Models\DeTai;

class ExportController extends Controller
{
    /**
     * STEP 1: Download template (.docx) for user to edit manually
     */
    public function downloadTemplate($MaDT)
    {
        $topic = DeTai::with(['SinhVien', 'GiangVien'])->where('MaDT', $MaDT)->firstOrFail();

        $sv1 = $topic->SinhVien[0] ?? null;
        $sv2 = $topic->SinhVien[1] ?? null;
        $giangvien = $topic->GiangVien;

        $template = new \PhpOffice\PhpWord\TemplateProcessor(
            storage_path('app/templates/Form_NhiemvuLVTN - 2SV.docx')
        );

        // Fill placeholders
        $template->setValue('teacher_name', $giangvien->Ho_va_Ten ?? '');

        $template->setValue('sv1_name', $sv1->Ho_va_Ten ?? '');
        $template->setValue('sv1_mssv', $sv1->MSSV ?? '');
        $template->setValue('sv1_lop',  $sv1->Lop ?? '');

        $template->setValue('sv2_name', $sv2->Ho_va_Ten ?? '');
        $template->setValue('sv2_mssv', $sv2->MSSV ?? '');
        $template->setValue('sv2_lop',  $sv2->Lop ?? '');

        $template->setValue('ten_detai', $topic->TenDeTai ?? '');

        // tasks
        $lines = preg_split("/\r\n|\n|\r/", $topic->MoTa);
        $template->setValue('task1', $lines[0] ?? '');
        $template->setValue('task2', $lines[1] ?? '');
        $template->setValue('task3', $lines[2] ?? '');
        $template->setValue('task4', $lines[3] ?? '');
        $template->setValue('task5', $lines[4] ?? '');

        $tempFile = tempnam(sys_get_temp_dir(), 'docx');
        $template->saveAs($tempFile);

        return response()->download($tempFile, 'Form_NhiemvuLVTN - 2SV.docx')->deleteFileAfterSend(true);
    }


    /**
     * STEP 2: User uploads edited template → we finalize & export
     */
    public function confirmTemplate(Request $request)
    {
        $request->validate([
            'file' => 'required|file|mimes:docx'
        ]);

        // Path of the uploaded edited file
        $uploadedPath = $request->file('file')->path();

        // Load the user-edited template
        $template = new TemplateProcessor($uploadedPath);

        // Add final values (customize as needed)
        $template->setValue('NgayXacNhan', now()->format('d/m/Y'));
        $template->setValue('GiangVien', auth()->user()->TenGV ?? 'Giảng viên');

        // Save to temp file
        $out = tempnam(sys_get_temp_dir(), 'docx');
        $template->saveAs($out);

        return response()->download($out, 'Form_NhiemvuLVTN - 2SV_Final.docx')->deleteFileAfterSend(true);
    }
}
