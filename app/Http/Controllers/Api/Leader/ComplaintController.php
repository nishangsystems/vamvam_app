<?php

namespace App\Http\Controllers\Api\Leader;

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
use App\Http\Controllers\Api\User\NotifyUser;

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
     * Complaint List 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function list(Request $request) 
    { 
        
        try 
           {
                $complaintArray = [];
                DB::beginTransaction();
                if($request->filter_by == 'resolved')
                {
                   $complaints =  $this->complaint
                                       ->where('status',3)
                                       ->orderBy('id','desc')
                                       ->get();
                }elseif($request->filter_by == 'inprocess'){
                   $complaints =  $this->complaint
                                       ->where('status','!=',3)
                                       ->where('status','!=',4)
                                       ->orderBy('id','desc')
                                       ->get();
                }elseif($request->filter_by == 'pending'){
                   $complaints =  $this->complaint
                                       ->where('status',1)
                                       ->orderBy('id','desc')
                                       ->get();
                }elseif($request->filter_by == 'cancelled'){
                   $complaints =  $this->complaint
                                       ->where('status',4)
                                       ->orderBy('id','desc')
                                       ->get();

                }else{
                   $complaints =  $this->complaint
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
