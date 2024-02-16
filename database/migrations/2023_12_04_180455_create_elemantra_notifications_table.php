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
        Schema::create('elemantra_notifications', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->text('description')->nullable();
            $table->foreignId('user_id')->nullable()->constrained('users')->comment('send for perticular user');
            $table->enum('interface_type',[0,1,2])->default(0)->comment('0-all,1-hire_work,2-find_work');
            $table->enum('type',[0,1])->default(0)->comment('0-All,1-individual');
            $table->boolean('status')->default(1)->comment('1-active,0-inactive');
            $table->timestamps();

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('elemantra_notifications');
    }
};
