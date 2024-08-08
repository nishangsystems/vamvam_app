<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddColumnToRepresentativeNotificationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('representative_notifications', function (Blueprint $table) {
            $table->boolean('is_read')->index()->default(0)->after('complaint_id');
            $table->boolean('is_delete')->index()->default(0)->after('is_read');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('representative_notifications', function (Blueprint $table) {
        });
    }
}
