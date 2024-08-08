<?php

namespace App\Http\Controllers\Api\Representative;

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
