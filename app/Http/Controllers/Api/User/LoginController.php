<?php

namespace App\Http\Controllers\Api\User;

# Models
use App\Models\Customer;
use App\Models\CustomerAddress; 
use App\Models\UserNotification; 

use App\Models\SurveyQuestion;
use App\Models\SurveyAnswer;
use App\Models\SurveyVoting;

# Traits
use App\Http\Traits\StatusTrait;

# Vendor Classes
use DB;
use File;
use Validator;
use Helper;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth; 
use App\Http\Controllers\Controller; 
use Illuminate\Support\Facades\Hash;
use App\Http\Controllers\Api\User\NotifyCustomer;

class LoginController extends Controller
{
    use StatusTrait;

    # Variable to Bind Model
    protected $customer;

    # bind customerAddress Model
    protected $customerAddress;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(
                                    Customer                $customer,
                                    CustomerAddress         $customerAddress
                               )
                               {
                                    $this->customer         = $customer;
                                    $this->customerAddress  = $customerAddress;
                               }

   
    /**
     * @method to login the User
     * @param Request $request
     * @return json
     */
    public function login(Request $request)
    {
            # Validate request data
            $validator = Validator::make($request->all(), [ 
                'username' => 'required|string',
            ]);

            # If validator fails return response
            if ($validator->fails()) { 
                return response()->json(['message'=>$validator->errors()->first(), 'code' => (string)$this->failedStatus]);            
            } 


            try {
                
                    # fetch user from Database
                    $user = $this->customer
                                 ->where('customer_unique_id', $request->username)
                                 ->where('is_delete', 0)
                                 ->get();
        
                       if($user->isNotEmpty()) 
                       {
                            $userInfo = $user->last();

                            $userId =$userInfo->id; 

                            
                             
                                $token = $this->generateToken();
                                $device_type = $request->device_type;
                                $device_token = $request->device_token;
                                # Update user token
                                $userInfo->update([
                                                'api_token'    => $token,
                                                'device_type'  => $device_type,
                                                'device_token' => $device_token,
                                                'name'         => $request->name,
                                                'email'        => $request->email,
                                                'mobile'       => $request->mobile,
                                              ]);
                                
                                $user = $this->customer->where('id', $userId)->first();

                                $data = [
                                        'user_id'          => (string)$user->id,
                                        'is_profile_complete' => (string)$user->is_profile_complete,
                                        'api_token'        => (string)$user->api_token,
                                        'user_unique_id'   => (string)$user->customer_unique_id,
                                        'voter_id'         => (string)$user->voter_id,
                                        'aadhaar_card'     => (string)$user->aadhaar_card,
                                        'name'             => (string)$user->name,
                                        'gender'           => (string)$user->gender,
                                        'dob'              => (string)$user->dob,
                                        'guardian_name'    => (string)$user->guardian_name,
                                        'relation'         => (string)$user->relation,
                                        'mobile'           => (string)$user->mobile,
                                        'email'            => (string)$user->email,
                                        'state_id'         => $user->addressInfo ? (string)$user->addressInfo->state_id : '',
                                        'state_name'       => $user->addressInfo ? ($user->addressInfo->state_id ? $user->addressInfo->stateInfo->name : '' ) : '',
                                        'district_id'      => $user->addressInfo ? (string)$user->addressInfo->district_id : '',
                                        'district_name'    => $user->addressInfo ? ($user->addressInfo->district_id ? ($user->addressInfo->districtInfo ? $user->addressInfo->districtInfo->name : '') : '') : '',
                                        'tehsil_id'        => $user->addressInfo ? (string)$user->addressInfo->tehsil_id : '',
                                        'tehsil_name'    => $user->addressInfo ? ($user->addressInfo->tehsil_id ? ($user->addressInfo->tehsilInfo ? $user->addressInfo->tehsilInfo->name : '') : '') : '',
                                       
                                        'area'             => $user->addressInfo ? (string)$user->addressInfo->area : '',
                                        'parliamentary_id' => $user->addressInfo ? (string)$user->addressInfo->parliamentary_id : '',
                                        'parliamentary_name'    => $user->addressInfo ? ($user->addressInfo->parliamentary_id ? ($user->addressInfo->parliamentaryInfo ? $user->addressInfo->parliamentaryInfo->name : '') : '') : '',
                                        'assembly_id'      => $user->addressInfo ? (string)$user->addressInfo->assembly_id : '',
                                        'assembly_name'    => $user->addressInfo ? ($user->addressInfo->assembly_id ? ($user->addressInfo->assemblyInfo ? $user->addressInfo->assemblyInfo->name : '') : '') : '',
                                        
                                        'town_village_id'      => $user->addressInfo ? (string)$user->addressInfo->town_village_id : '',
                                        'town_village_name'    => $user->addressInfo ? ($user->addressInfo->town_village_id ? ($user->addressInfo->townVillageInfo ? $user->addressInfo->townVillageInfo->name : '') : '') : '',


                                        'panchayat_ward_id'         => $user->addressInfo ? (string)$user->addressInfo->panchayat_ward_id : '',
                                        'panchayat_ward_name'    => $user->addressInfo ? ($user->addressInfo->panchayat_ward_id ? ($user->addressInfo->panchayatWardInfo ? $user->addressInfo->panchayatWardInfo->name : '') : '') : '',

                                        'block_id'         => $user->addressInfo ? (string)$user->addressInfo->block_id : '',
                                        'block_name'    => $user->addressInfo ? ($user->addressInfo->block_id ? ($user->addressInfo->blockInfo ? $user->addressInfo->blockInfo->name : '') : '') : '',

                                        'thana_id'         => $user->addressInfo ? (string)$user->addressInfo->thana_id : '',
                                        'thana_name'    => $user->addressInfo ? ($user->addressInfo->thana_id ? ($user->addressInfo->thanaInfo ? $user->addressInfo->thanaInfo->name : '') : '') : '',

                                        'post_office_id'      => $user->addressInfo ? (string)$user->addressInfo->post_office_id : '',
                                        'post_office_name'    => $user->addressInfo ? ($user->addressInfo->post_office_id ? ($user->addressInfo->postOfficeInfo ? $user->addressInfo->postOfficeInfo->name : '') : '') : '',

                                        
                                        'locality'         => $user->addressInfo ? (string)$user->addressInfo->locality : '',
                                        'house_no'         => $user->addressInfo ? (string)$user->addressInfo->house_no : '',
                                        'land_mark'        => $user->addressInfo ? (string)$user->addressInfo->land_mark : '',
                                        'pincode'          => $user->addressInfo ? (string)$user->addressInfo->pincode : '',
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
                                            'customer_unique_id'  => $request->username,  
                                            'name'                => $request->name ?? null,   
                                            'mobile'              => $request->mobile ?? null,   
                                            'email'               => $request->email ?? null,   
                                            'is_profile_complete' => 0,
                                            'api_token'           => $token,
                                            'device_type'         => $request->device_type,
                                            'device_token'        => $request->device_token,   
                                         ];  

                            #store
                            $create = $this->customer::create($arrayData);


                            $arrayData2 = [
                                                'customer_id'      => $create->id, 
                                                'state_id'         => 0,   
                                                'district_id'      => 0,   
                                                'tehsil_id'        => 0,   
                                                'area'             => null,   
                                                'parliamentary_id' => 0,   
                                                'assembly_id'      => 0,
                                                'town_village_id'  => 0,
                                                'panchayat_ward_id'=> 0,
                                                'block_id'         => 0,
                                                'thana_id'         => 0,
                                                'post_office_id'   => 0,
                                                'locality'         => null,   
                                                'house_no'         => null,   
                                                'pincode'          => null,      
                                            ];
                            #store
                            $createAdd = $this->customerAddress::create($arrayData2); 

                            $user = $this->customer->where('id', $create->id)->first();
                                $data = [
                                        'user_id'          => (string)$user->id,
                                        'is_profile_complete' => (string)$user->is_profile_complete,
                                        'api_token'        => (string)$user->api_token,
                                        'user_unique_id'   => (string)$user->customer_unique_id,
                                        'voter_id'         => (string)$user->voter_id,
                                        'aadhaar_card'     => (string)$user->aadhaar_card,
                                        'name'             => (string)$user->name,
                                        'gender'           => (string)$user->gender,
                                        'dob'              => (string)$user->dob,
                                        'guardian_name'    => (string)$user->guardian_name,
                                        'relation'         => (string)$user->relation,
                                        'mobile'           => (string)$user->mobile,
                                        'email'            => (string)$user->email,
                                        'state_id'         => $user->addressInfo ? (string)$user->addressInfo->state_id : '',
                                        'state_name'       => $user->addressInfo ? ($user->addressInfo->state_id ? $user->addressInfo->stateInfo->name : '' ) : '',
                                        'district_id'      => $user->addressInfo ? (string)$user->addressInfo->district_id : '',
                                        'district_name'    => $user->addressInfo ? ($user->addressInfo->district_id ? ($user->addressInfo->districtInfo ? $user->addressInfo->districtInfo->name : '') : '') : '',
                                        'tehsil_id'        => $user->addressInfo ? (string)$user->addressInfo->tehsil_id : '',
                                        'tehsil_name'    => $user->addressInfo ? ($user->addressInfo->tehsil_id ? ($user->addressInfo->tehsilInfo ? $user->addressInfo->tehsilInfo->name : '') : '') : '',
                                       
                                        'area'             => $user->addressInfo ? (string)$user->addressInfo->area : '',
                                        'parliamentary_id' => $user->addressInfo ? (string)$user->addressInfo->parliamentary_id : '',
                                        'parliamentary_name'    => $user->addressInfo ? ($user->addressInfo->parliamentary_id ? ($user->addressInfo->parliamentaryInfo ? $user->addressInfo->parliamentaryInfo->name : '') : '') : '',
                                        'assembly_id'      => $user->addressInfo ? (string)$user->addressInfo->assembly_id : '',
                                        'assembly_name'    => $user->addressInfo ? ($user->addressInfo->assembly_id ? ($user->addressInfo->assemblyInfo ? $user->addressInfo->assemblyInfo->name : '') : '') : '',
                                        
                                        'town_village_id'      => $user->addressInfo ? (string)$user->addressInfo->town_village_id : '',
                                        'town_village_name'    => $user->addressInfo ? ($user->addressInfo->town_village_id ? ($user->addressInfo->townVillageInfo ? $user->addressInfo->townVillageInfo->name : '') : '') : '',


                                        'panchayat_ward_id'         => $user->addressInfo ? (string)$user->addressInfo->panchayat_ward_id : '',
                                        'panchayat_ward_name'    => $user->addressInfo ? ($user->addressInfo->panchayat_ward_id ? ($user->addressInfo->panchayatWardInfo ? $user->addressInfo->panchayatWardInfo->name : '') : '') : '',

                                        'block_id'         => $user->addressInfo ? (string)$user->addressInfo->block_id : '',
                                        'block_name'    => $user->addressInfo ? ($user->addressInfo->block_id ? ($user->addressInfo->blockInfo ? $user->addressInfo->blockInfo->name : '') : '') : '',

                                        'thana_id'         => $user->addressInfo ? (string)$user->addressInfo->thana_id : '',
                                        'thana_name'    => $user->addressInfo ? ($user->addressInfo->thana_id ? ($user->addressInfo->thanaInfo ? $user->addressInfo->thanaInfo->name : '') : '') : '',

                                        'post_office_id'      => $user->addressInfo ? (string)$user->addressInfo->post_office_id : '',
                                        'post_office_name'    => $user->addressInfo ? ($user->addressInfo->post_office_id ? ($user->addressInfo->postOfficeInfo ? $user->addressInfo->postOfficeInfo->name : '') : '') : '',

                                        
                                        'locality'         => $user->addressInfo ? (string)$user->addressInfo->locality : '',
                                        'house_no'         => $user->addressInfo ? (string)$user->addressInfo->house_no : '',
                                        'land_mark'        => $user->addressInfo ? (string)$user->addressInfo->land_mark : '',
                                        'pincode'          => $user->addressInfo ? (string)$user->addressInfo->pincode : '',
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
    public function login_old(Request $request)
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
                    $user = $this->customer
                                 ->where('mobile', $request->mobile_email)
                                 ->where('is_delete', 0)
                                 ->get();
        
                       if($user->isNotEmpty()) 
                       {
                            $user = $user->last();
                             
                            # Check active or not 
                            if($user->status != '1')
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
                            $user->update($data);

                            $data = [
                                        'user_id'          => (string)$user->id,
                                        'is_profile_complete' => (string)$user->is_profile_complete,
                                        'otp'              => (string)$otp,
                                        'user_unique_id'   => (string)$user->customer_unique_id,
                                        'voter_id'         => (string)$user->voter_id,
                                        'aadhaar_card'     => (string)$user->aadhaar_card,
                                        'name'             => (string)$user->name,
                                        'gender'           => (string)$user->gender,
                                        'dob'              => (string)$user->dob,
                                        'guardian_name'    => (string)$user->guardian_name,
                                        'relation'         => (string)$user->relation,
                                        'mobile'           => (string)$user->mobile,
                                        'email'            => (string)$user->email,
                                        'state_id'         => $user->addressInfo ? (string)$user->addressInfo->state_id : '',
                                        'state_name'       => $user->addressInfo ? ($user->addressInfo->state_id ? $user->addressInfo->stateInfo->name : '' ) : '',
                                        'district_id'      => $user->addressInfo ? (string)$user->addressInfo->district_id : '',
                                        'district_name'    => $user->addressInfo ? ($user->addressInfo->district_id ? ($user->addressInfo->districtInfo ? $user->addressInfo->districtInfo->name : '') : '') : '',
                                        'tehsil_id'        => $user->addressInfo ? (string)$user->addressInfo->tehsil_id : '',
                                        'tehsil_name'    => $user->addressInfo ? ($user->addressInfo->tehsil_id ? ($user->addressInfo->tehsilInfo ? $user->addressInfo->tehsilInfo->name : '') : '') : '',
                                        
                                        'area'             => $user->addressInfo ? (string)$user->addressInfo->area : '',
                                        'parliamentary_id' => $user->addressInfo ? (string)$user->addressInfo->parliamentary_id : '',
                                        'parliamentary_name'    => $user->addressInfo ? ($user->addressInfo->parliamentary_id ? ($user->addressInfo->parliamentaryInfo ? $user->addressInfo->parliamentaryInfo->name : '') : '') : '',
                                        'assembly_id'      => $user->addressInfo ? (string)$user->addressInfo->assembly_id : '',
                                        'assembly_name'    => $user->addressInfo ? ($user->addressInfo->assembly_id ? ($user->addressInfo->assemblyInfo ? $user->addressInfo->assemblyInfo->name : '') : '') : '',

                                        'town_village_id'      => $user->addressInfo ? (string)$user->addressInfo->town_village_id : '',
                                        'town_village_name'    => $user->addressInfo ? ($user->addressInfo->town_village_id ? ($user->addressInfo->townVillageInfo ? $user->addressInfo->townVillageInfo->name : '') : '') : '',


                                        'panchayat_ward_id'         => $user->addressInfo ? (string)$user->addressInfo->panchayat_ward_id : '',
                                        'panchayat_ward_name'    => $user->addressInfo ? ($user->addressInfo->panchayat_ward_id ? ($user->addressInfo->panchayatWardInfo ? $user->addressInfo->panchayatWardInfo->name : '') : '') : '',

                                        'block_id'         => $user->addressInfo ? (string)$user->addressInfo->block_id : '',
                                        'block_name'    => $user->addressInfo ? ($user->addressInfo->block_id ? ($user->addressInfo->blockInfo ? $user->addressInfo->blockInfo->name : '') : '') : '',

                                        'thana_id'         => $user->addressInfo ? (string)$user->addressInfo->thana_id : '',
                                        'thana_name'    => $user->addressInfo ? ($user->addressInfo->thana_id ? ($user->addressInfo->thanaInfo ? $user->addressInfo->thanaInfo->name : '') : '') : '',

                                        'post_office_id'      => $user->addressInfo ? (string)$user->addressInfo->post_office_id : '',
                                        'post_office_name'    => $user->addressInfo ? ($user->addressInfo->post_office_id ? ($user->addressInfo->postOfficeInfo ? $user->addressInfo->postOfficeInfo->name : '') : '') : '',

                                        
                                        'locality'         => $user->addressInfo ? (string)$user->addressInfo->locality : '',
                                        'house_no'         => $user->addressInfo ? (string)$user->addressInfo->house_no : '',
                                        'land_mark'        => $user->addressInfo ? (string)$user->addressInfo->land_mark : '',
                                        'pincode'          => $user->addressInfo ? (string)$user->addressInfo->pincode : '',
                                    ];


                           
                            # return response
                            return response()->json([
                                'code'      => (string)$this->successStatus, 
                                'message'   => 'OTP send your mobile number',
                                'data'      => $data
                            ]);
                        } else {
                            
                            $otp = mt_rand(1000,9999);
                            $arrayData = [
                                            'customer_unique_id'=> rand(10000000,99999999),  
                                            'mobile'            => $request->mobile_email ?? null,   
                                            'is_profile_complete' => 0, 
                                            'otp'               => $otp,

                                         ];  

                            #store
                            $user = $this->customer::create($arrayData);


                            $arrayData2 = [
                                            'customer_id'      => $user->id, 
                                            'state_id'         => $request->state_id ?? 0,   
                                            'district_id'      => $request->district_id ?? 0,   
                                            'tehsil_id'        => $request->tehsil_id ?? 0,   
                                            'area'             => $request->area ?? null,   
                                            'parliamentary_id' => $request->parliamentary_id ?? 0,   
                                            'assembly_id'      => $request->assembly_id ?? 0,
                                            'town_village_id'  => $request->town_village_id ?? 0,
                                            'panchayat_ward_id'=> $request->panchayat_ward_id ?? 0,
                                            'block_id'         => $request->block_id ?? 0,
                                            'thana_id'         => $request->thana_id ?? 0,
                                            'post_office_id'   => $request->post_office_id ?? 0,
                                            'locality'         => $request->locality ?? null,   
                                            'house_no'         => $request->house_no ?? null,   
                                            'pincode'          => $request->pincode ?? null,   
                                         ];
                            #store
                            $create = $this->customerAddress::create($arrayData2);

                            $data = [
                                        'user_id'          => (string)$user->id,
                                        'is_profile_complete' => (string)$user->is_profile_complete,
                                        'otp'              => (string)$otp,
                                        'user_unique_id'   => (string)$user->customer_unique_id,
                                        'voter_id'         => (string)$user->voter_id,
                                        'aadhaar_card'     => (string)$user->aadhaar_card,
                                        'name'             => (string)$user->name,
                                        'gender'           => (string)$user->gender,
                                        'dob'              => (string)$user->dob,
                                        'guardian_name'    => (string)$user->guardian_name,
                                        'relation'         => (string)$user->relation,
                                        'mobile'           => (string)$user->mobile,
                                        'email'            => (string)$user->email,
                                        'state_id'         => $user->addressInfo ? (string)$user->addressInfo->state_id : '',
                                        'state_name'       => $user->addressInfo ? ($user->addressInfo->state_id ? $user->addressInfo->stateInfo->name : '' ) : '',
                                        'district_id'      => $user->addressInfo ? (string)$user->addressInfo->district_id : '',
                                        'district_name'    => $user->addressInfo ? ($user->addressInfo->district_id ? ($user->addressInfo->districtInfo ? $user->addressInfo->districtInfo->name : '') : '') : '',
                                        'tehsil_id'        => $user->addressInfo ? (string)$user->addressInfo->tehsil_id : '',
                                        'tehsil_name'    => $user->addressInfo ? ($user->addressInfo->tehsil_id ? ($user->addressInfo->tehsilInfo ? $user->addressInfo->tehsilInfo->name : '') : '') : '',
                                        
                                        'area'             => $user->addressInfo ? (string)$user->addressInfo->area : '',
                                        'parliamentary_id' => $user->addressInfo ? (string)$user->addressInfo->parliamentary_id : '',
                                        'parliamentary_name'    => $user->addressInfo ? ($user->addressInfo->parliamentary_id ? ($user->addressInfo->parliamentaryInfo ? $user->addressInfo->parliamentaryInfo->name : '') : '') : '',
                                        'assembly_id'      => $user->addressInfo ? (string)$user->addressInfo->assembly_id : '',
                                        'assembly_name'    => $user->addressInfo ? ($user->addressInfo->assembly_id ? ($user->addressInfo->assemblyInfo ? $user->addressInfo->assemblyInfo->name : '') : '') : '',
                                        
                                        'town_village_id'      => $user->addressInfo ? (string)$user->addressInfo->town_village_id : '',
                                        'town_village_name'    => $user->addressInfo ? ($user->addressInfo->town_village_id ? ($user->addressInfo->townVillageInfo ? $user->addressInfo->townVillageInfo->name : '') : '') : '',


                                        'panchayat_ward_id'         => $user->addressInfo ? (string)$user->addressInfo->panchayat_ward_id : '',
                                        'panchayat_ward_name'    => $user->addressInfo ? ($user->addressInfo->panchayat_ward_id ? ($user->addressInfo->panchayatWardInfo ? $user->addressInfo->panchayatWardInfo->name : '') : '') : '',

                                        'block_id'         => $user->addressInfo ? (string)$user->addressInfo->block_id : '',
                                        'block_name'    => $user->addressInfo ? ($user->addressInfo->block_id ? ($user->addressInfo->blockInfo ? $user->addressInfo->blockInfo->name : '') : '') : '',

                                        'thana_id'         => $user->addressInfo ? (string)$user->addressInfo->thana_id : '',
                                        'thana_name'    => $user->addressInfo ? ($user->addressInfo->thana_id ? ($user->addressInfo->thanaInfo ? $user->addressInfo->thanaInfo->name : '') : '') : '',

                                        'post_office_id'      => $user->addressInfo ? (string)$user->addressInfo->post_office_id : '',
                                        'post_office_name'    => $user->addressInfo ? ($user->addressInfo->post_office_id ? ($user->addressInfo->postOfficeInfo ? $user->addressInfo->postOfficeInfo->name : '') : '') : '',


                                        'locality'         => $user->addressInfo ? (string)$user->addressInfo->locality : '',
                                        'house_no'         => $user->addressInfo ? (string)$user->addressInfo->house_no : '',
                                        'land_mark'        => $user->addressInfo ? (string)$user->addressInfo->land_mark : '',
                                        'pincode'          => $user->addressInfo ? (string)$user->addressInfo->pincode : '',
                                    ];

                             # return response
                            return response()->json([
                                'code'      => (string)$this->successStatus, 
                                'message'   => 'OTP send your mobile number',
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
                    $user = $this->customer
                                 ->where('email', $request->mobile_email)
                                 ->where('is_delete', 0)
                                 ->get();
        
                       if($user->isNotEmpty()) 
                       {
                            $user = $user->last();
                             
                            # Check password 
                            if(Hash::check($request->get('password'), $user->password))     
                            {

                                # Check active or not 
                                if($user->status != '1')
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
                                $user->update([
                                                'api_token'    => $token,
                                                'device_type'  => $device_type,
                                                'device_token' => $device_token
                                              ]);


                                $data = [
                                        'user_id'          => (string)$user->id,
                                        'is_profile_complete' => (string)$user->is_profile_complete,
                                        'api_token'        => (string)$user->api_token,
                                        'user_unique_id'   => (string)$user->customer_unique_id,
                                        'voter_id'         => (string)$user->voter_id,
                                        'aadhaar_card'     => (string)$user->aadhaar_card,
                                        'name'             => (string)$user->name,
                                        'gender'           => (string)$user->gender,
                                        'dob'              => (string)$user->dob,
                                        'guardian_name'    => (string)$user->guardian_name,
                                        'relation'         => (string)$user->relation,
                                        'mobile'           => (string)$user->mobile,
                                        'email'            => (string)$user->email,
                                        'state_id'         => $user->addressInfo ? (string)$user->addressInfo->state_id : '',
                                        'state_name'       => $user->addressInfo ? ($user->addressInfo->state_id ? $user->addressInfo->stateInfo->name : '' ) : '',
                                        'district_id'      => $user->addressInfo ? (string)$user->addressInfo->district_id : '',
                                        'district_name'    => $user->addressInfo ? ($user->addressInfo->district_id ? ($user->addressInfo->districtInfo ? $user->addressInfo->districtInfo->name : '') : '') : '',
                                        'tehsil_id'        => $user->addressInfo ? (string)$user->addressInfo->tehsil_id : '',
                                        'tehsil_name'    => $user->addressInfo ? ($user->addressInfo->tehsil_id ? ($user->addressInfo->tehsilInfo ? $user->addressInfo->tehsilInfo->name : '') : '') : '',
                                       
                                        'area'             => $user->addressInfo ? (string)$user->addressInfo->area : '',
                                        'parliamentary_id' => $user->addressInfo ? (string)$user->addressInfo->parliamentary_id : '',
                                        'parliamentary_name'    => $user->addressInfo ? ($user->addressInfo->parliamentary_id ? ($user->addressInfo->parliamentaryInfo ? $user->addressInfo->parliamentaryInfo->name : '') : '') : '',
                                        'assembly_id'      => $user->addressInfo ? (string)$user->addressInfo->assembly_id : '',
                                        'assembly_name'    => $user->addressInfo ? ($user->addressInfo->assembly_id ? ($user->addressInfo->assemblyInfo ? $user->addressInfo->assemblyInfo->name : '') : '') : '',
                                        
                                        'town_village_id'      => $user->addressInfo ? (string)$user->addressInfo->town_village_id : '',
                                        'town_village_name'    => $user->addressInfo ? ($user->addressInfo->town_village_id ? ($user->addressInfo->townVillageInfo ? $user->addressInfo->townVillageInfo->name : '') : '') : '',


                                        'panchayat_ward_id'         => $user->addressInfo ? (string)$user->addressInfo->panchayat_ward_id : '',
                                        'panchayat_ward_name'    => $user->addressInfo ? ($user->addressInfo->panchayat_ward_id ? ($user->addressInfo->panchayatWardInfo ? $user->addressInfo->panchayatWardInfo->name : '') : '') : '',

                                        'block_id'         => $user->addressInfo ? (string)$user->addressInfo->block_id : '',
                                        'block_name'    => $user->addressInfo ? ($user->addressInfo->block_id ? ($user->addressInfo->blockInfo ? $user->addressInfo->blockInfo->name : '') : '') : '',

                                        'thana_id'         => $user->addressInfo ? (string)$user->addressInfo->thana_id : '',
                                        'thana_name'    => $user->addressInfo ? ($user->addressInfo->thana_id ? ($user->addressInfo->thanaInfo ? $user->addressInfo->thanaInfo->name : '') : '') : '',

                                        'post_office_id'      => $user->addressInfo ? (string)$user->addressInfo->post_office_id : '',
                                        'post_office_name'    => $user->addressInfo ? ($user->addressInfo->post_office_id ? ($user->addressInfo->postOfficeInfo ? $user->addressInfo->postOfficeInfo->name : '') : '') : '',

                                        
                                        'locality'         => $user->addressInfo ? (string)$user->addressInfo->locality : '',
                                        'house_no'         => $user->addressInfo ? (string)$user->addressInfo->house_no : '',
                                        'land_mark'        => $user->addressInfo ? (string)$user->addressInfo->land_mark : '',
                                        'pincode'          => $user->addressInfo ? (string)$user->addressInfo->pincode : '',
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
            'user_id'  => 'required|numeric',
            'otp'      => 'required|string',
        ]);

        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors()->first(),'code' => (string)$this->failedStatus]);            
        }

        try {

                # check user already Exist on that id
                $user = $this->customer
                             ->where('id', $request->get('user_id'))
                             ->where('is_delete', 0)
                             ->get()
                             ->last();
        

                    # return response if user already exist on requested mobile
                    if($user != '') 
                    {
                            if($user->otp == $request->get('otp')) 
                            {
                                $token = $this->generateToken();
                                $device_type = $request->device_type;
                                $device_token = $request->device_token;
                                # Update user token
                                $user->update([
                                                'api_token'    => $token,
                                                'device_type'  => $device_type,
                                                'device_token' => $device_token
                                              ]);

                                # Set the Data
                                $data = [
                                        'user_id'          => (string)$user->id,
                                        'is_profile_complete' => (string)$user->is_profile_complete,
                                        'user_unique_id'   => (string)$user->customer_unique_id,
                                        'api_token'        =>  (string)$token ?? '',
                                        'voter_id'         => (string)$user->voter_id,
                                        'aadhaar_card'     => (string)$user->aadhaar_card,
                                        'name'             => (string)$user->name,
                                        'gender'           => (string)$user->gender,
                                        'dob'              => (string)$user->dob,
                                        'guardian_name'    => (string)$user->guardian_name,
                                        'relation'         => (string)$user->relation,
                                        'mobile'           => (string)$user->mobile,
                                        'email'            => (string)$user->email,
                                        'state_id'         => $user->addressInfo ? (string)$user->addressInfo->state_id : '',
                                        'state_name'       => $user->addressInfo ? ($user->addressInfo->state_id ? $user->addressInfo->stateInfo->name : '' ) : '',
                                        'district_id'      => $user->addressInfo ? (string)$user->addressInfo->district_id : '',
                                        'district_name'    => $user->addressInfo ? ($user->addressInfo->district_id ? ($user->addressInfo->districtInfo ? $user->addressInfo->districtInfo->name : '') : '') : '',
                                        'tehsil_id'        => $user->addressInfo ? (string)$user->addressInfo->tehsil_id : '',
                                        'tehsil_name'    => $user->addressInfo ? ($user->addressInfo->tehsil_id ? ($user->addressInfo->tehsilInfo ? $user->addressInfo->tehsilInfo->name : '') : '') : '',
                                        
                                        'area'             => $user->addressInfo ? (string)$user->addressInfo->area : '',
                                        'parliamentary_id' => $user->addressInfo ? (string)$user->addressInfo->parliamentary_id : '',
                                        'parliamentary_name'    => $user->addressInfo ? ($user->addressInfo->parliamentary_id ? ($user->addressInfo->parliamentaryInfo ? $user->addressInfo->parliamentaryInfo->name : '') : '') : '',
                                        'assembly_id'      => $user->addressInfo ? (string)$user->addressInfo->assembly_id : '',
                                        'assembly_name'    => $user->addressInfo ? ($user->addressInfo->assembly_id ? ($user->addressInfo->assemblyInfo ? $user->addressInfo->assemblyInfo->name : '') : '') : '',
                                        
                                        'town_village_id'      => $user->addressInfo ? (string)$user->addressInfo->town_village_id : '',
                                        'town_village_name'    => $user->addressInfo ? ($user->addressInfo->town_village_id ? ($user->addressInfo->townVillageInfo ? $user->addressInfo->townVillageInfo->name : '') : '') : '',


                                        'panchayat_ward_id'         => $user->addressInfo ? (string)$user->addressInfo->panchayat_ward_id : '',
                                        'panchayat_ward_name'    => $user->addressInfo ? ($user->addressInfo->panchayat_ward_id ? ($user->addressInfo->panchayatWardInfo ? $user->addressInfo->panchayatWardInfo->name : '') : '') : '',

                                        'block_id'         => $user->addressInfo ? (string)$user->addressInfo->block_id : '',
                                        'block_name'    => $user->addressInfo ? ($user->addressInfo->block_id ? ($user->addressInfo->blockInfo ? $user->addressInfo->blockInfo->name : '') : '') : '',

                                        'thana_id'         => $user->addressInfo ? (string)$user->addressInfo->thana_id : '',
                                        'thana_name'    => $user->addressInfo ? ($user->addressInfo->thana_id ? ($user->addressInfo->thanaInfo ? $user->addressInfo->thanaInfo->name : '') : '') : '',

                                        'post_office_id'      => $user->addressInfo ? (string)$user->addressInfo->post_office_id : '',
                                        'post_office_name'    => $user->addressInfo ? ($user->addressInfo->post_office_id ? ($user->addressInfo->postOfficeInfo ? $user->addressInfo->postOfficeInfo->name : '') : '') : '',

      
                                        'locality'         => $user->addressInfo ? (string)$user->addressInfo->locality : '',
                                        'house_no'         => $user->addressInfo ? (string)$user->addressInfo->house_no : '',
                                        'land_mark'        => $user->addressInfo ? (string)$user->addressInfo->land_mark : '',
                                        'pincode'          => $user->addressInfo ? (string)$user->addressInfo->pincode : '',
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
     * @method to Register
     * 
     * @return 
     */
    public function register(Request $request)
    {

        $rules = [ 
                   //'voter_id'      =>'required',
                   //'aadhaar_card'  =>'required',
                   'name'          =>'required',
                   //'gender'        =>'required',
                   //'dob'           =>'required',
                   'mobile'        =>'required',
                   //'state_id'      =>'required',
                 ];

        $validator = Validator::make($request->all(), $rules);
       
        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors(),'code' => (string)$this->failedStatus]);            
        }


          try{

                if($request->email != '')
                {
                     $emailCheck = $this->customer
                                       ->where('email', $request->email)
                                       ->where('is_delete', 0)
                                       ->first();
                     if($emailCheck)
                     {
                        return response()->json([
                            'code'    => (string)$this->failedStatus, 
                            'message' => 'Sorry,This email already exists.',
                        ]);
                     }  
                }


                $mobileCheck = $this->customer
                                    ->where('mobile', $request->mobile)
                                    ->where('is_delete', 0)
                                    ->first();
                if($mobileCheck)
                 {
                    return response()->json([
                        'code'    => (string)$this->failedStatus, 
                        'message' => 'Sorry,This mobile already exists.',
                    ]);
                }

                if($request->voter_id != '')
                {
                    $voterCheck = $this->customer
                                   ->where('voter_id', $request->voter_id)
                                   ->where('is_delete', 0)
                                   ->first();
                    if($voterCheck)
                     {
                        return response()->json([
                            'code'    => (string)$this->failedStatus, 
                            'message' => 'Sorry,This voder id already exists.',
                        ]);
                    }
                }    
                

                if($request->aadhaar_card != '')
                {
                    $aadhaarCheck = $this->customer
                                         ->where('aadhaar_card', $request->aadhaar_card)
                                         ->where('is_delete', 0)
                                         ->first();
                    if($aadhaarCheck)
                     {
                        return response()->json([
                            'code'    => (string)$this->failedStatus, 
                            'message' => 'Sorry,This aadhaar number already exists.',
                        ]);
                    }
                }
               

          
                $arrayData = [
                                'customer_unique_id'=> rand(10000000,99999999),  
                                'voter_id'      => $request->voter_id ?? null, 
                                'aadhaar_card'  => $request->aadhaar_card ?? null,   
                                'name'          => $request->name ?? null,   
                                'gender'        => $request->gender ?? null,   
                                'dob'           => $request->dob ?? null,   
                                //'age'           => $request->age ?? null,   
                                'guardian_name' => $request->guardian_name ?? null,   
                                'relation'      => $request->relation ?? null,   
                                'mobile'        => $request->mobile ?? null,   
                                'email'         => $request->email ?? null,   

                                'show_password' => $request->mobile,   
                                'password'      => Hash::make($request->mobile),
                                'is_profile_complete' => 0,   
                             ];  


                #store
                $create = $this->customer::create($arrayData);


                $arrayData2 = [
                                'customer_id'      => $create->id, 
                                'state_id'         => $request->state_id ?? 0,   
                                'district_id'      => $request->district_id ?? 0,   
                                'tehsil_id'        => $request->tehsil_id ?? 0,   
                                'area'             => $request->area ?? null,   
                                'parliamentary_id' => $request->parliamentary_id ?? 0,   
                                'assembly_id'      => $request->assembly_id ?? 0,
                                'town_village_id'  => $request->town_village_id ?? 0,
                                'panchayat_ward_id'=> $request->panchayat_ward_id ?? 0,
                                'block_id'         => $request->block_id ?? 0,
                                'thana_id'         => $request->thana_id ?? 0,
                                'post_office_id'   => $request->post_office_id ?? 0,
                                'locality'         => $request->locality ?? null,   
                                'house_no'         => $request->house_no ?? null,   
                                'pincode'          => $request->pincode ?? null,      
                             ];
                #store
                $create = $this->customerAddress::create($arrayData2);             
               
                return response()->json([
                                        'code'    => (string)$this->successStatus, 
                                        'message' => 'User Added Successfully',
                                    ]); 
                

          }catch(\Exception $e)
          {
            return response()->json([
                                    'code'    => (string)$this->failedStatus, 
                                    'message' => (string)$e,
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
            'user_id'  => 'required|numeric',
        ]);

        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors()->first(),'code' => (string)$this->failedStatus]);            
        }

        try {

        # check user already Exist on that id
        $user = $this->customer
                     ->where('id', $request->get('user_id'))
                     ->where('is_delete', 0)
                     ->get()
                     ->last();
      
        # return response if user already exist on requested user id
        if($user != '') 
        {
            # Set the Data
            $data = [
                        'user_id'          => (string)$user->id,
                        'is_profile_complete' => (string)$user->is_profile_complete,
                        'user_unique_id'   => (string)$user->customer_unique_id,
                        'api_token'        =>  (string)$user->api_token ?? '',
                        'voter_id'         => (string)$user->voter_id,
                        'aadhaar_card'     => (string)$user->aadhaar_card,
                        'name'             => (string)$user->name,
                        'gender'           => (string)$user->gender,
                        'dob'              => (string)$user->dob,
                        'guardian_name'    => (string)$user->guardian_name,
                        'relation'         => (string)$user->relation,
                        'mobile'           => (string)$user->mobile,
                        'email'            => (string)$user->email,
                        'state_id'         => $user->addressInfo ? (string)$user->addressInfo->state_id : '',
                        'state_name'       => $user->addressInfo ? ($user->addressInfo->state_id ? $user->addressInfo->stateInfo->name : '' ) : '',
                        'district_id'      => $user->addressInfo ? (string)$user->addressInfo->district_id : '',
                        'district_name'    => $user->addressInfo ? ($user->addressInfo->district_id ? ($user->addressInfo->districtInfo ? $user->addressInfo->districtInfo->name : '') : '') : '',
                        'tehsil_id'        => $user->addressInfo ? (string)$user->addressInfo->tehsil_id : '',
                        'tehsil_name'    => $user->addressInfo ? ($user->addressInfo->tehsil_id ? ($user->addressInfo->tehsilInfo ? $user->addressInfo->tehsilInfo->name : '') : '') : '',
                        
                        'area'             => $user->addressInfo ? (string)$user->addressInfo->area : '',
                        'parliamentary_id' => $user->addressInfo ? (string)$user->addressInfo->parliamentary_id : '',
                        'parliamentary_name'    => $user->addressInfo ? ($user->addressInfo->parliamentary_id ? ($user->addressInfo->parliamentaryInfo ? $user->addressInfo->parliamentaryInfo->name : '') : '') : '',
                        'assembly_id'      => $user->addressInfo ? (string)$user->addressInfo->assembly_id : '',
                        'assembly_name'    => $user->addressInfo ? ($user->addressInfo->assembly_id ? ($user->addressInfo->assemblyInfo ? $user->addressInfo->assemblyInfo->name : '') : '') : '',
                        
                        'town_village_id'      => $user->addressInfo ? (string)$user->addressInfo->town_village_id : '',
                        'town_village_name'    => $user->addressInfo ? ($user->addressInfo->town_village_id ? ($user->addressInfo->townVillageInfo ? $user->addressInfo->townVillageInfo->name : '') : '') : '',


                        'panchayat_ward_id'         => $user->addressInfo ? (string)$user->addressInfo->panchayat_ward_id : '',
                        'panchayat_ward_name'    => $user->addressInfo ? ($user->addressInfo->panchayat_ward_id ? ($user->addressInfo->panchayatWardInfo ? $user->addressInfo->panchayatWardInfo->name : '') : '') : '',

                        'block_id'         => $user->addressInfo ? (string)$user->addressInfo->block_id : '',
                        'block_name'    => $user->addressInfo ? ($user->addressInfo->block_id ? ($user->addressInfo->blockInfo ? $user->addressInfo->blockInfo->name : '') : '') : '',

                        'thana_id'         => $user->addressInfo ? (string)$user->addressInfo->thana_id : '',
                        'thana_name'    => $user->addressInfo ? ($user->addressInfo->thana_id ? ($user->addressInfo->thanaInfo ? $user->addressInfo->thanaInfo->name : '') : '') : '',

                        'post_office_id'      => $user->addressInfo ? (string)$user->addressInfo->post_office_id : '',
                        'post_office_name'    => $user->addressInfo ? ($user->addressInfo->post_office_id ? ($user->addressInfo->postOfficeInfo ? $user->addressInfo->postOfficeInfo->name : '') : '') : '',


                        'locality'         => $user->addressInfo ? (string)$user->addressInfo->locality : '',
                        'house_no'         => $user->addressInfo ? (string)$user->addressInfo->house_no : '',
                        'land_mark'        => $user->addressInfo ? (string)$user->addressInfo->land_mark : '',
                        'pincode'          => $user->addressInfo ? (string)$user->addressInfo->pincode : '',
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
     * @method to Update Profile
     * 
     * @return 
     */
    public function updateProfile(Request $request)
    {

        $rules = [ 
                   'user_id'       =>'required',
                   //'voter_id'      =>'required',
                   //'aadhaar_card'  =>'required',
                   'name'          =>'required',
                   //'gender'        =>'required',
                   //'dob'           =>'required',
                   'mobile'        =>'required',
                   //'state_id'      =>'required',
                 ];

        $validator = Validator::make($request->all(), $rules);
        if($validator->fails()){
            return response()->json([
                        'code'=>(string)$this->failedStatus, 
                        'message' => (string)$validator->messages()->first()
                    ]);
        }


          try{

               $customer = $this->customer->where('id',$request->user_id)->where('is_delete', 0)->first();

               $is_profile_complete = $customer->is_profile_complete ?? 0;

                // if($request->email != '')
                // {
                //      $emailCheck = $this->customer
                //                        ->where('id','!=' ,$request->user_id)
                //                        ->where('email', $request->email)
                //                        ->where('is_delete', 0)
                //                        ->first();
                //      if($emailCheck)
                //      {
                //         return response()->json([
                //             'code'    => (string)$this->failedStatus, 
                //             'message' => 'Sorry,This email already exists.',
                //         ]);
                //      }  
                // }


                // $mobileCheck = $this->customer
                //                     ->where('mobile', $request->mobile)
                //                     ->where('id','!=' ,$request->user_id)
                //                     ->where('is_delete', 0)
                //                     ->first();
                // if($mobileCheck)
                //  {
                //     return response()->json([
                //         'code'    => (string)$this->failedStatus, 
                //         'message' => 'Sorry,This mobile already exists.',
                //     ]);
                // }

                if($request->voter_id != ''){
                    $voterCheck = $this->customer
                                   ->where('voter_id', $request->voter_id)
                                   ->where('id','!=' ,$request->user_id)
                                   ->where('is_delete', 0)
                                   ->first();
                    if($voterCheck)
                     {
                        return response()->json([
                            'code'    => (string)$this->failedStatus, 
                            'message' => 'Sorry,This voder id already exists.',
                        ]);
                    }
                }
                

                if($request->aadhaar_card != '')
                {
                    $aadhaarCheck = $this->customer
                                         ->where('aadhaar_card', $request->aadhaar_card)
                                         ->where('id','!=' ,$request->user_id)
                                         ->where('is_delete', 0)
                                         ->first();
                    if($aadhaarCheck)
                     {
                        return response()->json([
                            'code'    => (string)$this->failedStatus, 
                            'message' => 'Sorry,This aadhaar number already exists.',
                        ]);
                    }
                }    
                
               

          
                $arrayData = [
                                'voter_id'      => $request->voter_id ?? null, 
                                'aadhaar_card'  => $request->aadhaar_card ?? null,   
                                'name'          => $request->name ?? null,   
                                'gender'        => $request->gender ?? null,   
                                'dob'           => $request->dob ?? null,   
                                //'age'           => $request->age ?? null,   
                                'guardian_name' => $request->guardian_name ?? null,   
                                'relation'      => $request->relation ?? null,   
                                'mobile'        => $request->mobile ?? null,   
                                'email'         => $request->email ?? null,   
                                'is_profile_complete' => 1,   
                             ];  


                #Update
                $updateCustomer = $this->customer
                                       ->where('id',$request->user_id)
                                       ->update($arrayData);


                $arrayData2 = [
                                'state_id'         => $request->state_id ?? 0,   
                                'district_id'      => $request->district_id ?? 0,   
                                'tehsil_id'        => $request->tehsil_id ?? 0,   
                                'area'             => $request->area ?? null,   
                                'parliamentary_id' => $request->parliamentary_id ?? 0,   
                                'assembly_id'      => $request->assembly_id ?? 0,
                                'town_village_id'  => $request->town_village_id ?? 0,
                                'panchayat_ward_id'=> $request->panchayat_ward_id ?? 0,
                                'block_id'         => $request->block_id ?? 0,
                                'thana_id'         => $request->thana_id ?? 0,
                                'post_office_id'   => $request->post_office_id ?? 0,
                                'locality'         => $request->locality ?? null,   
                                'house_no'         => $request->house_no ?? null,   
                                'pincode'          => $request->pincode ?? null,   
                             ];
                #Update
                $this->customerAddress
                     ->where('customer_id',$request->user_id)
                     ->update($arrayData2);

                $customer = $this->customer->where('id',$request->user_id)->first();
                if($is_profile_complete == 0)
                {
                      #Notify customer for Order Successfully
                      $notifyCustomer = new NotifyCustomer();
                      # Set Title message
                      $title = 'Biaka Account Notification';
                      # Set Message
                      $message = 'Your profile has been successfully completed.';    
                        if($customer->device_type=='android')      
                        {
                          # Notify customer for android
                          $notifyCustomer->notify($customer, $title, $message, '', 'account-create');
                        }elseif($customer->device_type=='ios'){
                          # Notify customer for ios
                          $notifyCustomer->iOS($customer, $title, $message, '', 'account-create');
                        }  

                        #store notification
                        storeNotification('user','account-create',$title, $message, 0,$customer->id);    
                }       

               
                return response()->json([
                                        'code'    => (string)$this->successStatus, 
                                        'message' => 'User Updated Successfully',
                                    ]); 
                

          }catch(\Exception $e)
          {
            return response()->json([
                                    'code'    => (string)$this->failedStatus, 
                                    'message' => (string)$e,
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
                $user = $this->customer
                             ->where('email', $request->get('email'))
                             ->where('is_delete', 0)
                             ->get()
                             ->last();
        

                    # return response if user already exist on requested mobile
                    if($user != '') 
                    {
                        $otp = rand(1000,9999);
                        $user->update([
                                        'forgot_otp'    => $otp
                                      ]); 
                        
                        $data = [
                                    'user_id'          => (string)$user->id,
                                    'email'            => (string)$user->email,
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
     * @method to Forgot Password Verify OTP
     * 
     * @return Forgot Password Verify OTP
     */
    public function forgotVerifyOtp(Request $request)
    {
        # Validate request data
        $validator = Validator::make($request->all(), [ 
            'user_id'    => 'required',
            'otp'        => 'required',
        ]);

        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors()->first(),'code' => (string)$this->failedStatus]);            
        }

        try {

                # check user already Exist on that id
                $user = $this->customer
                             ->where('id', $request->get('user_id'))
                             ->where('is_delete', 0)
                             ->get()
                             ->last();
        

                    # return response if user already exist on requested mobile
                    if($user != '') 
                    {
                        if($user->forgot_otp == $request->otp)
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
            'user_id'      => 'required',
            'password'     => 'required',
        ]);

        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors()->first(),'code' => (string)$this->failedStatus]);            
        }

        try {

                # check user already Exist on that id
                $user = $this->customer
                             ->where('id', $request->get('user_id'))
                             ->where('is_delete', 0)
                             ->get()
                             ->last();
        

                    # return response if user already exist on requested mobile
                    if($user != '') 
                    {
                        $user->update([
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
            'user_id'  => 'required|numeric',
        ]);

        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors()->first(),'code' => (string)$this->failedStatus]);            
        }

        try {

                # check user already Exist on that id
                $user = $this->customer
                             ->where('id', $request->get('user_id'))
                             ->get()
                             ->last();
          
                # return response if user already exist on requested user id
                if($user != '') 
                {

                    # Update user 
                    $user->update(['is_delete'    => 1]);

                      $customer = $this->customer->where('id', $request->get('user_id'))->first();
                      #Notify customer for Order Successfully
                      $notifyCustomer = new NotifyCustomer();
                      # Set Title message
                      $title = 'Biaka Account Notification';
                      # Set Message
                      $message = 'Your profile has been deleted successfully.';    
                        if($customer->device_type=='android')      
                        {
                          # Notify customer for android
                          $notifyCustomer->notify($customer, $title, $message, '', 'account-delete');
                        }elseif($customer->device_type=='ios'){
                          # Notify customer for ios
                          $notifyCustomer->iOS($customer, $title, $message, '', 'account-delete');
                        } 

                        #store notification
                        storeNotification('user','account-delete',$title, $message, 0,$customer->id); 
                       
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
     * Survey List 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function survey(Request $request) 
    { 
        # Validate request data
        $validator = Validator::make($request->all(), [ 
            'user_id'     => 'required',
        ]);

        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors()->first(), 'code' => (string)$this->failedStatus]);            
        }

        try 
           {
                DB::beginTransaction();

                $now = \Carbon\Carbon::now();
                 //echo $now->weekOfYear;

                // if($now->weekOfYear < 10)
                //   {
                //     $weekOfYear = date('Y').'-W0'.$now->weekOfYear;  
                //   }else{
                //     $weekOfYear = date('Y').'-W'.$now->weekOfYear;
                //   }
                  $weekOfYear = date('Y').'-W'.$now->weekOfYear;  
                    # get surveyData
                    $surveyData =  SurveyQuestion::where('week_date',$weekOfYear)
                                       ->where('status',1)
                                       ->first();
                DB::commit();      
                        # return response if surveyData get
                        if($surveyData) 
                        {
                                $checkUserAttempt = $surveyData->userAttempt ? $surveyData->userAttempt->where('customer_id',$request->user_id)->count() : 0;
                                $data['id']         = (string)$surveyData->id ?? '';
                                $data['question']   = (string)$surveyData->question ?? '';
                                $data['is_attempt'] = (string)$checkUserAttempt ?? '0';
                                $optionArray = [];
                                foreach ($surveyData->answerData as $key => $answerData) 
                                {
                                   
                                   $data1['id']      = (string)$answerData->id ?? '';
                                   $data1['option']  = (string)$answerData->answer ?? '';
                                   $data1['ans_count']  = (string)count($answerData->votingData) ?? 0;
                                   # push in array
                                   array_push($optionArray, $data1);
                                }
                                $data['optionData'] = $optionArray;
                                
                                
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->successStatus, 
                                                        'message'   => 'Survey List',
                                                        'data'      =>  $data
                                                    ]);
                        }else{
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->failedStatus, 
                                                        'message'   => 'Survey Not Found!!',
                                                    ]); 
                        }
            } catch (Exception $e) {
            # return response
            return response()->json([
                                        'code'      => (string)$this->failedStatus, 
                                        'message'   => 'Something Went Worng',
                                   ]);
            }
    }

    
        /**
     * @method to Survey Store Profile
     * 
     * @return 
     */
    public function storeSurvey(Request $request)
    {
        # Validate request data
        $validator = Validator::make($request->all(), [ 
            'user_id'             => 'required',
            'survey_question_id'  => 'required',
            'survey_answer_id'    => 'required',
        ]);

        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors()->first(),'code' => (string)$this->failedStatus]);            
        }

        try {

                # check user already Exist on that id
                $checkDuplicate = SurveyVoting::where('customer_id', $request->get('user_id'))
                                              ->where('survey_question_id', $request->get('survey_question_id'))
                                              ->first();
                if($checkDuplicate)
                {
                     # return response
                    return response()->json([
                                                'code'      => (string)$this->failedStatus, 
                                                'message'   => 'Sorry you already attempt this question',
                                            ]);
                }
               

                    $arrayData = [
                                    'customer_id'         => $request->user_id ?? null, 
                                    'survey_question_id'  => $request->survey_question_id ?? null,   
                                    'survey_answer_id'    => $request->survey_answer_id ?? null,
                                 ];  


                    #store
                    $create = SurveyVoting::create($arrayData);
                       
                        # return response
                        return response()->json([
                                'code'      => (string)$this->successStatus, 
                                'message'   => 'Your voting save successfully.'
                             ]);
                      
               
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
            'user_id'  => 'required|numeric',
        ]);

        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors()->first(),'code' => (string)$this->failedStatus]);            
        }
        
        try 
           {
                $userNotificationArray = [];
                DB::beginTransaction();
                    # get userNotification
                    $userNotifications =  UserNotification::where('user_id',$request->user_id)
                                                          ->where('is_delete',0)
                                                          ->orderBy('id','desc')
                                                          ->get();
                DB::commit();      
                        # return response if userNotifications get
                        if($userNotifications->isNotEmpty()) 
                        {
                            foreach($userNotifications as $key => $userNotification) 
                            {
                                $data['id']           = (string)$userNotification->id ?? '';
                                $data['type']         = (string)$userNotification->type ?? '';
                                $data['title']        = (string)$userNotification->title ?? '';
                                $data['message']      = (string)$userNotification->message ?? '';
                                $data['is_read']      = (string)$userNotification->is_read ?? '';
                                $data['complaint_id'] = (string)$userNotification->complaint_id ?? '';
                                $data['created_at']   = (string)$userNotification->created_at ?? '';
                                # push in array
                                array_push($userNotificationArray, $data);
                            }
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->successStatus, 
                                                        'message'   => 'Notification List',
                                                        'data'      =>  $userNotificationArray
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
            'user_id'          => 'required',
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
                $userNotifications =  UserNotification::where('id',$request->notification_id)->first();
                $userNotifications->is_read = 1;
                $userNotifications->save();

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
                $userNotifications =  UserNotification::where('id',$request->notification_id)->first();
                $userNotifications->is_delete = 1;
                $userNotifications->save();

                # return response
                return response()->json([
                        'code'      => (string)$this->successStatus, 
                        'message'   => 'Notification delete successfully.'
                     ]);

            }


            if($request->type == 'alldelete')
            {
                UserNotification::where('user_id',$request->user_id)
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
