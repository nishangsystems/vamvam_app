<?php

namespace App\Http\Controllers\Admin;

use App\Http\Traits\MessageStatusTrait;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Setting;
use Validator;
use Auth;
use Hash;
use File;

class SettingController extends Controller
{
    use MessageStatusTrait;

    # Bind location
    protected $view = 'admin.setting.';
    protected $type = 'Setting ';


    # Bind setting
    protected $setting;

    /**
     * default constructor
     * @param
     * @return
     */
    function __construct(
                         Setting $setting
                        )
                        {
                            $this->setting      = $setting;
                            $this->page         = config('paginate.pagination');
                        }



   
    #setting page
    public function index(Request $request){
        # fetch setting list
        $settings = $this->setting->first();

        return view($this->view.'edit')->with([
                                               'settings' => $settings
                                              ]);
    }



   


    /**
      * edit setting
      * @param Illuminate\Http\Request; 
      * @return Illuminate\Http\Response;
      */
     public function edit(Request $request)
     {
     
            try {
              
               $query = $this->setting->first();
                             
               
               if($query)
                {   
                   
                   #upload logo
                    if ($request->hasfile('logo'))
                    {
                        $file = $request->file('logo');
                        $extension = $file->getClientOriginalExtension(); // getting image extension
                        $filename =((string)(microtime(true)*10000)).'.'.$extension;
                        File::delete(public_path($query->logo));
                        $file->move(public_path('images/'), $filename);
                        $logo='images/'.$filename;
                    }else{
                        $logo = $query->logo;
                    }


                 #upload fevicon
                if ($request->hasfile('fevicon'))
                {
                    $file = $request->file('fevicon');
                    $extension = $file->getClientOriginalExtension(); // getting image extension
                    $filename =((string)(microtime(true)*10000)).'.'.$extension;
                    File::delete(public_path($query->fevicon));
                    $file->move(public_path('images/'), $filename);
                    $fevicon='images/'.$filename;
                }else{
                    $fevicon = $query->fevicon;
                }

                 #upload our_service_image
                if ($request->hasfile('our_service_image'))
                {
                    $file = $request->file('our_service_image');
                    $extension = $file->getClientOriginalExtension(); // getting image extension
                    $filename =((string)(microtime(true)*10000)).'.'.$extension;
                    File::delete(public_path($query->our_service_image));
                    $file->move(public_path('images/'), $filename);
                    $our_service_image='images/'.$filename;
                }else{
                    $our_service_image = $query->our_service_image;
                }

                # request param
                $arrayData = [
                                'logo'               => $logo,
                                'fevicon'            => $fevicon,
                                'our_service_image'  => $our_service_image,
                                'email'              => $request->email ?? null,
                                'address'            => $request->address ?? null,
                                'summary'            => $request->summary ?? null,
                                'description'        => $request->description ?? null,
                                'phone_no_one'       => $request->phone_no_one ?? null,
                                'phone_no_two'       => $request->phone_no_two ?? null,
                                'facebook_link'      => $request->facebook_link ?? null,
                                'linkedin_link'      => $request->linkedin_link ?? null,
                                'instagram_link'     => $request->instagram_link ?? null,
                                'twitter_link'       => $request->twitter_link ?? null,
                                'youtube_link'       => $request->youtube_link ?? null,
                                'map_code'           => $request->map_code ?? null,
                                'website'            => $request->website ?? null,
                             ];      

                #update
                $updateSetting = $query->update($arrayData);  
                

                }else{
                    #upload logo
                    if ($request->hasfile('logo'))
                    {
                        $file = $request->file('logo');
                        $extension = $file->getClientOriginalExtension(); // getting image extension
                        $filename =((string)(microtime(true)*10000)).'.'.$extension;
                        $file->move(public_path('images/'), $filename);
                        $logo='images/'.$filename;
                    }else{
                        $logo = null;
                    }


                 #upload fevicon
                if ($request->hasfile('fevicon'))
                {
                    $file = $request->file('fevicon');
                    $extension = $file->getClientOriginalExtension(); // getting image extension
                    $filename =((string)(microtime(true)*10000)).'.'.$extension;
                    $file->move(public_path('images/'), $filename);
                    $fevicon='images/'.$filename;
                }else{
                    $fevicon = null;
                }

                #upload our_service_image
                if ($request->hasfile('our_service_image'))
                {
                    $file = $request->file('our_service_image');
                    $extension = $file->getClientOriginalExtension(); // getting image extension
                    $filename =((string)(microtime(true)*10000)).'.'.$extension;
                    $file->move(public_path('images/'), $filename);
                    $our_service_image='images/'.$filename;
                }else{
                    $our_service_image = null;
                }

                # request param
                 $arrayData = [
                                'logo'               => $logo,
                                'fevicon'            => $fevicon,
                                'our_service_image'  => $our_service_image,
                                'email'              => $request->email ?? null,
                                'address'            => $request->address ?? null,
                                'summary'            => $request->summary ?? null,
                                'description'        => $request->description ?? null,
                                'phone_no_one'       => $request->phone_no_one ?? null,
                                'phone_no_two'       => $request->phone_no_two ?? null,
                                'facebook_link'      => $request->facebook_link ?? null,
                                'linkedin_link'      => $request->linkedin_link ?? null,
                                'instagram_link'     => $request->instagram_link ?? null,
                                'twitter_link'       => $request->twitter_link ?? null,
                                'youtube_link'       => $request->youtube_link ?? null,
                                'map_code'           => $request->map_code ?? null,
                                'website'            => $request->website ?? null,
                             ];       

                #update
                $updateSetting = $this->setting->create($arrayData); 
                }  

                 
                
                return response()->json([
                                          'responseCode'    =>$this->successStatus, 
                                          'responseMessage' => 'Setting Updated Successfully.'
                                        ]);                      

            } catch (Exception $e) {
               // dd($e);
                return response()->json([
                                          'responseCode'    =>$this->errorStatus, 
                                          'responseMessage' => 'Something went wrong.'
                                        ]);  
            }
     }


       
}
