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
        Schema::create('review_ratings', function (Blueprint $table) {
            $table->id();
            $table->foreignId('review_user_id')->constrained('review_users');
            $table->foreignId('user_id')->constrained('users')->comment('review for user id store here');
            $table->foreignId('review_by_user')->nullable()->constrained('users')->comment('review by user id store here');
            $table->foreignId('review_category_id')->constrained('review_categories');
            $table->double('rating')->default(0)->comment('store rating here by 5');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('review_ratings');
    }
};
