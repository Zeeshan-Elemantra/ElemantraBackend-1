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
        Schema::create('verification_remarks', function (Blueprint $table) {
            $table->id();
            $table->foreignId('onboard_step_id')->nullable()->constrained('onboard_steps');
            $table->foreignId('user_id')->nullable()->constrained('users')->comment('vendor id mean user id');
            $table->string('spoken_name');
            $table->integer('meeting_minute')->nullable();
            $table->text('remark')->nullable();
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('verification_remarks');
    }
};
