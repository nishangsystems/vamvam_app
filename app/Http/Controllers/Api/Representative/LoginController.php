<?php

namespace App\Http\Controllers\Api\Representative;

# Models
use App\Models\Executive;
use App\Models\ExecutiveAddress;
use App\Models\RepresentativeNotification;

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
use App\Http\Controllers\Api\Representative\NotifyRepresentative;

class LoginController extends Controller
{
    use StatusTrait;

    # Variable to Bind Model
    protected $executive;

    # bind executiveAddress Model
    protected $executiveAddress;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(
                                    Executive                $executive,
                                    ExecutiveAddress         $executiveAddress
                               )
                               {
                                    $this->executive         = $executive;
                                    $this->executiveAddress  = $executiveAddress;
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


            try{
                
                    # fetch executive from Database
                    $executive = $this->executive
                                      ->where('executive_unique_id', $request->username)
                                      ->where('is_delete', 0)
                                      ->get();
        
                       if($executive->isNotEmpty()) 
                       {
                            $executiveInfo = $executive->last();

                            $executiveId =$executiveInfo->id; 

                            
                             
                                $token = $this->generateToken();
                                $device_type = $request->device_type;
                                $device_token = $request->device_token;
                                # Update user token
                                $executiveInfo->update([
                                                        'api_token'    => $token,
                                                        'device_type'  => $device_type,
                                                        'device_token' => $device_token,
                                                        'name'         => $request->name,
                                                        'email'        => $request->email,
                                                        'mobile'       => $request->mobile,
                                                      ]);
                                
                                $executive = $this->executive->where('id', $executiveId)->first();

                                $data = [
                                            'executive_id'     => (string)$executive->id,
                                            'api_token'        => (string)$executive->api_token,
                                            'executive_unique_id'   => (string)$executive->executive_unique_id,
                                            'voter_id'         => (string)$executive->voter_id,
                                            'aadhaar_card'     => (string)$executive->aadhaar_card,
                                            'name'             => (string)$executive->name,
                                            'gender'           => (string)$executive->gender,
                                            'dob'              => (string)$executive->dob,
                                            'guardian_name'    => (string)$executive->guardian_name,
                                            'relation'         => (string)$executive->relation,
                                            'mobile'           => (string)$executive->mobile,
                                            'email'            => (string)$executive->email,
                                            'state_id'         => $executive->addressInfo ? (string)$executive->addressInfo->state_id : '',
                                            'state_name'       => $executive->addressInfo ? ($executive->addressInfo->state_id ? $executive->addressInfo->stateInfo->name : '' ) : '',
                                            'district_id'      => $executive->addressInfo ? (string)$executive->addressInfo->district_id : '',
                                            'district_name'    => $executive->addressInfo ? ($executive->addressInfo->district_id ? ($executive->addressInfo->districtInfo ? $executive->addressInfo->districtInfo->name : '') : '') : '',
                                            'tehsil_id'        => $executive->addressInfo ? (string)$executive->addressInfo->tehsil_id : '',
                                            'tehsil_name'    => $executive->addressInfo ? ($executive->addressInfo->tehsil_id ? ($executive->addressInfo->tehsilInfo ? $executive->addressInfo->tehsilInfo->name : '') : '') : '',
                                            
                                            'area'             => $executive->addressInfo ? (string)$executive->addressInfo->area : '',
                                            'parliamentary_id' => $executive->addressInfo ? (string)$executive->addressInfo->parliamentary_id : '',
                                            'parliamentary_name'    => $executive->addressInfo ? ($executive->addressInfo->parliamentary_id ? ($executive->addressInfo->parliamentaryInfo ? $executive->addressInfo->parliamentaryInfo->name : '') : '') : '',
                                            'assembly_id'      => $executive->addressInfo ? (string)$executive->addressInfo->assembly_id : '',
                                            'assembly_name'    => $executive->addressInfo ? ($executive->addressInfo->assembly_id ? ($executive->addressInfo->assemblyInfo ? $executive->addressInfo->assemblyInfo->name : '') : '') : '',
                                            
                                            'town_village_id'      => $executive->addressInfo ? (string)$executive->addressInfo->town_village_id : '',
                                            'town_village_name'    => $executive->addressInfo ? ($executive->addressInfo->town_village_id ? ($executive->addressInfo->townVillageInfo ? $executive->addressInfo->townVillageInfo->name : '') : '') : '',


                                            'panchayat_ward_id'         => $executive->addressInfo ? (string)$executive->addressInfo->panchayat_ward_id : '',
                                            'panchayat_ward_name'    => $executive->addressInfo ? ($executive->addressInfo->panchayat_ward_id ? ($executive->addressInfo->panchayatWardInfo ? $executive->addressInfo->panchayatWardInfo->name : '') : '') : '',

                                            'block_id'         => $executive->addressInfo ? (string)$executive->addressInfo->block_id : '',
                                            'block_name'    => $executive->addressInfo ? ($executive->addressInfo->block_id ? ($executive->addressInfo->blockInfo ? $executive->addressInfo->blockInfo->name : '') : '') : '',

                                            'thana_id'         => $executive->addressInfo ? (string)$executive->addressInfo->thana_id : '',
                                            'thana_name'    => $executive->addressInfo ? ($executive->addressInfo->thana_id ? ($executive->addressInfo->thanaInfo ? $executive->addressInfo->thanaInfo->name : '') : '') : '',

                                            'post_office_id'      => $executive->addressInfo ? (string)$executive->addressInfo->post_office_id : '',
                                            'post_office_name'    => $executive->addressInfo ? ($executive->addressInfo->post_office_id ? ($executive->addressInfo->postOfficeInfo ? $executive->addressInfo->postOfficeInfo->name : '') : '') : '',


                                            'locality'         => $executive->addressInfo ? (string)$executive->addressInfo->locality : '',
                                            'house_no'         => $executive->addressInfo ? (string)$executive->addressInfo->house_no : '',
                                            'land_mark'        => $executive->addressInfo ? (string)$executive->addressInfo->land_mark : '',
                                            'pincode'          => $executive->addressInfo ? (string)$executive->addressInfo->pincode : '',
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
                                            'executive_unique_id' => $request->username,  
                                            'name'                => $request->name ?? null,   
                                            'mobile'              => $request->mobile ?? null,   
                                            'email'               => $request->email ?? null,   
                                            'api_token'           => $token,
                                            'device_type'         => $request->device_type,
                                            'device_token'        => $request->device_token,   
                                         ];  

                            #store
                            $create = $this->executive::create($arrayData);

                            $arrayData2 = [
                                            'executive_id'     => $create->id, 
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
                                            'locality'         => $request->address ?? null,   
                                            'house_no'         => null,   
                                            'pincode'          => null,   
                                         ];             
                            #store
                            $this->executiveAddress::create($arrayData2);

                            $executive = $this->executive->where('id', $create->id)->first();

                                $data = [
                                            'executive_id'     => (string)$executive->id,
                                            'api_token'        => (string)$executive->api_token,
                                            'executive_unique_id'   => (string)$executive->executive_unique_id,
                                            'voter_id'         => (string)$executive->voter_id,
                                            'aadhaar_card'     => (string)$executive->aadhaar_card,
                                            'name'             => (string)$executive->name,
                                            'gender'           => (string)$executive->gender,
                                            'dob'              => (string)$executive->dob,
                                            'guardian_name'    => (string)$executive->guardian_name,
                                            'relation'         => (string)$executive->relation,
                                            'mobile'           => (string)$executive->mobile,
                                            'email'            => (string)$executive->email,
                                            'state_id'         => $executive->addressInfo ? (string)$executive->addressInfo->state_id : '',
                                            'state_name'       => $executive->addressInfo ? ($executive->addressInfo->state_id ? $executive->addressInfo->stateInfo->name : '' ) : '',
                                            'district_id'      => $executive->addressInfo ? (string)$executive->addressInfo->district_id : '',
                                            'district_name'    => $executive->addressInfo ? ($executive->addressInfo->district_id ? ($executive->addressInfo->districtInfo ? $executive->addressInfo->districtInfo->name : '') : '') : '',
                                            'tehsil_id'        => $executive->addressInfo ? (string)$executive->addressInfo->tehsil_id : '',
                                            'tehsil_name'    => $executive->addressInfo ? ($executive->addressInfo->tehsil_id ? ($executive->addressInfo->tehsilInfo ? $executive->addressInfo->tehsilInfo->name : '') : '') : '',
                                            
                                            'area'             => $executive->addressInfo ? (string)$executive->addressInfo->area : '',
                                            'parliamentary_id' => $executive->addressInfo ? (string)$executive->addressInfo->parliamentary_id : '',
                                            'parliamentary_name'    => $executive->addressInfo ? ($executive->addressInfo->parliamentary_id ? ($executive->addressInfo->parliamentaryInfo ? $executive->addressInfo->parliamentaryInfo->name : '') : '') : '',
                                            'assembly_id'      => $executive->addressInfo ? (string)$executive->addressInfo->assembly_id : '',
                                            'assembly_name'    => $executive->addressInfo ? ($executive->addressInfo->assembly_id ? ($executive->addressInfo->assemblyInfo ? $executive->addressInfo->assemblyInfo->name : '') : '') : '',
                                            
                                            'town_village_id'      => $executive->addressInfo ? (string)$executive->addressInfo->town_village_id : '',
                                            'town_village_name'    => $executive->addressInfo ? ($executive->addressInfo->town_village_id ? ($executive->addressInfo->townVillageInfo ? $executive->addressInfo->townVillageInfo->name : '') : '') : '',


                                            'panchayat_ward_id'         => $executive->addressInfo ? (string)$executive->addressInfo->panchayat_ward_id : '',
                                            'panchayat_ward_name'    => $executive->addressInfo ? ($executive->addressInfo->panchayat_ward_id ? ($executive->addressInfo->panchayatWardInfo ? $executive->addressInfo->panchayatWardInfo->name : '') : '') : '',

                                            'block_id'         => $executive->addressInfo ? (string)$executive->addressInfo->block_id : '',
                                            'block_name'    => $executive->addressInfo ? ($executive->addressInfo->block_id ? ($executive->addressInfo->blockInfo ? $executive->addressInfo->blockInfo->name : '') : '') : '',

                                            'thana_id'         => $executive->addressInfo ? (string)$executive->addressInfo->thana_id : '',
                                            'thana_name'    => $executive->addressInfo ? ($executive->addressInfo->thana_id ? ($executive->addressInfo->thanaInfo ? $executive->addressInfo->thanaInfo->name : '') : '') : '',

                                            'post_office_id'      => $executive->addressInfo ? (string)$executive->addressInfo->post_office_id : '',
                                            'post_office_name'    => $executive->addressInfo ? ($executive->addressInfo->post_office_id ? ($executive->addressInfo->postOfficeInfo ? $executive->addressInfo->postOfficeInfo->name : '') : '') : '',


                                            'locality'         => $executive->addressInfo ? (string)$executive->addressInfo->locality : '',
                                            'house_no'         => $executive->addressInfo ? (string)$executive->addressInfo->house_no : '',
                                            'land_mark'        => $executive->addressInfo ? (string)$executive->addressInfo->land_mark : '',
                                            'pincode'          => $executive->addressInfo ? (string)$executive->addressInfo->pincode : '',
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
                    $executive = $this->executive
                                 ->where('mobile', $request->mobile_email)
                                 ->where('is_delete', 0)
                                 ->get();
        
                       if($executive->isNotEmpty()) 
                       {
                            $executive = $executive->last();
                             
                            # Check active or not 
                            if($executive->status != '1')
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
                            $executive->update($data);

                            $data = [
                                        'executive_id'          => (string)$executive->id,
                                        'otp'              => (string)$otp,
                                        'executive_unique_id'   => (string)$executive->executive_unique_id,
                                        'voter_id'         => (string)$executive->voter_id,
                                        'aadhaar_card'     => (string)$executive->aadhaar_card,
                                        'name'             => (string)$executive->name,
                                        'gender'           => (string)$executive->gender,
                                        'dob'              => (string)$executive->dob,
                                        'guardian_name'    => (string)$executive->guardian_name,
                                        'relation'         => (string)$executive->relation,
                                        'mobile'           => (string)$executive->mobile,
                                        'email'            => (string)$executive->email,
                                        'state_id'         => $executive->addressInfo ? (string)$executive->addressInfo->state_id : '',
                                        'state_name'       => $executive->addressInfo ? ($executive->addressInfo->state_id ? $executive->addressInfo->stateInfo->name : '' ) : '',
                                        'district_id'      => $executive->addressInfo ? (string)$executive->addressInfo->district_id : '',
                                        'district_name'    => $executive->addressInfo ? ($executive->addressInfo->district_id ? ($executive->addressInfo->districtInfo ? $executive->addressInfo->districtInfo->name : '') : '') : '',
                                        'tehsil_id'        => $executive->addressInfo ? (string)$executive->addressInfo->tehsil_id : '',
                                        'tehsil_name'    => $executive->addressInfo ? ($executive->addressInfo->tehsil_id ? ($executive->addressInfo->tehsilInfo ? $executive->addressInfo->tehsilInfo->name : '') : '') : '',
                                        
                                        'area'             => $executive->addressInfo ? (string)$executive->addressInfo->area : '',
                                        'parliamentary_id' => $executive->addressInfo ? (string)$executive->addressInfo->parliamentary_id : '',
                                        'parliamentary_name'    => $executive->addressInfo ? ($executive->addressInfo->parliamentary_id ? ($executive->addressInfo->parliamentaryInfo ? $executive->addressInfo->parliamentaryInfo->name : '') : '') : '',
                                        'assembly_id'      => $executive->addressInfo ? (string)$executive->addressInfo->assembly_id : '',
                                        'assembly_name'    => $executive->addressInfo ? ($executive->addressInfo->assembly_id ? ($executive->addressInfo->assemblyInfo ? $executive->addressInfo->assemblyInfo->name : '') : '') : '',
                                        
                                        'town_village_id'      => $executive->addressInfo ? (string)$executive->addressInfo->town_village_id : '',
                                        'town_village_name'    => $executive->addressInfo ? ($executive->addressInfo->town_village_id ? ($executive->addressInfo->townVillageInfo ? $executive->addressInfo->townVillageInfo->name : '') : '') : '',


                                        'panchayat_ward_id'         => $executive->addressInfo ? (string)$executive->addressInfo->panchayat_ward_id : '',
                                        'panchayat_ward_name'    => $executive->addressInfo ? ($executive->addressInfo->panchayat_ward_id ? ($executive->addressInfo->panchayatWardInfo ? $executive->addressInfo->panchayatWardInfo->name : '') : '') : '',

                                        'block_id'         => $executive->addressInfo ? (string)$executive->addressInfo->block_id : '',
                                        'block_name'    => $executive->addressInfo ? ($executive->addressInfo->block_id ? ($executive->addressInfo->blockInfo ? $executive->addressInfo->blockInfo->name : '') : '') : '',

                                        'thana_id'         => $executive->addressInfo ? (string)$executive->addressInfo->thana_id : '',
                                        'thana_name'    => $executive->addressInfo ? ($executive->addressInfo->thana_id ? ($executive->addressInfo->thanaInfo ? $executive->addressInfo->thanaInfo->name : '') : '') : '',

                                        'post_office_id'      => $executive->addressInfo ? (string)$executive->addressInfo->post_office_id : '',
                                        'post_office_name'    => $executive->addressInfo ? ($executive->addressInfo->post_office_id ? ($executive->addressInfo->postOfficeInfo ? $executive->addressInfo->postOfficeInfo->name : '') : '') : '',


                                        'locality'         => $executive->addressInfo ? (string)$executive->addressInfo->locality : '',
                                        'house_no'         => $executive->addressInfo ? (string)$executive->addressInfo->house_no : '',
                                        'land_mark'        => $executive->addressInfo ? (string)$executive->addressInfo->land_mark : '',
                                        'pincode'          => $executive->addressInfo ? (string)$executive->addressInfo->pincode : '',
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
                    $executive = $this->executive
                                 ->where('email', $request->mobile_email)
                                 ->where('is_delete', 0)
                                 ->get();
        
                       if($executive->isNotEmpty()) 
                       {
                            $executive = $executive->last();
                             
                            # Check password 
                            if(Hash::check($request->get('password'), $executive->password))     
                            {

                                # Check active or not 
                                if($executive->status != '1')
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
                                $executive->update([
                                                'api_token'    => $token,
                                                'device_type'  => $device_type,
                                                'device_token' => $device_token
                                              ]);


                                $data = [
                                        'executive_id'          => (string)$executive->id,
                                        'api_token'        => (string)$executive->api_token,
                                        'executive_unique_id'   => (string)$executive->executive_unique_id,
                                        'voter_id'         => (string)$executive->voter_id,
                                        'aadhaar_card'     => (string)$executive->aadhaar_card,
                                        'name'             => (string)$executive->name,
                                        'gender'           => (string)$executive->gender,
                                        'dob'              => (string)$executive->dob,
                                        'guardian_name'    => (string)$executive->guardian_name,
                                        'relation'         => (string)$executive->relation,
                                        'mobile'           => (string)$executive->mobile,
                                        'email'            => (string)$executive->email,
                                        'state_id'         => $executive->addressInfo ? (string)$executive->addressInfo->state_id : '',
                                        'state_name'       => $executive->addressInfo ? ($executive->addressInfo->state_id ? $executive->addressInfo->stateInfo->name : '' ) : '',
                                        'district_id'      => $executive->addressInfo ? (string)$executive->addressInfo->district_id : '',
                                        'district_name'    => $executive->addressInfo ? ($executive->addressInfo->district_id ? ($executive->addressInfo->districtInfo ? $executive->addressInfo->districtInfo->name : '') : '') : '',
                                        'tehsil_id'        => $executive->addressInfo ? (string)$executive->addressInfo->tehsil_id : '',
                                        'tehsil_name'    => $executive->addressInfo ? ($executive->addressInfo->tehsil_id ? ($executive->addressInfo->tehsilInfo ? $executive->addressInfo->tehsilInfo->name : '') : '') : '',
                                        
                                        'area'             => $executive->addressInfo ? (string)$executive->addressInfo->area : '',
                                        'parliamentary_id' => $executive->addressInfo ? (string)$executive->addressInfo->parliamentary_id : '',
                                        'parliamentary_name'    => $executive->addressInfo ? ($executive->addressInfo->parliamentary_id ? ($executive->addressInfo->parliamentaryInfo ? $executive->addressInfo->parliamentaryInfo->name : '') : '') : '',
                                        'assembly_id'      => $executive->addressInfo ? (string)$executive->addressInfo->assembly_id : '',
                                        'assembly_name'    => $executive->addressInfo ? ($executive->addressInfo->assembly_id ? ($executive->addressInfo->assemblyInfo ? $executive->addressInfo->assemblyInfo->name : '') : '') : '',
                                        'town_village_id'      => $executive->addressInfo ? (string)$executive->addressInfo->town_village_id : '',
                                        'town_village_name'    => $executive->addressInfo ? ($executive->addressInfo->town_village_id ? ($executive->addressInfo->townVillageInfo ? $executive->addressInfo->townVillageInfo->name : '') : '') : '',


                                        'panchayat_ward_id'         => $executive->addressInfo ? (string)$executive->addressInfo->panchayat_ward_id : '',
                                        'panchayat_ward_name'    => $executive->addressInfo ? ($executive->addressInfo->panchayat_ward_id ? ($executive->addressInfo->panchayatWardInfo ? $executive->addressInfo->panchayatWardInfo->name : '') : '') : '',

                                        'block_id'         => $executive->addressInfo ? (string)$executive->addressInfo->block_id : '',
                                        'block_name'    => $executive->addressInfo ? ($executive->addressInfo->block_id ? ($executive->addressInfo->blockInfo ? $executive->addressInfo->blockInfo->name : '') : '') : '',

                                        'thana_id'         => $executive->addressInfo ? (string)$executive->addressInfo->thana_id : '',
                                        'thana_name'    => $executive->addressInfo ? ($executive->addressInfo->thana_id ? ($executive->addressInfo->thanaInfo ? $executive->addressInfo->thanaInfo->name : '') : '') : '',

                                        'post_office_id'      => $executive->addressInfo ? (string)$executive->addressInfo->post_office_id : '',
                                        'post_office_name'    => $executive->addressInfo ? ($executive->addressInfo->post_office_id ? ($executive->addressInfo->postOfficeInfo ? $executive->addressInfo->postOfficeInfo->name : '') : '') : '',
                                        'locality'         => $executive->addressInfo ? (string)$executive->addressInfo->locality : '',
                                        'house_no'         => $executive->addressInfo ? (string)$executive->addressInfo->house_no : '',
                                        'land_mark'        => $executive->addressInfo ? (string)$executive->addressInfo->land_mark : '',
                                        'pincode'          => $executive->addressInfo ? (string)$executive->addressInfo->pincode : '',
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
            'executive_id'  => 'required|numeric',
            'otp'      => 'required|string',
        ]);

        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors()->first(),'code' => (string)$this->failedStatus]);            
        }

        try {

                # check user already Exist on that id
                $executive = $this->executive
                             ->where('id', $request->get('executive_id'))
                             ->where('is_delete', 0)
                             ->get()
                             ->last();
        

                    # return response if user already exist on requested mobile
                    if($executive != '') 
                    {
                            if($executive->otp == $request->get('otp')) 
                            {
                                $token = $this->generateToken();
                                $device_type = $request->device_type;
                                $device_token = $request->device_token;
                                # Update user token
                                $executive->update([
                                                'api_token'    => $token,
                                                'device_type'  => $device_type,
                                                'device_token' => $device_token
                                              ]);

                                # Set the Data
                                $data = [
                                        'executive_id'          => (string)$executive->id,
                                        'executive_unique_id'   => (string)$executive->executive_unique_id,
                                        'api_token'        =>  (string)$token ?? '',
                                        'voter_id'         => (string)$executive->voter_id,
                                        'aadhaar_card'     => (string)$executive->aadhaar_card,
                                        'name'             => (string)$executive->name,
                                        'gender'           => (string)$executive->gender,
                                        'dob'              => (string)$executive->dob,
                                        'guardian_name'    => (string)$executive->guardian_name,
                                        'relation'         => (string)$executive->relation,
                                        'mobile'           => (string)$executive->mobile,
                                        'email'            => (string)$executive->email,
                                        'state_id'         => $executive->addressInfo ? (string)$executive->addressInfo->state_id : '',
                                        'state_name'       => $executive->addressInfo ? ($executive->addressInfo->state_id ? $executive->addressInfo->stateInfo->name : '' ) : '',
                                        'district_id'      => $executive->addressInfo ? (string)$executive->addressInfo->district_id : '',
                                        'district_name'    => $executive->addressInfo ? ($executive->addressInfo->district_id ? ($executive->addressInfo->districtInfo ? $executive->addressInfo->districtInfo->name : '') : '') : '',
                                        'tehsil_id'        => $executive->addressInfo ? (string)$executive->addressInfo->tehsil_id : '',
                                        'tehsil_name'    => $executive->addressInfo ? ($executive->addressInfo->tehsil_id ? ($executive->addressInfo->tehsilInfo ? $executive->addressInfo->tehsilInfo->name : '') : '') : '',
                                        
                                        'area'             => $executive->addressInfo ? (string)$executive->addressInfo->area : '',
                                        'parliamentary_id' => $executive->addressInfo ? (string)$executive->addressInfo->parliamentary_id : '',
                                        'parliamentary_name'    => $executive->addressInfo ? ($executive->addressInfo->parliamentary_id ? ($executive->addressInfo->parliamentaryInfo ? $executive->addressInfo->parliamentaryInfo->name : '') : '') : '',
                                        'assembly_id'      => $executive->addressInfo ? (string)$executive->addressInfo->assembly_id : '',
                                        'assembly_name'    => $executive->addressInfo ? ($executive->addressInfo->assembly_id ? ($executive->addressInfo->assemblyInfo ? $executive->addressInfo->assemblyInfo->name : '') : '') : '',
                                       'town_village_id'      => $executive->addressInfo ? (string)$executive->addressInfo->town_village_id : '',
                                        'town_village_name'    => $executive->addressInfo ? ($executive->addressInfo->town_village_id ? ($executive->addressInfo->townVillageInfo ? $executive->addressInfo->townVillageInfo->name : '') : '') : '',


                                        'panchayat_ward_id'         => $executive->addressInfo ? (string)$executive->addressInfo->panchayat_ward_id : '',
                                        'panchayat_ward_name'    => $executive->addressInfo ? ($executive->addressInfo->panchayat_ward_id ? ($executive->addressInfo->panchayatWardInfo ? $executive->addressInfo->panchayatWardInfo->name : '') : '') : '',

                                        'block_id'         => $executive->addressInfo ? (string)$executive->addressInfo->block_id : '',
                                        'block_name'    => $executive->addressInfo ? ($executive->addressInfo->block_id ? ($executive->addressInfo->blockInfo ? $executive->addressInfo->blockInfo->name : '') : '') : '',

                                        'thana_id'         => $executive->addressInfo ? (string)$executive->addressInfo->thana_id : '',
                                        'thana_name'    => $executive->addressInfo ? ($executive->addressInfo->thana_id ? ($executive->addressInfo->thanaInfo ? $executive->addressInfo->thanaInfo->name : '') : '') : '',

                                        'post_office_id'      => $executive->addressInfo ? (string)$executive->addressInfo->post_office_id : '',
                                        'post_office_name'    => $executive->addressInfo ? ($executive->addressInfo->post_office_id ? ($executive->addressInfo->postOfficeInfo ? $executive->addressInfo->postOfficeInfo->name : '') : '') : '',
                                        'locality'         => $executive->addressInfo ? (string)$executive->addressInfo->locality : '',
                                        'house_no'         => $executive->addressInfo ? (string)$executive->addressInfo->house_no : '',
                                        'land_mark'        => $executive->addressInfo ? (string)$executive->addressInfo->land_mark : '',
                                        'pincode'          => $executive->addressInfo ? (string)$executive->addressInfo->pincode : '',
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
            'executive_id'  => 'required|numeric',
        ]);

        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors()->first(),'code' => (string)$this->failedStatus]);            
        }

        try {

        # check user already Exist on that id
        $executive = $this->executive
                     ->where('id', $request->get('executive_id'))
                     ->where('is_delete', 0)
                     ->get()
                     ->last();
      
        # return response if user already exist on requested user id
        if($executive != '') 
        {
            # Set the Data
            $data = [
                        'executive_id'          => (string)$executive->id,
                        'executive_unique_id'   => (string)$executive->executive_unique_id,
                        'api_token'        =>  (string)$executive->api_token ?? '',
                        'voter_id'         => (string)$executive->voter_id,
                        'aadhaar_card'     => (string)$executive->aadhaar_card,
                        'name'             => (string)$executive->name,
                        'gender'           => (string)$executive->gender,
                        'dob'              => (string)$executive->dob,
                        'guardian_name'    => (string)$executive->guardian_name,
                        'relation'         => (string)$executive->relation,
                        'mobile'           => (string)$executive->mobile,
                        'email'            => (string)$executive->email,
                        'state_id'         => $executive->addressInfo ? (string)$executive->addressInfo->state_id : '',
                        'state_name'       => $executive->addressInfo ? ($executive->addressInfo->state_id ? $executive->addressInfo->stateInfo->name : '' ) : '',
                        'district_id'      => $executive->addressInfo ? (string)$executive->addressInfo->district_id : '',
                        'district_name'    => $executive->addressInfo ? ($executive->addressInfo->district_id ? ($executive->addressInfo->districtInfo ? $executive->addressInfo->districtInfo->name : '') : '') : '',
                        'tehsil_id'        => $executive->addressInfo ? (string)$executive->addressInfo->tehsil_id : '',
                        'tehsil_name'    => $executive->addressInfo ? ($executive->addressInfo->tehsil_id ? ($executive->addressInfo->tehsilInfo ? $executive->addressInfo->tehsilInfo->name : '') : '') : '',
                        
                        'area'             => $executive->addressInfo ? (string)$executive->addressInfo->area : '',
                        'parliamentary_id' => $executive->addressInfo ? (string)$executive->addressInfo->parliamentary_id : '',
                        'parliamentary_name'    => $executive->addressInfo ? ($executive->addressInfo->parliamentary_id ? ($executive->addressInfo->parliamentaryInfo ? $executive->addressInfo->parliamentaryInfo->name : '') : '') : '',
                        'assembly_id'      => $executive->addressInfo ? (string)$executive->addressInfo->assembly_id : '',
                        'assembly_name'    => $executive->addressInfo ? ($executive->addressInfo->assembly_id ? ($executive->addressInfo->assemblyInfo ? $executive->addressInfo->assemblyInfo->name : '') : '') : '',
                        'town_village_id'      => $executive->addressInfo ? (string)$executive->addressInfo->town_village_id : '',
                                        'town_village_name'    => $executive->addressInfo ? ($executive->addressInfo->town_village_id ? ($executive->addressInfo->townVillageInfo ? $executive->addressInfo->townVillageInfo->name : '') : '') : '',


                                        'panchayat_ward_id'         => $executive->addressInfo ? (string)$executive->addressInfo->panchayat_ward_id : '',
                                        'panchayat_ward_name'    => $executive->addressInfo ? ($executive->addressInfo->panchayat_ward_id ? ($executive->addressInfo->panchayatWardInfo ? $executive->addressInfo->panchayatWardInfo->name : '') : '') : '',

                                        'block_id'         => $executive->addressInfo ? (string)$executive->addressInfo->block_id : '',
                                        'block_name'    => $executive->addressInfo ? ($executive->addressInfo->block_id ? ($executive->addressInfo->blockInfo ? $executive->addressInfo->blockInfo->name : '') : '') : '',

                                        'thana_id'         => $executive->addressInfo ? (string)$executive->addressInfo->thana_id : '',
                                        'thana_name'    => $executive->addressInfo ? ($executive->addressInfo->thana_id ? ($executive->addressInfo->thanaInfo ? $executive->addressInfo->thanaInfo->name : '') : '') : '',

                                        'post_office_id'      => $executive->addressInfo ? (string)$executive->addressInfo->post_office_id : '',
                                        'post_office_name'    => $executive->addressInfo ? ($executive->addressInfo->post_office_id ? ($executive->addressInfo->postOfficeInfo ? $executive->addressInfo->postOfficeInfo->name : '') : '') : '',
                        'locality'         => $executive->addressInfo ? (string)$executive->addressInfo->locality : '',
                        'house_no'         => $executive->addressInfo ? (string)$executive->addressInfo->house_no : '',
                        'land_mark'        => $executive->addressInfo ? (string)$executive->addressInfo->land_mark : '',
                        'pincode'          => $executive->addressInfo ? (string)$executive->addressInfo->pincode : '',
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
                $executive = $this->executive
                             ->where('email', $request->get('email'))
                             ->where('is_delete', 0)
                             ->get()
                             ->last();
        

                    # return response if user already exist on requested mobile
                    if($executive != '') 
                    {
                        $otp = rand(1000,9999);
                        $executive->update([
                                        'forgot_otp'    => $otp
                                      ]); 
                        
                        $data = [
                                    'executive_id'          => (string)$executive->id,
                                    'email'            => (string)$executive->email,
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
            'executive_id'    => 'required',
            'otp'        => 'required',
        ]);

        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors()->first(),'code' => (string)$this->failedStatus]);            
        }

        try {

                # check user already Exist on that id
                $executive = $this->executive
                             ->where('id', $request->get('executive_id'))
                             ->where('is_delete', 0)
                             ->get()
                             ->last();
        

                    # return response if user already exist on requested mobile
                    if($executive != '') 
                    {
                        if($executive->forgot_otp == $request->otp)
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
            'executive_id'      => 'required',
            'password'     => 'required',
        ]);

        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors()->first(),'code' => (string)$this->failedStatus]);            
        }

