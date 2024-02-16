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
        Schema::create('project_labour_applications', function (Blueprint $table) {
            $table->id();
            $table->foreignId('project_labour_contractor_id')->constrained('project_labour_contractors');
            $table->foreignId('user_id')->constrained('users')->comment('applied user id');
            $table->foreignId('role_id')->constrained('roles');
            $table->enum('application_status',[0,1,2])->default(0)->comment('0-pending/applied ,1-meet,2-assigned');
            $table->timestamp('meet_at')->nullable()->comment('if request meet true then it store timestamp');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('project_labour_applications');
    }
};
