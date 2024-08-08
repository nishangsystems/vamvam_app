<?php

namespace App\Http\Controllers\Api\Leader;

# Models
use App\Models\RepresentativeAppointment;
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

class RepresentativeAppointmentController extends Controller
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
                            RepresentativeAppointment      $representativeAppointment
                        )
                        {
                            $this->executive                  = $executive;
                            $this->representativeAppointment  = $representativeAppointment;
                        }

  

    /** 
     * Appointment List 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function list(Request $request) 
    { 
       
        try 
           {
                $appointmentArray = [];
                DB::beginTransaction();
                
                    if($request->filter_by == 'today')
                    {
                       $lists = $this->representativeAppointment
                                     ->where('appointment_date',date('Y-m-d'))
                                     ->orderBy('id','desc')
                                     ->get();
                    }elseif($request->filter_by == 'upcomming'){
                       $lists = $this->representativeAppointment
                                     ->where('appointment_date','>',date('Y-m-d'))
                                     ->orderBy('id','desc')
                                     ->get();
                    }elseif($request->filter_by == 'past'){
                       $lists = $this->representativeAppointment
                                     ->where('appointment_date','<',date('Y-m-d'))
                                     ->orderBy('id','desc')
                                     ->get();
                    }else{
                       $lists = $this->representativeAppointment
                                     ->orderBy('id','desc')
                                     ->get();
                    }   
                    
                DB::commit();      
                        # return response if lists get
                        if($lists->isNotEmpty()) 
                        {
                            foreach($lists as $key => $value) 
                            {
                                $data['id']                = (string)$value->id ?? '';
                                $data['executive_id']      = (string)$value->executive_id ?? '';
                                $data['executive_name']    = $value->executiveInfo ? (string)$value->executiveInfo->name : '';
                                $data['reason']            = (string)$value->reason ?? '';
                                $data['description']       = (string)$value->description ?? '';
                                $data['appointment_date']  = (string)$value->appointment_date ?? '';
                                $data['appointment_time']  = (string)$value->appointment_time ?? '';
                                $data['status']            = (string)$value->status ?? '';
                                $data['status_string']     = (string)$value->status_string ?? '';
                                # push in array
                                array_push($appointmentArray, $data);
                            }
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->successStatus, 
                                                        'message'   => 'Appointment List',
                                                        'data'      =>  $appointmentArray
                                                    ]);
                        }else{
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->failedStatus, 
                                                        'message'   => 'Appointment Not Found!!',
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
     * @method to Status Change Appointment
     * 
     * @return 
     */
    public function statusChange(Request $request)
    {

        $rules = [ 
                   'appointment_id'  =>'required',
                   'leader_id'       =>'required',
                   'status'          =>'required',
                 ];

        $validator = Validator::make($request->all(), $rules);
       
        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors(),'code' => (string)$this->failedStatus]);            
        }


          try{
          
                $check = $this->representativeAppointment
                              ->where('id',$request->appointment_id)
                              ->first();
                $executive_id = $check->executive_id ?? 0;              

                if($check->status == 1)
                {
                   return response()->json([
                                    'code'    => (string)$this->failedStatus, 
                                    'message' => 'Sorry, this appointment already accepted',
                                ]); 
                }

                if($check->status == 2)
                {
                   return response()->json([
                                    'code'    => (string)$this->failedStatus, 
                                    'message' => 'Sorry, this appointment already rejected',
                                ]); 
                } 

                $check->status           = $request->status;             
                $check->reject_reason    = $request->reject_reason ?? null;             
                $check->action_leader_id = $request->leader_id ?? null;             
                $check->save();             
               
               $message = '';
               if($request->status == 1)
               {
                 return response()->json([
                                        'code'    => (string)$this->successStatus, 
                                        'message' => 'Appointment Accepted Successfully',
                                    ]);
                 $message = 'Your appointment has been accepted.'; 
               }elseif($request->status == 2){
                 return response()->json([
                                        'code'    => (string)$this->successStatus, 
                                        'message' => 'Appointment Rejected Successfully',
                                    ]);
                 $message = 'Your appointment has been rejected.'; 
               } 



                    $executive = $this->executive->where('id', $executive_id)->first();
                    #Notify executive for Order Successfully
                    $notifyRepresentative = new NotifyRepresentative();
                    # Set Title message
                    $title = 'Biaka Appointment Notification';
                    # Set Message
                    //$message = 'Your appointment has been booked successfully.';    
                     if($executive->device_type=='android')      
                      {
                        # Notify executive for android
                        $notifyRepresentative->notify($executive, $title, $message, '', 'representative_appointment');
                      }elseif($executive->device_type=='ios'){
                        # Notify executive for ios
                        $notifyRepresentative->iOS($executive, $title, $message, '', 'representative_appointment');
                      }

                      #store notification
                      storeNotification('executive','representative_appointment',$title, $message, 0,$executive->id);                      
                 
                

          }catch(\Exception $e)
          {
            return response()->json([
                                    'code'    => (string)$this->failedStatus, 
                                    'message' => (string)$e,
                                ]);
          }
    }
   
}
