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
        Schema::create('review_users', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->comment('review for user id store here');
            $table->foreignId('review_by_user')->nullable()->constrained('users')->comment('review by user id store here');
            $table->string('review_by_name')->nullable()->comment('this field only store when admin added fake review to perticular user');
            $table->text('description')->nullable()->comment('brief about vendor skill ');
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
        Schema::dropIfExists('review_users');
    }
};
