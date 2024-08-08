<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use File;
use Validator;
use Hash;
use App\Models\Leader;
use App\Http\Traits\MessageStatusTrait;

class LeaderController extends Controller
{
    use MessageStatusTrait;

    # Bind Type
    protected $type = 'Leader ';

    # Bind location
    protected $view = 'admin.leader.';

    # Bind leader
    protected $leader; 

    /**
     * default constructor
     * @param
     * @return
     */
    function __construct(
                            Leader                        $leader
                        )
                        {
                            $this->leader                 = $leader;
                        }
   
    
    public function index(Request $request)
    {
        # Fetch  
        $lists = $this->leader
                      ->where('is_delete', 0)
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
                   'aadhaar_card'  =>'required',
                   'name'          =>'required',
                   'mobile'        =>'required|digits:10',
                   'email'         =>'required',
                   //'password'      =>'required',
                 ];

        $validator = Validator::make($request->all(), $rules);
        if($validator->fails()){
            return response()->json([
                        (string)$this->responseCode=>(string)$this->errorStatus, 
                        (string)$this->responseMessage => (string)$validator->messages()->first()
                    ]);
        }


          try{

                     $emailCheck = $this->leader
                                        ->where('email', $request->email)
                                        ->where('is_delete', 0)
                                        ->first();
                     if($emailCheck)
                     {
                        return response()->json([
                            (string)$this->responseCode    => (string)$this->errorStatus, 
                            (string)$this->responseMessage => 'Sorry,This email already exists.',
                        ]);
                     } 


                    $mobileCheck = $this->leader
                                        ->where('mobile', $request->mobile)
                                        ->where('is_delete', 0)
                                        ->first();
                    if($mobileCheck)
                     {
                        return response()->json([
                            (string)$this->responseCode    => (string)$this->errorStatus, 
                            (string)$this->responseMessage => 'Sorry,This mobile already exists.',
                        ]);
                      }

                    if($request->voter_id != '')
                    {
                       $voterCheck = $this->leader
                                       ->where('voter_id', $request->voter_id)
                                       ->where('is_delete', 0)
                                       ->first();
                        if($voterCheck)
                        {
                            return response()->json([
                                (string)$this->responseCode    => (string)$this->errorStatus, 
                                (string)$this->responseMessage => 'Sorry,This voder id already exists.',
                            ]);
                        }  
                    }
                    

                    if($request->aadhaar_card != '')
                    {
                        $aadhaarCheck = $this->leader
                                             ->where('aadhaar_card', $request->aadhaar_card)
                                             ->where('is_delete', 0)
                                             ->first();
                        if($aadhaarCheck)
                        {
                            return response()->json([
                                (string)$this->responseCode    => (string)$this->errorStatus, 
                                (string)$this->responseMessage => 'Sorry,This aadhaar number already exists.',
                            ]);
                        }
                    }

                    $arrayData = [
                                    'leader_unique_id'=> rand(10000000,99999999),  
                                    'voter_id'      => $request->voter_id ?? null, 
                                    'aadhaar_card'  => $request->aadhaar_card ?? null,   
                                    'name'          => $request->name ?? null,   
                                    'mobile'        => $request->mobile ?? null, 
                                    'show_password' => $request->password,   
                                    'password'      => Hash::make(123456), 
                                    'email'         => $request->email ?? null,   
                                 ];  


                    #store
                    $leader = $this->leader::create($arrayData);

               
                return response()->json([
                                        (string)$this->responseCode    => (string)$this->successStatus, 
                                        (string)$this->responseMessage => 'Leader Added Successfully',
                                        'responseUrl' => url('admin/leader')
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
        $leader = $this->leader
                       ->where('id', base64_decode($id))
                       ->first();

        return view($this->view . 'edit')->with([
                                                   'leader'       => $leader,
                                                ]);
    }





    public function update(Request $request)
    {

         $rules = [ 
                   'aadhaar_card'  =>'required',
                   'name'          =>'required',
                   'email'         =>'required',
                   'mobile'        =>'required|digits:10',
                 ];
        $validator = Validator::make($request->all(), $rules);
        if($validator->fails()){
            return response()->json([
                        (string)$this->responseCode=>(string)$this->errorStatus, 
                        (string)$this->responseMessage => (string)$validator->messages()->first()
                    ]);
        }
           
        try {


                if($request->email != '')
                {
                     $emailCheck = $this->leader
                                       ->where('email', $request->email)
                                       ->where('id','!=',base64_decode($request->id))
                                       ->where('is_delete', 0)
                                       ->first();
                     if($emailCheck)
                     {
                        return response()->json([
                            (string)$this->responseCode    => (string)$this->errorStatus, 
                            (string)$this->responseMessage => 'Sorry,This email already exists.',
                        ]);
                     }  
                }


                $mobileCheck = $this->leader
                                    ->where('mobile', $request->mobile)
                                    ->where('id','!=',base64_decode($request->id))
                                    ->where('is_delete', 0)
                                    ->first();
                if($mobileCheck)
                 {
                    return response()->json([
                        (string)$this->responseCode    => (string)$this->errorStatus, 
                        (string)$this->responseMessage => 'Sorry,This mobile already exists.',
                    ]);
                }

                if($request->voter_id != '')
                {
                    $voterCheck = $this->leader
                                       ->where('voter_id', $request->voter_id)
                                       ->where('id','!=',base64_decode($request->id))
                                       ->where('is_delete', 0)
                                       ->first();
                    if($voterCheck)
                     {
                        return response()->json([
                            (string)$this->responseCode    => (string)$this->errorStatus, 
                            (string)$this->responseMessage => 'Sorry,This voder id already exists.',
                        ]);
                    }
                }    
                


                $aadhaarCheck = $this->leader
                                     ->where('aadhaar_card', $request->aadhaar_card)
                                     ->where('id','!=',base64_decode($request->id))
                                     ->where('is_delete', 0)
                                     ->first();
                if($aadhaarCheck)
                 {
                    return response()->json([
                        (string)$this->responseCode    => (string)$this->errorStatus, 
                        (string)$this->responseMessage => 'Sorry,This aadhaar number already exists.',
                    ]);
                }

                    $arrayData = [
                                    'leader_unique_id'=> rand(10000000,99999999),  
                                    'voter_id'      => $request->voter_id ?? null, 
                                    'aadhaar_card'  => $request->aadhaar_card ?? null,   
                                    'name'          => $request->name ?? null,   
                                    'mobile'        => $request->mobile ?? null, 
                                    'email'         => $request->email ?? null,   
                                 ];


                #update
                $this->leader
                     ->whereId(base64_decode($request->id))
                     ->update($arrayData);
               
                return response()->json([
                        (string)$this->responseCode =>(string)$this->successStatus, 
                        (string)$this->responseMessage => 'Leader Updated Successfully!',
                        'responseUrl' => url('admin/leader')
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
        $status = Leader::where('id', base64_decode($id))->first()->status;
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
        Leader::where('id', base64_decode($id))->update(['status' => $statusCode]);

        # return success
        return [$this->successKey => $this->successStatus, $this->messageKey => $message];
    }

    
 
}