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
        Schema::create('project_addresses', function (Blueprint $table) {
            $table->id();
            $table->morphs('project');
            $table->foreignId('project_type_id')->nullable()->constrained('project_types');
            $table->text('address');
            $table->string('room_no')->nullable();
            $table->string('bldg_no')->nullable();
            $table->string('city')->nullable();
            $table->string('latitude');
            $table->string('longitude');
            $table->integer('pincode')->nullable();
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('project_addresses');
    }
};
