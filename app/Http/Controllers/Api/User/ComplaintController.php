<?php

namespace App\Http\Controllers\Api\User;

# Models
use App\Models\Executive;
use App\Models\Customer;
use App\Models\CustomerAddress;
use App\Models\State;
use App\Models\District;
use App\Models\Tehsil;
use App\Models\City;
use App\Models\AssemblyConstituency;
use App\Models\ParliamentaryConstituency;
use App\Models\Complaint;
use App\Models\ComplaintStatus;
use App\Models\Department;
use App\Models\IssueType;
use App\Models\ComplaintAssign;
use App\Models\ComplaintAssignStatus;

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
use App\Http\Controllers\Api\Representative\NotifyRepresentative;

class ComplaintController extends Controller
{
    use StatusTrait;

    # Variable to Bind Model
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
     * Create a new controller instance.
     *
     * @return void
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
                            ParliamentaryConstituency     $parliamentaryConstituency
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

  

    /**
     * @method to Register Complaint
     * 
     * @return 
     */
    public function store(Request $request)
    {

        $rules = [ 
                   'user_id'        =>'required',
                   'department_id'  =>'required',
                   'issue_type_id'  =>'required',
                   'message'        =>'required',
                 ];

        $validator = Validator::make($request->all(), $rules);
       
        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors(),'code' => (string)$this->failedStatus]);            
        }


          try{

                    $complaintFile = [];
                    $countComplaintFile = $request->complaint_file ? array_filter($request->complaint_file) : [];
                    #Check file size
                    if(count($countComplaintFile) > 0)
                    {
                           foreach ($request->complaint_file as $key=> $file_data) 
                            {
                                $fullName    = $file_data->getClientOriginalName();
                                $extension   = $file_data->getClientOriginalExtension();
                                $fileSize    = $file_data->getSize();
                                if($fileSize > 20000000)
                                {
                                   return response()->json([
                                        'code'    => (string)$this->failedStatus,  
                                        'message' => (string)'File size upload max 8 mb',
                                    ]); 
                                }
                            }  
                    }

                    #Upload file
                    if(count($countComplaintFile) > 0)
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
                    

          
                $arrayData = [
                                'complaint_code'    => rand(10000000,99999999), 
                                'customer_id'       => $request->user_id ?? null, 
                                'department_id'     => $request->department_id ?? null,   
                                'issue_type_id'     => $request->issue_type_id ?? null,   
                                'message'           => $request->message ?? null, 
                                'latitude'          => $request->latitude ?? null, 
                                'longitude'         => $request->longitude ?? null, 
                                'address'           => $request->address ?? null, 
                                'complaint_file'    => json_encode($complaintFile), 
                                'complaint_date'    => date('Y-m-d'), 
                                'status'            => 1, 
                             ];


                #store
                $complaint = $this->complaint::create($arrayData);

                $arrayData1 = [
                                'complaint_id'      => $complaint->id, 
                                'status_id'         => 1,   
                                'comment'           => 'Complaint Register', 
                             ];


                #store
                $create = $this->complaintStatus::create($arrayData1);

               
               $customer = $this->customer
                                ->where('id',$request->user_id)
                                ->first();

                      #Notify customer for Order Successfully
                      $notifyCustomer = new NotifyCustomer();
                      # Set Title message
                      $title = 'Biaka Complaint Notification';
                      # Set Message
                      $message = 'Your complaint has been register successfully.';    
                        if($customer->device_type=='android')      
                        {
                          # Notify customer for android
                          $notifyCustomer->notify($customer, $title, $message, $complaint->id, 'complaint-create');
                        }elseif($customer->device_type=='ios'){
                          # Notify customer for ios
                          $notifyCustomer->iOS($customer, $title, $message, $complaint->id, 'complaint-create');
                        } 
                        
                        #store notification
                        storeNotification('user','complaint-create',$title, $message, $complaint->id,$request->user_id);
                        

               $block_id = $customer->addressInfo ? $customer->addressInfo->block_id : '';                 
               if($block_id != '')
               {
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

                      #Notify Representative Order assign Successfully
                      $notifyRepresentative = new NotifyRepresentative();
                      # Set Title message
                      $title = 'Biaka Complaint Notification';
                      # Set Message
                      $message = 'New complaint has been received.';    
                        if($executive->device_type=='android')      
                        {
                          # Notify executive for android
                          $notifyRepresentative->notify($executive, $title, $message, $complaint->id, 'new-complaint');
                        }elseif($executive->device_type=='ios'){
                          # Notify executive for ios
                          $notifyRepresentative->iOS($executive, $title, $message, $complaint->id, 'new-complaint');
                        } 
                        #store notification
                        storeNotification('executive','new-complaint',$title, $message, $complaint->id,$executive->id);
                  }                   
               }

               
                return response()->json([
                                        'code'    => (string)$this->successStatus, 
                                        'message' => 'Complaint Registered Successfully',
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
     * Complaint List 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function list(Request $request) 
    { 
        # Validate request data
        $validator = Validator::make($request->all(), [ 
            'user_id'        => 'required',
        ]);

        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors()->first(), 'code' => (string)$this->failedStatus]);            
        }

        try 
           {
                $complaintArray = [];
                DB::beginTransaction();
                if($request->filter_by == 'open')
                {
                    $complaints =  $this->complaint
                                        ->where('customer_id',$request->user_id)
                                        ->where('status','!=',3)
                                        ->where('status','!=',4)
                                        ->orderBy('id','desc')
                                        ->get();
                }elseif($request->filter_by == 'close'){
                    $complaints =  $this->complaint
                                        ->where('customer_id',$request->user_id)
                                        ->where('status','!=',1)
                                        ->where('status','!=',2)
                                        ->where('status','!=',5)
                                        ->orderBy('id','desc')
                                        ->get();
                }elseif($request->filter_by == 'reopen'){
                    $complaints =  $this->complaint
                                        ->where('customer_id',$request->user_id)
                                        ->where('status',5)
                                        ->orderBy('id','desc')
                                        ->get();                        

                }else{
                    $complaints =  $this->complaint
                                        ->where('customer_id',$request->user_id)
                                        ->orderBy('id','desc')
                                        ->get();
                }    
                    
                DB::commit();      
                        # return response if complaints get
                        if($complaints->isNotEmpty()) 
                        {
                            foreach($complaints as $key => $complaint) 
                            {
                                $data['id']             = (string)$complaint->id ?? '';
                                $data['complaint_code'] = (string)$complaint->complaint_code ?? '';
                                $data['user_id']        = (string)$complaint->customer_id ?? '';
                                $data['department_id']  = (string)$complaint->department_id ?? '';
                                $data['departmentInfo'] = $complaint->departmentInfo ? (string)$complaint->departmentInfo->name : '';
                                $data['issue_type_id']  = (string)$complaint->issue_type_id ?? '';
                                $data['issueInfo']      = $complaint->issueInfo ? (string)$complaint->issueInfo->name : '';
                                $data['message']        = (string)$complaint->message ?? '';
                                $data['complaint_file'] = $complaint->complaint_file ? json_decode($complaint->complaint_file) : [];
                                $data['complaint_date'] = (string)$complaint->complaint_date ?? '';
                                $data['status']         = (string)$complaint->status ?? '';
                                $data['status_string']  = (string)$complaint->status_string ?? '';
                                $data['latitude']       = (string)$complaint->latitude ?? '';
                                $data['longitude']      = (string)$complaint->longitude ?? '';
                                $data['address']        = (string)$complaint->address ?? '';
                                # push in array
                                array_push($complaintArray, $data);
                            }
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->successStatus, 
                                                        'message'   => 'Complaint List',
                                                        'data'      =>  $complaintArray
                                                    ]);
                        }else{
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->failedStatus, 
                                                        'message'   => 'Complaint Not Found!!',
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
     * Complaint Followup List 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function followupList(Request $request) 
    { 
        # Validate request data
        $validator = Validator::make($request->all(), [ 
            'complaint_id'        => 'required',
        ]);

        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors()->first(), 'code' => (string)$this->failedStatus]);            
        }

        try 
           {
                $complaintFollowUpArray = [];
                DB::beginTransaction();
                    $complaints =  ComplaintAssignStatus::where('complaint_id',$request->complaint_id)
                                                        ->orderBy('id','asc')
                                                        ->get();
                DB::commit();      
                        # return response if complaints get
                        if($complaints->isNotEmpty()) 
                        {
                            foreach($complaints as $key => $complaint) 
                            {
                                $data['complaint_id']   = (string)$complaint->complaint_id ?? '';
                                $data['executive_id']   = $complaint->assignComplaintData ? (string)$complaint->assignComplaintData->executive_id : '';
                                $data['executive_name'] = $complaint->assignComplaintData ? (string)($complaint->assignComplaintData->executiveData ? $complaint->assignComplaintData->executiveData->name : '') : '';
                                $data['date']           = (string)$complaint->date ?? '';
                                $data['time']           = (string)$complaint->time ?? '';
                                $data['remarks']        = (string)$complaint->remarks ?? '';
                                $data['media_file']     = $complaint->media_file ? json_decode($complaint->media_file) : [];
                                $data['status']         = (string)$complaint->status ?? '';
                                $data['status_string']  = (string)$complaint->status_string ?? '';
                                # push in array
                                array_push($complaintFollowUpArray, $data);
                            }
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->successStatus, 
                                                        'message'   => 'Complaint Follow Up List',
                                                        'data'      =>  $complaintFollowUpArray
                                                    ]);
                        }else{
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->failedStatus, 
                                                        'message'   => 'Your Complaint has been registered successfully. Please wait till we assign any Executive',
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
     * @method to Follow Up Complaint
     * 
     * @return 
     */
    public function reopenComplain(Request $request)
    {

        $rules = [ 
                   'complaint_id'        => 'required',
                 ];

        $validator = Validator::make($request->all(), $rules);
       
        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors(),'code' => (string)$this->failedStatus]);            
        }

          try{

                    #Update reopen Status
                    //$complaintData = Complaint::where('id', $request->id)->update(['status'=>5]);
                    $complaintData = Complaint::where('id', $request->complaint_id)->first();
                    $complaintData->status = 5;
                    $complaintData->save();

                    //dd($complaintData);

                    $arrayData3 = [
                                    'complaint_id'      => $request->complaint_id,
                                    'status_id'         => 5,   
                                    'comment'           => 'Complaint Reopen by user', 
                                  ];
                    #store
                    $create = $this->complaintStatus::create($arrayData3);

                    #Update
                    ComplaintAssign::where('complaint_id',$request->complaint_id)->update(['status' => 6]);

                    $arrayData1 = [
                                    'assign_complaint_id' => 0, 
                                    'complaint_id'        => $request->complaint_id, 
                                    'date'                => date('Y-m-d'),
                                    'time'                => date('H:i:s'),
                                    'remarks'             => 'Complaint reopen by user',
                                    'status'              => 6,
                                 ];   


                    #store
                    $create=ComplaintAssignStatus::create($arrayData1);

                      
                      $customer = $this->customer->where('id',$complaintData->customer_id)->first();
                      #Notify customer for Order Successfully
                      $notifyCustomer = new NotifyCustomer();
                      # Set Title message
                      $title = 'Biaka Complaint Notification';
                      # Set Message
                      $message = 'Your complaint has been reopen successfully.';    
                        if($customer->device_type=='android')      
                        {
                          # Notify customer for android
                          $notifyCustomer->notify($customer, $title, $message, $complaintData->id, 'complaint-reopen');
                        }elseif($customer->device_type=='ios'){
                          # Notify customer for ios
                          $notifyCustomer->iOS($customer, $title, $message, $complaintData->id, 'complaint-reopen');
                        }

                        #store notification
                        storeNotification('user','complaint-reopen',$title, $message, $complaintData->id,$complaintData->customer_id); 

               
                return response()->json([
                                          'code'    => (string)$this->successStatus,
                                          'message' => 'Complaint Reopen Successfully',
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
     * @method to Withdraw Complaint
     * 
     * @return 
     */
    public function withdrawComplain(Request $request)
    {

        $rules = [ 
                   'complaint_id'        => 'required',
                 ];

        $validator = Validator::make($request->all(), $rules);
       
        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors(),'code' => (string)$this->failedStatus]);            
        }

          try{

                    #Update reopen Status
                    //Complaint::where('id', $request->complaint_id)->update(['status'=>4]);
                    $complaintData = Complaint::where('id', $request->complaint_id)->first();
                    $complaintData->status = 4;
                    $complaintData->save();

                    $arrayData3 = [
                                    'complaint_id'      => $request->complaint_id,
                                    'status_id'         => 4,   
                                    'comment'           => 'Complaint cancel by user', 
                                  ];
                    #store
                    $this->complaintStatus::create($arrayData3);

                    #Update
                    ComplaintAssign::where('complaint_id',$request->complaint_id)->update(['status' => 4]);

                    $arrayData1 = [
                                    'assign_complaint_id' => 0, 
                                    'complaint_id'        => $request->complaint_id, 
                                    'date'                => date('Y-m-d'),
                                    'time'                => date('H:i:s'),
                                    'remarks'             => 'Complaint cancel by user',
                                    'status'              => 4,
                                 ];   


                    #store
                    $create=ComplaintAssignStatus::create($arrayData1);


                      $customer = $this->customer->where('id',$complaintData->customer_id)->first();
                      #Notify customer for Order Successfully
                      $notifyCustomer = new NotifyCustomer();
                      # Set Title message
                      $title = 'Biaka Complaint Notification';
                      # Set Message
                      $message = 'Your complaint has been withdraw successfully.';    
                        if($customer->device_type=='android')      
                        {
                          # Notify customer for android
                          $notifyCustomer->notify($customer, $title, $message, $complaintData->id, 'complaint-withdraw');
                        }elseif($customer->device_type=='ios'){
                          # Notify customer for ios
                          $notifyCustomer->iOS($customer, $title, $message, $complaintData->id, 'complaint-withdraw');
                        } 
                       #store notification
                        storeNotification('user','complaint-withdraw',$title, $message, $complaintData->id,$complaintData->customer_id);   
                   
               
                return response()->json([
                                          'code'    => (string)$this->successStatus,
                                          'message' => 'Complaint Canceled Successfully',
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
     * @method to Follow Up Submit Complaint
     * 
     * @return 
     */
    public function followUpSubmit(Request $request)
    {

        $rules = [ 
                   'complaint_id'        => 'required',
                 ];

        $validator = Validator::make($request->all(), $rules);
       
        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors(),'code' => (string)$this->failedStatus]);            
        }


          try{

                    $complaintFile = [];
                    $countMediaFile = $request->media_file ? array_filter($request->media_file) : [];
                    if(count($countMediaFile) > 0)
                    {
                        foreach ($request->media_file as $key=> $file_data) 
                        {
                            $fullName    = $file_data->getClientOriginalName();
                            $extension   = $file_data->getClientOriginalExtension();
                            $filename    = ((string)(microtime(true)*10000)).'.'.$extension;
                            $file_data->move(public_path('images/complaint/'), $filename);
                            $complaint_file = 'images/complaint/'.$filename;
                            $complaintFile[]=['file_path'=>$complaint_file,'file_type'=>$extension];
                        }
                    }


                    $arrayData1 = [
                                    'assign_complaint_id' => 0, 
                                    'complaint_id'        => $request->complaint_id, 
                                    'date'                => date('Y-m-d'),
                                    'time'                => date('H:i:s'),
                                    'remarks'             => $request->message, 
                                    'status'              => 0,
                                    'media_file'          => json_encode($complaintFile), 
                                 ];   


                    #store
                    $create=ComplaintAssignStatus::create($arrayData1);
                    
                  
               
                return response()->json([
                                        'code'    => (string)$this->successStatus, 
                                        'message' => 'Follow up send successfully',
                                    ]); 
                
          }catch(\Exception $e)
          {
            return response()->json([
                                    'code'    => (string)$this->failedStatus, 
                                    'message' => (string)$e,
                                ]);
          }
    }


   


   
}
