<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEventsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('events', function (Blueprint $table) {
            $table->id();
            $table->integer('leader_id')->index()->default(0);
            $table->string('added_by')->index()->nullable();
            $table->string('title')->index()->nullable();
            $table->longText('description')->nullable();
            $table->longText('address')->nullable();
            $table->string('image')->index()->nullable();
            $table->string('video')->index()->nullable();
            $table->date('event_date')->index()->nullable();
            $table->datetime('start_date_time')->index()->nullable();
            $table->datetime('end_date_time')->index()->nullable();
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
        Schema::dropIfExists('events');
    }
};
