<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('settings', function (Blueprint $table) {
            $table->id();
            $table->string('phone_no_one')->nullable()->index();
            $table->string('phone_no_two')->nullable()->index();
            $table->string('email')->nullable()->index();
            $table->string('address')->nullable()->index();
            $table->string('logo')->nullable()->index();
            $table->string('fevicon')->nullable()->index();
            $table->string('website')->nullable()->index();
            $table->string('our_service_image')->nullable()->index();
            $table->text('summary')->nullable();
            $table->longText('description')->nullable();
            $table->text('facebook_link')->nullable();
            $table->text('instagram_link')->nullable();
            $table->text('twitter_link')->nullable();
            $table->text('linkedin_link')->nullable();
            $table->text('youtube_link')->nullable();
            $table->longText('map_code')->nullable();
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
        Schema::dropIfExists('settings');
    }
};
