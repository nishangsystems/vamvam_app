<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Blog extends Model
{

     /**
     * The database table used by the model.
     *
     * @var string
     */
	protected $table 	= 	'blogs';

	/**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable 	= 	[
                                    'service_id',
							    	'title',
                                    'description',
                                    'image',
                                    'status',
                                    'slug_name',
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
    public function serviceInfo()
    {
        return $this->hasOne('App\Models\OurService','id', 'service_id');
    }


    public function blogImages(){

        return $this->hasMany('App\Models\BlogImage', 'blog_id', 'id');
    } 
   
}
