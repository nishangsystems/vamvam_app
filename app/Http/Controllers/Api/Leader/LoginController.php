<?php

namespace App\Http\Controllers\Api\Leader;

# Models
use App\Models\Leader;
use App\Models\LeaderNotification;

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
    protected $leader;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(
                                    Leader                $leader
                               )
                               {
                                    $this->leader         = $leader;
                               }

    

    /**
     * @method to login the Leader
     * @param Request $request
     * @return json
     */
    public function login(Request $request)
    {
        # Validate request data
            $validator = Validator::make($request->all(), [ 
                'login_type'   => 'required',
            ]);

            # If validator fails return response
            if ($validator->fails()) { 
                return response()->json(['message'=>$validator->errors()->first(), 'code' => (string)$this->failedStatus]);            
            }

        if($request->login_type == 'mobile')
        {
            # Validate request data
            $validator = Validator::make($request->all(), [ 
                'mobile_email'     => 'required|string',
            ]);

            # If validator fails return response
            if ($validator->fails()) { 
                return response()->json(['message'=>$validator->errors()->first(), 'code' => (string)$this->failedStatus]);            
            }

            try {
                
                    # fetch user from Database
                    $leader = $this->leader
                                   ->where('mobile', $request->mobile_email)
                                   ->where('is_delete', 0)
                                   ->get();
        
                       if($leader->isNotEmpty()) 
                       {
                            $leader = $leader->last();
                             
                            # Check active or not 
                            if($leader->status != '1')
                            {
                               # return response
                                return response()->json([
                                    'code'      => (string)$this->failedStatus, 
                                    'message'   => 'Sorry your account is not active',
                                ]);
                            }


                            $otp = mt_rand(1000,9999);
                            $data = [
                                        'otp'           => $otp,
                                    ];

                            # User Otp
                            $leader->update($data);

                            $data = [
                                        'leader_id'        => (string)$leader->id,
                                        'otp'              => (string)$otp,
                                        'leader_unique_id' => (string)$leader->leader_unique_id,
                                        'name'             => (string)$leader->name,
                                        'mobile'           => (string)$leader->mobile,
                                        'email'            => (string)$leader->email,
                                        'aadhaar_card'     => (string)$leader->aadhaar_card,
                                        'voter_id'         => (string)$leader->voter_id,
                                    ];

                           
                            # return response
                            return response()->json([
                                'code'      => (string)$this->successStatus, 
                                'message'   => 'OTP send your mobile number',
                                'data'      => $data
                            ]);
                        } else {
                            # return response
                            return response()->json([
                                'code'      => (string)$this->failedStatus, 
                                'message'   => 'Sorry, this mobile number not register',
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
        }/// login type mobile 


        if($request->login_type == 'email')
        {
            # Validate request data
            $validator = Validator::make($request->all(), [ 
                'mobile_email' => 'required|string',
                'password'     => 'required|string',
            ]);

            # If validator fails return response
            if ($validator->fails()) { 
                return response()->json(['message'=>$validator->errors()->first(), 'code' => (string)$this->failedStatus]);            
            } 


            try {
                
                    # fetch user from Database
                    $leader = $this->leader
                                   ->where('email', $request->mobile_email)
                                   ->where('is_delete', 0)
                                   ->get();
        
                       if($leader->isNotEmpty()) 
                       {
                            $leader = $leader->last();
                             
                            # Check password 
                            if(Hash::check($request->get('password'), $leader->password))     
                            {

                                # Check active or not 
                                if($leader->status != '1')
                                {
                                   # return response
                                    return response()->json([
                                        'code'      => (string)$this->failedStatus, 
                                        'message'   => 'Sorry your account is not active',
                                    ]);
                                }

                                $token = $this->generateToken();
                                $device_type = $request->device_type;
                                $device_token = $request->device_token;
                                # Update user token
                                $leader->update([
                                                'api_token'    => $token,
                                                'device_type'  => $device_type,
                                                'device_token' => $device_token
                                              ]);


                                $data = [
                                          'leader_id'    => (string)$leader->id,
                                          'api_token'    => (string)$leader->api_token,
                                          'leader_unique_id'=> (string)$leader->leader_unique_id,
                                          'name'         => (string)$leader->name,
                                          'mobile'       => (string)$leader->mobile,
                                          'email'        => (string)$leader->email,
                                          'aadhaar_card' => (string)$leader->aadhaar_card,
                                          'voter_id'     => (string)$leader->voter_id,
                                        ];
                           
                                # return response
                                return response()->json([
                                    'code'      => (string)$this->successStatus, 
                                    'message'   => 'Login Successfully',
                                    'data'      => $data
                                ]);
                              
                            }else{
                                # return response
                                return response()->json([
                                    'code'      => (string)$this->failedStatus, 
                                    'message'   => 'Sorry, this password is incorrect',
                                    'data'      => []
                                ]);  
                            }
                        } else {
                            # return response
                            return response()->json([
                                'code'      => (string)$this->failedStatus, 
                                'message'   => 'Sorry, this email not register',
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
    }

    /**
     * @method to login the User
     * @param Request $request
     * @return json
     */
    public function login1(Request $request)
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
                
                    # fetch leader from Database
                    $leader = $this->leader
                                   ->where('mobile', $request->mobile)
                                   ->where('is_delete', 0)
                                   ->get();
        
                       if($leader->isNotEmpty()) 
                       {
                            $leaderInfo = $leader->last();

                            $leaderId =$leaderInfo->id; 

                            
                             
                                $token = $this->generateToken();
                                $device_type = $request->device_type;
                                $device_token = $request->device_token;
                                # Update user token
                                $leaderInfo->update([
                                                    'api_token'    => $token,
                                                    'device_type'  => $device_type,
                                                    'device_token' => $device_token,
                                                    'name'         => $request->name ?? null,
                                                    'mobile'       => $request->mobile,
                                                  ]);

                                
                                $leader = $this->leader->where('id', $leaderId)->first();

                                $data = [
                                        'leader_id'        => (string)$leader->id,
                                        'leader_unique_id' => (string)$leader->leader_unique_id ?? '',
                                        'name'             => (string)$leader->name ?? '',
                                        'mobile'           => (string)$leader->mobile,
                                        'email'            => (string)$leader->email ?? '',
                                        'aadhaar_card'     => (string)$leader->aadhaar_card ?? '',
                                        'voter_id'         => (string)$leader->voter_id ?? '',
                                        'api_token'        => (string)$leader->api_token,
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
                                            'leader_unique_id'    => rand(10000000,99999999),  
                                            'name'                => $request->name ?? null,   
                                            'mobile'              => $request->mobile ?? null,   
                                            'api_token'           => $token,
                                            'device_type'         => $request->device_type,
                                            'device_token'        => $request->device_token,  
                                            'password'            => Hash::make(123456),  
                                         ];  

                            #store
                            $create = $this->leader::create($arrayData);

                            $leader = $this->leader->where('id', $create->id)->first();
                                $data = [
                                            'leader_id'        => (string)$leader->id,
                                            'leader_unique_id' => (string)$leader->leader_unique_id ?? '',
                                            'name'             => (string)$leader->name ?? '',
                                            'mobile'           => (string)$leader->mobile,
                                            'email'            => (string)$leader->email ?? '',
                                            'aadhaar_card'     => (string)$leader->aadhaar_card ?? '',
                                            'voter_id'         => (string)$leader->voter_id ?? '',
                                            'api_token'        => (string)$leader->api_token,
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
     * @method to login the User
     * @param Request $request
     * @return json
     */
    public function loginOld(Request $request)
    {
        # Validate request data
            $validator = Validator::make($request->all(), [ 
                'login_type'   => 'required',
            ]);

            # If validator fails return response
            if ($validator->fails()) { 
                return response()->json(['message'=>$validator->errors()->first(), 'code' => (string)$this->failedStatus]);            
            }

        if($request->login_type == 'mobile')
        {
            # Validate request data
            $validator = Validator::make($request->all(), [ 
                'mobile_email'     => 'required|string',
            ]);

            # If validator fails return response
            if ($validator->fails()) { 
                return response()->json(['message'=>$validator->errors()->first(), 'code' => (string)$this->failedStatus]);            
            }

            try {
                
                    # fetch user from Database
                    $leader = $this->leader
                                   ->where('mobile', $request->mobile_email)
                                   ->where('is_delete', 0)
                                   ->get();
        
                       if($leader->isNotEmpty()) 
                       {
                            $leader = $leader->last();
                             
                            # Check active or not 
                            if($leader->status != '1')
                            {
                               # return response
                                return response()->json([
                                    'code'      => (string)$this->failedStatus, 
                                    'message'   => 'Sorry your account is not active',
                                ]);
                            }


                            $otp = mt_rand(1000,9999);
                            $data = [
                                        'otp'           => $otp,
                                    ];

                            # User Otp
                            $leader->update($data);

                            $data = [
                                        'leader_id'        => (string)$leader->id,
                                        'otp'              => (string)$otp,
                                        'leader_unique_id' => (string)$leader->leader_unique_id,
                                        'name'             => (string)$leader->name,
                                        'mobile'           => (string)$leader->mobile,
                                        'email'            => (string)$leader->email,
                                        'aadhaar_card'     => (string)$leader->aadhaar_card,
                                        'voter_id'         => (string)$leader->voter_id,
                                    ];

                           
                            # return response
                            return response()->json([
                                'code'      => (string)$this->successStatus, 
                                'message'   => 'OTP send your mobile number',
                                'data'      => $data
                            ]);
                        } else {
                            # return response
                            return response()->json([
                                'code'      => (string)$this->failedStatus, 
                                'message'   => 'Sorry, this mobile number not register',
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
        }/// login type mobile 


        if($request->login_type == 'email')
        {
            # Validate request data
            $validator = Validator::make($request->all(), [ 
                'mobile_email' => 'required|string',
                'password'     => 'required|string',
            ]);

            # If validator fails return response
            if ($validator->fails()) { 
                return response()->json(['message'=>$validator->errors()->first(), 'code' => (string)$this->failedStatus]);            
            } 


            try {
                
                    # fetch user from Database
                    $leader = $this->leader
                                   ->where('email', $request->mobile_email)
                                   ->where('is_delete', 0)
                                   ->get();
        
                       if($leader->isNotEmpty()) 
                       {
                            $leader = $leader->last();
                             
                            # Check password 
                            if(Hash::check($request->get('password'), $leader->password))     
                            {

                                # Check active or not 
                                if($leader->status != '1')
                                {
                                   # return response
                                    return response()->json([
                                        'code'      => (string)$this->failedStatus, 
                                        'message'   => 'Sorry your account is not active',
                                    ]);
                                }

                                $token = $this->generateToken();
                                $device_type = $request->device_type;
                                $device_token = $request->device_token;
                                # Update user token
                                $leader->update([
                                                'api_token'    => $token,
                                                'device_type'  => $device_type,
                                                'device_token' => $device_token
                                              ]);


                                $data = [
                                          'leader_id'    => (string)$leader->id,
                                          'api_token'    => (string)$leader->api_token,
                                          'leader_unique_id'=> (string)$leader->leader_unique_id,
                                          'name'         => (string)$leader->name,
                                          'mobile'       => (string)$leader->mobile,
                                          'email'        => (string)$leader->email,
                                          'aadhaar_card' => (string)$leader->aadhaar_card,
                                          'voter_id'     => (string)$leader->voter_id,
                                        ];
                           
                                # return response
                                return response()->json([
                                    'code'      => (string)$this->successStatus, 
                                    'message'   => 'Login Successfully',
                                    'data'      => $data
                                ]);
                              
                            }else{
                                # return response
                                return response()->json([
                                    'code'      => (string)$this->failedStatus, 
                                    'message'   => 'Sorry, this password is incorrect',
                                    'data'      => []
                                ]);  
                            }
                        } else {
                            # return response
                            return response()->json([
                                'code'      => (string)$this->failedStatus, 
                                'message'   => 'Sorry, this email not register',
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
    }



    /**
     * @method to verify user Request Otp
     * 
     * @return Otp Verified or Not
     */
    public function verifyOtp(Request $request)
    {
        # Validate request data
        $validator = Validator::make($request->all(), [ 
            'leader_id'  => 'required|numeric',
            'otp'        => 'required|string',
        ]);

        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors()->first(),'code' => (string)$this->failedStatus]);            
        }

        try {

                # check user already Exist on that id
                $leader = $this->leader
                               ->where('id', $request->get('leader_id'))
                               ->where('is_delete', 0)
                               ->get()
                               ->last();
        

                    # return response if leader already exist on requested mobile
                    if($leader != '') 
                    {
                            if($leader->otp == $request->get('otp')) 
                            {
                                $token = $this->generateToken();
                                $device_type = $request->device_type;
                                $device_token = $request->device_token;
                                # Update user token
                                $leader->update([
                                                'api_token'    => $token,
                                                'device_type'  => $device_type,
                                                'device_token' => $device_token
                                              ]);

                                # Set the Data
                                $data = [
                                        'leader_id'        => (string)$leader->id,
                                        'leader_unique_id' => (string)$leader->leader_unique_id,
                                        'api_token'        =>  (string)$token ?? '',
                                        'name'             => (string)$leader->name,
                                        'mobile'           => (string)$leader->mobile,
                                        'email'            => (string)$leader->email,
                                        'aadhaar_card'     => (string)$leader->aadhaar_card,
                                        'voter_id'         => (string)$leader->voter_id,
                                    ];

                                # return response
                                return response()->json([
                                    'code'      => (string)$this->successStatus, 
                                    'message'   => 'OTP has been Verified.',
                                    'data'      => $data
                                 ]);
                            } else {
                                # return response
                                return response()->json([
                                    'code'      => (string)$this->failedStatus, 
                                    'message'   => 'OTP does not match.',
                                    'data'      => []
                                 ]);
                            }
                        
                    } else {
                        # return response
                        return response()->json([
                            'code'      => (string)$this->failedStatus, 
                            'message'   => 'User not Found on User Id.',
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
     * @method to Get Profile
     * 
     * @return 
     */
    public function getProfile(Request $request)
    {
        # Validate request data
        $validator = Validator::make($request->all(), [ 
            'leader_id'  => 'required|numeric',
        ]);

        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors()->first(),'code' => (string)$this->failedStatus]);            
        }

        try {

        # check user already Exist on that id
        $leader = $this->leader
                       ->where('id', $request->get('leader_id'))
                       ->where('is_delete', 0)
                       ->get()
                       ->last();
      
        # return response if user already exist on requested user id
        if($leader != '') 
        {
            # Set the Data
             $data = [
                        'leader_id'        => (string)$leader->id,
                        'leader_unique_id' => (string)$leader->leader_unique_id,
                        'api_token'        => (string)$leader->api_token,
                        'name'             => (string)$leader->name,
                        'mobile'           => (string)$leader->mobile,
                        'email'            => (string)$leader->email,
                        'aadhaar_card'     => (string)$leader->aadhaar_card,
                        'voter_id'         => (string)$leader->voter_id,
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
                'message'   => 'User not Found on User Id.',
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
     * @method to Forgot Password
     * 
     * @return Forgot Password
     */
    public function forgotPassword(Request $request)
    {
        # Validate request data
        $validator = Validator::make($request->all(), [ 
            'email'      => 'required|string',
        ]);

        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors()->first(),'code' => (string)$this->failedStatus]);            
        }

        try {

                # check user already Exist on that id
                $leader = $this->leader
                               ->where('email', $request->get('email'))
                               ->where('is_delete', 0)
                               ->get()
                               ->last();
        

                    # return response if user already exist on requested mobile
                    if($leader != '') 
                    {
                        $otp = rand(1000,9999);
                        $leader->update([
                                         'forgot_otp'    => $otp
                                        ]); 
                        
                        $data = [
                                    'leader_id'        => (string)$leader->id,
                                    'email'            => (string)$leader->email,
                                    'otp'              => (string)$otp
                                ];


                        return response()->json([
                                        'code'    => (string)$this->successStatus, 
                                        'message' => 'OTP Send Successfully',
                                        'data'    => $data
                                    ]);                  
                        
                    } else {
                        # return response
                        return response()->json([
                            'code'      => (string)$this->failedStatus, 
                            'message'   => 'Leader not Found on this email.',
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
     * @method to Forgot Password Verify OTP
     * 
     * @return Forgot Password Verify OTP
     */
    public function forgotVerifyOtp(Request $request)
    {
        # Validate request data
        $validator = Validator::make($request->all(), [ 
            'leader_id'  => 'required',
            'otp'        => 'required',
        ]);

        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors()->first(),'code' => (string)$this->failedStatus]);            
        }

        try {

                # check user already Exist on that id
                $leader = $this->leader
                               ->where('id', $request->get('leader_id'))
                               ->where('is_delete', 0)
                               ->get()
                               ->last();
        

                    # return response if user already exist on requested mobile
                    if($leader != '') 
                    {
                        if($leader->forgot_otp == $request->otp)
                        {
                          
                            return response()->json([
                                        'code'    => (string)$this->successStatus, 
                                        'message' => 'OTP Verify Successfully',
                                    ]);  
                        }else{
                            return response()->json([
                                        'code'    => (string)$this->failedStatus, 
                                        'message' => 'OTP Not Verify',
                                    ]); 
                        }
       
                        
                    } else {
                        # return response
                        return response()->json([
                            'code'      => (string)$this->failedStatus, 
                            'message'   => 'User not Found on this email.',
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
     * @method to Forgot Password Reset
     * 
     * @return Forgot Password
     */
    public function forgotPasswordReset(Request $request)
    {
        # Validate request data
        $validator = Validator::make($request->all(), [ 
            'leader_id'    => 'required',
            'password'     => 'required',
        ]);

        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors()->first(),'code' => (string)$this->failedStatus]);            
        }

        try {

                # check user already Exist on that id
                $leader = $this->leader
                             ->where('id', $request->get('leader_id'))
                             ->where('is_delete', 0)
                             ->get()
                             ->last();
        

                    # return response if user already exist on requested mobile
                    if($leader != '') 
                    {
                        $leader->update([
                                         'forgot_otp'       => '',
                                         'password'         => Hash::make($request->password),
                                         'show_password'    => $request->password,
                                        ]); 
                      
                        return response()->json([
                                        'code'    => (string)$this->successStatus, 
                                        'message' => 'Password Reset Successfully',
                                    ]);                  
                        
                    } else {
                        # return response
                        return response()->json([
                            'code'      => (string)$this->failedStatus, 
                            'message'   => 'User not Found on this email.',
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
            'leader_id'  => 'required|numeric',
        ]);

        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors()->first(),'code' => (string)$this->failedStatus]);            
        }

        try {

                # check user already Exist on that id
                $leader = $this->leader
                               ->where('id', $request->get('leader_id'))
                               ->get()
                               ->last();
          
                # return response if user already exist on requested user id
                if($leader != '') 
                {

                    # Update user 
                    $leader->update(['is_delete'    => 1]);
                       
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



     /** 
     * Notification List 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function notification(Request $request) 
    { 

        # Validate request data
        $validator = Validator::make($request->all(), [ 
            'leader_id'  => 'required|numeric',
        ]);

        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors()->first(),'code' => (string)$this->failedStatus]);            
        }

        try 
           {
                $leaderNotificationArray = [];
                DB::beginTransaction();
                    # get leaderNotification
                    $leaderNotifications =  LeaderNotification::where('leader_id',$request->leader_id)
                                                              ->where('is_delete',0)
                                                              ->orderBy('id','desc')
                                                              ->get();
                DB::commit();      
                        # return response if leaderNotifications get
                        if($leaderNotifications->isNotEmpty()) 
                        {
                            foreach($leaderNotifications as $key => $leaderNotification) 
                            {
                                $data['id']           = (string)$leaderNotification->id ?? '';
                                $data['type']         = (string)$leaderNotification->type ?? '';
                                $data['title']        = (string)$leaderNotification->title ?? '';
                                $data['message']      = (string)$leaderNotification->message ?? '';
                                $data['complaint_id'] = (string)$leaderNotification->complaint_id ?? '';
                                $data['is_read']      = (string)$leaderNotification->is_read ?? '';
                                $data['created_at']   = (string)$leaderNotification->created_at ?? '';
                                # push in array
                                array_push($leaderNotificationArray, $data);
                            }
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->successStatus, 
                                                        'message'   => 'Notification List',
                                                        'data'      =>  $leaderNotificationArray
                                                    ]);
                        }else{
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->failedStatus, 
                                                        'message'   => 'Notification Not Found!!',
                                                        'data'      =>  []
                                                    ]); 
                        }
            } catch (Exception $e) {
            # return response
            return response()->json([
                                        'code'      => (string)$this->failedStatus, 
                                        'message'   => 'Something Went Worng',
                                        'data'      =>  []
                                   ]);
            }
    }



    /**
     * @method to Notification Read/Single Delete/Multiple Delete
     * 
     * @return 
     */
    public function notificationUpdate(Request $request)
    {
        # Validate request data
        $validator = Validator::make($request->all(), [ 
            'type'             => 'required',
            'leader_id'        => 'required',
        ]);

        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors()->first(),'code' => (string)$this->failedStatus]);            
        }

        try {

            if($request->type == 'read')
            {
                if($request->notification_id == '')
                {
                    return response()->json(['message'=>'Notification id is required','code' => (string)$this->failedStatus]); 
                }
                $leaderNotification =  LeaderNotification::where('id',$request->notification_id)->first();
                $leaderNotification->is_read = 1;
                $leaderNotification->save();

                # return response
                return response()->json([
                        'code'      => (string)$this->successStatus, 
                        'message'   => 'Notification read successfully.'
                     ]);

            }


            if($request->type == 'delete')
            {
                if($request->notification_id == '')
                {
                    return response()->json(['message'=>'Notification id is required','code' => (string)$this->failedStatus]); 
                }
                $leaderNotification =  LeaderNotification::where('id',$request->notification_id)->first();
                $leaderNotification->is_delete = 1;
                $leaderNotification->save();

                # return response
                return response()->json([
                        'code'      => (string)$this->successStatus, 
                        'message'   => 'Notification delete successfully.'
                     ]);

            }


            if($request->type == 'alldelete')
            {
                LeaderNotification::where('leader_id',$request->leader_id)
                                  ->update(['is_delete' => 1]);

                # return response
                return response()->json([
                        'code'      => (string)$this->successStatus, 
                        'message'   => 'Notification delete successfully.'
                     ]);

            }

             return response()->json([
                          'code'      => (string)$this->failedStatus, 
                          'message'   => 'Something Went Worng.'
                       ]);
               
            } catch (Exception $e) {
                # return response
                      return response()->json([
                          'code'      => (string)$this->failedStatus, 
                          'message'   => 'Something Went Worng.'
                       ]);
            }
    }


}
