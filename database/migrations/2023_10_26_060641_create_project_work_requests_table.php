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
        Schema::create('project_work_requests', function (Blueprint $table) {
            $table->id();
            $table->string('unique_request_id')->comment('store unique id current timestamp code');
            $table->foreignId('project_work_type_id')->constrained('project_work_types');
            $table->morphs('project');
            $table->foreignId('project_type_id')->constrained('project_types');
            $table->foreignId('area_of_work_id')->nullable()->constrained('area_of_works');
            $table->foreignId('item_id')->nullable()->constrained('items');
            $table->foreignId('item_category_id')->nullable()->constrained('item_categories');
            $table->foreignId('item_detail_id')->nullable()->constrained('item_details');
            $table->text('other_item_detail')->nullable();
            $table->foreignId('item_brand_specification_id')->nullable()->constrained('item_brand_specifications');
            $table->text('other_item_brand_specification')->nullable();
            $table->text('item_description')->nullable();
            $table->foreignId('unit_id')->nullable()->constrained('units');
            $table->integer('area_size')->nullable();
            $table->integer('quantity')->nullable();
            $table->string('floor_plan_file')->nullable()->comment('floor plan file path stored here file pdf');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('project_work_requests');
    }
};
