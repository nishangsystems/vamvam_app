<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class RepresentativeRequestApproval extends Model
{

     /**
     * The database table used by the model.
     *
     * @var string
     */
	protected $table 	= 	'representative_request_approvals';


	/**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable 	= 	[
                                    'ticket_no',
							    	'ticket_date',
                                    'executive_id',
                                    'complaint_id',
                                    'message',
                                    'leader_id',
                                    'reply_message',
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
     * Model has One Executive 
     * 
     * @return relation
     */
    public function executiveInfo()
    {
        return $this->hasOne('App\Models\Executive','id', 'executive_id');
    }

    /**
     * Model has One Executive 
     * 
     * @return relation
     */
    public function compaintInfo()
    {
        return $this->hasOne('App\Models\Complaint','id', 'complaint_id');
    }

     /**
     * Model has One Executive 
     * 
     * @return relation
     */
    public function leaderInfo()
    {
        return $this->hasOne('App\Models\Leader','id', 'leader_id');
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
