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
        Schema::create('mau_sacs', function (Blueprint $table) {
            $table->id();
            $table->string('ten_mau');  // Color name (e.g., Red, Blue, Black)
            $table->string('ma_mau')->nullable();  // Color code (e.g., #FF0000 for red)
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('mau_sacs');
    }
};