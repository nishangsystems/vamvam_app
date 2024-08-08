<?php

namespace App\Http\Controllers\Api\Representative;

# Models
use App\Models\Executive;
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
    protected $complaintAssign;
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
                            Executive                     $executive,
                            ComplaintStatus               $complaintStatus,
                            ComplaintAssign               $complaintAssign,
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
                            $this->executive                 = $executive;
                            $this->complaintStatus           = $complaintStatus;
                            $this->complaintAssign           = $complaintAssign;
                            $this->department                = $department;
                            $this->issueType                 = $issueType;
                            $this->customerAddress           = $customerAddress;
                            $this->assemblyConstituency      = $assemblyConstituency;
                            $this->parliamentaryConstituency = $parliamentaryConstituency;
                            
                        }

  

    /**
     * @method to Follow Up Complaint
     * 
     * @return 
     */
    public function followUp(Request $request)
    {

        $rules = [ 
                   'assign_complaint_id' => 'required',
                   'complaint_id'        => 'required',
                   'status'              => 'required',
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



                    #Update
                    ComplaintAssign::where('id',$request->assign_complaint_id)->update(['status' => $request->status]);

                    $arrayData1 = [
                                    'assign_complaint_id' => $request->assign_complaint_id, 
                                    'complaint_id'        => $request->complaint_id, 
                                    'date'                => date('Y-m-d'),
                                    'time'                => date('H:i:s'),
                                    'remarks'             => $request->remarks ?? '',
                                    'status'              => $request->status,
                                    'media_file'          => json_encode($complaintFile), 
                                 ];   


                    #store
                    $create=ComplaintAssignStatus::create($arrayData1);
                    
                    #Update Status
                    //Complaint::where('id', $request->complaint_id)->update(['status'=>$request->status]);
                    $complaintData = Complaint::where('id', $request->complaint_id)->first();
                    $complaintData->status = $request->status;
                    $complaintData->save();
                    $customer = $this->customer->where('id',$complaintData->customer_id)->first();
                     #Notify customer for Order Successfully
                      $notifyCustomer = new NotifyCustomer();
                      # Set Title message
                      $title = 'Biaka Complaint Notification';
                      # Set Message
                      if($request->status == 2){
                        $message = 'Your complaint has been in progress.'; 
                        $status = 'inprogress'; 
                      }elseif($request->status == 3){
                        $message = 'Your complaint has been resolved.'; 
                        $status = 'resolved';
                      }elseif($request->status == 4){
                        $message = 'Your complaint has been register successfully cancelled.'; 
                        $status = 'cancelled';
                      }else{
                        $message = '';
                        $status = ''; 
                      }   

                         
                        if($customer->device_type=='android')      
                        {
                          # Notify customer for android
                          $notifyCustomer->notify($customer, $title, $message, $complaintData->id,$status);
                        }elseif($customer->device_type=='ios'){
                          # Notify customer for ios
                          $notifyCustomer->iOS($customer, $title, $message, $complaintData->id,$status);
                        } 

                        #store notification
                        storeNotification('user',$status,$title, $message, $complaintData->id,$customer->id);  
               
                return response()->json([
                                        'code'    => (string)$this->successStatus, 
                                        'message' => 'Complaint Status Change Successfully',
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
            'executive_id'        => 'required',
        ]);

        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors()->first(), 'code' => (string)$this->failedStatus]);            
        }

        try 
           {
                $complaintArray = [];
                DB::beginTransaction();

                if($request->filter_by == 'today')
                {    
                    $complaints =  $this->complaintAssign
                                        ->where('executive_id',$request->executive_id)
                                        ->where('status','!=',5)
                                        ->whereHas('complaintData', function ($query)
                                            {
                                              $query->where('complaint_date',date('Y-m-d'));
                                            })
                                        ->orderBy('id','desc')
                                        ->get();
                }elseif($request->filter_by == 'open'){
                    $complaints =  $this->complaintAssign
                                        ->where('status','!=',5)
                                        ->where('executive_id',$request->executive_id)
                                        ->whereHas('complaintData', function ($query)
                                            {
                                              $query->where('status','!=',1)
                                                    ->where('status','!=',3)
                                                    ->where('status','!=',4);
                                            })
                                        ->orderBy('id','desc')
                                        ->get();
                }elseif($request->filter_by == 'resolve'){
                    $complaints =  $this->complaintAssign
                                        ->where('status','!=',5)
                                        ->where('executive_id',$request->executive_id)
                                        ->whereHas('complaintData', function ($query)
                                            {
                                              $query->where('status',3);
                                            })
                                        ->orderBy('id','desc')
                                        ->get();     
                }elseif($request->filter_by == 'cancel'){
                    $complaints =  $this->complaintAssign
                                        ->where('status','!=',5)
                                        ->where('executive_id',$request->executive_id)
                                        ->whereHas('complaintData', function ($query)
                                            {
                                              $query->where('status',4);
                                            })
                                        ->orderBy('id','desc')
                                        ->get();
                }else{
                    $complaints =  $this->complaintAssign
                                        ->where('executive_id',$request->executive_id)
                                        ->where('status','!=',5)
                                        ->orderBy('id','desc')
                                        ->get(); 
                }                                                                                                                             
                DB::commit();      
                        # return response if complaints get
                        if($complaints->isNotEmpty()) 
                        {
                            foreach($complaints as $key => $complaint) 
                            {
                                $data['assign_complaint_id']    = (string)$complaint->id ?? '';
                                $data['complaint_id']           = (string)$complaint->complaint_id ?? '';
                                $data['complaint_code']        = $complaint->complaintData ? (string)$complaint->complaintData->complaint_code : '';
                                $data['user_id']               = $complaint->complaintData ? (string)($complaint->complaintData->customerInfo ? $complaint->complaintData->customerInfo->id : '') : '';
                                $data['user_name']             = $complaint->complaintData ? (string)($complaint->complaintData->customerInfo ? $complaint->complaintData->customerInfo->name : '') : '';
                                $data['user_mobile']           = $complaint->complaintData ? (string)($complaint->complaintData->customerInfo ? $complaint->complaintData->customerInfo->mobile : '') : '';

                                $data['department_id']         = $complaint->complaintData ? (string)$complaint->complaintData->department_id : '';
                                $data['department_name']       = $complaint->complaintData ? (string)($complaint->complaintData->departmentInfo ? $complaint->complaintData->departmentInfo->name : '') : '';

                                $data['issue_type_id']         = $complaint->complaintData ? (string)$complaint->complaintData->issue_type_id : '';
                                $data['issue_type_name']       = $complaint->complaintData ? (string)($complaint->complaintData->issueInfo ? $complaint->complaintData->issueInfo->name : '') : '';

                                $data['message']               = $complaint->complaintData ? (string)$complaint->complaintData->message : '';
                                $data['complaint_file']        = $complaint->complaintData ? ($complaint->complaintData->complaint_file ? json_decode($complaint->complaintData->complaint_file) : []) : [];
                                $data['complaint_date']        = $complaint->complaintData ? (string)$complaint->complaintData->complaint_date : '';
                                $data['latitude']              = $complaint->complaintData ? (string)$complaint->complaintData->latitude : '';
                                $data['longitude']             = $complaint->complaintData ? (string)$complaint->complaintData->longitude : '';
                                $data['address']               = $complaint->complaintData ? (string)$complaint->complaintData->address : '';

                                $data['status']                = (string)$complaint->status ?? '';
                                $data['status_string']         = (string)$complaint->status_string ?? '';
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

                                $data['user_id']        = $complaint->complaintData ? (string)($complaint->complaintData->customerInfo ? $complaint->complaintData->customerInfo->id : '') : '';
                                $data['user_name']      = $complaint->complaintData ? (string)($complaint->complaintData->customerInfo ? $complaint->complaintData->customerInfo->name : '') : '';
                                $data['user_mobile']    = $complaint->complaintData ? (string)($complaint->complaintData->customerInfo ? $complaint->complaintData->customerInfo->mobile : '') : '';

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
                                                        'message'   => 'Complaint Follow Up Not Found!!',
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




   
}
