<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use File;
use Validator;
use App\Models\OurService;
use App\Models\OurSubService;
use App\Http\Traits\MessageStatusTrait;

class OurServiceController extends Controller
{
    use MessageStatusTrait;

    # Bind Type
    protected $type = 'OurService ';

    # Bind location
    protected $view = 'admin.our_service.';

    # Bind
    protected $ourService;

    /**
     * default constructor
     * @param
     * @return
     */
    function __construct(OurService $ourService)
    {
        $this->ourService = $ourService;
        
    }
    public function index()
    {
        $ourServices = $this->ourService->orderBy('sequence','asc')->get();
        # return to index page
        return view($this->view .'index')->with(['ourServices' =>$ourServices]);
    }
    public function store(Request $request)
    {

        $rules = [ 
                  'title'         =>'required|max:100',
                  'description'   =>'required|max:50',
                  'type'          =>'required',
                  'display_on_banner'   =>'required',
                  'image'         =>'required|max:1024',
                  'sequence'      =>'required',
                 ];

       
        $messages = [ 'required' => 'The :attribute field is required.'];
        $validator = Validator::make($request->all(), $rules, $messages);
        if($validator->fails()){
            return response()->json([
                        (string)$this->responseCode=>(string)$this->errorStatus, 
                        (string)$this->responseMessage => (string)$validator->messages()->first()
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
                    $file->move(public_path('images/ourservice/'), $filename);
                    $image = 'images/ourservice/'.$filename;
                }else{
                    $image = null;
                }

            

                $arrayData = [
                                'title'              => $request->title ?? null,  
                                'description'        => $request->description ?? null,   
                                'display_on_banner'        => $request->display_on_banner ?? null,   
                                'type'        => $request->type ?? null,   
                                'sequence'        => $request->sequence ?? null,   
                                'image'              => $image??null,
                             ];  

            #store
            $create = OurService::create($arrayData);
            
            $slug = strtolower(preg_replace('/[^a-zA-Z0-9_.]/', '-', $request->title));
            $final_slug = preg_replace('/_+/', '-', $slug).'-'.base64_encode($create->id);
            #update 
            OurService::where('id', $create->id)->update(['slug_name' => $final_slug]);

            return response()->json([
                                        (string)$this->responseCode    => (string)$this->successStatus, 
                                        (string)$this->responseMessage => 'Data Added Successfully',
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
        $ourService = OurService::where('id', $id)->first();
        $ourSubService = OurSubService::where('service_id', $id)->get();
        return view($this->view . 'edit')->with([
                                                 'ourService' => $ourService,
                                                 'ourSubService' => $ourSubService,
                                               ]);
    }
    public function update(Request $request)
    {

         $rules = [ 

                  'title'         =>'required|max:100',
                  'description'   =>'required|max:50',
                  //'assign_sub_service' =>'required',
                  'type'              =>'required',
                  'display_on_banner' =>'required',
                  'sequence' =>'required',
                 ];
        $messages = [ 'required' => 'The :attribute field is required.'];
        $validator = Validator::make($request->all(), $rules, $messages);
        if($validator->fails()){
            return response()->json([
                        (string)$this->responseCode=>(string)$this->errorStatus, 
                        (string)$this->responseMessage => (string)$validator->messages()->first()
                    ]);
        }
           
        try {


                $ourServiceData = OurService::where('id',$request->id)->first();

                $slug = strtolower(preg_replace('/[^a-zA-Z0-9_.]/', '-', $request->title));
                $final_slug = preg_replace('/_+/', '-', $slug).'-'.base64_encode($request->id);

                if ($request->hasfile('image'))
                {
                    if($ourServiceData->image){
                       $filename = public_path($ourServiceData->image);
                       if($filename) {
                        // unlink($filename);
                        File::delete(public_path($ourServiceData->image));
                       }
                    }

                    $file        = $request->file('image');
                    $fullName    = $file->getClientOriginalName();
                    $extension   = $file->getClientOriginalExtension();
                    $filename    = ((string)(microtime(true)*10000)).'.'.$extension;
                    $file->move(public_path('images/ourservice/'), $filename);
                    $image = 'images/ourservice/'.$filename;

                }else{
                    $image = $ourServiceData->image;
                }
        
                $ourServiceData->title        = $request->title ?? '';
                $ourServiceData->slug_name    = $final_slug;
                $ourServiceData->display_on_banner        = $request->display_on_banner ?? '';
                $ourServiceData->type        = $request->type ?? '';
                $ourServiceData->description  = $request->description ?? '';
                $ourServiceData->assign_sub_service  = $request->assign_sub_service ?? 0;
                $ourServiceData->sequence  = $request->sequence ?? 0;
                $ourServiceData->image        = $image ?? null;
                $ourServiceData->update();

                
            
                return response()->json([
                        (string)$this->responseCode =>(string)$this->successStatus, 
                        (string)$this->responseMessage => 'Data Updated Successfully!'
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
        
        $query = OurService::where('id', $id)->first();

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

        return [$this->successKey => $this->successStatus, $this->messageKey => 'Data delete Successfully' ];
    }
    
}
