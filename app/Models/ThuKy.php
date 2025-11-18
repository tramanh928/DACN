<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ThuKy extends Model
{

    protected $table = 'thuky';

    protected $primaryKey = 'MaTK';
    public $incrementing = false; 
    protected $keyType = 'string';
    public $timestamps = true;

    protected $fillable = [
        'MaTK',
        'Ho_va_Ten',
        'email',
        'sdt',
        'Ngay_Sinh',
        'user_id',
    ];

    protected $casts = [
        'Ngay_Sinh' => 'date',
    ];

    public function getFullNameAttribute(): ?string
    {
        return $this->Ho_va_Ten ? trim($this->Ho_va_Ten) : null;
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
