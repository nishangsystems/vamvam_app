<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\ContentManagement;
class CMSSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        # initialize Providers
        $comtentmanagements = [
            [
                'name' => 'Terms & Condition',
                'short_name' => 'terms_condition',
            ],
            [
                'name' => 'Privacy Policy',
                'short_name' => 'privacy_policy',
            ],
            [
                'name' => 'About Us',
                'short_name' => 'about_us',
            ]
           
        ];
       
            foreach ($comtentmanagements as $key => $data) 
            {

                ContentManagement::updateOrCreate(['name' => $data['name'], 'short_name' => $data['short_name']]);

            }
        
    }
}
