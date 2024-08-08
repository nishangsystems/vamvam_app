<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class RepresentativeToDo extends Model
{

     /**
     * The database table used by the model.
     *
     * @var string
     */
	protected $table 	= 	'representative_to_dos';


	/**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable 	= 	[
                                    'executive_id',
							    	                'todo_date',
                                    'title',
                                    'message',
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

   
}
