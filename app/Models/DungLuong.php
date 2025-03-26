<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DungLuong extends Model
{
    use HasFactory;

    protected $table = 'dung_luongs';

    protected $fillable = [
        'kich_thuoc',
        'don_vi',
    ];

    /**
     * Get the products that have this storage capacity.
     */
    public function sanPhams()
    {
        return $this->belongsToMany(SanPham::class, 'san_pham_dung_luong')
            ->withPivot('so_luong', 'gia')
            ->withTimestamps();
    }
}