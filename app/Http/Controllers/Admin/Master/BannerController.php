<?php

namespace App\Http\Controllers\Admin\Master;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use File;
use Validator;
use App\Models\Banner;
use App\Http\Traits\MessageStatusTrait;

class BannerController extends Controller
{
    use MessageStatusTrait;

    # Bind Type
    protected $type = 'Banner ';

    # Bind location
    protected $view = 'admin.banner.';

    # Bind banner
    protected $banner;

    /**
     * default constructor
     * @param
     * @return
     */
    function __construct(Banner $banner)
    {
        $this->banner = $banner;
        
    }
    public function index()
    {
        $banners = $this->banner->orderBy('id','desc')->get();
        # return to index page
        return view($this->view .'index')->with(['banners' =>$banners]);
    }
    public function store(Request $request)
    {

        $data = [ 
                  'image'           =>'required|max:1024'
                 ];

       
        $validator = Validator::make($request->all() , $data);
        if($validator->fails())
         {
            return response()->json([
                                      (string)$this->responseCode=>(string)$this->errorStatus, 
                                      (string)$this->responseMessage => $validator->messages()->first()
                                    ]);
         }


          try{

                # upload image1
                if ($request->hasfile('image'))
                {
                    $file        = $request->file('image');
                    $fullName    = $file->getClientOriginalName();
                    $extension   = $file->getClientOriginalExtension();
                    $filename    = ((string)(microtime(true)*10000)).'.'.$extension;
                    $file->move(public_path('images/banner/'), $filename);
                    $image = 'images/banner/'.$filename;
                }else{
                    $image = null;
                }

          
                $arrayData = [
                               'title'          => $request->title??null,
                               'image'          => $image??null,
                             ];  

            #store
            $create = Banner::create($arrayData);

            return response()->json([
                                        (string)$this->responseCode    => (string)$this->successStatus, 
                                        (string)$this->responseMessage => 'Banner Added Successfully',
                                    ]); 
                

          }catch(\Exception $e)
          {
            return response()->json([
                                    (string)$this->responseCode    => (string)$this->errorStatus, 
                                    (string)$this->responseMessage => (string)$e,
                                ]);
          }
       
    }
    public function editBanner($id)
    {
      
        # Fetch Banner by id
        $banner = Banner::where('id', $id)->first();
        return view($this->view . 'edit_banner')->with([
                                                         'banner' => $banner,
                                                       ]);
    }
    public function update(Request $request)
    {
       
        try {
                $bannerData = Banner::where('id',$request->id)->first();

                if ($request->hasfile('image'))
                {
                    if($bannerData->image){
                       $filename = public_path($bannerData->image);
                       if($filename) {
                        File::delete(public_path($bannerData->image));
                       }
                    }

                    $file        = $request->file('image');
                    $fullName    = $file->getClientOriginalName();
                    $extension   = $file->getClientOriginalExtension();
                    $filename    = ((string)(microtime(true)*10000)).'.'.$extension;
                    $file->move(public_path('images/banner/'), $filename);
                    $image = 'images/banner/'.$filename;

                }else{
                    $image = $bannerData->image;
                }
        
                $bannerData->title      = $request->title ?? null;
                $bannerData->image      = $image ?? null;
                $bannerData->update();

                return response()->json([
                        (string)$this->responseCode =>(string)$this->successStatus, 
                        (string)$this->responseMessage => 'Banner Updated Successfully!'
                    ]);                
               
            } catch (Exception $e) {
                return response()->json([
                                            (string)$this->responseCode =>(string)$this->errorStatus, 
                                            (string)$this->responseMessage => 'Something went wrong.'
                                        ]);  
            }
    }


    public function delete($id)
    {
        
        $query = Banner::where('id', $id)->first();

        if($query->image)
        {
             $filename = public_path($query->image);
             if($filename) {
                // unlink($filename);
                File::delete(public_path($query->image));
            }
        }
        # delete by id
        $query->delete();

        return [$this->successKey => $this->successStatus, $this->messageKey => 'Banner delete Successfully' ];
    }


      
}
