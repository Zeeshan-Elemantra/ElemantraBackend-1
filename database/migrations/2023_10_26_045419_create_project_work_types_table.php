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
        Schema::create('project_work_types', function (Blueprint $table) {
            $table->id();
            $table->morphs('project');
            $table->foreignId('project_type_id')->nullable()->constrained('project_types');
            $table->foreignId('work_type_id')->constrained('work_types');
            $table->foreignId('assigned_user_id')->nullable()->constrained('users')->comment('assigned user id store here');
            $table->timestamp('assigned_at')->nullable()->comment('when user assigend then timestamp store here');
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
        Schema::dropIfExists('project_work_types');
    }
};
