<?php

namespace App\Http\Controllers\Api\Leader;

# Models
use App\Models\Leader;
use App\Models\Appointment;

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

class AppointmentController extends Controller
{
    use StatusTrait;

    # Variable to Bind Model
    protected $leader;   
    protected $appointment;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
     function __construct(
                            Leader                       $leader,
                            Appointment                  $appointment
                        )
                        {
                            $this->leader                   = $leader;
                            $this->appointment              = $appointment;
                        }

  

    /**
     * @method to Store appointment
     * 
     * @return 
     */
    public function store(Request $request)
    {

        $rules = [ 
                   'leader_id'         =>'required',
                   'title'             =>'required',
                   'description'       =>'required',
                   'appointment_date'  =>'required',
                   'start_time'        =>'required',
                   'end_time'          =>'required',
                 ];

        $validator = Validator::make($request->all(), $rules);
       
        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors(),'code' => (string)$this->failedStatus]);            
        }


          try{     
                   
                   $query = $this->appointment;
                   # check the requested appointment already exist or not
                   $checkAppointment = $this->appointment
                                            ->where('appointment_date',$request->appointment_date)  
                                            ->where('start_time',$request->start_time)
                                            ->first();
                   
                   if($checkAppointment)
                    {   
                      return response()->json([
                                                'code'=>(string)$this->failedStatus, 
                                                'message' => 'Sorry,this time already appointment exist.'
                                              ]);  
                    }


                    # request param
                    $arrayData = [
                                   'leader_id'   => $request->leader_id ?? null,
                                   'title'       => $request->title ?? null,
                                   'description' => $request->description ?? null,
                                   'appointment_date'  => $request->appointment_date ?? null,
                                   'start_time'  => $request->start_time ?? null,
                                   'end_time'    => $request->end_time ?? null, 
                                 ];     
                    #store
                    $create = $query->create($arrayData);

                   
             
                       
                return response()->json([
                                        'code'    => (string)$this->successStatus, 
                                        'message' => 'Appointment Created Successfully',
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
        try 
           {
                $appointmentArray = [];
                
                    if($request->filter_by == 'today')
                    {
                       $lists = $this->appointment
                                     ->where('appointment_date',date('Y-m-d'))
                                     ->orderBy('id','desc')
                                     ->get();
                    }elseif($request->filter_by == 'upcomming'){
                       $lists = $this->appointment
                                     ->where('appointment_date','>',date('Y-m-d'))
                                     ->orderBy('id','desc')
                                     ->get();
                    }elseif($request->filter_by == 'past'){
                       $lists = $this->appointment
                                     ->where('appointment_date','<',date('Y-m-d'))
                                     ->orderBy('id','desc')
                                     ->get();
                    }else{
                       $lists = $this->appointment
                                     ->orderBy('id','desc')
                                     ->get();
                    }                


                if($lists->isNotEmpty()) 
                {
                    foreach ($lists as $key => $value) 
                    {
                        $data['id']         = (string)$value->id ?? '';
                        $data['title']      = (string)$value->title ?? '';
                        $data['description']= (string)$value->description ?? '';
                        $data['appointment_date']   = (string)$value->appointment_date ?? '';
                        $data['start_time'] = (string)$value->start_time ?? '';
                        $data['end_time']   = (string)$value->end_time ?? '';
                        
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



    

   
}
