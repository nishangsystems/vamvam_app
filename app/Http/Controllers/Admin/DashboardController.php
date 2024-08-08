<?php

namespace App\Http\Controllers\Admin;

use App\Http\Traits\MessageStatusTrait;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Validator;
use Auth;
use Hash;
use File;

class DashboardController extends Controller
{
    use MessageStatusTrait;

    # Bind location
    protected $view = 'admin.';
    protected $type = 'Dashboard ';  
   
  
   
    #Dashboard page
    public function index(Request $request){ 
       
        return view($this->view .'dashboard');
    }




   
   
}
