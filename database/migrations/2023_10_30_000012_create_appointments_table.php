<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAppointmentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('appointments', function (Blueprint $table) {
            $table->id();
            $table->integer('leader_id')->index()->default(0);
            $table->string('title')->index()->nullable();
            $table->longText('description')->nullable();
            $table->date('appointment_date')->index()->nullable();
            $table->time('start_time')->index()->nullable();
            $table->time('end_time')->index()->nullable();
            $table->boolean('status')->index()->default(1);
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
        Schema::dropIfExists('appointments');
    }
};