        try {

                # check user already Exist on that id
                $executive = $this->executive
                             ->where('id', $request->get('executive_id'))
                             ->where('is_delete', 0)
                             ->get()
                             ->last();
        

                    # return response if user already exist on requested mobile
                    if($executive != '') 
                    {
                        $executive->update([
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
            'executive_id'  => 'required|numeric',
        ]);

        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors()->first(),'code' => (string)$this->failedStatus]);            
        }

        try {

                # check user already Exist on that id
                $executive = $this->executive
                             ->where('id', $request->get('executive_id'))
                             ->get()
                             ->last();
          
                # return response if user already exist on requested user id
                if($executive != '') 
                {

                    # Update user 
                    $executive->update(['is_delete'    => 1]);
                       
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
            'executive_id'  => 'required|numeric',
        ]);

        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors()->first(),'code' => (string)$this->failedStatus]);            
        }
        
        try 
           {
                $representativeNotificationArray = [];
                DB::beginTransaction();
                    # get representativeNotification
                    $representativeNotifications =  RepresentativeNotification::where('executive_id',$request->executive_id)
                                                                              ->where('is_delete',0)
                                                                              ->orderBy('id','desc')
                                                                              ->get();
                DB::commit();      
                        # return response if representativeNotifications get
                        if($representativeNotifications->isNotEmpty()) 
                        {
                            foreach($representativeNotifications as $key => $representativeNotification) 
                            {
                                $data['id']           = (string)$representativeNotification->id ?? '';
                                $data['type']         = (string)$representativeNotification->type ?? '';
                                $data['title']        = (string)$representativeNotification->title ?? '';
                                $data['message']      = (string)$representativeNotification->message ?? '';
                                $data['is_read']      = (string)$representativeNotification->is_read ?? '';
                                $data['complaint_id'] = (string)$representativeNotification->complaint_id ?? '';
                                $data['created_at']   = (string)$representativeNotification->created_at ?? '';
                                # push in array
                                array_push($representativeNotificationArray, $data);
                            }
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->successStatus, 
                                                        'message'   => 'Notification List',
                                                        'data'      =>  $representativeNotificationArray
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
            'executive_id'     => 'required',
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
                $representativeNotification =  RepresentativeNotification::where('id',$request->notification_id)->first();
                $representativeNotification->is_read = 1;
                $representativeNotification->save();

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
                $representativeNotification =  RepresentativeNotification::where('id',$request->notification_id)->first();
                $representativeNotification->is_delete = 1;
                $representativeNotification->save();

                # return response
                return response()->json([
                        'code'      => (string)$this->successStatus, 
                        'message'   => 'Notification delete successfully.'
                     ]);

            }


            if($request->type == 'alldelete')
            {
                RepresentativeNotification::where('executive_id',$request->executive_id)
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
