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
        Schema::create('project_work_request_applications', function (Blueprint $table) {
            $table->id();
            $table->foreignId('project_work_type_application_id')
                ->constrained('project_work_type_applications')
                ->index('pwra_pwta_id_foreign'); // Custom name for the index

            $table->foreignId('project_work_request_id')
                ->constrained('project_work_requests')
                ->index('pwra_pwri_id_foreign'); // Custom name for the index

            $table->foreignId('user_id')
                ->constrained('users');
            $table->morphs('project');
            $table->integer('rate')->default(0);
            $table->integer('rate_total')->nullable();
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('project_work_request_applications');
    }
};
