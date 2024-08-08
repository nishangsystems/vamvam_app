<?php

namespace App\Http\Controllers\Api\User;

# Models
use App\Models\State;
use App\Models\District;
use App\Models\Tehsil;
use App\Models\AssemblyConstituency;
use App\Models\ParliamentaryConstituency;
use App\Models\Department;
use App\Models\IssueType;
use App\Models\ContentManagement;
use App\Models\Banner;

use App\Models\PanchayatWard;
use App\Models\TownVillage;
use App\Models\Block;
use App\Models\Thana;
use App\Models\PostOffice;

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

class MasterController extends Controller
{
    use StatusTrait;

    # Bind customer
    protected $tehsil;
    protected $state;
    protected $district;    
    protected $assemblyConstituency;
    protected $parliamentaryConstituency;
    protected $department;
    protected $issueType;
    protected $contentManagement;
    protected $banner;
     
    /**
     * Create a new controller instance.
     *
     * @return void
     */
     function __construct(
                            State                         $state,
                            Tehsil                        $tehsil,
                            District                      $district,
                            Department                    $department,
                            IssueType                     $issueType,
                            Banner                        $banner,
                            AssemblyConstituency          $assemblyConstituency,
                            ParliamentaryConstituency     $parliamentaryConstituency,
                            ContentManagement             $contentManagement
                        )
                        {
                            $this->state                     = $state;
                            $this->tehsil                    = $tehsil;
                            $this->district                  = $district;
                            $this->department                = $department;
                            $this->issueType                 = $issueType;
                            $this->banner                    = $banner;
                            $this->assemblyConstituency      = $assemblyConstituency;
                            $this->parliamentaryConstituency = $parliamentaryConstituency;
                            $this->contentManagement         = $contentManagement;
                            
                        }



