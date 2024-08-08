<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateComplaintAssignsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('complaint_assigns', function (Blueprint $table) {
            $table->id();
            $table->integer('complaint_id')->index()->default(0);
            $table->integer('executive_id')->index()->default(0);
            $table->date('assign_date')->index()->nullable();
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
        Schema::dropIfExists('complaint_assigns');
    }
};
