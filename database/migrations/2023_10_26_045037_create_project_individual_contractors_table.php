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
        Schema::create('project_individual_contractors', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users');
            $table->foreignId('project_type_id')->nullable()->constrained('project_types');
            $table->string('name');
            $table->text('description')->nullable()->comment('additional information about project');
            $table->foreignId('property_type_id')->nullable()->constrained('property_types');
            $table->string('property_other')->nullable()->comment('if property_type store other id then other endterd field store here');
            $table->foreignId('budget_range_id')->nullable()->constrained('budget_ranges');
            $table->integer('budget_min')->nullable()->comment('if project type skilled labour then budget min amount will store here');
            $table->integer('budget_max')->nullable()->comment('if project type skilled labour then budget max amount will store here');
            $table->date('start_date')->nullable()->comment('tentative start date of project');
            $table->date('handover_date')->nullable()->comment('expected hand over date of project');
            $table->boolean('status')->default(1)->comment('0-in_active, 1-active');
            $table->enum('project_status', [0,1,2,3])->default(0)->comment('0-pending,1-live,2-application,3-assigned');
            $table->timestamps();
            $table->timestamp('live_at')->nullable();
            $table->softDeletes();
        });

        Schema::create('project_turnkey_contractors', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users');
            $table->foreignId('project_type_id')->nullable()->constrained('project_types');
            $table->string('name');
            $table->text('description')->nullable()->comment('additional information about project');
            $table->foreignId('property_type_id')->nullable()->constrained('property_types');
            $table->string('property_other')->nullable()->comment('if property_type store other id then other endterd field store here');
            $table->foreignId('budget_range_id')->nullable()->constrained('budget_ranges');
            $table->integer('budget_min')->nullable()->comment('if project type skilled labour then budget min amount will store here');
            $table->integer('budget_max')->nullable()->comment('if project type skilled labour then budget max amount will store here');
            $table->date('start_date')->nullable()->comment('tentative start date of project');
            $table->date('handover_date')->nullable()->comment('expected hand over date of project');
            $table->boolean('status')->default(1)->comment('0-in_active, 1-active');
            $table->enum('project_status', [0,1,2,3])->default(0)->comment('0-pending,1-live,2-application,3-assigned');
            $table->timestamps();
            $table->timestamp('live_at')->nullable();
            $table->foreignId('assigned_user_id')->nullable()->constrained('users')->comment('project assigned to user');
            $table->timestamp('assigned_at')->nullable()->comment('when user assigned timestamp store here');
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('project_individual_contractors');
    }
};
