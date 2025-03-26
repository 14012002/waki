<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'ho_va_ten',
        'ten_dang_nhap',
        'email',
        'password',
        'so_dien_thoai',
        'dia_chi',
        'vai_tro',
        'trang_thai',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'password' => 'hashed',
    ];

    public function donHangs()
    {
        return $this->hasMany(DonHang::class, 'user_id', 'id');
    }

    public function gioHangs()
    {
        return $this->hasMany(GioHang::class, 'user_id', 'id');
    }

    public function binhLuans()
    {
        return $this->hasMany(BinhLuan::class, 'user_id', 'id');
    }

    public function tinTucs()
    {
        return $this->hasMany(TinTuc::class, 'user_id', 'id');
    }

    public function isAdmin()
    {
        return $this->vai_tro == 1;
    }
}