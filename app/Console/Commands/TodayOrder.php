<?php

namespace App\Console\Commands;

// ini_set('max_execution_time', '300'); //300 seconds = 5 minutes
ini_set('max_execution_time', '0'); // for infinite time of execution

use Illuminate\Console\Command;

use DB;
use File;
use Hash;
use Validator;
use App\Models\Order; 
use App\Models\Subscription;
use App\Models\UserSubscription;
use App\Models\UserSubscriptionPlanOff;
use App\Models\UserSubscriptionPause;

use App\Http\Controllers\Controller;

class TodayOrder extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'order:todayOrder';
    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Find today order';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle() 
    { 
        
        $userSubscriptions = UserSubscription::where('start_date','<=',date('Y-m-d'))
                                 ->where('end_date','>=',date('Y-m-d'))
                                 ->where('is_canceled',0)
                                 ->where('status',1)
                                 ->with('planOff','pauseDate')
                                 ->get();
        foreach($userSubscriptions as $userSubscription)
        {
            $userPlanOff = $userSubscription->planOff->where('day_name',strtolower(date('l', strtotime(date('Y-m-d')))));
            if(count($userPlanOff) == 0 )
            {
               $userPlanPause = $userSubscription->pauseDate->where('pause_date',date('Y-m-d')); 
               if(count($userPlanPause) == 0 )
               {
                  $order                       = new Order;
                  $order->user_id              = $userSubscription->user_id;
                  $order->user_subscription_id = $userSubscription->id;
                  $order->order_date           = date('Y-m-d');
                  $order->unique_order_id      = rand(100000,999999);
                  $order->save();
               } 
            }
        }
    }
}
