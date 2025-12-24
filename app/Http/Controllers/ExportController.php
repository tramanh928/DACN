<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use PhpOffice\PhpWord\TemplateProcessor;
use App\Models\DeTai;
use App\Models\DiemPhanBien;
use App\Models\DiemHuongDan;

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

        $originalFilename = $sv1->Ho_va_Ten ?? 'SV1';
        if ($sv2) {
            $originalFilename .= ' - ' . ($sv2->Ho_va_Ten ?? 'SV2');
        }

        $filename = preg_replace('/[\\\\\/:*?"<>|]/', '', $originalFilename) . '.docx';

        $tempPath = tempnam(sys_get_temp_dir(), 'nhiemvu_') . '.docx';
        copy(storage_path('app/templates/Form_NhiemvuLVTN - 2SV.docx'), $tempPath);

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
        for ($i = 0; $i < 5; $i++) {
            $template->setValue('task' . ($i + 1), $lines[$i] ?? '');
        }

        $template->saveAs($tempPath);
        $this->updateDocxTitle($tempPath, $filename);

        return response()->download($tempPath, $filename)->deleteFileAfterSend(true);
    }

    public function downloadPhanBien($MaDT)
    {
        $topic = DeTai::with(['SinhVien', 'giangVienPhanBien'])
            ->where('MaDT', $MaDT)
            ->firstOrFail();

        $students = $topic->SinhVien;
        $gv = $topic->giangVienPhanBien;

        $templateFile = $students->count() === 1
            ? 'Mau 02.02_PHIEU CHAM_PHAN BIEN_SINH VIEN-An_.docx'
            : 'Mau 02.01_PHIEU CHAM_PHAN BIEN_NHOM SINH VIEN - Tham-Tran.docx';

        $tempPath = tempnam(sys_get_temp_dir(), 'phanbien_') . '.docx';
        copy(storage_path("app/templates/{$templateFile}"), $tempPath);

        $template = new TemplateProcessor($tempPath);

        $template->setValue('ten_detai', $topic->TenDeTai ?? '');
        $template->setValue('gv_name', $gv->Ho_va_Ten ?? '');

        $shared = null;
        if ($students->count() > 0) {
            $shared = DiemPhanBien::where('MSSV', $students[0]->MSSV)->first();
        }

        $template->setValue('dieu_chinh', $shared->dieu_chinh ?? '');
        $template->setValue('uu', $shared->uu ?? '');
        $template->setValue('nhuoc', $shared->nhuoc ?? '');
        $template->setValue('cau_hoi', $shared->cau_hoi ?? '');

        $template->setValue(
            'check_dat',
            $shared && $shared->Danh_gia === 'Đạt' ? '☑' : '☐'
        );
        $template->setValue(
            'check_khong_dat',
            $shared && $shared->Danh_gia === 'Không đạt' ? '☑' : '☐'
        );

        foreach ($students as $i => $sv) {
            $idx = $i + 1;

            $template->setValue("sv{$idx}_name", $sv->Ho_va_Ten ?? '');
            $template->setValue("sv{$idx}_mssv", $sv->MSSV ?? '');
            $template->setValue("sv{$idx}_lop", $sv->Lop ?? '');

            $score = DiemPhanBien::where('MSSV', $sv->MSSV)->first();
            if (!$score) {
                $template->setValue("pttk_sv{$idx}", '');
                $template->setValue("tkvd_sv{$idx}", '');
                $template->setValue("htvd_sv{$idx}", '');
                $template->setValue("ktsp_sv{$idx}", '');
                $template->setValue("tong_sv{$idx}", '');
                $template->setValue("diem10_sv{$idx}", '');
                $template->setValue("bv_dat_sv{$idx}", '☐');
                $template->setValue("bv_khong_sv{$idx}", '☐');
                $template->setValue("bv_bs_sv{$idx}", '☐');
                continue;
            }

            $template->setValue("pttk_sv{$idx}", $score->pttk ?? '');
            $template->setValue("tkvd_sv{$idx}", $score->tkvd ?? '');
            $template->setValue("htvd_sv{$idx}", $score->htvd ?? '');
            $template->setValue("ktsp_sv{$idx}", $score->ktsp ?? '');

            $template->setValue(
                "tong_sv{$idx}",
                $score->tong !== null ? $score->tong*10 : ''
            );

            $diem10 = round($score->tong, 1);

            $template->setValue("diem10_sv{$idx}", $diem10);
            $template->setValue(
                "diem10_chu_sv{$idx}",
                $this->diemSoThanhChu($diem10)
            );

            $template->setValue(
                "bv_dat_sv{$idx}",
                $score->bao_ve === 'Được bảo vệ' ? '☑' : '☐'
            );
            $template->setValue(
                "bv_khong_sv{$idx}",
                $score->bao_ve === 'Không được bảo vệ' ? '☑' : '☐'
            );
            $template->setValue(
                "bv_bs_sv{$idx}",
                $score->bao_ve === 'Bổ sung/hiệu chỉnh để được bảo vệ' ? '☑' : '☐'
            );
            $deNghi = '';

            if ($score->bao_ve === 'Được bảo vệ') {
                $deNghi = 'Được bảo vệ';
            } elseif ($score->bao_ve === 'Không được bảo vệ') {
                $deNghi = 'Không được bảo vệ';
            } elseif ($score->bao_ve === 'Bổ sung/hiệu chỉnh để được bảo vệ') {
                $deNghi = 'Bổ sung/hiệu chỉnh để được bảo vệ';
            }

            $template->setValue('de_nghi_bao_ve_sv1', $deNghi);
        }

        $filename = 'Điểm phản biện - ' . $students->pluck('Ho_va_Ten')->implode(' - ') . '.docx';
        $filename = preg_replace('/[\\\\\/:*?"<>|]/', '', $filename);

        $template->saveAs($tempPath);

        return response()
            ->download($tempPath, $filename)
            ->deleteFileAfterSend(true);
    }

    public function downloadHuongDan($MaDT)
    {
        $topic = DeTai::with(['SinhVien', 'giangVien'])
            ->where('MaDT', $MaDT)
            ->firstOrFail();

        $students = $topic->SinhVien;
        $gv = $topic->giangVien;

        $templateFile = $students->count() === 1
            ? 'Mau 01.02_PHIEU CHAM_HUONG DAN_SINH VIEN - Duy_.docx'
            : 'Mau 01.01_PHIEU CHAM_HUONG DAN_NHOM SINH VIEN -Hau Hieu.docx';

        $tempPath = tempnam(sys_get_temp_dir(), 'huongdan_') . '.docx';
        copy(storage_path("app/templates/{$templateFile}"), $tempPath);

        $template = new TemplateProcessor($tempPath);

        $template->setValue('ten_detai', $topic->TenDeTai ?? '');
        $template->setValue('gv_name', $gv->Ho_va_Ten ?? '');

        $shared = null;
        if ($students->count() > 0) {
            $shared = DiemHuongDan::where('MSSV', $students[0]->MSSV)->first();
        }

        $template->setValue('dieu_chinh', $shared->dieu_chinh ?? '');
        $template->setValue('uu', $shared->uu ?? '');
        $template->setValue('nhuoc', $shared->nhuoc ?? '');
        $template->setValue('cau_hoi', $shared->cau_hoi ?? '');

        $template->setValue(
            'check_dat',
            $shared && $shared->Danh_gia === 'Đạt' ? '☑' : '☐'
        );
        $template->setValue(
            'check_khong_dat',
            $shared && $shared->Danh_gia === 'Không đạt' ? '☑' : '☐'
        );

        foreach ($students as $i => $sv) {
            $idx = $i + 1;

            $template->setValue("sv{$idx}_name", $sv->Ho_va_Ten ?? '');
            $template->setValue("sv{$idx}_mssv", $sv->MSSV ?? '');
            $template->setValue("sv{$idx}_lop", $sv->Lop ?? '');

            $score = DiemHuongDan::where('MSSV', $sv->MSSV)->first();
            if (!$score) {
                $template->setValue("pttk_sv{$idx}", '');
                $template->setValue("tkvd_sv{$idx}", '');
                $template->setValue("htvd_sv{$idx}", '');
                $template->setValue("ktsp_sv{$idx}", '');
                $template->setValue("tong_sv{$idx}", '');
                $template->setValue("diem10_sv{$idx}", '');
                $template->setValue("bv_dat_sv{$idx}", '☐');
                $template->setValue("bv_khong_sv{$idx}", '☐');
                $template->setValue("bv_bs_sv{$idx}", '☐');
                continue;
            }

            $template->setValue("pttk_sv{$idx}", $score->pttk ?? '');
            $template->setValue("tkvd_sv{$idx}", $score->tkvd ?? '');
            $template->setValue("htvd_sv{$idx}", $score->htvd ?? '');
            $template->setValue("ktsp_sv{$idx}", $score->ktsp ?? '');

            $template->setValue("tong_sv{$idx}", $score->tong ?? '');
            $diem10 = round($score->tong, 1);
            $template->setValue("diem10_sv{$idx}", $diem10);

            $template->setValue(
                "bv_dat_sv{$idx}",
                $score->bao_ve === 'Được bảo vệ' ? '☑' : '☐'
            );
            $template->setValue(
                "bv_khong_sv{$idx}",
                $score->bao_ve === 'Không được bảo vệ' ? '☑' : '☐'
            );
            $template->setValue(
                "bv_bs_sv{$idx}",
                $score->bao_ve === 'Bổ sung/hiệu chỉnh để được bảo vệ' ? '☑' : '☐'
            );

            $deNghi = '';
            if ($score->bao_ve === 'Được bảo vệ') $deNghi = 'Được bảo vệ';
            elseif ($score->bao_ve === 'Không được bảo vệ') $deNghi = 'Không được bảo vệ';
            elseif ($score->bao_ve === 'Bổ sung/hiệu chỉnh để được bảo vệ') $deNghi = 'Bổ sung/hiệu chỉnh để được bảo vệ';

            $template->setValue("de_nghi_bao_ve_sv{$idx}", $deNghi);
        }

        $filename = 'Điểm hướng dẫn - ' . $students->pluck('Ho_va_Ten')->implode(' - ') . '.docx';
        $filename = preg_replace('/[\\\\\/:*?"<>|]/', '', $filename);

        $template->saveAs($tempPath);

        return response()
            ->download($tempPath, $filename)
            ->deleteFileAfterSend(true);
    }


    private function updateDocxTitle($filePath, $title)
    {
        $zip = new \ZipArchive();
        if ($zip->open($filePath) === true) {
            if (($index = $zip->locateName('docProps/core.xml')) !== false) {
                $data = $zip->getFromIndex($index);
                $data = preg_replace(
                    '/<dc:title>.*<\/dc:title>/',
                    '<dc:title>' . htmlspecialchars($title, ENT_XML1) . '</dc:title>',
                    $data
                );
                $zip->addFromString('docProps/core.xml', $data);
            }
            $zip->close();
        }
    }
    private function diemSoThanhChu($diem)
    {
        $map = [
            0 => 'Không',
            0.5 => 'Không phẩy năm',
            1 => 'Một',
            1.5 => 'Một phẩy năm',
            2 => 'Hai',
            2.5 => 'Hai phẩy năm',
            3 => 'Ba',
            3.5 => 'Ba phẩy năm',
            4 => 'Bốn',
            4.5 => 'Bốn phẩy năm',
            5 => 'Năm',
            5.5 => 'Năm phẩy năm',
            6 => 'Sáu',
            6.5 => 'Sáu phẩy năm',
            7 => 'Bảy',
            7.5 => 'Bảy phẩy năm',
            8 => 'Tám',
            8.5 => 'Tám phẩy năm',
            9 => 'Chín',
            9.5 => 'Chín phẩy năm',
            10 => 'Mười',
        ];

        $diem = round($diem, 1);

        return ($map[$diem] ?? '') . ' điểm';
    }
}
