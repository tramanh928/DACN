<?php

namespace App\Http\Controllers;

use App\Models\SinhVien;
use App\Models\DeTai;
use Illuminate\Http\Request;
use App\Exports\StudentsExport;
use Maatwebsite\Excel\Facades\Excel;
use App\Exports\Evaluation50Export;
use App\Exports\ReviewAssignmentExport;
use App\Exports\CommitteeAssignmentExport;

class StudentController extends Controller
{
    public function index()
    {
        return SinhVien::with(['giangVienHuongDan', 'deTai'])->get()->map(function($s) {
            return [
                'mssv'               => $s->MSSV,
                'name'               => $s->Ho_va_Ten,
                'Lop'                => $s->Lop,
                'group'              => $s->Nhom,
                'topic'              => $s->MaDT ? $s->deTai->TenDeTai : '',
                'committee'          => $s->MaDT ? $s->deTai->MaHD : '',
                'MaDT'               => $s->MaDT,
                'email'              => $s->email,
                'phone'              => $s->sdt,
                'lecturer'           => $s->giangVienHuongDan ? $s->giangVienHuongDan->Ho_va_Ten : '',
                'status'             => $s->deTai ? $s->deTai->TrangThai : '-',
                'score'              => $s->Diem,
                'note'               => $s->GhiChu,
            ];
        });
    }

    public function show(SinhVien $student)
    {
        return $student->load(['giangVienHuongDan', 'deTai']);
    }

