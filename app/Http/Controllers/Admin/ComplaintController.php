<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use File;
use Hash;
use Validator;
use App\Models\Executive;
use App\Models\ExecutiveAddress;
use App\Models\Customer;
use App\Models\CustomerAddress;
use App\Models\State;
use App\Models\District;
use App\Models\Tehsil;
use App\Models\AssemblyConstituency;
use App\Models\ParliamentaryConstituency;
use App\Models\Complaint;
use App\Models\ComplaintStatus;
use App\Models\Department;
use App\Models\IssueType;
use App\Models\ComplaintAssign;
use App\Models\ComplaintAssignStatus;
use App\Models\PanchayatWard;
use App\Models\TownVillage;
use App\Models\Block;
use App\Models\Thana;
use App\Models\PostOffice;
use App\Http\Traits\MessageStatusTrait;

class ComplaintController extends Controller
{
    use MessageStatusTrait;

    # Bind Type
    protected $type = 'Complaint ';

    # Bind location
    protected $view = 'admin.complaint.';

    # Bind customer
    protected $customer;   
    protected $customerAddress;
    protected $tehsil;
    protected $state;
    protected $district;
    protected $assemblyConstituency;
    protected $parliamentaryConstituency;
    protected $complaint;
    protected $complaintStatus;
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
                            ComplaintStatus               $complaintStatus,
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
                            $this->complaint                 = $complaint;
                            $this->complaintStatus           = $complaintStatus;
                            $this->department                = $department;
                            $this->issueType                 = $issueType;
                            $this->customerAddress           = $customerAddress;
                            $this->assemblyConstituency      = $assemblyConstituency;
                            $this->parliamentaryConstituency = $parliamentaryConstituency;
                            
                        }
   
    
    public function index(Request $request)
    {
        # Fetch  
        $lists = $this->complaint
                      ->orderBy('id','desc')
                      ->get();

        return view($this->view . 'index')->with([
                                                   'lists' => $lists ?? [],
                                                ]);
    }

    public function followUp(Request $request,$id)
    {
        # Fetch  
        $lists = ComplaintAssignStatus::where('complaint_id',base64_decode($id))->get();

        # Fetch  
        $complaint = $this->complaint
                          ->where('id',base64_decode($id))
                          ->first();

        if($complaint == '')
        {
            return route('admin_complaint');
        }                                

        return view($this->view . 'followup')->with([
                                                       'lists'     => $lists ?? [],
                                                       'complaint' => $complaint,
                                                    ]);
    }

    public function create()
    {
        $states = State::get();
        $departments = Department::where('status',1)->get();
        $issueTypes = IssueType::where('status',1)->get();
        # return to create page
        return view($this->view .'create')->with([
                                                   'states'   => $states ?? [],
                                                   'departments'   => $departments ?? [],
                                                   'issueTypes'   => $issueTypes ?? [],
                                                 ]);
    }


    public function jsonCustomerInfo(Request $request)
    {
        $states = [];
        $tehsils = [];
        $customer = '';
        $districts = [];
        $assemblies = [];
        $parliamentaries = [];
        $townVillages = [];
        $panchayatWards = [];
        $blocks = [];
        $thanas = [];
        $postOffices = [];
        $age = '';
       # Fetch  by id
        $customer = $this->customer
                         ->where('voter_id', $request->check_customer_info)
                         ->orWhere('aadhaar_card', $request->check_customer_info)
                         ->orWhere('email', $request->check_customer_info)
                         ->orWhere('mobile', $request->check_customer_info)
                         ->with('addressInfo')
                         ->where('is_delete', 0)
                         ->first();
        if($customer)
        {
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
            $townVillages = TownVillage::where('tehsil_id',$customer->addressInfo->tehsil_id)
                                      ->select('id', 'name')
                                      ->where('status',1)
                                      ->get();
            # fetch PanchayatWard 
            $panchayatWards = PanchayatWard::where('tehsil_id',$customer->addressInfo->tehsil_id)
                                          ->select('id', 'name')
                                          ->where('status',1)
                                          ->get();
            # fetch block 
            $blocks = Block::where('tehsil_id',$customer->addressInfo->tehsil_id)
                          ->select('id', 'name')
                          ->where('status',1)
                          ->get();

            # fetch thana 
            $thanas = Thana::where('tehsil_id',$customer->addressInfo->tehsil_id)
                          ->select('id', 'name')
                          ->where('status',1)
                          ->get();

            # fetch thana 
            $postOffices = PostOffice::where('tehsil_id',$customer->addressInfo->tehsil_id)
                                    ->select('id', 'name')
                                    ->where('status',1)
                                    ->get();
                                  

            $dob = date('d.m.Y', strtotime($customer->dob));
            $bday = new \DateTime($dob); // Your date of birth
            $today = new \Datetime(date('m.d.y'));
            $diff = $today->diff($bday);
            $age = $diff->y;                          
        }

        return response()->json([
                                   'states'          => $states ?? [],
                                   'tehsils'         => $tehsils ?? [],
                                   'customer'        => $customer,
                                   'districts'       => $districts ?? [],
                                   'assemblies'      => $assemblies ?? [],
                                   'parliamentaries' => $parliamentaries ?? [],
                                   'townVillages'    => $townVillages ?? [],
                                   'panchayatWards'  => $panchayatWards ?? [],
                                   'blocks'          => $blocks ?? [],
                                   'thanas'          => $thanas ?? [],
                                   'postOffices'     => $postOffices ?? [],
                                   'age'             => $age,
                                ]);               
    }


    public function store(Request $request)
    {
        $rules = [ 
                   'name'          =>'required',
                   'gender'        =>'required',
                   'dob'           =>'required',
                   'mobile'        =>'required|digits:10',
                   'state_id'      =>'required',
                   'department_id' =>'required',
                   'issue_type_id' =>'required',
                   'message'       =>'required',
                 ];

        $validator = Validator::make($request->all(), $rules);
        if($validator->fails()){
            return response()->json([
                        (string)$this->responseCode=>(string)$this->errorStatus, 
                        (string)$this->responseMessage => (string)$validator->messages()->first()
                    ]);
        }


          try{
               
               if(isset($request->complaint_file))
                    {
                    if(count($request->complaint_file) > 0 )
                       {
                          foreach ($request->complaint_file as $key=> $file_data) 
                            {
                                $fullName    = $file_data->getClientOriginalName();
                                $extension   = $file_data->getClientOriginalExtension();
                                $fileSize    = $file_data->getSize();
                                if($fileSize > 20000000)
                                {
                                   return response()->json([
                                        (string)$this->responseCode    => (string)$this->errorStatus, 
                                        (string)$this->responseMessage => (string)'File size upload max 8 mb',
                                    ]); 
                                }
                            }  
                        }  
                    }

               if($request->customer_id != '')
               {

                    if($request->email != '')
                    {
                         $emailCheck = $this->customer
                                           ->where('email', $request->email)
                                           ->where('is_delete', 0)
                                           ->where('id','!=',$request->customer_id)
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
                                        ->where('id','!=',$request->customer_id)
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
                                       ->where('id','!=',$request->customer_id)
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
                                         ->where('id','!=',$request->customer_id)
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
                    $customer = $this->customer
                                     ->where('id',$request->customer_id)
                                     ->update($arrayData);


                    $arrayData2 = [
                                    'customer_id'      => $request->customer_id, 
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
                         ->where('customer_id',$request->customer_id)
                         ->update($arrayData2); 



                     # upload complaint_file
                    $complaintFile = [];
                    if(isset($request->complaint_file))
                    {
                        if(count($request->complaint_file) > 0)
                        {
                          foreach ($request->complaint_file as $key=> $file_data) 
                            {
                                $fullName    = $file_data->getClientOriginalName();
                                $extension   = $file_data->getClientOriginalExtension();
                                $filename    = ((string)(microtime(true)*10000)).'.'.$extension;
                                $file_data->move(public_path('images/complaint/'), $filename);
                                $complaint_file = 'images/complaint/'.$filename;
                                $complaintFile[]=['file_path'=>$complaint_file,'file_type'=>$extension];
                            }  
                        }
                    }
                    

              
                    $arrayData = [
                                    'complaint_code'    => rand(10000000,99999999), 
                                    'customer_id'       => $request->customer_id ?? null, 
                                    'department_id'     => $request->department_id ?? null,   
                                    'issue_type_id'     => $request->issue_type_id ?? null,   
                                    'message'           => $request->message ?? null, 
                                    'complaint_file'    => json_encode($complaintFile), 
                                    'complaint_date'    => date('Y-m-d'), 
                                    'status'            => 1, 
                                 ];  


                    #store
                    $complaint=$this->complaint::create($arrayData);

                    $arrayData3 = [
                                    'complaint_id'      => $complaint->id, 
                                    'status_id'         => 1,   
                                    'comment'           => 'Complaint Register', 
                                  ];


                    #store
                    $create = $this->complaintStatus::create($arrayData3);

               }else{

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
                                    'mobile'        => $request->mobile ?? null, 
                                    'show_password' => $request->mobile,   
                                    'password'      => Hash::make($request->mobile),  
                                    'email'         => $request->email ?? null,   
                                 ];  


                    #store
                    $customer = $this->customer::create($arrayData);

                    $arrayData2 = [
                                    'customer_id'      => $customer->id,  
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
                    $this->customerAddress::create($arrayData2); 

                   
                     # upload complaint_file
                    $complaintFile = [];
                    if(isset($request->complaint_file))
                    {
                        if(count($request->complaint_file) > 0)
                        {
                          foreach ($request->complaint_file as $key=> $file_data) 
                            {
                                $fullName    = $file_data->getClientOriginalName();
                                $extension   = $file_data->getClientOriginalExtension();
                                $filename    = ((string)(microtime(true)*10000)).'.'.$extension;
                                $file_data->move(public_path('images/complaint/'), $filename);
                                $complaint_file = 'images/complaint/'.$filename;
                                $complaintFile[]=['file_path'=>$complaint_file,'file_type'=>$extension];
                            }  
                        }
                    }
              
                    $arrayData = [
                                    'customer_id'       => $customer->id ?? null, 
                                    'department_id'     => $request->department_id ?? null,   
                                    'issue_type_id'     => $request->issue_type_id ?? null,   
                                    'message'           => $request->message ?? null, 
                                    'complaint_file'    => json_encode($complaintFile), 
                                    'complaint_date'    => date('Y-m-d'), 
                                    'status'            => 1, 
                                 ];  


                    #store
                    $complaint=$this->complaint::create($arrayData);

                    $arrayData3 = [
                                    'complaint_id'      => $complaint->id, 
                                    'status_id'         => 1,   
                                    'comment'           => 'Complaint Register', 
                                  ];


                    #store
                    $create = $this->complaintStatus::create($arrayData3);
               }

               if($request->block_id != '')
               {
                 $block_id = $request->block_id;
                 $executive = Executive::whereHas('addressInfo', function ($query) use($block_id){ 
                                                            $query->where('block_id',$block_id);    
                                                         })
                                   ->where('status',1)
                                   ->where('is_delete', 0)
                                   ->first();
                 if($executive)
                 { 
                    $arrayData = [
                                    'executive_id'     => $executive->id ?? 0, 
                                    'complaint_id'     => $complaint->id ?? 0,   
                                    'assign_date'      => date('Y-m-d'),
                                    'status'           => 1
                                 ];  


                    #store
                    $create=ComplaintAssign::create($arrayData);

                    $arrayData1 = [
                                    'assign_complaint_id' => $create->id ?? 0, 
                                    'complaint_id'        => $complaint->id ?? 0,   
                                    'date'                => date('Y-m-d'),
                                    'time'                => date('H:i:s'),
                                    'remarks'             => 'Assign',
                                    'status'              => 1
                                 ];   


                    #store
                    $create=ComplaintAssignStatus::create($arrayData1);

                    #Update Status
                    Complaint::where('id', $complaint->id)->update(['status'=>2]);                  
                 }
               }
               


               
                return response()->json([
                                        (string)$this->responseCode    => (string)$this->successStatus, 
                                        (string)$this->responseMessage => 'Complaint Added Successfully',
                                        'responseUrl' => url('admin/complaint')
                                    ]); 
                

          }catch(\Exception $e)
          {
            return response()->json([
                                    (string)$this->responseCode    => (string)$this->errorStatus, 
                                    (string)$this->responseMessage => (string)$e,
                                ]);
          }
       
    }


    public function assignComplaint($complaint_id)
    {
        $executives = Executive::where('status',1)->where('is_delete',0)->get();
        # return to create page
        return view($this->view .'assign_complaint')->with([
                                                   'executives'   => $executives ?? [],
                                                   'complaint_id'   => $complaint_id,
                                                   
                                                 ]);
    }


    public function storeAssignComplaint(Request $request)
    {

        $rules = [ 
                   'id'            =>'required',
                   'executive_id'  =>'required',
                 ];

        $validator = Validator::make($request->all(), $rules);
        if($validator->fails()){
            return response()->json([
                        (string)$this->responseCode=>(string)$this->errorStatus, 
                        (string)$this->responseMessage => (string)$validator->messages()->first()
                    ]);
        }


          try{


                    $lastAssign = ComplaintAssign::where('complaint_id', $request->id)->orderby('id','desc')->first();
                    if($lastAssign)
                     {
                        $lastAssign->status = 5;
                        $lastAssign->save();
                     }     
              
                    $arrayData = [
                                    'executive_id'     => $request->executive_id ?? 0, 
                                    'complaint_id'     => $request->id ?? 0,   
                                    'assign_date'      => date('Y-m-d'),
                                    'status'           => 1
                                 ];  


                    #store
                    $create=ComplaintAssign::create($arrayData);

                    $arrayData1 = [
                                    'assign_complaint_id' => $create->id ?? 0, 
                                    'complaint_id'        => $request->id ?? 0,   
                                    'date'                => date('Y-m-d'),
                                    'time'                => date('H:i:s'),
                                    'remarks'             => 'Assign',
                                    'status'              => 1
                                 ];   


                    #store
                    $create=ComplaintAssignStatus::create($arrayData1);

                    #Update Status
                    Complaint::where('id', $request->id)->update(['status'=>2]);

               
               
                return response()->json([
                                        (string)$this->responseCode    => (string)$this->successStatus, 
                                        (string)$this->responseMessage => 'Complaint Assign Successfully',
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