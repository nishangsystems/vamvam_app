<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use File;
use Validator;
use Hash;
use App\Models\Event;
use App\Http\Traits\MessageStatusTrait;

class EventController extends Controller
{
    use MessageStatusTrait;

    # Bind Type
    protected $type = 'Event ';

    # Bind location
    protected $view = 'admin.event.';

    # Bind event
    protected $event; 

    /**
     * default constructor
     * @param
     * @return
     */
    function __construct(
                            Event                        $event
                        )
                        {
                            $this->event                 = $event;
                        }
   
    
    public function index(Request $request)
    {
        # Fetch  
        $lists = $this->event
                      ->orderBy('id','desc')
                      ->get();

        return view($this->view . 'index')->with([
                                                   'lists' => $lists ?? [],
                                                ]);
    }

 
    public function create()
    {
        # return to create page
        return view($this->view .'create');
    }


  
    public function store(Request $request)
    {

        $rules = [ 
                   'title'             =>'required',
                   'description'       =>'required',
                   'address'           =>'required',
                   'start_date_time'   =>'required',
                   'end_date_time'     =>'required',
                 ];

        $validator = Validator::make($request->all(), $rules);
        if($validator->fails()){
            return response()->json([
                        (string)$this->responseCode=>(string)$this->errorStatus, 
                        (string)$this->responseMessage => (string)$validator->messages()->first()
                    ]);
        }


          try{

                if(date('Y-m-d H:i:s',strtotime($request->end_date_time)) <= date('Y-m-d H:i:s',strtotime($request->start_date_time)))
                {
                  return response()->json([
                        (string)$this->responseCode=>(string)$this->errorStatus, 
                        (string)$this->responseMessage => 'End date time can not be smaller than to start date time'
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
                                   'added_by'         => 'admin',
                                   'title'            => $request->title ?? null,
                                   'description'      => $request->description ?? null,
                                   'address'          => $request->address ?? null,
                                   'event_date'       => date('Y-m-d',strtotime($request->start_date_time)),
                                   'start_date_time'  => date('Y-m-d H:i:s',strtotime($request->start_date_time)) ?? null,
                                   'end_date_time'    => date('Y-m-d H:i:s',strtotime($request->end_date_time)) ?? null,
                                   'image'            => $image ?? null, 
                                   'video'            => $video ?? null, 
                                 ];     
                    #store
                    $create = $query->create($arrayData);

               
                return response()->json([
                                        (string)$this->responseCode    => (string)$this->successStatus, 
                                        (string)$this->responseMessage => 'Event Added Successfully',
                                        'responseUrl' => url('admin/event')
                                    ]); 
                

          }catch(\Exception $e)
          {
            return response()->json([
                                    (string)$this->responseCode    => (string)$this->errorStatus, 
                                    (string)$this->responseMessage => (string)$e,
                                ]);
          }
       
    }


    public function edit($id)
    {
        # Fetch  by id
        $event = $this->event
                      ->where('id', base64_decode($id))
                      ->first();

        return view($this->view . 'edit')->with([
                                                   'event'       => $event,
                                                ]);
    }



    public function update(Request $request)
    {

          $rules = [ 
                   'event_id'          =>'required',
                   'title'             =>'required',
                   'description'       =>'required',
                   'address'           =>'required',
                   'start_date_time'   =>'required',
                   'end_date_time'     =>'required',
                 ];
        $validator = Validator::make($request->all(), $rules);
        if($validator->fails()){
            return response()->json([
                        (string)$this->responseCode=>(string)$this->errorStatus, 
                        (string)$this->responseMessage => (string)$validator->messages()->first()
                    ]);
        }
           
        try {
                if(date('Y-m-d H:i:s',strtotime($request->end_date_time)) <= date('Y-m-d H:i:s',strtotime($request->start_date_time)))
                {
                  return response()->json([
                        (string)$this->responseCode=>(string)$this->errorStatus, 
                        (string)$this->responseMessage => 'End date time can not be smaller than to start date time'
                    ]);  
                }
                
                $event = $this->event->whereId(base64_decode($request->event_id))->first();

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
                        $image = $event->image;
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
                        $video = $event->video;
                    }

                # request param
                $arrayData = [
                               'title'            => $request->title ?? null,
                               'description'      => $request->description ?? null,
                               'address'          => $request->address ?? null,
                               'event_date'       => date('Y-m-d',strtotime($request->start_date_time)),
                               'start_date_time'  => date('Y-m-d H:i:s',strtotime($request->start_date_time)) ?? null,
                               'end_date_time'    => date('Y-m-d H:i:s',strtotime($request->end_date_time)) ?? null,
                               'end_date_time'    => $request->end_date_time ?? null, 
                               'image'            => $image ?? null, 
                               'video'            => $video ?? null, 
                             ];


                #update
                $this->event
                     ->whereId(base64_decode($request->event_id))
                     ->update($arrayData);
               
                return response()->json([
                        (string)$this->responseCode =>(string)$this->successStatus, 
                        (string)$this->responseMessage => 'Event Updated Successfully!',
                        'responseUrl' => url('admin/event')
                    ]);                
               
            } catch (Exception $e) {
                return response()->json([
                                            (string)$this->responseCode =>(string)$this->errorStatus, 
                                            (string)$this->responseMessage => 'Something went wrong.'
                                        ]);  
            }
    }


    


    public function status(Request $request,$id)
    {
        # get the status
        $status = Event::where('id', base64_decode($id))->first()->status;
        # check status, if active
        if ($status == '1')
        {
            #message
            $message = $this->inActiveMessage($this->type);
            # deactive( update status to zero)
            $statusCode = '0';
        }
        else
        {
            #message
            $message = $this->activeMessage($this->type);
            # active( update status to one)
            $statusCode = '1';
        }
        # update status code
        Event::where('id', base64_decode($id))->update(['status' => $statusCode]);

        # return success
        return [$this->successKey => $this->successStatus, $this->messageKey => $message];
    }

    
 
}