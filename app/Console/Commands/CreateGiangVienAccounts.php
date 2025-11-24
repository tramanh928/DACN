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

            // Generate login email
            $email = $gv->email ?? strtolower(Str::slug($gv->name)).'@example.com';

            // Generate password
            $password = $email;

            // Create user
            $user = User::create([
                'name' => $gv->Ho_va_Ten,
                'email' => $email,
                'password' => Hash::make($password),
                'role' => 'GiangVien',
            ]);

            // Link back
            $gv->update(['user_id' => $user->id]);

            // Show the created login
            $this->info("Created: {$gv->Ho_va_Ten} | {$email} | password: {$password}");
        }

        $this->info("Done. Accounts created.");
    }
}
