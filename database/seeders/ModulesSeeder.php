<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Module;

class ModulesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        # initialize Modules Array
        $modules = [
                     'State',                       //1
                     'District',                    //2
                     'Tehsil',                      //3
                     'Block',                       //4
                     'City',                        //5
                     'Assembly Constituency',       //6
                     'Parliamentary Constituency',  //7
                     'Department',                  //8
                     'Issue Type',                  //9
                     'Customer',                    //10
                     'Customer Wise Complaint',      //11
                   ];

        # Store Data to model
        foreach ($modules as $key => $module) {
        	Module::updateOrCreate(['name' => $module]);
        }
    }
}
