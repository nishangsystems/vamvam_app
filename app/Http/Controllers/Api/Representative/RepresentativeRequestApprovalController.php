<?php

namespace App\Http\Controllers\Api\Representative;

# Models
use App\Models\Executive;
use App\Models\RepresentativeRequestApproval;

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


class RepresentativeRequestApprovalController extends Controller
{
    use StatusTrait;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
     function __construct(
                            Executive                     $executive,
                            RepresentativeRequestApproval $representativeRequestApproval
                        )
                        {
                            $this->executive                      = $executive;
                            $this->representativeRequestApproval  = $representativeRequestApproval;
                        }

  

    /**
     * @method to RepresentativeRequestApproval Store
     * 
     * @return 
     */
    public function store(Request $request)
    {
        $rules = [ 
                   'executive_id'   => 'required',
                   'complaint_id'   => 'required',
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
                                    'ticket_no'      => rand(10000000,99999999), 
                                    'executive_id'   => $request->executive_id, 
                                    'complaint_id'   => $request->complaint_id, 
                                    'ticket_date'    => date('Y-m-d'),
                                    'message'        => $request->message ?? '',
                                    'status'         => 0, 
                                 ];   
                    #store
                    $create=RepresentativeRequestApproval::create($arrayData);
                                                     
                return response()->json([
                                            'code'    => (string)$this->successStatus, 
                                            'message' => 'Request has been saved successfully',
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
     * RepresentativeRequestApproval List 
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
                $approvalArray = [];
                DB::beginTransaction();
                        if($request->filter_by == 'today')
                        {
                           $lists = $this->representativeRequestApproval
                                         ->where('executive_id',$request->executive_id)
                                         ->where('ticket_date',date('Y-m-d'))
                                         ->orderBy('id','desc')
                                         ->get();
                        }elseif($request->filter_by == 'upcomming'){
                           $lists = $this->representativeRequestApproval
                                         ->where('executive_id',$request->executive_id)
                                         ->where('ticket_date','>',date('Y-m-d'))
                                         ->orderBy('id','desc')
                                         ->get();
                        }elseif($request->filter_by == 'past'){
                           $lists = $this->representativeRequestApproval
                                         ->where('executive_id',$request->executive_id)
                                         ->where('ticket_date','<',date('Y-m-d'))
                                         ->orderBy('id','desc')
                                         ->get();
                        }else{
                           $lists = $this->representativeRequestApproval
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
                                $data['complaint_id']    = (string)$list->complaint_id ?? '';
                                $data['executive_id']    = (string)$list->executive_id ?? '';
                                $data['ticket_no']       = (string)$list->ticket_no ?? '';
                                $data['ticket_date']     = (string)$list->ticket_date ?? '';
                                $data['message']         = (string)$list->message ?? '';
                                $data['leader_id']       = (string)$list->leader_id ?? '';
                                $data['leader_name']     = $list->leaderInfo ? (string)$list->leaderInfo->name : '';
                                $data['reply_message']   = (string)$list->reply_message ?? '';
                                $data['status']          = (string)$list->status ?? '';
                                $data['status_string']   = (string)$list->status_string ?? '';

                                # push in array
                                array_push($approvalArray, $data);
                            }
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->successStatus, 
                                                        'message'   => 'Approval Request List',
                                                        'data'      =>  $approvalArray
                                                    ]);
                        }else{
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->failedStatus, 
                                                        'message'   => 'Approval Request Not Found!!',
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
