<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MauSac extends Model
{
    use HasFactory;

    protected $table = 'mau_sacs';

    protected $fillable = [
        'ten_mau',
        'ma_mau',
    ];

    /**
     * Get the products that have this color.
     */
    public function sanPhams()
    {
        return $this->belongsToMany(SanPham::class, 'san_pham_mau_sac')
            ->withPivot('so_luong', 'gia')
            ->withTimestamps();
    }
}