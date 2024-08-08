<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use File;
use Validator;
use Hash;
use App\Models\Executive;
use App\Models\ExecutiveAddress;
use App\Models\State;
use App\Models\District;
use App\Models\Tehsil;
use App\Models\PanchayatWard;
use App\Models\TownVillage;
use App\Models\Block;
use App\Models\Thana;
use App\Models\PostOffice;
use App\Models\AssemblyConstituency;
use App\Models\ParliamentaryConstituency;
use App\Models\Complaint;
use App\Models\Department;
use App\Models\IssueType;
use App\Http\Traits\MessageStatusTrait;

class ExecutiveController extends Controller
{
    use MessageStatusTrait;

    # Bind Type
    protected $type = 'Executive ';

    # Bind location
    protected $view = 'admin.executive.';

    # Bind executive
    protected $executive;   
    protected $executiveAddress;
    protected $tehsil;
    protected $state;
    protected $district;
    protected $assemblyConstituency;
    protected $parliamentaryConstituency;
    protected $complaint;
    protected $department;
    protected $issueType;

    /**
     * default constructor
     * @param
     * @return
     */
    function __construct(
                            State                         $state,
                            Tehsil                        $tehsil,
                            District                      $district,
                            Executive                     $executive,
                            Complaint                     $complaint,
                            Department                    $department,
                            IssueType                     $issueType,
                            ExecutiveAddress              $executiveAddress,
                            AssemblyConstituency          $assemblyConstituency,
                            ParliamentaryConstituency     $parliamentaryConstituency,
                        )
                        {
                            $this->state                     = $state;
                            $this->tehsil                    = $tehsil;
                            $this->district                  = $district;
                            $this->executive                 = $executive;
                            $this->complaint                  = $complaint;
                            $this->department                = $department;
                            $this->issueType                 = $issueType;
                            $this->executiveAddress          = $executiveAddress;
                            $this->assemblyConstituency      = $assemblyConstituency;
                            $this->parliamentaryConstituency = $parliamentaryConstituency;
                            
                        }
   
    
    public function index(Request $request)
    {
        # Fetch  
        $lists = $this->executive
                      ->where('is_delete', 0)
                      ->orderBy('id','desc')
                      ->get();

        return view($this->view . 'index')->with([
                                                   'lists' => $lists ?? [],
                                                ]);
    }

         /**
  * json responce of city executive by city id by ajax for dependent dropdown respons
  * @param
  * @return \Illuminate\Http\Response in json
  */
  public function jsonCityExecutive(Request $request)
  {
    $city_id = $request->city_id;
    # fetch executive 
    $executive = $this->executive
                     ->whereHas('addressInfo', function ($query) use($city_id){ 
                                                $query->where('city_village',$city_id);    
                                             })
                     ->select('id', 'name', 'mobile')
                     ->where('status',1)
                     ->where('is_delete', 0)
                     ->get();
    
    return response()->json(['executive'=>$executive]);                

  }



