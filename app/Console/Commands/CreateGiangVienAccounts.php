<?php

namespace App\Console\Commands;

use App\Models\GiangVien;
use App\Models\User;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class CreateGiangVienAccounts extends Command
{
    protected $signature = 'giangvien:create-accounts';
    protected $description = 'Create user accounts for all GiangVien without an account';

    public function handle()
    {
        $giangViens = GiangVien::whereNull('user_id')->get();

        if ($giangViens->count() === 0) {
            $this->info('All GiangVien already have accounts.');
            return;
        }

        foreach ($giangViens as $gv) {

            $email = $gv->email ?? strtolower(Str::slug($gv->name)).'@example.com';

            $password = $email;

            $user = User::create([
                'name' => $gv->Ho_va_Ten,
                'email' => $email,
                'password' => Hash::make($password),
                'role' => 'GiangVien',
            ]);

            $gv->update(['user_id' => $user->id]);

            $this->info("Created: {$gv->Ho_va_Ten} | {$email} | password: {$password}");
        }

        $this->info("Done. Accounts created.");
    }
}
