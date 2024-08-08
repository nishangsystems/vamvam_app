<?php

namespace App\Http\Controllers\Admin\Master;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use File;
use Validator;
use App\Models\State;
use App\Http\Traits\MessageStatusTrait;

class StateController extends Controller
{
    use MessageStatusTrait;

    # Bind Type
    protected $type = 'State ';

    # Bind location
    protected $view = 'admin.master.state.';

    # Bind state
    protected $state;

    /**
     * default constructor
     * @param
     * @return
     */
    function __construct(
                            State          $state
                        )
                        {
                            $this->state   = $state;
                        }
   

    public function index()
    {
        $lists = $this->state
                      ->orderBy('name','asc')
                      ->get();
        # return to index page
        return view($this->view .'index')->with(['lists' =>$lists]);
    }

    
    
}