    public function create()
    {
        $states = State::get();
        # return to create page
        return view($this->view .'create')->with([
                                                   'states'   => $states ?? []
                                                 ]);
    }


  
    public function store(Request $request)
    {

        $rules = [ 
                   //'voter_id'      =>'required',
                   //'aadhaar_card'  =>'required',
                   'name'          =>'required',
                   'gender'        =>'required',
                   'dob'           =>'required',
                   'mobile'        =>'required|digits:10',
                   'email'         =>'required',
                   'password'      =>'required',
                   'state_id'      =>'required',
                 ];

        $validator = Validator::make($request->all(), $rules);
        if($validator->fails()){
            return response()->json([
                        (string)$this->responseCode=>(string)$this->errorStatus, 
                        (string)$this->responseMessage => (string)$validator->messages()->first()
                    ]);
        }


          try{

                     $emailCheck = $this->executive
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

                    $mobileCheck = $this->executive
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
                        $voterCheck = $this->executive
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
                        $aadhaarCheck = $this->executive
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

                    if($request->block_id != '')
                    {   
                        $block_id = $request->block_id;
                        $blockCheck = $this->executive
                                           ->whereHas('addressInfo', function ($query) use($block_id){ 
                                                $query->where('block_id',$block_id);    
                                             })
                                           ->where('is_delete', 0)
                                           ->first();
                        if($blockCheck)
                         {
                            return response()->json([
                                (string)$this->responseCode    => (string)$this->errorStatus, 
                                (string)$this->responseMessage => 'Sorry,This block already assigned.',
                            ]);
                        }
                    }

                    $arrayData = [
                                    'executive_unique_id'=> rand(10000000,99999999),  
                                    'voter_id'      => $request->voter_id ?? null, 
                                    'aadhaar_card'  => $request->aadhaar_card ?? null,   
                                    'name'          => $request->name ?? null,   
                                    'gender'        => $request->gender ?? null,   
                                    'dob'           => $request->dob ?? null,   
                                    //'age'           => $request->age ?? null,   
                                    'guardian_name' => $request->guardian_name ?? null,  
                                    'relation'      => $request->relation ?? null,   
                                    'mobile'        => $request->mobile ?? null, 
                                    'show_password' => $request->password,   
                                    'password'      => Hash::make($request->password), 
                                    'email'         => $request->email ?? null,   
                                 ];  


                    #store
                    $executive = $this->executive::create($arrayData);
                    
                    $arrayData2 = [
                                    'executive_id'     => $executive->id, 
                                    'state_id'         => $request->state_id ?? 0,   
                                    'district_id'      => $request->district_id ?? 0,   
                                    'tehsil_id'        => $request->tehsil_id ?? 0,   
                                    'area'             => $request->area ?? null,   
                                    'parliamentary_id' => $request->parliamentary_id ?? 0,   
                                    'assembly_id'      => $request->assembly_id ?? 0,
                                    'town_village_id'  => $request->town_village_id ?? 0,
                                    'panchayat_ward_id'=> $request->panchayat_ward_id ?? 0,
                                    'block_id'         => $request->block_id ?? 0,
                                    'thana_id'         => $request->thana_id ?? 0,
                                    'post_office_id'   => $request->post_office_id ?? 0,
                                    'locality'         => $request->locality ?? null,   
                                    'house_no'         => $request->house_no ?? null,   
                                    'pincode'          => $request->pincode ?? null,   
                                 ];             
                    #store
                    $this->executiveAddress::create($arrayData2); 
              
               
                return response()->json([
                                        (string)$this->responseCode    => (string)$this->successStatus, 
                                        (string)$this->responseMessage => 'Executive Added Successfully',
                                        'responseUrl' => url('admin/executive')
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
        $executive = $this->executive
                         ->where('id', base64_decode($id))
                         ->with('addressInfo')
                         ->first();
        $states = $this->state
                       ->get();
        $districts = $this->district
                          ->where('state_id',$executive->addressInfo->state_id)
                          ->where('status',1)
                          ->get();
        $parliamentaries = $this->parliamentaryConstituency
                                ->where('state_id',$executive->addressInfo->state_id)
                                ->where('status',1)
                                ->get();
        $assemblies = $this->assemblyConstituency
                           ->where('district_id',$executive->addressInfo->district_id)
                           ->where('status',1)
                           ->get();
        $tehsils = $this->tehsil
                        ->where('district_id',$executive->addressInfo->district_id)
                        ->where('status',1)
                        ->get();
        
        # fetch townVillage 
        $townVillage = TownVillage::where('tehsil_id',$executive->addressInfo->tehsil_id)
                                  ->select('id', 'name')
                                  ->where('status',1)
                                  ->get();
        # fetch PanchayatWard 
        $panchayatWard = PanchayatWard::where('tehsil_id',$executive->addressInfo->tehsil_id)
                                      ->select('id', 'name')
                                      ->where('status',1)
                                      ->get();
        # fetch block 
        $block = Block::where('tehsil_id',$executive->addressInfo->tehsil_id)
                      ->select('id', 'name')
                      ->where('status',1)
                      ->get();

        # fetch thana 
        $thana = Thana::where('tehsil_id',$executive->addressInfo->tehsil_id)
                      ->select('id', 'name')
                      ->where('status',1)
                      ->get();

        # fetch thana 
        $postOffice = PostOffice::where('tehsil_id',$executive->addressInfo->tehsil_id)
                                ->select('id', 'name')
                                ->where('status',1)
                                ->get();
             
       

        return view($this->view . 'edit')->with([
                                                   'states'          => $states ?? [],
                                                   'tehsils'         => $tehsils ?? [],
                                                   'executive'       => $executive,
                                                   'districts'       => $districts ?? [],
                                                   'assemblies'      => $assemblies ?? [],
                                                   'parliamentaries' => $parliamentaries ?? [],
                                                   'townVillages'    => $townVillage ?? [],
                                                   'panchayatWards'  => $panchayatWard ?? [],
                                                   'blocks'          => $block ?? [],
                                                   'thanas'          => $thana ?? [],
                                                   'postOffices'     => $postOffice ?? [],
                                                ]);
    }





    public function update(Request $request)
    {

         $rules = [ 
                   // 'voter_id'      =>'required',
                   // 'aadhaar_card'  =>'required',
                   'name'          =>'required',
                   'gender'        =>'required',
                   'dob'           =>'required',
                   'mobile'        =>'required|digits:10',
                   'state_id'      =>'required',
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
                     $emailCheck = $this->executive
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


                $mobileCheck = $this->executive
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
                    $voterCheck = $this->executive
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

                
                if($request->aadhaar_card != '')
                {
                    $aadhaarCheck = $this->executive
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
                }

                if($request->block_id != '')
                {
                    $block_id = $request->block_id;
                    $blockCheck = $this->executive
                                       ->whereHas('addressInfo', function ($query) use($block_id){ 
                                                $query->where('block_id',$block_id);    
                                             })
                                       ->where('id','!=',base64_decode($request->id))
                                       ->where('is_delete', 0)
                                       ->first();
                    if($blockCheck)
                     {
                        return response()->json([
                            (string)$this->responseCode    => (string)$this->errorStatus, 
                            (string)$this->responseMessage => 'Sorry,This block already assigned.',
                        ]);
                    }
                }



          
                $arrayData = [
                                'executive_unique_id'=> rand(10000000,99999999),  
                                'voter_id'      => $request->voter_id ?? null, 
                                'aadhaar_card'  => $request->aadhaar_card ?? null,   
                                'name'          => $request->name ?? null,   
                                'gender'        => $request->gender ?? null,   
                                'dob'           => $request->dob ?? null,   
                                'age'           => $request->age ?? null,   
                                'guardian_name' => $request->guardian_name ?? null,   
                                'relation'      => $request->relation ?? null,   
                                'mobile'        => $request->mobile ?? null, 
                                'email'         => $request->email ?? null,   
                             ];  


                #update
                $this->executive
                     ->whereId(base64_decode($request->id))
                     ->update($arrayData);


                $arrayData2 = [
                                'state_id'         => $request->state_id ?? 0,   
                                'district_id'      => $request->district_id ?? 0,   
                                'tehsil_id'        => $request->tehsil_id ?? 0,   
                                'area'             => $request->area ?? null,   
                                'parliamentary_id' => $request->parliamentary_id ?? 0,   
                                'assembly_id'      => $request->assembly_id ?? 0,
                                'town_village_id'  => $request->town_village_id ?? 0,
                                'panchayat_ward_id'=> $request->panchayat_ward_id ?? 0,
                                'block_id'         => $request->block_id ?? 0,
                                'thana_id'         => $request->thana_id ?? 0,
                                'post_office_id'   => $request->post_office_id ?? 0,
                                'locality'         => $request->locality ?? null,   
                                'house_no'         => $request->house_no ?? null,   
                                'pincode'          => $request->pincode ?? null,    
                             ];
                #update
                $this->executiveAddress
                     ->where('executive_id',base64_decode($request->id))
                     ->update($arrayData2);;


               
                return response()->json([
                        (string)$this->responseCode =>(string)$this->successStatus, 
                        (string)$this->responseMessage => 'Executive Updated Successfully!',
                        'responseUrl' => url('admin/executive')
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
        $status = Executive::where('id', base64_decode($id))->first()->status;
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
        Executive::where('id', base64_decode($id))->update(['status' => $statusCode]);

        # return success
        return [$this->successKey => $this->successStatus, $this->messageKey => $message];
    }

    
 
}