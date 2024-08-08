<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateComplaintsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('complaints', function (Blueprint $table) {
            $table->id();
            $table->string('complaint_code')->index()->nullable();
            $table->string('customer_id')->index()->nullable();
            $table->string('department_id')->index()->nullable();
            $table->string('issue_type_id')->index()->nullable();
            $table->string('latitude')->index()->nullable();
            $table->string('longitude')->index()->nullable();
            $table->string('address')->index()->nullable();
            $table->longText('message')->nullable();
            $table->longText('complaint_file')->nullable();
            $table->string('complaint_file_type')->index()->nullable();
            $table->date('complaint_date')->index()->nullable();
            $table->boolean('status')->index()->default(1);
            $table->longText('remarks')->nullable();
            $table->date('resolved_date')->index()->nullable();
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
        Schema::dropIfExists('complaints');
    }
};
