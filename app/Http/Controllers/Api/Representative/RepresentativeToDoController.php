<?php

namespace App\Http\Controllers\Api\Representative;

# Models
use App\Models\Executive;
use App\Models\RepresentativeToDo;

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


class RepresentativeToDoController extends Controller
{
    use StatusTrait;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
     function __construct(
                            Executive                     $executive,
                            RepresentativeToDo            $representativeToDo
                        )
                        {
                            $this->executive                 = $executive;
                            $this->representativeToDo        = $representativeToDo;
                        }

  

    /**
     * @method to ToDo Store
     * 
     * @return 
     */
    public function store(Request $request)
    {
        $rules = [ 
                   'executive_id'   => 'required',
                   'message'        => 'required',
                 ];

        $validator = Validator::make($request->all(), $rules);
       
        # If validator fails return response
        if ($validator->fails()) 
        { 
            return response()->json(['message'=>$validator->errors(),'code' => (string)$this->failedStatus]);            
        }


        try{
                    $arrayData = [
                                    'executive_id'   => $request->executive_id, 
                                    'title'          => $request->title, 
                                    'todo_date'      => date('Y-m-d'),
                                    'message'        => $request->message ?? '',
                                    'status'         => 0, 
                                 ];   
                    #store
                    $create=RepresentativeToDo::create($arrayData);
                                                     
                return response()->json([
                                            'code'    => (string)$this->successStatus, 
                                            'message' => 'ToDo has been saved successfully',
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
     * ToDo List 
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
                $toDoArray = [];
                DB::beginTransaction();
                    if($request->filter_date)
                    {    
                        $lists =  $this->representativeToDo
                                       ->where('executive_id',$request->executive_id)
                                       ->where('todo_date',$request->filter_date)
                                       ->orderBy('id','desc')
                                       ->get();
                    }else{
                        $lists =  $this->representativeToDo
                                       ->where('executive_id',$request->executive_id)
                                       ->orderBy('id','desc')
                                       ->get();
                    }                                                                               
                DB::commit();      
                        # return response if todo get
                        if($lists->isNotEmpty()) 
                        {
                            foreach($lists as $key => $list) 
                            {
                                $data['id']              = (string)$list->id ?? '';
                                $data['executive_id']    = (string)$list->executive_id ?? '';
                                $data['title']           = (string)$list->title ?? '';
                                $data['message']         = (string)$list->message ?? '';
                                $data['todo_date']       = (string)$list->todo_date ?? '';
                                $data['status']          = (string)$list->status ?? '';
                                # push in array
                                array_push($toDoArray, $data);
                            }
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->successStatus, 
                                                        'message'   => 'Todo List',
                                                        'data'      =>  $toDoArray
                                                    ]);
                        }else{
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->failedStatus, 
                                                        'message'   => 'Todo Not Found!!',
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
     * @method to ToDo Status Update
     * 
     * @return 
     */
    public function status(Request $request)
    {
        $rules = [ 
                   'executive_id'   => 'required',
                   'id'             => 'required',
                 ];

        $validator = Validator::make($request->all(), $rules);
       
        # If validator fails return response
        if ($validator->fails()) 
        { 
            return response()->json(['message'=>$validator->errors(),'code' => (string)$this->failedStatus]);            
        }


        try{
                    $checkToDo = RepresentativeToDo::find($request->id);
                    if($checkToDo)
                    {
                      if($checkToDo->status == 1)
                      {
                        return response()->json([
                                                'code'    => (string)$this->failedStatus, 
                                                'message' => 'Sorry, your task has been already completed',
                                             ]);
                      } 

                      $checkToDo->status = 1;
                      $checkToDo->save();

                      # return response
                      return response()->json([
                                                'code'      => (string)$this->successStatus, 
                                                'message'   => 'Your todo has been complete',
                                             ]);
                    }else{
                      return response()->json([
                                                'code'    => (string)$this->failedStatus, 
                                                'message' => 'Something Went Worng',
                                             ]);
                    }
            }catch(\Exception $e)
            {
                return response()->json([
                                            'code'    => (string)$this->failedStatus, 
                                            'message' => (string)$e,
                                        ]);
            }
    }

}
