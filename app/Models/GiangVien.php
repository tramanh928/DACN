<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class GiangVien extends Model
{
    // Nếu dùng factories, có thể thêm HasFactory:
    // use \Illuminate\Database\Eloquent\Factories\HasFactory;
    // use HasFactory;

    // Tên bảng phải khớp migration
    protected $table = 'GiangVien';

    // Khóa chính không phải id mặc định
    protected $primaryKey = 'MaGV';
    public $incrementing = false; // MaGV là string, không auto-increment
    protected $keyType = 'string';

    // Sử dụng timestamps (migration có timestamps())
    public $timestamps = true;

    // Cho phép gán hàng loạt
    protected $fillable = [
        'MaGV',
        'Ho_va_Ten',
        'email',
        'sdt',
        'Ngay_Sinh',
        'So_luong_sinh_vien',
        'user_id',
    ];

    // Casts cho đúng kiểu
    protected $casts = [
        'So_luong_sinh_vien' => 'integer',
        'Ngay_Sinh' => 'date',
    ];

    /**
     * Truy cập tên đầy đủ qua $giangVien->full_name
     */
    public function getFullNameAttribute(): ?string
    {
        return $this->Ho_va_Ten ? trim($this->Ho_va_Ten) : null;
    }

    /**
     * Quan hệ tới user (migration có foreignId('user_id')->constrained('users'))
     */
    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
