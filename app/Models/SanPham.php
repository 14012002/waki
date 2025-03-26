<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SanPham extends Model
{
    use HasFactory;

    protected $table = 'san_phams';
    
    protected $fillable = [
        'ten_san_pham',
        'gia',
        'hinh_anh',
        'so_luong',
        'mo_ta',
        'danh_muc_id',
        'gia_khuyen_mai',
    ];

    public function danhMuc()
    {
        return $this->belongsTo(DanhMuc::class, 'danh_muc_id', 'id');
    }

    public function binhLuans()
    {
        return $this->hasMany(BinhLuan::class, 'san_pham_id', 'id');
    }

    public function gioHangs()
    {
        return $this->hasMany(GioHang::class, 'san_pham_id', 'id');
    }

    public function chiTietDonHangs()
    {
        return $this->hasMany(ChiTietDonHang::class, 'san_pham_id', 'id');
    }

    public function banners()
    {
        return $this->hasMany(Banner::class, 'san_pham_id', 'id');
    }

    /**
     * Get the colors for the product.
     */
    public function mauSacs()
    {
        return $this->belongsToMany(MauSac::class, 'san_pham_mau_sac')
            ->withPivot('so_luong', 'gia')
            ->withTimestamps();
    }

    /**
     * Get the storage capacities for the product.
     */
    public function dungLuongs()
    {
        return $this->belongsToMany(DungLuong::class, 'san_pham_dung_luong')
            ->withPivot('so_luong', 'gia')
            ->withTimestamps();
    }
}