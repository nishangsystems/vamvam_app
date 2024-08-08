<?php

namespace App\Http\Controllers\Api\Leader;

# Models
use App\Models\RepresentativeRequestApproval;
use App\Models\Executive;

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
use App\Http\Controllers\Api\Representative\NotifyRepresentative;

class RepresentativeRequestApprovalController extends Controller
{
    use StatusTrait;

    # Variable to Bind Model
    protected $executive;   
    protected $representativeAppointment;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
     function __construct(
                            Executive                      $executive,
                            RepresentativeRequestApproval  $representativeRequestApproval
                        )
                        {
                            $this->executive                      = $executive;
                            $this->representativeRequestApproval  = $representativeRequestApproval;
                        }

  

    /** 
     * representativeRequestApproval List 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function list(Request $request) 
    { 
       
        try 
           {
                $approvalArray = [];
                DB::beginTransaction();
                
                    if($request->filter_by == 'today')
                    {
                       $lists = $this->representativeRequestApproval
                                     ->where('ticket_date',date('Y-m-d'))
                                     ->orderBy('id','desc')
                                     ->get();
                    }elseif($request->filter_by == 'upcomming'){
                       $lists = $this->representativeRequestApproval
                                     ->where('ticket_date','>',date('Y-m-d'))
                                     ->orderBy('id','desc')
                                     ->get();
                    }elseif($request->filter_by == 'past'){
                       $lists = $this->representativeRequestApproval
                                     ->where('ticket_date','<',date('Y-m-d'))
                                     ->orderBy('id','desc')
                                     ->get();
                    }else{
                       $lists = $this->representativeRequestApproval
                                     ->orderBy('id','desc')
                                     ->get();
                    }   
                    
                DB::commit();      
                        # return response if lists get
                        if($lists->isNotEmpty()) 
                        {
                            foreach($lists as $key => $value) 
                            {
                                
                                $data['id']              = (string)$value->id ?? '';
                                $data['complaint_id']    = (string)$value->complaint_id ?? '';
                                $data['executive_id']    = (string)$value->executive_id ?? '';
                                $data['executive_name']  = $value->executiveInfo ? (string)$value->executiveInfo->name : '';
                                $data['ticket_no']       = (string)$value->ticket_no ?? '';
                                $data['ticket_date']     = (string)$value->ticket_date ?? '';
                                $data['message']         = (string)$value->message ?? '';
                                $data['leader_id']       = (string)$value->leader_id ?? '';
                                $data['leader_name']     = $value->leaderInfo ? (string)$value->leaderInfo->name : '';
                                $data['reply_message']   = (string)$value->reply_message ?? '';
                                $data['status']          = (string)$value->status ?? '';
                                $data['status_string']   = (string)$value->status_string ?? '';

                                # push in array
                                array_push($approvalArray, $data);
                            }
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->successStatus, 
                                                        'message'   => 'Approval Request List',
                                                        'data'      =>  $approvalArray
                                                    ]);
                        }else{
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->failedStatus, 
                                                        'message'   => 'Approval Request Not Found!!',
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
     * @method to Status Change Approval request
     * 
     * @return 
     */
    public function status(Request $request)
    {

        $rules = [ 
                   'id'              =>'required',
                   'leader_id'       =>'required',
                   'status'          =>'required',
                   'reply_message'   =>'required',
                 ];

        $validator = Validator::make($request->all(), $rules);
       
        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors(),'code' => (string)$this->failedStatus]);            
        }


          try{
          
                $check = $this->representativeRequestApproval
                              ->where('id',$request->id)
                              ->first();
                $executive_id = $check->executive_id ?? 0;              

                if($check->status == 1)
                {
                   return response()->json([
                                    'code'    => (string)$this->failedStatus, 
                                    'message' => 'Sorry, this request already accepted',
                                ]); 
                }

                if($check->status == 2)
                {
                   return response()->json([
                                    'code'    => (string)$this->failedStatus, 
                                    'message' => 'Sorry, this request already rejected',
                                ]); 
                } 

                $check->status           = $request->status;             
                $check->leader_id        = $request->leader_id ?? null;             
                $check->reply_message    = $request->reply_message ?? null;             
                $check->save();             
               
               $message = '';
               if($request->status == 1)
               {
                 return response()->json([
                                        'code'    => (string)$this->successStatus, 
                                        'message' => 'Request Accepted Successfully',
                                    ]);
                 $message = 'Your Request has been accepted.'; 
               }elseif($request->status == 2){
                 return response()->json([
                                        'code'    => (string)$this->successStatus, 
                                        'message' => 'Request Rejected Successfully',
                                    ]);
                 $message = 'Your Request has been rejected.'; 
               } 



                    $executive = $this->executive->where('id', $executive_id)->first();
                    #Notify executive for Order Successfully
                    $notifyRepresentative = new NotifyRepresentative();
                    # Set Title message
                    $title = 'Biaka Approval Request Notification';
                    # Set Message
                    //$message = 'Your appointment has been booked successfully.';    
                     if($executive->device_type=='android')      
                      {
                        # Notify executive for android
                        $notifyRepresentative->notify($executive, $title, $message, '', 'representative_approval_request');
                      }elseif($executive->device_type=='ios'){
                        # Notify executive for ios
                        $notifyRepresentative->iOS($executive, $title, $message, '', 'representative_approval_request');
                      }

                      #store notification
                      storeNotification('executive','representative_approval_request',$title, $message, 0,$executive->id);                      
                 
                

          }catch(\Exception $e)
          {
            return response()->json([
                                    'code'    => (string)$this->failedStatus, 
                                    'message' => (string)$e,
                                ]);
          }
    }
   
}
