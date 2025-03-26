<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('dung_luongs', function (Blueprint $table) {
            $table->id();
            $table->integer('kich_thuoc');  // Size (e.g., 64, 128, 256)
            $table->string('don_vi');       // Unit (e.g., GB, TB)
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('dung_luongs');
    }
};