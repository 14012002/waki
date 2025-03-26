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
        Schema::create('san_pham_dung_luong', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('san_pham_id');
            $table->unsignedBigInteger('dung_luong_id');
            $table->integer('so_luong')->default(0);  // Quantity for this specific storage capacity
            $table->double('gia')->nullable();        // Price for this specific storage capacity (optional)
            $table->timestamps();

            // Foreign keys
            $table->foreign('san_pham_id')->references('id')->on('san_phams')->onDelete('cascade');
            $table->foreign('dung_luong_id')->references('id')->on('dung_luongs')->onDelete('cascade');
            
            // Ensure each product-storage combination is unique
            $table->unique(['san_pham_id', 'dung_luong_id']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('san_pham_dung_luong');
    }
};