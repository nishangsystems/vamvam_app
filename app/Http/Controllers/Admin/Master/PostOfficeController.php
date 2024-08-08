<?php

namespace App\Http\Controllers\Admin\Master;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use File;
use Validator;
use App\Models\State;
use App\Models\District;
use App\Models\Tehsil;
use App\Models\PostOffice;
use App\Http\Traits\MessageStatusTrait;

class PostOfficeController extends Controller
{
    use MessageStatusTrait;

    # Bind Type
    protected $type = 'PostOffice ';

    # Bind location
    protected $view = 'admin.master.postOffice.';

    # Bind tehsil
    protected $tehsil;
    protected $state;
    protected $district;
    protected $postOffice;

    /**
     * default constructor
     * @param
     * @return
     */
    function __construct(
                            State       $state,
                            Tehsil      $tehsil,
                            District    $district,
                            PostOffice       $postOffice,
                        )
                        {
                            $this->state       = $state;
                            $this->tehsil      = $tehsil;
                            $this->district    = $district;
                            $this->postOffice       = $postOffice;
                        }
   

    public function index()
    {
        $lists = $this->postOffice
                      ->orderBy('id','desc')
                      ->get();
        # return to index page
        return view($this->view .'index')->with(['lists' =>$lists]);
    }

    public function create()
    {
        $states = $this->state
                       ->orderBy('name','asc')
                       ->get();
        # return to create page
        return view($this->view .'create')->with([
                                                   'states' => $states ?? [],
                                                 ]);
    }


    public function store(Request $request)
    {

        $rules = [ 
                   'state_id'      =>'required',
                   'district_id'   =>'required',
                   'tehsil_id'     =>'required',
                   'name'          =>'required|max:100',
                 ];

        $validator = Validator::make($request->all(), $rules);
        if($validator->fails()){
            return response()->json([
                        (string)$this->responseCode=>(string)$this->errorStatus, 
                        (string)$this->responseMessage => (string)$validator->messages()->first()
                    ]);
        }


          try{

                $checkDuplicate = $this->postOffice
                                       ->where('state_id',$request->state_id)
                                       ->where('district_id',$request->district_id)
                                       ->where('tehsil_id',$request->tehsil_id)
                                       ->where('name',$request->name)
                                       ->first();
                if($checkDuplicate != '')
                {
                  return response()->json([
                                    (string)$this->responseCode    => (string)$this->errorStatus, 
                                    (string)$this->responseMessage => 'Sorry, this post office already added',
                                ]);  
                }


                $arrayData = [
                                'state_id'      => $request->state_id ?? 0,  
                                'district_id'   => $request->district_id ?? 0,  
                                'tehsil_id'     => $request->tehsil_id ?? 0,  
                                'name'          => $request->name ?? null, 
                             ];  

                #store
                $create = $this->postOffice->create($arrayData);
               
                return response()->json([
                                        (string)$this->responseCode    => (string)$this->successStatus, 
                                        (string)$this->responseMessage => 'Post Office Added Successfully',
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
        $list = $this->postOffice
                     ->where('id',$id)
                     ->orderBy('id','desc')
                     ->first();

        $states = $this->state
                       ->orderBy('name','asc')
                       ->get();
        $districts = $this->district
                          ->where('state_id',$list->state_id)
                          ->orderBy('name','asc')
                          ->get();
        $tehsils = $this->tehsil
                        ->where('state_id',$list->state_id)
                        ->where('district_id',$list->district_id)
                        ->orderBy('name','asc')
                        ->get();
        return view($this->view . 'edit')->with([
                                                   'list'     => $list,
                                                   'states'   => $states ?? [],
                                                   'districts'=> $districts ?? [],
                                                   'tehsils'  => $tehsils ?? [],
                                                ]);
    }





    public function update(Request $request)
    {

         $rules = [ 
                    'state_id'     =>'required',
                    'district_id'  =>'required',
                    'tehsil_id'    =>'required',
                    'name'         =>'required|max:100',
                  ];
        $validator = Validator::make($request->all(), $rules);
        if($validator->fails()){
            return response()->json([
                        (string)$this->responseCode=>(string)$this->errorStatus, 
                        (string)$this->responseMessage => (string)$validator->messages()->first()
                    ]);
        }
           
        try {

                $checkDuplicate = $this->postOffice
                                       ->where('state_id',$request->state_id)
                                       ->where('district_id',$request->district_id)
                                       ->where('tehsil_id',$request->tehsil_id)
                                       ->where('name',$request->name)
                                       ->where('id','!=',$request->id)
                                       ->first();
                if($checkDuplicate != '')
                {
                  return response()->json([
                                    (string)$this->responseCode    => (string)$this->errorStatus, 
                                    (string)$this->responseMessage => 'Sorry, this post office already added',
                                ]);  
                }

          
                $arrayData = [
                                'state_id'     => $request->state_id ?? 0,  
                                'district_id'  => $request->district_id ?? 0,  
                                'tehsil_id'    => $request->tehsil_id ?? 0,  
                                'name'         => $request->name ?? null,
                             ];  
               #update
                $this->postOffice
                     ->whereId($request->id)
                     ->update($arrayData);

               
                return response()->json([
                        (string)$this->responseCode =>(string)$this->successStatus, 
                        (string)$this->responseMessage => 'Post Office Updated Successfully!',
                    ]);                
               
            } catch (Exception $e) {
                return response()->json([
                                            (string)$this->responseCode =>(string)$this->errorStatus, 
                                            (string)$this->responseMessage => $e
                                        ]);  
            }
    }


    


    public function status(Request $request,$id)
    {
        # get the status
        $status = $this->postOffice
                       ->where('id', base64_decode($id))
                       ->first()
                       ->status;
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
        $this->postOffice
             ->where('id', base64_decode($id))
             ->update(['status' => $statusCode]);

        # return success
        return [$this->successKey => $this->successStatus, $this->messageKey => $message];
    }


    /**
     * delete tehsil
     * @param $id
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        $query = $this->postOffice;

        # delete tehsil by id
        $query->where('id', $id)->delete();

        # return success
        return [$this->successKey => $this->successStatus, $this->messageKey => $this->deleteMessage($this->type) ];
    }




   
    
}
