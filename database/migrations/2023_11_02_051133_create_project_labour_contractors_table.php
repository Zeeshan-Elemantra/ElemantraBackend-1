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
        Schema::create('project_labour_contractors', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->comment('project created user');
            $table->foreignId('project_type_id')->nullable()->constrained('project_types');
            $table->foreignId('work_type_id')->constrained('work_types');
            $table->string('name');
            $table->text('description')->nullable()->comment('additional information about project');
            $table->integer('working_days')->comment('no of working days');
            $table->double('rate')->comment('rate per day');
            $table->double('total_rate')->comment('total rate working days * per day');
            $table->date('start_date')->nullable()->comment('tentative start date of project');
            $table->date('handover_date')->nullable()->comment('expected hand over date of project');
            $table->boolean('status')->default(1)->comment('0-in_active, 1-active');
            $table->enum('project_status', [1,2,3])->default(1)->comment('1-live,2-application,3-assigned');
            $table->timestamp('live_at')->nullable();
            $table->foreignId('assigned_user_id')->nullable()->constrained('users')->comment('project assigned to user');
            $table->timestamp('assigned_at')->nullable()->comment('when user assigned timestamp store here');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('project_labour_contractors');
    }
};
