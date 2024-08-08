<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use File;
use Hash;
use Validator;
use App\Models\Customer;
use App\Models\CustomerAddress;
use App\Models\State;
use App\Models\District;
use App\Models\Tehsil;
use App\Models\PanchayatWard;
use App\Models\TownVillage;
use App\Models\Block;
use App\Models\Thana;
use App\Models\PostOffice;
use App\Models\AssemblyConstituency;
use App\Models\ParliamentaryConstituency;
use App\Models\Complaint;
use App\Models\Department;
use App\Models\IssueType;
use App\Http\Traits\MessageStatusTrait;

class UserController extends Controller
{
    use MessageStatusTrait;

    # Bind Type
    protected $type = 'User ';

    # Bind location
    protected $view = 'admin.user.';

    # Bind customer
    protected $customer;   
    protected $customerAddress;
    protected $tehsil;
    protected $state;
    protected $district;
    protected $assemblyConstituency;
    protected $parliamentaryConstituency;
    protected $complaint;
    protected $department;
    protected $issueType;

    /**
     * default constructor
     * @param
     * @return
     */
    function __construct(
                            State                         $state,
                            Tehsil                        $tehsil,
                            District                      $district,
                            Customer                      $customer,
                            Complaint                     $complaint,
                            Department                    $department,
                            IssueType                     $issueType,
                            CustomerAddress               $customerAddress,
                            AssemblyConstituency          $assemblyConstituency,
                            ParliamentaryConstituency     $parliamentaryConstituency,
                        )
                        {
                            $this->state                     = $state;
                            $this->tehsil                    = $tehsil;
                            $this->district                  = $district;
                            $this->customer                  = $customer;
                            $this->complaint                  = $complaint;
                            $this->department                = $department;
                            $this->issueType                 = $issueType;
                            $this->customerAddress           = $customerAddress;
                            $this->assemblyConstituency      = $assemblyConstituency;
                            $this->parliamentaryConstituency = $parliamentaryConstituency;
                            
                        }
   
    
    public function index()
    {
        $lists = $this->customer
                      ->where('is_delete', 0)
                      ->orderBy('id','desc')
                      ->get();
        # return to index page
        return view($this->view .'index')->with(['lists' =>$lists]);
    }

    public function create()
    {
        $states = State::get();
        # return to create page
        return view($this->view .'create')->with([
                                                   'states'   => $states ?? [],
                                                 ]);
    }


