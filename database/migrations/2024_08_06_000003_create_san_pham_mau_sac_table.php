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
        Schema::create('san_pham_mau_sac', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('san_pham_id');
            $table->unsignedBigInteger('mau_sac_id');
            $table->integer('so_luong')->default(0);  // Quantity for this specific color
            $table->double('gia')->nullable();        // Price for this specific color (optional)
            $table->timestamps();

            // Foreign keys
            $table->foreign('san_pham_id')->references('id')->on('san_phams')->onDelete('cascade');
            $table->foreign('mau_sac_id')->references('id')->on('mau_sacs')->onDelete('cascade');
            
            // Ensure each product-color combination is unique
            $table->unique(['san_pham_id', 'mau_sac_id']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('san_pham_mau_sac');
    }
};