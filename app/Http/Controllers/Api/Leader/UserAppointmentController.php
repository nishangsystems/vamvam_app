<?php

namespace App\Http\Controllers\Api\Leader;

# Models
use App\Models\UserAppointment;
use App\Models\Customer;

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

class UserAppointmentController extends Controller
{
    use StatusTrait;

    # Variable to Bind Model
    protected $customer;   
    protected $userAppointment;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
     function __construct(
                            Customer                      $customer,
                            UserAppointment               $userAppointment
                        )
                        {
                            $this->customer                  = $customer;
                            $this->userAppointment           = $userAppointment;
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
                       $lists = $this->userAppointment
                                     ->where('appointment_date',date('Y-m-d'))
                                     ->orderBy('id','desc')
                                     ->get();
                    }elseif($request->filter_by == 'upcomming'){
                       $lists = $this->userAppointment
                                     ->where('appointment_date','>',date('Y-m-d'))
                                     ->orderBy('id','desc')
                                     ->get();
                    }elseif($request->filter_by == 'past'){
                       $lists = $this->userAppointment
                                     ->where('appointment_date','<',date('Y-m-d'))
                                     ->orderBy('id','desc')
                                     ->get();
                    }else{
                       $lists = $this->userAppointment
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
                                $data['user_id']           = (string)$value->customer_id ?? '';
                                $data['customer_name']     = $value->customerInfo ? (string)$value->customerInfo->name : '';
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
                 ];

        $validator = Validator::make($request->all(), $rules);
       
        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors(),'code' => (string)$this->failedStatus]);            
        }


          try{
          
                $check = $this->userAppointment
                              ->where('id',$request->appointment_id)
                              ->first();

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


                    $customer = $this->customer->where('id', $customer_id)->first();
                    #Notify customer for Order Successfully
                    $notifyCustomer = new NotifyCustomer();
                    # Set Title message
                    $title = 'Biaka Appointment Notification';
                    # Set Message
                    //$message = 'Your appointment has been booked successfully.';    
                     if($customer->device_type=='android')      
                      {
                        # Notify customer for android
                        $notifyCustomer->notify($customer, $title, $message, '', 'customer_appointment');
                      }elseif($customer->device_type=='ios'){
                        # Notify customer for ios
                        $notifyCustomer->iOS($customer, $title, $message, '', 'customer_appointment');
                      }
                     #store notification
                     storeNotification('user','customer_appointment',$title, $message, 0,$customer->id);                       
                 
                

          }catch(\Exception $e)
          {
            return response()->json([
                                    'code'    => (string)$this->failedStatus, 
                                    'message' => (string)$e,
                                ]);
          }
    }
   
}