    /** 
     * Relation List 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function relation(Request $request) 
    { 
        try 
           {
                $relationArray = [];
                $relations = ['Father','Mother','Husband','Wife'];
                foreach($relations as $key => $relation) 
                {
                    $data['name']     = (string)$relation ?? '';
                    # push in array
                    array_push($relationArray, $data);
                }
                
                # return response
                return response()->json([
                                            'code'      => (string)$this->successStatus, 
                                            'message'   => 'Relation List',
                                            'data'      =>  $relationArray
                                        ]);
                        
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
     * State List 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function state(Request $request) 
    { 
        try 
           {
                $stateArray = [];
                DB::beginTransaction();
                    # get state
                    $states =  $this->state->where('country_id',101)->get();
                DB::commit();      
                        # return response if states get
                        if($states->isNotEmpty()) 
                        {
                            foreach($states as $key => $state) 
                            {
                                $data['id']       = (string)$state->id ?? '';
                                $data['name']     = (string)$state->name ?? '';
                                # push in array
                                array_push($stateArray, $data);
                            }
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->successStatus, 
                                                        'message'   => 'State List',
                                                        'data'      =>  $stateArray
                                                    ]);
                        }else{
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->failedStatus, 
                                                        'message'   => 'State Not Found!!',
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
     * District List 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function district(Request $request) 
    { 
        # Validate request data
        $validator = Validator::make($request->all(), [ 
            'state_id'     => 'required',
        ]);

        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors()->first(), 'code' => (string)$this->failedStatus]);            
        }

        try 
           {
                $districtArray = [];
                DB::beginTransaction();
                    # get district
                    $districts =  $this->district
                                       ->where('state_id',$request->state_id)
                                       ->where('status',1)
                                       ->get();
                DB::commit();      
                        # return response if districts get
                        if($districts->isNotEmpty()) 
                        {
                            foreach($districts as $key => $district) 
                            {
                                $data['id']       = (string)$district->id ?? '';
                                $data['state_id'] = (string)$district->state_id ?? '';
                                $data['name']     = (string)$district->name ?? '';
                                # push in array
                                array_push($districtArray, $data);
                            }
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->successStatus, 
                                                        'message'   => 'District List',
                                                        'data'      =>  $districtArray
                                                    ]);
                        }else{
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->failedStatus, 
                                                        'message'   => 'District Not Found!!',
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
     * Parliamentary List 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function parliamentary(Request $request) 
    { 
        # Validate request data
        $validator = Validator::make($request->all(), [ 
            'state_id'        => 'required',
        ]);

        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors()->first(), 'code' => (string)$this->failedStatus]);            
        }

        try 
           {
                $parliamentarieArray = [];
                DB::beginTransaction();
                    # get Parliamentarie
                    $parliamentaries =  $this->parliamentaryConstituency
                                    ->where('state_id',$request->state_id)
                                    ->where('status',1)
                                    ->get();
                DB::commit();      
                        # return response if parliamentaries get
                        if($parliamentaries->isNotEmpty()) 
                        {
                            foreach($parliamentaries as $key => $parliamentary) 
                            {
                                $data['id']          = (string)$parliamentary->id ?? '';
                                $data['state_id']    = (string)$parliamentary->state_id ?? '';
                                $data['name']        = (string)$parliamentary->name ?? '';
                                # push in array
                                array_push($parliamentarieArray, $data);
                            }
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->successStatus, 
                                                        'message'   => 'Parliamentary List',
                                                        'data'      =>  $parliamentarieArray
                                                    ]);
                        }else{
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->failedStatus, 
                                                        'message'   => 'Parliamentary Not Found!!',
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
     * assembly List 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function assembly(Request $request) 
    { 
        # Validate request data
        $validator = Validator::make($request->all(), [ 
            'state_id'        => 'required',
            'district_id'     => 'required',
        ]);

        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors()->first(), 'code' => (string)$this->failedStatus]);            
        }

        try 
           {
                $assemblyArray = [];
                DB::beginTransaction();
                    # get assemblies
                    $assemblies =  $this->assemblyConstituency
                                        ->where('state_id',$request->state_id)
                                        ->where('district_id',$request->district_id)
                                        ->where('status',1)
                                        ->get();
                DB::commit();      
                        # return response if assemblies get
                        if($assemblies->isNotEmpty()) 
                        {
                            foreach($assemblies as $key => $assembly) 
                            {
                                $data['id']          = (string)$assembly->id ?? '';
                                $data['state_id']    = (string)$assembly->state_id ?? '';
                                $data['district_id'] = (string)$assembly->district_id ?? '';
                                $data['name']        = (string)$assembly->name ?? '';
                                # push in array
                                array_push($assemblyArray, $data);
                            }
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->successStatus, 
                                                        'message'   => 'Assembly List',
                                                        'data'      =>  $assemblyArray
                                                    ]);
                        }else{
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->failedStatus, 
                                                        'message'   => 'Assembly Not Found!!',
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
     * Tehsil List 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function tehsil(Request $request) 
    { 
        # Validate request data
        $validator = Validator::make($request->all(), [ 
            'state_id'        => 'required',
            'district_id'     => 'required',
        ]);

        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors()->first(), 'code' => (string)$this->failedStatus]);            
        }

        try 
           {
                $tehsilArray = [];
                DB::beginTransaction();
                    # get tehsil
                    $tehsils =  $this->tehsil
                                     ->where('state_id',$request->state_id)
                                     ->where('district_id',$request->district_id)
                                     ->where('status',1)
                                     ->get();
                DB::commit();      
                        # return response if tehsils get
                        if($tehsils->isNotEmpty()) 
                        {
                            foreach($tehsils as $key => $tehsil) 
                            {
                                $data['id']          = (string)$tehsil->id ?? '';
                                $data['state_id']    = (string)$tehsil->state_id ?? '';
                                $data['district_id'] = (string)$tehsil->district_id ?? '';
                                $data['name']        = (string)$tehsil->name ?? '';
                                # push in array
                                array_push($tehsilArray, $data);
                            }
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->successStatus, 
                                                        'message'   => 'Tehsil List',
                                                        'data'      =>  $tehsilArray
                                                    ]);
                        }else{
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->failedStatus, 
                                                        'message'   => 'Tehsil Not Found!!',
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
     * TownVillage List 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function townVillage(Request $request) 
    { 
        # Validate request data
        $validator = Validator::make($request->all(), [ 
            'tehsil_id'        => 'required',
        ]);

        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors()->first(), 'code' => (string)$this->failedStatus]);            
        }

        try 
           {
                $townVillageArray = [];
                DB::beginTransaction();
                    # get TownVillage
                    $townVillages =  TownVillage::where('tehsil_id',$request->tehsil_id)
                                                ->where('status',1)
                                                ->get();
                DB::commit();      
                        # return response if townVillages get
                        if($townVillages->isNotEmpty()) 
                        {
                            foreach($townVillages as $key => $townVillage) 
                            {
                                $data['id']          = (string)$townVillage->id ?? '';
                                $data['state_id']    = (string)$townVillage->state_id ?? '';
                                $data['district_id'] = (string)$townVillage->district_id ?? '';
                                $data['tehsil_id']   = (string)$townVillage->tehsil_id ?? '';
                                $data['name']        = (string)$townVillage->name ?? '';
                                # push in array
                                array_push($townVillageArray, $data);
                            }
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->successStatus, 
                                                        'message'   => 'TownVillage List',
                                                        'data'      =>  $townVillageArray
                                                    ]);
                        }else{
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->failedStatus, 
                                                        'message'   => 'TownVillage Not Found!!',
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
     * PanchayatWard List 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function panchayatWard(Request $request) 
    { 
        # Validate request data
        $validator = Validator::make($request->all(), [ 
            'tehsil_id'        => 'required',
        ]);

        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors()->first(), 'code' => (string)$this->failedStatus]);            
        }

        try 
           {
                $panchayatWardArray = [];
                DB::beginTransaction();
                    # get panchayatWard
                    $panchayatWards =  PanchayatWard::where('tehsil_id',$request->tehsil_id)
                                                    ->where('status',1)
                                                    ->get();
                DB::commit();      
                        # return response if panchayatWards get
                        if($panchayatWards->isNotEmpty()) 
                        {
                            foreach($panchayatWards as $key => $panchayatWard) 
                            {
                                $data['id']          = (string)$panchayatWard->id ?? '';
                                $data['state_id']    = (string)$panchayatWard->state_id ?? '';
                                $data['district_id'] = (string)$panchayatWard->district_id ?? '';
                                $data['tehsil_id']   = (string)$panchayatWard->tehsil_id ?? '';
                                $data['name']        = (string)$panchayatWard->name ?? '';
                                # push in array
                                array_push($panchayatWardArray, $data);
                            }
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->successStatus, 
                                                        'message'   => 'Panchayat Ward List',
                                                        'data'      =>  $panchayatWardArray
                                                    ]);
                        }else{
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->failedStatus, 
                                                        'message'   => 'Panchayat Ward Not Found!!',
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
     * Block List 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function block(Request $request) 
    { 
        # Validate request data
        $validator = Validator::make($request->all(), [ 
            'tehsil_id'        => 'required',
        ]);

        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors()->first(), 'code' => (string)$this->failedStatus]);            
        }

        try 
           {
                $blockArray = [];
                DB::beginTransaction();
                    # get block
                    $blocks =  Block::where('tehsil_id',$request->tehsil_id)
                                    ->where('status',1)
                                    ->get();
                DB::commit();      
                        # return response if blocks get
                        if($blocks->isNotEmpty()) 
                        {
                            foreach($blocks as $key => $block) 
                            {
                                $data['id']          = (string)$block->id ?? '';
                                $data['state_id']    = (string)$block->state_id ?? '';
                                $data['district_id'] = (string)$block->district_id ?? '';
                                $data['tehsil_id']   = (string)$block->tehsil_id ?? '';
                                $data['name']        = (string)$block->name ?? '';
                                # push in array
                                array_push($blockArray, $data);
                            }
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->successStatus, 
                                                        'message'   => 'Block List',
                                                        'data'      =>  $blockArray
                                                    ]);
                        }else{
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->failedStatus, 
                                                        'message'   => 'Block Not Found!!',
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
     * Thana List 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function thana(Request $request) 
    { 
        # Validate request data
        $validator = Validator::make($request->all(), [ 
            'tehsil_id'        => 'required',
        ]);

        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors()->first(), 'code' => (string)$this->failedStatus]);            
        }

        try 
           {
                $thanaArray = [];
                DB::beginTransaction();
                    # get Thana
                    $thanas =  Thana::where('tehsil_id',$request->tehsil_id)
                                    ->where('status',1)
                                    ->get();
                DB::commit();      
                        # return response if thanas get
                        if($thanas->isNotEmpty()) 
                        {
                            foreach($thanas as $key => $thana) 
                            {
                                $data['id']          = (string)$thana->id ?? '';
                                $data['state_id']    = (string)$thana->state_id ?? '';
                                $data['district_id'] = (string)$thana->district_id ?? '';
                                $data['tehsil_id']   = (string)$thana->tehsil_id ?? '';
                                $data['name']        = (string)$thana->name ?? '';
                                # push in array
                                array_push($thanaArray, $data);
                            }
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->successStatus, 
                                                        'message'   => 'Thana List',
                                                        'data'      =>  $thanaArray
                                                    ]);
                        }else{
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->failedStatus, 
                                                        'message'   => 'Thana Not Found!!',
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
     * postOffice List 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function postOffice(Request $request) 
    { 
        # Validate request data
        $validator = Validator::make($request->all(), [ 
            'tehsil_id'        => 'required',
        ]);

        # If validator fails return response
        if ($validator->fails()) { 
            return response()->json(['message'=>$validator->errors()->first(), 'code' => (string)$this->failedStatus]);            
        }

        try 
           {
                $postOfficeArray = [];
                DB::beginTransaction();
                    # get postOffice
                    $postOffices =  PostOffice::where('tehsil_id',$request->tehsil_id)
                                              ->where('status',1)
                                              ->get();
                DB::commit();      
                        # return response if postOffices get
                        if($postOffices->isNotEmpty()) 
                        {
                            foreach($postOffices as $key => $postOffice) 
                            {
                                $data['id']          = (string)$postOffice->id ?? '';
                                $data['state_id']    = (string)$postOffice->state_id ?? '';
                                $data['district_id'] = (string)$postOffice->district_id ?? '';
                                $data['tehsil_id']   = (string)$postOffice->tehsil_id ?? '';
                                $data['name']        = (string)$postOffice->name ?? '';
                                # push in array
                                array_push($postOfficeArray, $data);
                            }
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->successStatus, 
                                                        'message'   => 'PostOffice List',
                                                        'data'      =>  $postOfficeArray
                                                    ]);
                        }else{
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->failedStatus, 
                                                        'message'   => 'PostOffice Not Found!!',
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
     * Department List 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function department(Request $request) 
    { 
       
        try 
           {
                $departmentArray = [];
                DB::beginTransaction();
                    # get departments
                    $departments =  $this->department
                                         ->where('status',1)
                                         ->get();
                DB::commit();      
                        # return response if departments get
                        if($departments->isNotEmpty()) 
                        {
                            foreach($departments as $key => $department) 
                            {
                                $data['id']          = (string)$department->id ?? '';
                                $data['name']        = (string)$department->name ?? '';
                                # push in array
                                array_push($departmentArray, $data);
                            }
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->successStatus, 
                                                        'message'   => 'Department List',
                                                        'data'      =>  $departmentArray
                                                    ]);
                        }else{
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->failedStatus, 
                                                        'message'   => 'Department Not Found!!',
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
     * IssueType List 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function issueType(Request $request) 
    { 
       
        try 
           {
                $issueTypeArray = [];
                DB::beginTransaction();
                    # get issueTypes
                    $issueTypes =  $this->issueType
                                        ->where('status',1)
                                        ->get();
                DB::commit();      
                        # return response if issueTypes get
                        if($issueTypes->isNotEmpty()) 
                        {
                            foreach($issueTypes as $key => $issueType) 
                            {
                                $data['id']          = (string)$issueType->id ?? '';
                                $data['name']        = (string)$issueType->name ?? '';
                                # push in array
                                array_push($issueTypeArray, $data);
                            }
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->successStatus, 
                                                        'message'   => 'IssueType List',
                                                        'data'      =>  $issueTypeArray
                                                    ]);
                        }else{
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->failedStatus, 
                                                        'message'   => 'IssueType Not Found!!',
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
     * Banner List 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function banner(Request $request) 
    { 
        try 
           {
                $bannerArray = [];
                DB::beginTransaction();
                    # get banner
                    $banners =  $this->banner->get();
                DB::commit();      
                        # return response if banners get
                        if($banners->isNotEmpty()) 
                        {
                            foreach($banners as $key => $banner) 
                            {
                                $data['id']       = (string)$banner->id ?? '';
                                $data['image']    = (string)$banner->image ?? '';
                                # push in array
                                array_push($bannerArray, $data);
                            }
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->successStatus, 
                                                        'message'   => 'Banner List',
                                                        'data'      =>  $bannerArray
                                                    ]);
                        }else{
                            # return response
                            return response()->json([
                                                        'code'      => (string)$this->failedStatus, 
                                                        'message'   => 'Banner Not Found!!',
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

///////////////////////////////////

}
