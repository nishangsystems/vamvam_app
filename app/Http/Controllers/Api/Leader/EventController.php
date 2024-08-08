<?php

namespace App\Http\Controllers\Api\Leader;

# Models
use App\Models\Leader;
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
    protected $leader;   
    protected $event;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
     function __construct(
                            Leader                 $leader,
                            Event                  $event
                        )
                        {
                            $this->leader          = $leader;
                            $this->event           = $event;
                        }

  

    /**
     * @method to Store event
     * 
     * @return 
     */
    public function store(Request $request)
    {

        $rules = [ 
                   'leader_id'         =>'required',
                   'title'             =>'required',
                   'description'       =>'required',
                   'address'           =>'required',
                   'start_date_time'   =>'required',
                   'end_date_time'     =>'required',
                 ];

        $validator = Validator::make($request->all(), $rules);
       
        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors(),'code' => (string)$this->failedStatus]);            
        }


          try{     
                if(date('Y-m-d H:i:s',strtotime($request->end_date_time)) <= date('Y-m-d H:i:s',strtotime($request->start_date_time)))
                {
                  return response()->json([
                        'code'=>(string)$this->failedStatus, 
                        'message' => 'End date time can not be smaller than to start date time'
                    ]);  
                }

                   $query = $this->event;

                    #upload image
                    if ($request->hasfile('image'))
                    {
                        $file = $request->file('image');
                        $extension = $file->getClientOriginalExtension(); // getting image extension
                        $filename =((string)(microtime(true)*10000)).'.'.$extension;
                        File::delete(public_path($query->image));
                        $file->move(public_path('images/event/'), $filename);
                        $image='images/event/'.$filename;
                    }else{
                        $image = null;
                    }

                    #upload video
                    if ($request->hasfile('video'))
                    {
                        $file = $request->file('video');
                        $extension = $file->getClientOriginalExtension(); // getting video extension
                        $filename =((string)(microtime(true)*10000)).'.'.$extension;
                        File::delete(public_path($query->video));
                        $file->move(public_path('images/event/'), $filename);
                        $video='images/event/'.$filename;
                    }else{
                        $video = null;
                    }
                   

                    # request param
                    $arrayData = [
                                   'leader_id'        => $request->leader_id ?? null,
                                   'added_by'         => 'leader',
                                   'title'            => $request->title ?? null,
                                   'description'      => $request->description ?? null,
                                   'address'          => $request->address ?? null,
                                   'event_date'       => date('Y-m-d',strtotime($request->start_date_time)),
                                   'start_date_time'  => $request->start_date_time ?? null,
                                   'end_date_time'    => $request->end_date_time ?? null, 
                                   'image'            => $image ?? null, 
                                   'video'            => $video ?? null, 
                                 ];     
                    #store
                    $create = $query->create($arrayData);
                                     
             
                       
                return response()->json([
                                        'code'    => (string)$this->successStatus, 
                                        'message' => 'Event Created Successfully',
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
