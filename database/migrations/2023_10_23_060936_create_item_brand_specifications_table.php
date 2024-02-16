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
        Schema::create('item_brand_specifications', function (Blueprint $table) {
            $table->id();
            $table->foreignId('work_type_id')->nullable()->constrained('work_types');
            $table->foreignId('item_id')->nullable()->constrained('items');
            $table->foreignId('item_category_id')->nullable()->constrained('item_categories');
            $table->foreignId('item_detail_id')->nullable()->constrained('item_details');
            $table->string('name');
            $table->text('description')->nullable();
            $table->text('details')->nullable();
            $table->text('brand_specification')->nullable();
            $table->foreignId('unit_id')->nullable()->constrained('units');
            $table->integer('rate');
            $table->boolean('status')->default(1)->comment('0-in_active, 1-active');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('item_brand_specifications');
    }
};
