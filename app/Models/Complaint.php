<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Http\Interfaces\ComplaintStatusInterface;

class Complaint extends Model
{

     /**
     * The database table used by the model.
     *
     * @var string
     */
	protected $table 	= 	'complaints';

	/**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable 	= 	[
							    	'complaint_code',
                                    'customer_id',
                                    'department_id',
                                    'issue_type_id',
                                    'message',
                                    'complaint_file',
                                    'complaint_file_type',
                                    'complaint_date',
                                    'status',
                                    'remarks',
                                    'resolved_date',
                                    'latitude',
                                    'longitude',
                                    'address',
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
     * Model has One Department 
     * 
     * @return relation
     */
    public function departmentInfo()
    {
        return $this->hasOne('App\Models\Department','id', 'department_id');
    }

    /**
     * Model has One IssueType 
     * 
     * @return relation
     */
    public function issueInfo()
    {
        return $this->hasOne('App\Models\IssueType','id', 'issue_type_id');
    }

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
     * Model has One Complai Assign 
     * 
     * @return relation
     */
    public function assignInfo()
    {
        return $this->hasOne('App\Models\ComplaintAssign','complaint_id', 'id')->orderBy('id','desc');
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
    if($statusId == ComplaintStatusInterface::Pending) {
      $status = 'Pending';
    } elseif ($statusId == ComplaintStatusInterface::Inprogress) {
      $status = 'In Progress';
    } elseif ($statusId == ComplaintStatusInterface::Resolved) {
      $status = 'Resolved';
    } elseif ($statusId == ComplaintStatusInterface::Cancelled) {
      $status = 'Cancelled';
    } elseif ($statusId == ComplaintStatusInterface::Reopened) {
      $status = 'Re Open';
    }

    return $status;
  }
    
   
}
