<?php
namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class PermissionsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

    $datas =[
             ['name' => 'view_state',      'slug' => 'View State',      'guard_name' => 'admin', 'module_id'=>'1'],


             ['name' => 'add_district',       'slug' => 'Add District',       'guard_name' => 'admin', 'module_id'=>'2'],
             ['name' => 'view_district',      'slug' => 'View District',      'guard_name' => 'admin', 'module_id'=>'2'],
             ['name' => 'edit_district',      'slug' => 'Edit District',      'guard_name' => 'admin', 'module_id'=>'2'],
             ['name' => 'active_inactive_district',       'slug' => 'Active/Inactive District',       'guard_name' => 'admin', 'module_id'=>'2'],
             ['name' => 'delete_district',     'slug' => 'Delete District',    'guard_name' => 'admin', 'module_id'=>'2'],


             ['name' => 'add_tehsil',       'slug' => 'Add Tehsil',       'guard_name' => 'admin', 'module_id'=>'3'],
             ['name' => 'view_tehsil',      'slug' => 'View Tehsil',      'guard_name' => 'admin', 'module_id'=>'3'],
             ['name' => 'edit_tehsil',      'slug' => 'Edit Tehsil',      'guard_name' => 'admin', 'module_id'=>'3'],
             ['name' => 'delete_tehsil',   'slug' => 'Delete Tehsil',   'guard_name' => 'admin', 'module_id'=>'3'],
             ['name' => 'active_inactive_tehsil',       'slug' => 'Active/Inactive Tehsil',       'guard_name' => 'admin', 'module_id'=>'3'],


             ['name' => 'add_block',       'slug' => 'Add Block',       'guard_name' => 'admin', 'module_id'=>'4'],
             ['name' => 'view_block',      'slug' => 'View Block',      'guard_name' => 'admin', 'module_id'=>'4'],
             ['name' => 'edit_block',      'slug' => 'Edit Block',      'guard_name' => 'admin', 'module_id'=>'4'],
             ['name' => 'delete_block',   'slug' => 'Delete Block',   'guard_name' => 'admin', 'module_id'=>'4'],
             ['name' => 'active_inactive_block',       'slug' => 'Active/Inactive Block',       'guard_name' => 'admin', 'module_id'=>'4'],


             ['name' => 'add_city',       'slug' => 'Add City',       'guard_name' => 'admin', 'module_id'=>'5'],
             ['name' => 'view_city',      'slug' => 'View City',      'guard_name' => 'admin', 'module_id'=>'5'],
             ['name' => 'edit_city',      'slug' => 'Edit City',      'guard_name' => 'admin', 'module_id'=>'5'],
             ['name' => 'delete_city',   'slug' => 'Delete City',   'guard_name' => 'admin', 'module_id'=>'5'],
             ['name' => 'active_inactive_city',       'slug' => 'Active/Inactive City',       'guard_name' => 'admin', 'module_id'=>'5'],


             ['name' => 'add_assembly_constituency',       'slug' => 'Add Assembly Constituency',       'guard_name' => 'admin', 'module_id'=>'6'],
             ['name' => 'view_assembly_constituency',      'slug' => 'View Assembly Constituency',      'guard_name' => 'admin', 'module_id'=>'6'],
             ['name' => 'edit_assembly_constituency',      'slug' => 'Edit Assembly Constituency',      'guard_name' => 'admin', 'module_id'=>'6'],
             ['name' => 'delete_assembly_constituency',   'slug' => 'Delete Assembly Constituency',   'guard_name' => 'admin', 'module_id'=>'6'],
             ['name' => 'active_inactive_assembly_constituency',       'slug' => 'Active/Inactive Assembly Constituency',       'guard_name' => 'admin', 'module_id'=>'6'],


             ['name' => 'add_parliamentary_constituency',       'slug' => 'Add Parliamentary Constituency',       'guard_name' => 'admin', 'module_id'=>'7'],
             ['name' => 'view_parliamentary_constituency',      'slug' => 'View Parliamentary Constituency',      'guard_name' => 'admin', 'module_id'=>'7'],
             ['name' => 'edit_parliamentary_constituency',      'slug' => 'Edit Parliamentary Constituency',      'guard_name' => 'admin', 'module_id'=>'7'],
             ['name' => 'delete_parliamentary_constituency',   'slug' => 'Delete Parliamentary Constituency',   'guard_name' => 'admin', 'module_id'=>'7'],
             ['name' => 'active_inactive_parliamentary_constituency',       'slug' => 'Active/Inactive Parliamentary Constituency',       'guard_name' => 'admin', 'module_id'=>'7'],


             ['name' => 'add_department',       'slug' => 'Add Department',       'guard_name' => 'admin', 'module_id'=>'8'],
             ['name' => 'view_department',      'slug' => 'View Department',      'guard_name' => 'admin', 'module_id'=>'8'],
             ['name' => 'edit_department',      'slug' => 'Edit Department',      'guard_name' => 'admin', 'module_id'=>'8'],
             ['name' => 'delete_department',   'slug' => 'Delete Department',   'guard_name' => 'admin', 'module_id'=>'8'],
             ['name' => 'active_inactive_department',       'slug' => 'Active/Inactive Department',       'guard_name' => 'admin', 'module_id'=>'8'],


             ['name' => 'add_issue_type',       'slug' => 'Add Issue Type',       'guard_name' => 'admin', 'module_id'=>'9'],
             ['name' => 'view_issue_type',      'slug' => 'View Issue Type',      'guard_name' => 'admin', 'module_id'=>'9'],
             ['name' => 'edit_issue_type',      'slug' => 'Edit Issue Type',      'guard_name' => 'admin', 'module_id'=>'9'],
             ['name' => 'delete_issue_type',   'slug' => 'Delete Issue Type',   'guard_name' => 'admin', 'module_id'=>'9'],
             ['name' => 'active_inactive_issue_type',       'slug' => 'Active/Inactive Issue Type',       'guard_name' => 'admin', 'module_id'=>'9'],

             ['name' => 'add_user',       'slug' => 'Add User',       'guard_name' => 'admin', 'module_id'=>'10'],
             ['name' => 'view_user',      'slug' => 'View User',      'guard_name' => 'admin', 'module_id'=>'10'],
             ['name' => 'edit_user',      'slug' => 'Edit User',      'guard_name' => 'admin', 'module_id'=>'10'],
             ['name' => 'delete_user',   'slug' => 'Delete User',   'guard_name' => 'admin', 'module_id'=>'10'],
             ['name' => 'active_inactive_user',       'slug' => 'Active/Inactive User',       'guard_name' => 'admin', 'module_id'=>'10'],

             ['name' => 'add_user_wise_complaint',       'slug' => 'Add User Wise Complaint',       'guard_name' => 'admin', 'module_id'=>'11'],
             ['name' => 'view_user_wise_complaint',      'slug' => 'View User Wise Complaint',      'guard_name' => 'admin', 'module_id'=>'11'],
             ['name' => 'edit_user_wise_complaint',      'slug' => 'Edit User Wise Complaint',      'guard_name' => 'admin', 'module_id'=>'11'],
             ['name' => 'delete_user_wise_complaint',   'slug' => 'Delete User Wise Complaint',   'guard_name' => 'admin', 'module_id'=>'11'],
             ['name' => 'active_inactive_user_wise_complaint',       'slug' => 'Active/Inactive User Wise Complaint',       'guard_name' => 'admin', 'module_id'=>'11'],


       ];

       foreach ($datas as $key => $data) {
        # code...
        # Store Data to model
        Permission::updateOrCreate([
                                     'name'       => $data['name'],
                                     'guard_name' => $data['guard_name'],
                                     'module_id'  => $data['module_id'],
                                     'slug'       => $data['slug'],
        ]);

        $permissionNames[] = $data['name'];
       }

       $role = Role::where('name','superAdmin')->first();
       $role->syncPermissions($permissionNames);
    }
}
