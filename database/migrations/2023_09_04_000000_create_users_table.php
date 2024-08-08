<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('name')->index()->nullable();
            $table->string('email')->index()->nullable();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password')->index()->nullable();
            $table->string('phone')->index()->nullable();
            $table->string('image')->index()->nullable();
            $table->longText('about')->nullable();
            $table->string('forgot_otp')->index()->nullable();
            $table->string('role')->index()->nullable();
            $table->boolean('is_admin')->default(0)->index();
            $table->boolean('status')->default(1)->index();
            $table->rememberToken();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
};