    public function getStudentsByTeacher(Request $request, $MaGV)
    {
        return SinhVien::where('Giang_vien_huong_dan', $MaGV)->get()->map(function($s) {
            return [
                'mssv'               => $s->MSSV,
                'name'               => $s->Ho_va_Ten,
                'Lop'                => $s->Lop,
                'group'              => $s->Nhom,
                'code'               => $s->MaDT, 
                'topic'              => $s->deTai ? $s->deTai->TenDeTai : '',
                'description'        => $s->deTai ? $s->deTai->MoTa : '',
                'email'              => $s->email,
                'phone'              => $s->sdt,
                'lecturer'           => $s->giangVienHuongDan ? $s->giangVienHuongDan->Ho_va_Ten : '',
                'status'             => $s->deTai ? $s->deTai->TrangThai : '-',
                'score'              => $s->Diem,
                'note'               => $s->GhiChu,
            ];
        });
    }
    public function getStudentsByReviewer(Request $request, $MaGV)
    {
        return SinhVien::whereHas('deTai', function ($q) use ($MaGV) {
            $q->where('MaGVPB', $MaGV);
        })
        ->with('deTai')
        ->get()
        ->map(function ($s) {
            return [
                'mssv'  => $s->MSSV,
                'name'  => $s->Ho_va_Ten,
                'group' => $s->Nhom,
                'MaDT'  => $s->MaDT,
                'TenDT' => $s->deTai?->TenDeTai,
            ];
        });
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'MSSV'                 => 'required|string|unique:SinhVien,MSSV',
            'Ho_va_Ten'            => 'required|string|max:120',
            'email'                => 'nullable|email|unique:SinhVien,email',
            'sdt'                  => 'nullable|string|max:15',
            'Lop'                  => 'nullable|string|max:50',
            'Nhom'                 => 'nullable|string|max:50',
            'MaDT'                 => 'nullable|string|exists:DeTai,MaDT',
            'Giang_vien_huong_dan' => 'nullable|string|exists:GiangVien,MaGV',
        ]);

        return SinhVien::create($data);
    }

   public function update(Request $request, $MSSV)
    {
        $student = SinhVien::where('MSSV', $MSSV)->firstOrFail();

        $data = $request->validate([
            'Ho_va_Ten'            => 'required|string|max:120',
            'email'                => 'nullable|email|unique:SinhVien,email,' . $student->MSSV . ',MSSV',
            'sdt'                  => 'nullable|string|max:15',
            'Lop'                  => 'nullable|string|max:50',
            'Nhom'                 => 'nullable|string|max:50',
            'MaDT'                 => 'nullable|string|exists:DeTai,MaDT',
            'Giang_vien_huong_dan' => 'nullable|string|exists:GiangVien,MaGV',
        ]);

        $student->update($data);

        return $student->load(['giangVienHuongDan', 'deTai']);
    }

    public function updateScore(Request $request)
    {
        $data = $request->validate([
            'Diem' => 'required|numeric|min:0|max:100',
            'MSSV' => 'required|string|exists:SinhVien,MSSV',
        ]);
        $MSSV = $request->MSSV;
        $student = SinhVien::where('MSSV', $MSSV)->firstOrFail();
        $student->update($data);
        return $student->load(['giangVienHuongDan', 'deTai']);
    }

    public function updateNote(Request $request)
    {
        $data = $request->validate([
            'GhiChu' => 'nullable|string|max:255',
            'MSSV' => 'required|string|exists:SinhVien,MSSV',
        ]);
        $MSSV = $request->MSSV;
        $student = SinhVien::where('MSSV', $MSSV)->firstOrFail();
        $student->update($data);
        return $student->load(['giangVienHuongDan', 'deTai']);
    }


    public function edit(Request $request, $MSSV)
    {
        $student = SinhVien::where('MSSV', $MSSV)->firstOrFail();
        $data = $request->validate([
            'Giang_vien_huong_dan' => 'required|string|exists:GiangVien,MaGV'
        ]);
        $student->update($data);
        return $student->load(['giangVienHuongDan', 'deTai']);
    }

    public function updateStudentGroup(Request $request)
    {
        $data = $request->validate([
            'mssv' => 'required|string|exists:SinhVien,MSSV',
            'group_number' => 'required|integer|min:1',
        ]);

        $mssv = $request->mssv;
        $groupNumber = $request->group_number;

        $student = SinhVien::where('MSSV', $mssv)->first();

        if (!$student) {
            return response()->json(['error' => 'Sinh viên không tồn tại'], 404);
        }

        $generatedGroup = $student->Giang_vien_huong_dan . '-' . $groupNumber;

        $sameGroup = SinhVien::where('Nhom', $generatedGroup)->get();

        if ($sameGroup->count() === 0) {
            $student->Nhom = $generatedGroup;
            $student->save();
            return response()->json(['success' => true]);
        }

        if ($sameGroup->count() >= 2) {
            return response()->json([
                'error' => 'Nhóm này đã đủ 2 thành viên!'
            ], 400);
        }

        $student->Nhom = $generatedGroup;
        $student->save();

        return response()->json(['success' => true]);
    }

    public function destroy(Request $request)
    {
        $student = SinhVien::where('MSSV', $request->mssv)->firstOrFail();
        return $student->delete();
    }

    public function export()
    {
        return Excel::download(new StudentsExport, 'DSSV.xlsx');
    }
    public function exportEvaluation50()
    {
        return Excel::download(new Evaluation50Export(),'DanhGia_50.xlsx');
    }
    public function exportReviewAssignment()
    {
        return Excel::download(new ReviewAssignmentExport(),'PhanCong_PhanBien.xlsx');
    }
    public function exportCommitteeAssignment()
    {
        return Excel::download(new CommitteeAssignmentExport(),'PhanCong_HoiDong.xlsx');
    }

    public function dashboardStats()
    {
        $svDaCoGV = SinhVien::whereNotNull('Giang_vien_huong_dan')->count();

        $svChuaCoGV = SinhVien::whereNull('Giang_vien_huong_dan')->count();

        $detaiStats = DeTai::select('TrangThai')
            ->selectRaw('COUNT(*) as total')
            ->groupBy('TrangThai')
            ->pluck('total', 'TrangThai');

        return response()->json([
            'sinh_vien' => [
                'da_co_gv'   => $svDaCoGV,
                'chua_co_gv'=> $svChuaCoGV,
            ],
            'de_tai' => [
                'tiep_tuc' => $detaiStats['Được tiếp tục'] ?? 0,
                'dinh_chi' => $detaiStats['Đình Chỉ'] ?? 0,
                'xin_hoan' => $detaiStats['Xin hoãn'] ?? 0,
            ]
        ]);
    }
}
