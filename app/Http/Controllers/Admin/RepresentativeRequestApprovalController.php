<?php

namespace App\Http\Controllers\Admin;

# Models
use App\Models\Executive;
use App\Models\RepresentativeRequestApproval;

# Traits
use App\Http\Traits\MessageStatusTrait;

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
    use MessageStatusTrait;

    # Bind Type
    protected $type = 'RequestApproval ';

    # Bind location
    protected $view = 'admin.request_approval.';

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

  

   public function index(Request $request)
    {
        # Fetch  
        $lists = $this->representativeRequestApproval
                      ->orderBy('id','desc')
                      ->get();

        return view($this->view . 'index')->with([
                                                   'lists' => $lists ?? [],
                                                ]);
    }


    

}
