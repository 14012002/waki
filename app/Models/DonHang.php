<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DonHang extends Model
{
    use HasFactory;

    protected $table = 'don_hangs';
    
    protected $fillable = [
        'ma_don_hang',
        'ten_nguoi_nhan',
        'dia_chi_nhan',
        'email_nguoi_nhan',
        'so_dien_thoai',
        'trang_thai',
        'thanh_toan',
        'tien_hang',
        'tien_ship',
        'tong_tien',
        'user_id',
    ];

    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    public const TRANG_THAI_DON_HANG = [
        'cho_xac_nhan' => 'Chờ xác nhận',
        'da_xac_nhan' => 'Đã xác nhận',
        'dang_giao' => 'Đang giao',
        'da_giao' => 'Đã giao',
        'da_huy' => 'Đã hủy',
    ];

    public const TRANG_THAI_THANH_TOAN = [
        'chua_thanh_toan' => 'Chưa thanh toán',
        'da_thanh_toan' => 'Đã thanh toán',
    ];

    public const CHO_XAC_NHAN = 'cho_xac_nhan';
    public const DA_XAC_NHAN = 'da_xac_nhan';
    public const DANG_GIAO = 'dang_giao';
    public const DA_GIAO = 'da_giao';
    public const DA_HUY = 'da_huy';
    
    // Alias constants
    public const HUY_DON_HANG = 'da_huy';
    public const DA_GIAO_HANG = 'da_giao';
    public const DANG_VAN_CHUYEN = 'dang_giao';
    public const DA_THANH_TOAN = 'da_thanh_toan';
    public const CHUA_THANH_TOAN = 'chua_thanh_toan';

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function chiTietDonHangs()
    {
        return $this->hasMany(ChiTietDonHang::class, 'don_hang_id', 'id');
    }

    // Helper methods for order status
    public function isChoXacNhan()
    {
        return $this->trang_thai === 'cho_xac_nhan';
    }

    public function isDaXacNhan()
    {
        return $this->trang_thai === 'da_xac_nhan';
    }

    public function isDangGiao()
    {
        return $this->trang_thai === 'dang_giao';
    }

    public function isDaGiao()
    {
        return $this->trang_thai === 'da_giao';
    }

    public function isDaHuy()
    {
        return $this->trang_thai === 'da_huy';
    }

    // Helper methods for payment status
    public function isChuaThanhToan()
    {
        return $this->thanh_toan === 'chua_thanh_toan';
    }

    public function isDaThanhToan()
    {
        return $this->thanh_toan === 'da_thanh_toan';
    }
}