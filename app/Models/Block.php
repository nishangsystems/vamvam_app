<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Block extends Model
{

     /**
     * The database table used by the model.
     *
     * @var string
     */
	protected $table 	= 	'blocks';

	/**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable 	= 	[
                                    'state_id',
                                    'district_id',
                                    'tehsil_id',
							    	'name',
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
     * Model has One Service 
     * 
     * @return relation
     */
    public function districtInfo()
    {
        return $this->hasOne('App\Models\District','id', 'district_id');
    }

    /**
     * Model has One Service 
     * 
     * @return relation
     */
    public function stateInfo()
    {
        return $this->hasOne('App\Models\State','id', 'state_id');
    }


     /**
     * Model has One Service 
     * 
     * @return relation
     */
    public function tehsilInfo()
    {
        return $this->hasOne('App\Models\Tehsil','id', 'tehsil_id');
    }


    
   
}
