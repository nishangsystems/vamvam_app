<?php
namespace Database\Seeders;
use App\Models\User;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Illuminate\Support\Facades\Hash;

class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        # initialize Address Types
        $credentials =  [
            'name'              => 'Admin',
            'email'             => 'jansamadhan@gmail.com',
            'password'          => Hash::make('jansamadhan@2023'),
            'is_admin'          => 1,
            'role'              => 'superAdmin',
        ];

        # Store Data to model
        #foreach ($credentials as $key => $credentials) {
            $admins = User::all();
            if($admins->isEmpty()) {
                User::create($credentials);
            } else {
                $admins->first()->update($credentials);
            }

            $admins = User::all();
            if($admins->isEmpty()) {
               $adminsData = User::create($credentials);
            } else {
               $adminsData = $admins->first();
               $adminsData->update($credentials);
            }
        #}

          #role seeder
          $roleArray = [
                        'name' => 'superAdmin',
                        'guard_name' => 'admin',
                       ];

          $checkRole = Role::where('name','superAdmin')->count();
          if($checkRole == 0){
            $role = Role::create($roleArray);

            $adminsData->assignRole($role->name);
          }               
    }
}
