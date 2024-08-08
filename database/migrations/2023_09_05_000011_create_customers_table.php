<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCustomersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('customers', function (Blueprint $table) {
            $table->id();
            $table->string('customer_unique_id')->index()->nullable();
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
            $table->boolean('status')->index()->default(1);
            $table->boolean('is_executive')->index()->default(0)->comment('0-Not Executive,1-Executive');
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
        Schema::dropIfExists('customers');
    }
};
