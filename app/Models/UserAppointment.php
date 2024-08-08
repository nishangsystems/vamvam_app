<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class UserAppointment extends Model
{

     /**
     * The database table used by the model.
     *
     * @var string
     */
	protected $table 	= 	'user_appointments';


	/**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable 	= 	[
                                    'customer_id',
							    	'reason',
                                    'description',
                                    'appointment_date',
                                    'appointment_time',
                                    'action_leader_id',
                                    'reject_reason',
                                    'status',
					      		];

    /**
     * The attributes that should be mutated to dates.
     *
     * @var array
     */
    protected $dates = [
        'created_at',
    ];


    /**
     * Model has One Customer 
     * 
     * @return relation
     */
    public function customerInfo()
    {
        return $this->hasOne('App\Models\Customer','id', 'customer_id');
    }


    /**
   * Attribute to Set String Status of Appointment
   * @params
   * @return string Status
   */
  public function getStatusStringAttribute()
  {
    # fetch the Last Status Id
    $statusId = $this->status; 
    $status = '';
    if($statusId == 0) {
      $status = 'Pending';
    } elseif ($statusId == 1) {
      $status = 'Accepted';
    } elseif ($statusId == 2) {
      $status = 'Rejected';
    }

    return $status;
  }

  
   
}
