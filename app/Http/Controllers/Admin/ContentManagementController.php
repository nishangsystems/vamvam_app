<?php

namespace App\Http\Controllers\Admin;

use App\Http\Traits\MessageStatusTrait;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ContentManagement;
use Validator;
use Auth;
use Hash;


class ContentManagementController extends Controller
{
    use MessageStatusTrait;

    # Bind location
    protected $view = 'admin.cms.';
    protected $type = 'CMS ';


    # Bind 
    protected $contentManagement;
  
    /**
     * default constructor
     * @param
     * @return
     */
    function __construct(
                         ContentManagement $contentManagement
                        )
                        {
                            $this->contentManagement   = $contentManagement;
                        }

  
     #mobile_privacy_policy page
    public function mobile_privacy_policy(Request $request){
        
        $value = $this->contentManagement->where('short_name','privacy_policy')->first();
        return view($this->view .'mobile_privacy_policy')->with([
                                                  'value'   => $value
                                               ]);
    }


     #mobile_term_condition page
    public function mobile_term_condition(Request $request){
        
        $value = $this->contentManagement->where('short_name','terms_condition')->first();
        return view($this->view .'mobile_term_condition')->with([
                                                  'value'   => $value
                                               ]);
    }


    #mobile_about_us page
    public function mobile_about_us(Request $request){
        
        $value = $this->contentManagement->where('short_name','about_us')->first();
        return view($this->view .'mobile_about_us')->with([
                                                  'value'   => $value
                                               ]);
    }
    
    
     #index page
    public function index(Request $request){
        
        $cms_list = $this->contentManagement->get();
        return view($this->view .'index')->with([
                                                  'cms_list'   => $cms_list
                                               ]);
    }



   /**
     * update page
     * @param Illuminate\Http\Request;
     * @return Illuminate\Http\Response;
     */
    public function update($type)
    {
        # initiate constructor
        $cms = $this->contentManagement->where('short_name',$type)->first();
        if($cms != ''){
           return view($this->view . 'edit')->with(['cms' => $cms]);
        }else{
           return redirect('admin/cms');
        }
    }


 

    /**
     * edit 
     * @param $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        # initiate constructor
        $query = $this->contentManagement;

        # get the status
        $query = $query->where('id', $request->id)->first();       

        $data = [
                 'details' => $request->details
                ];    

        # update 
        $query->update($data);

        # return success
        toastr()->success('Content updated.');
                return redirect('admin/cms');
    }
}
