<?php

namespace App\Http\Controllers\Admin\Master;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use File;
use Validator;
use App\Models\IssueType;
use App\Http\Traits\MessageStatusTrait;

class IssueTypeController extends Controller
{
    use MessageStatusTrait;

    # Bind Type
    protected $type = 'IssueType ';

    # Bind location
    protected $view = 'admin.master.issue_type.';

    # Bind issueType
    protected $issueType;

    /**
     * default constructor
     * @param
     * @return
     */
    function __construct(
                            IssueType  $issueType
                        )
                        {
                            $this->issueType    = $issueType;
                        }
   

    public function index()
    {
        $lists = $this->issueType
                      ->orderBy('id','desc')
                      ->get();
        # return to index page
        return view($this->view .'index')->with(['lists' =>$lists]);
    }

    public function create()
    {
        # return to create page
        return view($this->view .'create');
    }


    public function store(Request $request)
    {

        $rules = [ 
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

                $checkDuplicate = $this->issueType
                                       ->where('name',$request->name)
                                       ->first();
                if($checkDuplicate != '')
                {
                  return response()->json([
                                    (string)$this->responseCode    => (string)$this->errorStatus, 
                                    (string)$this->responseMessage => 'Sorry, this issue type already added',
                                ]);  
                }


                $arrayData = [
                                'name'          => $request->name ?? null, 
                             ];  

                #store
                $create = $this->issueType->create($arrayData);
               
                return response()->json([
                                        (string)$this->responseCode    => (string)$this->successStatus, 
                                        (string)$this->responseMessage => 'IssueType Added Successfully',
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
        $list = $this->issueType
                      ->where('id',$id)
                      ->orderBy('id','desc')
                      ->first();

        return view($this->view . 'edit')->with([
                                                   'list'     => $list,
                                                ]);
    }





    public function update(Request $request)
    {

         $rules = [ 
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

                $checkDuplicate = $this->issueType
                                       ->where('name',$request->name)
                                       ->where('id','!=',$request->id)
                                       ->first();
                if($checkDuplicate != '')
                {
                  return response()->json([
                                    (string)$this->responseCode    => (string)$this->errorStatus, 
                                    (string)$this->responseMessage => 'Sorry, this issue type already added',
                                ]);  
                }

          
                $arrayData = [
                                'name'         => $request->name ?? null,
                             ];  
               #update
                $this->issueType
                     ->whereId($request->id)
                     ->update($arrayData);

               
                return response()->json([
                        (string)$this->responseCode =>(string)$this->successStatus, 
                        (string)$this->responseMessage => 'IssueType Updated Successfully!',
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
        $status = $this->issueType
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
        $this->issueType
             ->where('id', base64_decode($id))
             ->update(['status' => $statusCode]);

        # return success
        return [$this->successKey => $this->successStatus, $this->messageKey => $message];
    }


   

   
    
}
