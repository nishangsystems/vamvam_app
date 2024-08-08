<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateComplaintAssignStatusTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('complaint_assign_status', function (Blueprint $table) {
            $table->id();
            $table->integer('complaint_id')->index()->default(0);
            $table->integer('assign_complaint_id')->index()->default(0);
            $table->date('date')->index()->nullable();
            $table->time('time')->index()->nullable();
            $table->text('remarks')->nullable();
            $table->longText('media_file')->nullable();
            $table->integer('status')->index()->default(0);
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
        Schema::dropIfExists('complaint_assign_status');
    }
};
