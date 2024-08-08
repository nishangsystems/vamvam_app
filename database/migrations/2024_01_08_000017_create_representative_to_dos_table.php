<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRepresentativeToDosTable extends Migration
{ 
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('representative_to_dos', function (Blueprint $table) {
            $table->id();
            $table->integer('executive_id')->index()->default(0);
            $table->date('todo_date')->nullable();
            $table->string('title')->nullable();
            $table->text('message')->nullable();
            $table->boolean('status')->index()->default(0)->comment('0-not complete,1-complete');
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
        Schema::dropIfExists('representative_to_dos');
    }
};
