<?php

namespace App\Http\Controllers\Admin;

use Auth;
use Hash;
use Config;
use Validator;
use App\Models\User;
use App\Models\Module;
use Illuminate\Http\Request;
use App\Models\RoleHasPermission;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Http\Controllers\Controller;
use App\Http\Traits\MessageStatusTrait;

class RoleController extends Controller
{

  use MessageStatusTrait;

 # Bind view
 protected $view = 'admin.role.';

 # definr type
 protected $type = 'Role ';

    # Bind model user
    protected $user;
    protected $role;
    protected $module;
    protected $permission;

    /**
     * default constructor
     * @param Classes
     * @return instance classe
     */
  function __construct(
                        Role        $role, 
                        User        $user, 
                        Module      $module,
                        Permission  $permission
                      )
                      {
                        $this->role       = $role;
                        $this->user       = $user;
                        $this->module     = $module;
                        $this->permission = $permission;
                      }


 /**
  * index page
  * @param Illuminate\Http\Request
  * @return Illuminate\Http\Response
  */
 public function index(Request $request)
 {
   # return index page
   try {
      # fetch roles
      $roles = $this->role
                    ->where('name','!=','superAdmin')
                    ->get();
      //dd($roles);

      return view($this->view.'index')->with(['roles' => $roles]);

    } catch (\Exception $ex) {
      return redirect()->back()->with('error', $ex->getMessage());
    }
 } 

 /**
  * add page
  * @param Illuminate\Http\Request
  * @return Illuminate\Http\Response
  */
 public function create()
 {
   
   try {
      # fetch modules
       $modules = $this->module->with('permissionsData')->get();

      # fetch all permissions 
      $permissions = $this->permission->all();

      return view($this->view.'create')->with(['permissions' => $permissions, 'modules' => $modules]);

    } catch (\Exception $ex) {
      return redirect()->back()->with('error', $ex->getMessage());
    }
 }  

 /**
  * add
  * @param Illuminate\Http\Request
  * @return Illuminate\Http\Response
  */
 public function store(Request $request)
 {

        $rules = [ 
                   'name'         => 'required',
                   'permission'   => 'required',
                 ];

        $validator = Validator::make($request->all(), $rules);
        if($validator->fails()){
            return response()->json([
                        (string)$this->responseCode=>(string)$this->errorStatus, 
                        (string)$this->responseMessage => (string)$validator->messages()->first()
                    ]);
        }

        try {
             
                # fetch request role
                $roleName = $request->input('name');
           
                # check already exist or not
                $count = Role::where('name', $roleName)->count();
           
                # if not exist
                if ($count == 0) 
                {
                    # create the role
                    $role = Role::create([
                                          'name'       => $roleName,
                                          'guard_name' => 'admin'
                                        ]);
            
                    # if permission is requested
                    if ($request->permission != '') 
                    {
                     # assign permission to created role
                     $assignPermiddion = $role->syncPermissions($request->input('permission'));
                    }
                     
                     return response()->json([
                                        (string)$this->responseCode    => (string)$this->successStatus, 
                                        (string)$this->responseMessage => 'Role Created Successfully',
                                        'responseUrl' => url('admin/role')
                                    ]);
            
                } else {
                     return response()->json([
                                    (string)$this->responseCode    => (string)$this->errorStatus, 
                                    (string)$this->responseMessage => 'Sorry this role already exist',
                                ]);
                }
        } catch (Exception $e) {
          return response()->json([
                                    (string)$this->responseCode    => (string)$this->errorStatus, 
                                    (string)$this->responseMessage => (string)$e,
                                ]);
        }
  
 }



 /**
  * edit page
  * @param Illuminate\Http\Request, $id
  * @return Illuminate\Http\Response
  */
 public function edit($id)
 {

  try {
            # fetch modules
            $modules = $this->module->with('permissionsData')->get();

            # fetch role data
            $role = $this->role->where('id', base64_decode($id))->first();

            $rolePermissions = $role->getAllPermissions();
            # fetch all permissions 
            $permissions = $this->permission->all();

            $data = []; 
            foreach($rolePermissions as $rolePermission) 
            {
                $data[] = $rolePermission->name;
            }

            return view($this->view.'edit')->with([
                                                    'permissions' => $permissions, 
                                                    'modules' => $modules, 
                                                    'role' => $role, 
                                                    'data' => $data
                                                  ]);

    } catch (\Exception $ex) {
      return redirect()->back()->with('error', $ex->getMessage());
    }

 }

 /**
  * update
  * @param
  * @return
  */
 public function update(Request $request)
 {

        $rules = [ 
                   'name'         => 'required',
                   'permission'   => 'required',
                 ];

        $validator = Validator::make($request->all(), $rules);
        if($validator->fails()){
            return response()->json([
                        (string)$this->responseCode=>(string)$this->errorStatus, 
                        (string)$this->responseMessage => (string)$validator->messages()->first()
                    ]);
        }


        try {
            
            # fetch request role
            $roleName = $request->input('name');
           
            # check already exist or not
            $count = Role::where('name', $roleName)->where('id', '!=', $request->id)->count();
           
            $role = Role::findOrFail($request->id); 
            $role->syncPermissions();

               # if not exist
               if ($count == 0) {
                
                # update the role
                $updateRole = Role::where('id', $request->id)->update([
                                                                        'name'       => $roleName,
                                                                        'guard_name' => 'admin'
                                                                      ]);
             
                if ($request->permission != '') 
                {
                 # assign permission to updated role
                 $assignPermission = $role->syncPermissions($request->input('permission'));
                }

                      return response()->json([
                                              (string)$this->responseCode    => (string)$this->successStatus, 
                                              (string)$this->responseMessage => 'Role Updated Successfully',
                                              'responseUrl' => url('admin/role')
                                          ]);

               } else {
                      return response()->json([
                                          (string)$this->responseCode    => (string)$this->errorStatus, 
                                          (string)$this->responseMessage => 'Sorry this role already exist',
                                      ]);
               } 
        } catch (Exception $e) {
          return response()->json([
                                    (string)$this->responseCode    => (string)$this->errorStatus, 
                                    (string)$this->responseMessage => (string)$e,
                                ]);
        }

 }
 
 /**
  * delete 
  * @param $id
  * @return \Illuminate\Http\Response
  */
 public function delete($id)
 {
   # delete role by id
   Role::where('id', $id)->delete();
   
   # return success
   return  [$this->successKey  =>  $this->successStatus,  $this->messageKey  => $this->deleteMessage($this->type)];
 }
}
