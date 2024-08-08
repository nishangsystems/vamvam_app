<?php

namespace App\Http\Controllers\Api\Representative;

# Models
use App\Models\RepresentativeAppointment;
use App\Models\Executive;
use App\Models\Leader;

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
use App\Http\Controllers\Api\Leader\NotifyLeader;

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
                            Executive                     $executive,
                            RepresentativeAppointment     $representativeAppointment
                        )
                        {
                            $this->executive                 = $executive;
                            $this->representativeAppointment = $representativeAppointment;
                        }

  

    /**
     * @method to Register Appointment
     * 
     * @return 
     */
    public function store(Request $request)
    {

        $rules = [ 
                   'executive_id'      =>'required',
                   'appointment_date'  =>'required',
                   'appointment_time'  =>'required',
                   'reason'            =>'required',
                 ];

        $validator = Validator::make($request->all(), $rules);
       
        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors(),'code' => (string)$this->failedStatus]);            
        }


          try{
          
                $arrayData = [
                                'executive_id'      => $request->executive_id ?? null, 
                                'reason'            => $request->reason ?? null,   
                                'description'       => $request->description ?? null,   
                                'appointment_date'  => $request->appointment_date ?? null, 
                                'appointment_time'  => $request->appointment_time ?? null, 
                                'status'            => 0, 
                             ];


                #store
                $create = $this->representativeAppointment::create($arrayData);


                    $executive = $this->executive->where('id', $request->get('executive_id'))->first();
                    #Notify executive for Order Successfully
                    $notifyRepresentative = new NotifyRepresentative();
                    # Set Title message
                    $title = 'Biaka Appointment Notification';
                    # Set Message
                    $message = 'Your appointment has been booked successfully.';    
                     if($executive->device_type=='android')      
                      {
                        # Notify executive for android
                        $notifyRepresentative->notify($executive, $title, $message, '', 'appointment');
                      }elseif($executive->device_type=='ios'){
                        # Notify executive for ios
                        $notifyRepresentative->iOS($executive, $title, $message, '', 'appointment');
                      } 

                      #store notification
                      storeNotification('executive','appointment',$title, $message, 0,$executive->id);
            
                    
                    $leaders = Leader::where('status', 1)->get();
                    foreach ($leaders as $key => $leader) 
                    {
                      #Notify leader for Order Successfully
                      $notifyLeader = new NotifyLeader();
                      # Set Title message
                      $title = 'Biaka Appointment Notification';
                      # Set Message
                      $message = 'New appointment received.';    
                        if($leader->device_type=='android')      
                        {
                          # Notify leader for android
                          $notifyLeader->notify($leader, $title, $message, '', 'appointment');
                        }elseif($leader->device_type=='ios'){
                          # Notify leader for ios
                          $notifyLeader->iOS($leader, $title, $message, '', 'appointment');
                        } 

                        #store notification
                        storeNotification('leader','appointment',$title, $message, 0,$leader->id);
                    }
               
                return response()->json([
                                        'code'    => (string)$this->successStatus, 
                                        'message' => 'Appointment Booked Successfully',
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
     * Appointment List 
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
                $appointmentArray = [];
                DB::beginTransaction();
                
                    if($request->filter_by == 'today')
                    {
                       $lists = $this->representativeAppointment
                                     ->where('appointment_date',date('Y-m-d'))
                                     ->where('executive_id',$request->executive_id)
                                     ->orderBy('id','desc')
                                     ->get();
                    }elseif($request->filter_by == 'upcomming'){
                       $lists = $this->representativeAppointment
                                     ->where('appointment_date','>',date('Y-m-d'))
                                     ->where('executive_id',$request->executive_id)
                                     ->orderBy('id','desc')
                                     ->get();
                    }elseif($request->filter_by == 'past'){
                       $lists = $this->representativeAppointment
                                     ->where('appointment_date','<',date('Y-m-d'))
                                     ->where('executive_id',$request->executive_id)
                                     ->orderBy('id','desc')
                                     ->get();
                    }else{
                       $lists = $this->representativeAppointment
                                     ->where('executive_id',$request->executive_id)
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
     * @method to Delete Appointment
     * 
     * @return 
     */
    public function delete(Request $request)
    {

        $rules = [ 
                   'executive_id'    =>'required',
                   'appointment_id'  =>'required',
                 ];

        $validator = Validator::make($request->all(), $rules);
       
        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors(),'code' => (string)$this->failedStatus]);            
        }


          try{
          
                $this->representativeAppointment
                     ->where('id',$request->appointment_id)
                     ->where('executive_id',$request->executive_id)
                     ->delete();
            
               
                return response()->json([
                                        'code'    => (string)$this->successStatus, 
                                        'message' => 'Appointment Delete Successfully',
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
