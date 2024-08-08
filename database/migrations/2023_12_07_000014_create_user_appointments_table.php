<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUserAppointmentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('user_appointments', function (Blueprint $table) {
            $table->id();
            $table->integer('customer_id')->index()->default(0);
            $table->text('reason')->nullable();
            $table->longText('description')->nullable();
            $table->date('appointment_date')->index()->nullable();
            $table->time('appointment_time')->index()->nullable();
            $table->integer('action_leader_id')->index()->default(0);
            $table->text('reject_reason')->nullable();
            $table->boolean('status')->index()->default(0)->comment('0-pending,1-approve,2-reject');
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
        Schema::dropIfExists('user_appointments');
    }
};
