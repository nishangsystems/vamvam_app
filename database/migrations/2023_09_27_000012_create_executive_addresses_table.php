<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateExecutiveAddressesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('executive_addresses', function (Blueprint $table) {
            $table->id();
            $table->integer('executive_id')->index()->nullable();
            $table->integer('state_id')->index()->nullable();
            $table->integer('district_id')->index()->nullable();
            $table->integer('tehsil_id')->index()->nullable();
            $table->string('area')->index()->nullable();
            $table->integer('parliamentary_id')->index()->nullable();
            $table->integer('assembly_id')->index()->nullable();
            $table->integer('town_village_id')->index()->nullable();
            $table->string('panchayat_ward_id')->index()->nullable();
            $table->integer('block_id')->index()->nullable();
            $table->integer('thana_id')->index()->nullable();
            $table->string('post_office_id')->index()->nullable();
            $table->string('house_no')->index()->nullable();
            $table->string('land_mark')->index()->nullable();
            $table->string('locality')->index()->nullable();
            $table->string('pincode')->index()->nullable();
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
        Schema::dropIfExists('executive_addresses');
    }
};
