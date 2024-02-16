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
        Schema::create('project_work_type_applications', function (Blueprint $table) {
            $table->id();
            $table->foreignId('project_work_type_id')->constrained('project_work_types');
            $table->morphs('project');
            $table->foreignId('user_id')->constrained('users');
            $table->foreignId('role_id')->constrained('roles');
            $table->integer('sub_total')->default(0)->comment('user applied requests sum here');
            $table->integer('over_all_total')->default(0)->comment('totalmultiply by quantity applied requests sum here');
            $table->enum('application_status',[0,1,2])->default(0)->comment('0-pending/applied ,1-meet,2-assigned');
            $table->timestamp('meet_at')->nullable()->comment('if request meet true then it store timestamp');
            $table->timestamp('applied_at')->nullable()->comment('timestamp store when user apply or apply api call');
            $table->timestamp('assigned_at')->nullable()->comment('when user assigend then timestamp store here');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('project_work_type_applications');
    }
};
