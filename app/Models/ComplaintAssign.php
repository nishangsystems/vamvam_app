<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Http\Interfaces\ComplaintFollowUpStatusInterface;

class ComplaintAssign extends Model
{

     /**
     * The database table used by the model.
     *
     * @var string
     */
	protected $table 	= 	'complaint_assigns';

	/**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable 	= 	[
                                    'complaint_id',
							    	'executive_id',
                                    'assign_date',
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
     * Model has One user
     * 
     * @return relation
     */
    public function complaintData()
    {
        return $this->belongsTo('App\Models\Complaint','complaint_id', 'id');
    }

    /**
     * Model has One executive
     * 
     * @return relation
     */
    public function executiveData()
    {
        return $this->belongsTo('App\Models\Executive','executive_id', 'id');
    }


    /**
     * Model has Many Complaint
     * 
     * @return relation
     */
    public function complaintStatusInfo()
    {
        return $this->hasMany('App\Models\ComplaintAssignStatus','assign_complaint_id', 'complaint_id');
    }

    /**
       * Attribute to Set String Status of Complaint Last history
       * @params
       * @return string Status
       */
      public function getStatusStringAttribute()
      {
        # fetch the Last Status Id From Order History
        $statusId = $this->status; 
        $status = '';
        if($statusId == ComplaintFollowUpStatusInterface::Assigned) {
          $status = 'Assigned';
        } elseif ($statusId == ComplaintFollowUpStatusInterface::Inprogress) {
          $status = 'In Progress';
        } elseif ($statusId == ComplaintFollowUpStatusInterface::Resolved) {
          $status = 'Resolved';
        } elseif ($statusId == ComplaintFollowUpStatusInterface::Cancelled) {
          $status = 'Cancelled';
        } elseif ($statusId == ComplaintFollowUpStatusInterface::Reopened) {
          $status = 'Reopened';
        }

        return $status;
      }
   
}
