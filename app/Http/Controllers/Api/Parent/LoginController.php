<?php

namespace App\Http\Controllers\Api\Parent;

# Models
use App\Models\ParentM;

# Traits
use App\Http\Traits\StatusTrait;

# Vendor Classes
use DB;
use File;
use Validator;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth; 
use App\Http\Controllers\Controller; 
use Illuminate\Support\Facades\Hash;
use App\Http\Controllers\Api\User\NotifyUser;

class LoginController extends Controller
{
    use StatusTrait;

    # Variable to Bind Model
    protected $parent;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(
                                    ParentM                $parent
                               )
                               {
                                    $this->parent         = $parent;
                               }

    

    /**
     * @method to login the Parent
     * @param Request $request
     * @return json
     */
    public function login(Request $request)
    {
            # Validate request data
            $validator = Validator::make($request->all(), [ 
                'mobile' => 'required|string',
            ]);

            # If validator fails return response
            if ($validator->fails()) { 
                return response()->json(['message'=>$validator->errors()->first(), 'code' => (string)$this->failedStatus]);            
            } 


            try {
                
                    # fetch parent from Database
                    $parent = $this->parent
                                   ->where('mobile', $request->mobile)
                                   ->where('is_delete', 0)
                                   ->get();
        
                       if($parent->isNotEmpty()) 
                       {
                            $parentInfo = $parent->last();

                            $parentId =$parentInfo->id; 

                            
                             
                                $token = $this->generateToken();
                                $device_type = $request->device_type;
                                $device_token = $request->device_token;
                                # Update user token
                                $parentInfo->update([
                                                    'api_token'    => $token,
                                                    'device_type'  => $device_type,
                                                    'device_token' => $device_token,
                                                    'name'         => $request->name ?? null,
                                                    'mobile'       => $request->mobile,
                                                  ]);

                                
                                $parent = $this->parent->where('id', $parentId)->first();

                                $data = [
                                        'parent_id'        => (string)$parent->id,
                                        'parent_unique_id' => (string)$parent->parent_unique_id ?? '',
                                        'name'             => (string)$parent->name ?? '',
                                        'mobile'           => (string)$parent->mobile,
                                        'api_token'        => (string)$parent->api_token,
                                    ];

                                                          
                                # return response
                                return response()->json([
                                    'code'      => (string)$this->successStatus, 
                                    'message'   => 'Login Successfully',
                                    'data'      => $data
                                ]);
                              
                            
                        } else {
                            $token = $this->generateToken();
                            $arrayData = [
                                            'parent_unique_id'    => rand(10000000,99999999),  
                                            'name'                => $request->name ?? null,   
                                            'mobile'              => $request->mobile ?? null,   
                                            'api_token'           => $token,
                                            'device_type'         => $request->device_type,
                                            'device_token'        => $request->device_token,  
                                            'password'            => Hash::make(123456),  
                                         ];  

                            #store
                            $create = $this->parent::create($arrayData);

                            $parent = $this->parent->where('id', $create->id)->first();
                                $data = [
                                            'parent_id'        => (string)$parent->id,
                                            'parent_unique_id' => (string)$parent->parent_unique_id ?? '',
                                            'name'             => (string)$parent->name ?? '',
                                            'mobile'           => (string)$parent->mobile,
                                            'api_token'        => (string)$parent->api_token,
                                        ];
                           
                                # return response
                                return response()->json([
                                    'code'      => (string)$this->successStatus, 
                                    'message'   => 'Login Successfully',
                                    'data'      => $data
                                ]);


                        } 
                } catch (Exception $e) {
                          # return response
                          return response()->json([
                              'code'      => (string)$this->failedStatus, 
                              'message'   => 'Something Went Worng.'
                           ]);
                } 
    }



   
      /**
     * @method to Get Profile
     * 
     * @return 
     */
    public function getProfile(Request $request)
    {
        # Validate request data
        $validator = Validator::make($request->all(), [ 
            'parent_id'  => 'required|numeric',
        ]);

        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors()->first(),'code' => (string)$this->failedStatus]);            
        }

        try {

        # check user already Exist on that id
        $parent = $this->parent
                       ->where('id', $request->get('parent_id'))
                       ->where('is_delete', 0)
                       ->get()
                       ->last();
      
        # return response if user already exist on requested user id
        if($parent != '') 
        {
            # Set the Data
             $data = [
                        'parent_id'        => (string)$parent->id,
                        'parent_unique_id' => (string)$parent->parent_unique_id,
                        'api_token'        => (string)$parent->api_token,
                        'name'             => (string)$parent->name,
                        'mobile'           => (string)$parent->mobile,
                     ];

            # return response
            return response()->json([
                'code'      => (string)$this->successStatus, 
                'message'   => 'Profile Details.',
                'data'      => $data
             ]);
              
        } else {
            # return response
            return response()->json([
                'code'      => (string)$this->failedStatus, 
                'message'   => 'parent not Found on parent Id.',
                'data'      => []
             ]); 
        } 


        } catch (Exception $e) {
            # return response
                  return response()->json([
                      'code'      => (string)$this->failedStatus, 
                      'message'   => 'Something Went Worng.'
                   ]);
        }
    }








    /**
     * @method to delete Profile
     * 
     * @return 
     */
    public function deleteProfile(Request $request)
    {
        # Validate request data
        $validator = Validator::make($request->all(), [ 
            'parent_id'  => 'required|numeric',
        ]);

        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors()->first(),'code' => (string)$this->failedStatus]);            
        }

        try {

                # check user already Exist on that id
                $parent = $this->parent
                               ->where('id', $request->get('parent_id'))
                               ->get()
                               ->last();
          
                # return response if user already exist on requested user id
                if($parent != '') 
                {

                    # Update user 
                    $parent->update(['is_delete'    => 1]);
                       
                        # return response
                        return response()->json([
                                'code'      => (string)$this->successStatus, 
                                'message'   => 'Your account has been deleted successfully.'
                             ]);
                      
                } else {
                    # return response
                    return response()->json([
                        'code'      => (string)$this->failedStatus, 
                        'message'   => 'User not Found',
                    ]);    
                } 
            } catch (Exception $e) {
                # return response
                      return response()->json([
                          'code'      => (string)$this->failedStatus, 
                          'message'   => 'Something Went Worng.'
                       ]);
            }
    }



    
         
    /**
     * function to generate the Token
     * 
     * @return Token
     */
    public function generateToken()
    {
        # Set the token 
        $token = Str::random(256);

        # Hash Token
        $hashToken = hash('sha256', $token);

        # return the Hash Token 
        return $hashToken;
    }


    /**
     * function to generate the random code
     * 
     * @return Token
     */
    public  function generateRandomCode($length = 20) {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }



}
