<?php

namespace App\Http\Controllers\Api\Parent;

# Models
use App\Models\Event;

# Traits
use App\Http\Traits\StatusTrait;

# Vendor Classes
use DB;
use File;
use Validator;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth; 
use App\Http\Controllers\Controller; 
use Illuminate\Support\Facades\Hash;

class EventController extends Controller
{
    use StatusTrait;

    # Variable to Bind Model
    protected $event;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
     function __construct(
                            Event                  $event
                        )
                        {
                            $this->event           = $event;
                        }

  

    /** 
     * Event List 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function list(Request $request) 
    { 
        try 
           {
                $eventArray = [];
                DB::beginTransaction();
                if($request->filter_by == 'today')
                {
                   $lists = $this->event
                                 ->where('status',1)
                                 ->where('start_date_time','<=',date('Y-m-d H:i:s'))
                                 ->where('end_date_time','>=',date('Y-m-d H:i:s'))
                                 ->orderBy('id','desc')
                                 ->get();
                }elseif($request->filter_by == 'upcomming'){
                   $lists = $this->event  
                                 ->where('status',1)
                                 ->where('start_date_time','>',date('Y-m-d H:i:s'))
                                 //->where('end_date_time','<=',date('Y-m-d H:i:s'))
                                 ->orderBy('id','desc')
                                 ->get();
                }elseif($request->filter_by == 'past'){
                   $lists = $this->event
                                 ->where('status',1)
                                 ->where('end_date_time','<',date('Y-m-d H:i:s'))
                                 ->orderBy('id','desc')
                                 ->get();
                }else{
                   $lists = $this->event
                                 ->where('status',1)
                                 ->orderBy('id','desc')
                                 ->get();
                }
                 
                if($lists->isNotEmpty()) 
                {
                    foreach ($lists as $key => $value) 
                    {
                        $data['id']              = (string)$value->id ?? '';
                        $data['title']           = (string)$value->title ?? '';
                        $data['description']     = (string)$value->description ?? '';
                        $data['address']         = (string)$value->address ?? '';
                        $data['start_date_time'] = (string)$value->start_date_time ?? '';
                        $data['end_date_time']   = (string)$value->end_date_time ?? '';
                        $data['image']           = (string)$value->image ?? '';
                        $data['video']           = (string)$value->video ?? '';
                        $data['status']          = (string)$value->status ?? '';
                        
                        # push in array
                        array_push($eventArray, $data);
                    }

                        # return response
                        return response()->json([
                                                    'code'      => (string)$this->successStatus, 
                                                    'message'   => 'Event List',
                                                    'data'      =>  $eventArray
                                                ]);
                }else{
                    # return response
                    return response()->json([
                                                'code'      => (string)$this->failedStatus, 
                                                'message'   => 'Event Not Found!!',
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