    public function store(Request $request)
    {

        $rules = [ 
                   'name'          =>'required',
                   'gender'        =>'required',
                   'dob'           =>'required',
                   'mobile'        =>'required|digits:10',
                 ];

        $validator = Validator::make($request->all(), $rules);
        if($validator->fails()){
            return response()->json([
                        (string)$this->responseCode=>(string)$this->errorStatus, 
                        (string)$this->responseMessage => (string)$validator->messages()->first()
                    ]);
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
                            (string)$this->responseCode    => (string)$this->errorStatus, 
                            (string)$this->responseMessage => 'Sorry,This email already exists.',
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
                        (string)$this->responseCode    => (string)$this->errorStatus, 
                        (string)$this->responseMessage => 'Sorry,This mobile already exists.',
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
                            (string)$this->responseCode    => (string)$this->errorStatus, 
                            (string)$this->responseMessage => 'Sorry,This voder id already exists.',
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
                            (string)$this->responseCode    => (string)$this->errorStatus, 
                            (string)$this->responseMessage => 'Sorry,This aadhaar number already exists.',
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
                                'age'           => $request->age ?? null,   
                                'guardian_name' => $request->guardian_name ?? null,   
                                'relation'      => $request->relation ?? null,   
                                'show_password' => $request->mobile,   
                                'password'      => Hash::make($request->mobile),   
                                'mobile'        => $request->mobile ?? null,   
                                'email'         => $request->email ?? null,   
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
                                        (string)$this->responseCode    => (string)$this->successStatus, 
                                        (string)$this->responseMessage => 'User Added Successfully',
                                        'responseUrl' => url('admin/user')
                                    ]); 
                

          }catch(\Exception $e)
          {
            return response()->json([
                                    (string)$this->responseCode    => (string)$this->errorStatus, 
                                    (string)$this->responseMessage => (string)$e,
                                ]);
          }
       
    }
    
    public function edit($id)
    {
        # Fetch  by id
        $customer = $this->customer
                         ->where('id', base64_decode($id))
                         ->with('addressInfo')
                         ->first();
        $states = $this->state
                       ->get();
        $districts = $this->district
                          ->where('state_id',$customer->addressInfo->state_id)
                          ->where('status',1)
                          ->get();
        $parliamentaries = $this->parliamentaryConstituency
                                ->where('state_id',$customer->addressInfo->state_id)
                                ->where('status',1)
                                ->get();
        $assemblies = $this->assemblyConstituency
                           ->where('district_id',$customer->addressInfo->district_id)
                           ->where('status',1)
                           ->get();
        $tehsils = $this->tehsil
                        ->where('district_id',$customer->addressInfo->district_id)
                        ->where('status',1)
                        ->get();
        
        # fetch townVillage 
        $townVillage = TownVillage::where('tehsil_id',$customer->addressInfo->tehsil_id)
                                  ->select('id', 'name')
                                  ->where('status',1)
                                  ->get();
        # fetch PanchayatWard 
        $panchayatWard = PanchayatWard::where('tehsil_id',$customer->addressInfo->tehsil_id)
                                      ->select('id', 'name')
                                      ->where('status',1)
                                      ->get();
        # fetch block 
        $block = Block::where('tehsil_id',$customer->addressInfo->tehsil_id)
                      ->select('id', 'name')
                      ->where('status',1)
                      ->get();

        # fetch thana 
        $thana = Thana::where('tehsil_id',$customer->addressInfo->tehsil_id)
                      ->select('id', 'name')
                      ->where('status',1)
                      ->get();

        # fetch thana 
        $postOffice = PostOffice::where('tehsil_id',$customer->addressInfo->tehsil_id)
                                ->select('id', 'name')
                                ->where('status',1)
                                ->get();
                   
       

        return view($this->view . 'edit')->with([
                                                   'user'            => $customer,
                                                   'states'          => $states ?? [],
                                                   'districts'       => $districts ?? [],
                                                   'tehsils'         => $tehsils ?? [],
                                                   'assemblies'      => $assemblies ?? [],
                                                   'parliamentaries' => $parliamentaries ?? [],
                                                   'townVillages'    => $townVillage ?? [],
                                                   'panchayatWards'  => $panchayatWard ?? [],
                                                   'blocks'          => $block ?? [],
                                                   'thanas'          => $thana ?? [],
                                                   'postOffices'     => $postOffice ?? [],
                                                ]);
    }





    public function update(Request $request)
    {

         $rules = [ 
                   'name'          =>'required',
                   'gender'        =>'required',
                   'dob'           =>'required',
                   'mobile'        =>'required|digits:10',
                 ];
        $validator = Validator::make($request->all(), $rules);
        if($validator->fails()){
            return response()->json([
                        (string)$this->responseCode=>(string)$this->errorStatus, 
                        (string)$this->responseMessage => (string)$validator->messages()->first()
                    ]);
        }
           
        try {


                if($request->email != '')
                {
                     $emailCheck = $this->customer
                                       ->where('email', $request->email)
                                       ->where('id','!=',base64_decode($request->id))
                                       ->where('is_delete', 0)
                                       ->first();
                     if($emailCheck)
                     {
                        return response()->json([
                            (string)$this->responseCode    => (string)$this->errorStatus, 
                            (string)$this->responseMessage => 'Sorry,This email already exists.',
                        ]);
                     }  
                }


                $mobileCheck = $this->customer
                                    ->where('mobile', $request->mobile)
                                    ->where('id','!=',base64_decode($request->id))
                                    ->where('is_delete', 0)
                                    ->first();
                if($mobileCheck)
                 {
                    return response()->json([
                        (string)$this->responseCode    => (string)$this->errorStatus, 
                        (string)$this->responseMessage => 'Sorry,This mobile already exists.',
                    ]);
                }

                if($request->voter_id != '')
                {
                   $voterCheck = $this->customer
                                   ->where('voter_id', $request->voter_id)
                                   ->where('id','!=',base64_decode($request->id))
                                   ->where('is_delete', 0)
                                   ->first();
                    if($voterCheck)
                     {
                        return response()->json([
                            (string)$this->responseCode    => (string)$this->errorStatus, 
                            (string)$this->responseMessage => 'Sorry,This voder id already exists.',
                        ]);
                    }
                }
                

                
                if($request->aadhaar_card != '')
                {
                   $aadhaarCheck = $this->customer
                                     ->where('aadhaar_card', $request->aadhaar_card)
                                     ->where('id','!=',base64_decode($request->id))
                                     ->where('is_delete', 0)
                                     ->first();
                    if($aadhaarCheck)
                     {
                        return response()->json([
                            (string)$this->responseCode    => (string)$this->errorStatus, 
                            (string)$this->responseMessage => 'Sorry,This aadhaar number already exists.',
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
                                'age'           => $request->age ?? null,   
                                'guardian_name' => $request->guardian_name ?? null,   
                                'relation'      => $request->relation ?? null,   
                                'mobile'        => $request->mobile ?? null, 
                                'show_password' => $request->mobile,   
                                'password'      => Hash::make($request->mobile),  
                                'email'         => $request->email ?? null,   
                             ];  


                #update
                $this->customer
                     ->whereId(base64_decode($request->id))
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
                #update
                $this->customerAddress
                     ->where('customer_id',base64_decode($request->id))
                     ->update($arrayData2);;


               
                return response()->json([
                        (string)$this->responseCode =>(string)$this->successStatus, 
                        (string)$this->responseMessage => 'User Updated Successfully!',
                        'responseUrl' => url('admin/user')
                    ]);                
               
            } catch (Exception $e) {
                return response()->json([
                                            (string)$this->responseCode =>(string)$this->errorStatus, 
                                            (string)$this->responseMessage => 'Something went wrong.'
                                        ]);  
            }
    }


    


    public function status(Request $request,$id)
    {
        # get the status
        $status = Customer::where('id', base64_decode($id))->first()->status;
        # check status, if active
        if ($status == '1')
        {
            #message
            $message = $this->inActiveMessage($this->type);
            # deactive( update status to zero)
            $statusCode = '0';
        }
        else
        {
            #message
            $message = $this->activeMessage($this->type);
            # active( update status to one)
            $statusCode = '1';
        }
        # update status code
        Customer::where('id', base64_decode($id))->update(['status' => $statusCode]);

        # return success
        return [$this->successKey => $this->successStatus, $this->messageKey => $message];
    }



    public function complaint($id)
    {
        # Fetch  by id
        $lists = $this->complaint
                      ->where('customer_id', base64_decode($id))
                      ->get();

        return view($this->view . 'complaint.index')->with([
                                                   'id'              => $id ?? '',
                                                   'lists'           => $lists ?? [],
                                                ]);
    }



    public function complaintCreate($id)
    {
        $customer = Customer::where('id',base64_decode($id))->first();
        $departments = Department::where('status',1)->get();
        $issueTypes = IssueType::where('status',1)->get();
        # return to create page
        
        return view($this->view .'complaint.create')->with([
                                                   'departments'   => $departments ?? [],
                                                   'issueTypes'   => $issueTypes ?? [],
                                                   'id'   => $id ?? '',
                                                   'user'   => $customer ?? '',
                                                 ]);
    }


    public function complaintStore(Request $request)
    {

        $rules = [ 
                   'customer_id'      =>'required',
                   'department_id'    =>'required',
                   'issue_type_id'    =>'required',
                   'message'          =>'required',
                 ];

        $validator = Validator::make($request->all(), $rules);
        if($validator->fails()){
            return response()->json([
                        (string)$this->responseCode=>(string)$this->errorStatus, 
                        (string)$this->responseMessage => (string)$validator->messages()->first()
                    ]);
        }


          try{

                
                # upload complaint_file
                if ($request->hasfile('complaint_file'))
                {
                    $file        = $request->file('complaint_file');
                    $fullName    = $file->getClientOriginalName();
                    $extension   = $file->getClientOriginalExtension();
                    $filename    = ((string)(microtime(true)*10000)).'.'.$extension;
                    $file->move(public_path('images/complaint/'), $filename);
                    $complaint_file = 'images/complaint/'.$filename;
                }else{
                    $complaint_file = null;
                    $extension = null;
                }
          
                $arrayData = [
                                'customer_id'      => base64_decode($request->customer_id) ?? null, 
                                'department_id'    => $request->department_id ?? null,   
                                'issue_type_id'    => $request->issue_type_id ?? null,   
                                'message'         => $request->message ?? null, 
                                'complaint_file'    => $complaint_file, 
                                'complaint_file_type'=> $extension, 
                                'complaint_date'    => date('Y-m-d'), 
                             ];  


                #store
                $create = $this->complaint::create($arrayData);


               
                return response()->json([
                                        (string)$this->responseCode    => (string)$this->successStatus, 
                                        (string)$this->responseMessage => 'Complaint Added Successfully',
                                    ]); 
                

          }catch(\Exception $e)
          {
            return response()->json([
                                    (string)$this->responseCode    => (string)$this->errorStatus, 
                                    (string)$this->responseMessage => (string)$e,
                                ]);
          }
       
    }



}