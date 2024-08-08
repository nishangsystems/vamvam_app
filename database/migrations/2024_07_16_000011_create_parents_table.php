<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateParentsTable extends Migration
{ 
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('parents', function (Blueprint $table) {
            $table->id();
            $table->string('parent_unique_id')->index()->nullable();
            $table->string('name')->index()->nullable();
            $table->string('mobile')->index()->nullable();
            $table->string('email')->index()->nullable();
            $table->string('password')->index()->nullable();
            $table->string('show_password')->index()->nullable();
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
        Schema::dropIfExists('parents');
    }
};
