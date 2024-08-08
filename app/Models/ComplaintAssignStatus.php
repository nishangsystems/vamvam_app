<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Http\Interfaces\ComplaintFollowUpStatusInterface;


class ComplaintAssignStatus extends Model
{

     /**
     * The database table used by the model.
     *
     * @var string
     */
	protected $table 	= 	'complaint_assign_status';

	/**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable 	= 	[
                                    'complaint_id',
							    	'assign_complaint_id',
                                    'date',
                                    'time',
                                    'remarks',
                                    'media_file',
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
     * Model has One user
     * 
     * @return relation
     */
    public function assignComplaintData()
    {
        return $this->belongsTo('App\Models\ComplaintAssign','assign_complaint_id', 'id');
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
        }

        return $status;
      }

   
   
}
