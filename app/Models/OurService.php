<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class OurService extends Model
{

     /**
     * The database table used by the model.
     *
     * @var string
     */
	protected $table 	= 	'our_services';

	/**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable 	= 	[
							    	'title',
                                    'description',
                                    'image',
                                    'assign_sub_service',
                                    'slug_name',
                                    'type',
                                    'display_on_banner',
                                    'sequence',
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
     * Model has One sub Service
     * 
     * @return relation
     */
    public function subServiceInfo()
    {
        return $this->hasOne('App\Models\OurSubService','id', 'assign_sub_service');
    }

   
}
