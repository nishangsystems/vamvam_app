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


class SystemUserController extends Controller
{
    use MessageStatusTrait;
    # Bind view
    protected $view = 'admin.role.user.';

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
  * managers index page
  * @param Illuminate\Http\Request
  * @return Illuminate\Http\Response
  */
 public function index()
 {
    # fetch users
    $users = $this->user
                   ->NotAdmin()
                   ->orderby('id', 'desc')
                   ->get();

    # return index page
    return view($this->view.'index')->with(['users' => $users]);
 }

 /**
  * add page
  * @param Illuminate\Http\Request
  * @return Illuminate\Http\Response
  */
 public function create()
 {
  # fetch role
  $roles = Role::where('name', '!=', 'Admin')->get();

  # return create page
  return view($this->view.'create')->with(['roles' => $roles]);
 }
 
 /**
  * add
  * @param Illuminate\Http\Request
  * @return Illuminate\Http\Response
  */
 public function store(Request $request)
 {

        $rules = [ 
                   'role'         => 'required',
                   'name'         => 'required',
                   'email'        => 'required|unique:users',
                   'password'     => 'required|min:6',
                   'confirm_password' => 'required|min:6',
                 ];

        $validator = Validator::make($request->all(), $rules);
        if($validator->fails()){
            return response()->json([
                        (string)$this->responseCode=>(string)$this->errorStatus, 
                        (string)$this->responseMessage => (string)$validator->messages()->first()
                    ]);
        }

        try {

              if($request->password != $request->confirm_password){
                return response()->json([
                        (string)$this->responseCode=>(string)$this->errorStatus, 
                        (string)$this->responseMessage => 'Sorry, Password and confirm password not matched'
                    ]);
              }
              # request data array
              $arrayData = [
                             'name'        => $request->name ?? null,
                             'email'       => $request->email ?? null, 
                             'phone'       => $request->mobile ?? null, 
                             'password'    => Hash::make($request->password) ?? null
                           ];
       
                #create
                $create = $this->user->create($arrayData);
                # assign role 
                $assignRole = $create->assignRole($request->input('role'));
             //dd($create,$assignRole);

                return response()->json([
                                        (string)$this->responseCode    => (string)$this->successStatus, 
                                        (string)$this->responseMessage => 'User Created Successfully',
                                    ]);
        } catch (Exception $e) {
                return response()->json([
                                    (string)$this->responseCode    => (string)$this->errorStatus, 
                                    (string)$this->responseMessage => (string)$e,
                                ]);
        }

 }




 /**
  * edit page
  * @param Illuminate\Http\Request
  * @return Illuminate\Http\Response
  */
 public function edit($id)
 {
    # fetch role
    $roles = Role::where('name', '!=', 'Admin')->get();

    # fetch 
    $user = $this->user
                 ->where('id', $id)
                 ->first();

    $role = $user->getRoleNames() ?? '';
    
    $roleName = preg_replace('/[^A-Za-z0-9 ]/', '', $role);

    # return create page
    return view($this->view.'edit')->with([
                                            'user'     => $user, 
                                            'roles'    => $roles, 
                                            'roleName' => $roleName
                                          ]);
 }

 /**
  * update
  * @param Illuminate\Http\Request
  * @return Illuminate\Http\Response
  */
 public function update(Request $request)
 {

        $rules = [ 
                   'user_id'      => 'required',
                   'name'         => 'required',
                   'email'        => 'required',
                   'role'         => 'required',
                 ];

        $validator = Validator::make($request->all(), $rules);
        if($validator->fails()){
            return response()->json([
                        (string)$this->responseCode=>(string)$this->errorStatus, 
                        (string)$this->responseMessage => (string)$validator->messages()->first()
                    ]);
        }


        try {
             
            $checkEmail = $this->user
                               ->where('email', $request->email)
                               ->where('id', '!=',$request->user_id)
                               ->first();

            if($checkEmail)
            {
              return response()->json([
                            (string)$this->responseCode=>(string)$this->errorStatus, 
                            (string)$this->responseMessage => 'Sorry, this email already exist'
                        ]);
            }


            $user = $this->user
                         ->where('id',$request->user_id)
                         ->first();            


            # request data array
            $arrayData = [
                           'name'        => $request->name ?? null,
                           'email'       => $request->email ?? null, 
                           'phone'       => $request->mobile ?? null, 
                           'password'    => $request->password ? Hash::make($request->password) : $user->password,
                         ];
     
      
            $update = $user->update($arrayData);

            # assign role to updated user
            $assignRole = $user->syncRoles($request->input('role')); 

            return response()->json([
                                        (string)$this->responseCode    => (string)$this->successStatus, 
                                        (string)$this->responseMessage => 'User Updated Successfully',
                                    ]);

        } catch (Exception $e) {
            return response()->json([
                                    (string)$this->responseCode    => (string)$this->errorStatus, 
                                    (string)$this->responseMessage => (string)$e,
                                ]);
        }
      
     
        
 }



}
