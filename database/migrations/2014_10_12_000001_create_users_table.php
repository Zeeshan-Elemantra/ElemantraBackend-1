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
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('name')->nullable()->index();
            $table->string('phone')->nullable()->unique();
            $table->string('alt_phone')->nullable();
            $table->string('email')->nullable()->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password')->nullable();
            $table->rememberToken();
            $table->foreignId('role_id')->nullable()->constrained('roles');
            $table->string('profile')->nullable()->comment('profile photo path here');
            $table->boolean('oauth_login')->default(0)->comment('0-no, 1-yes');
            $table->string('current_work')->nullable()->comment('is selected hire for work or find work default set for app purpose');
            $table->enum('elemantra_verification',[0,1,2])->default(0)->nullable()->comment('0-not applied,1-pending/applied ,2-verified');
            $table->integer('verification_step')->nullable()->comment('default null if requested for verififcation then it will be onboard step current id after verified then it store 0');
            $table->string('uuid')->nullable()->comment('app uuid store here for one signal push notification');
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
        Schema::dropIfExists('users');
    }
};
