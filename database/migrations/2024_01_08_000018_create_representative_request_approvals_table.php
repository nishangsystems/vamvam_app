<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRepresentativeRequestApprovalsTable extends Migration
{ 
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('representative_request_approvals', function (Blueprint $table) {
            $table->id();
            $table->string('ticket_no')->index()->nullable();
            $table->date('ticket_date')->index()->nullable();
            $table->integer('executive_id')->index()->default(0);
            $table->integer('complaint_id')->index()->default(0);
            $table->text('message')->nullable();
            $table->integer('leader_id')->index()->default(0);
            $table->text('reply_message')->nullable();
            $table->boolean('status')->default(0)->comment('0-pending,1-approve,2-reject');
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
        Schema::dropIfExists('representative_request_approvals');
    }
};
