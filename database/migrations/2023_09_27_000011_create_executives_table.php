<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateExecutivesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('executives', function (Blueprint $table) {
            $table->id();
            $table->string('executive_unique_id')->index()->nullable();
            $table->string('voter_id')->index()->nullable();
            $table->string('aadhaar_card')->index()->nullable();
            $table->string('name')->index()->nullable();
            $table->string('gender')->index()->nullable();
            $table->date('dob')->index()->nullable();
            $table->integer('age')->index()->nullable();
            $table->string('guardian_name')->index()->nullable();
            $table->string('relation')->index()->nullable();
            $table->string('mobile')->index()->nullable();
            $table->string('email')->index()->nullable();
            $table->string('password')->index()->nullable();
            $table->string('show_password')->index()->nullable();
            $table->string('otp')->index()->nullable();
            $table->string('forgot_otp')->index()->nullable();
            $table->string('api_token')->index()->nullable();
            $table->string('device_type')->index()->nullable();
            $table->string('device_token')->index()->nullable();
            $table->boolean('status')->index()->default(1);
            $table->boolean('is_delete')->index()->default(0);
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
        Schema::dropIfExists('executives');
    }
};
