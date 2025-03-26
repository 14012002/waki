<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //
        DB::table('users')->insert(
            [
                [
                    'ho_va_ten' => 'Đào Xuân Hùng',
                    'ten_dang_nhap' => 'admin',
                    'password' => Hash::make('123456789'),
                    'email' => 'admin@gmail.com',
                    'so_dien_thoai' => '0987654321',
                    'dia_chi' => 'Nam Từ Liêm, Hà Nội',
                    'vai_tro' => 1,
                    'trang_thai' => 0
                ],
                [
                    'ho_va_ten' => 'Nguyễn Thiện Giáp',
                    'ten_dang_nhap' => 'sunkenvalley',
                    'password' => Hash::make('Thiengiap_2004'),
                    'email' => 'ccccc3@gmail.com',
                    'so_dien_thoai' => '0987654322',
                    'dia_chi' => 'Nam Từ Liêm, Hà Nội',
                    'vai_tro' => 1,
                    'trang_thai' => 0
                ],
                [
                    'ho_va_ten' => 'Nguyễn Lan Anh',
                    'ten_dang_nhap' => 'lananh',
                    'password' => Hash::make('123456789'),
                    'email' => 'ccccc2@fpt.edu.vn',
                    'so_dien_thoai' => '0987654323',
                    'dia_chi' => 'Ba Đình, Hà Nội',
                    'vai_tro' => 1,
                    'trang_thai' => 0
                ],
                [
                    'ho_va_ten' => 'Trần Đức Bảo',
                    'ten_dang_nhap' => 'baotd',
                    'password' => Hash::make('123456789'),
                    'email' => 'ccccc@fpt.edu.vn',
                    'so_dien_thoai' => '0987654324',
                    'dia_chi' => 'Ba Đình, Hà Nội',
                    'vai_tro' => 1,
                    'trang_thai' => 0
                ],
            ]
          );
    }
}
