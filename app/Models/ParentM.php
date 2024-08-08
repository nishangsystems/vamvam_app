<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ParentM extends Model
{

     /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table    =   'parents';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable     =   [
                                    'parent_unique_id',
                                    'name',
                                    'mobile',
                                    'email',
                                    'password',
                                    'show_password',
                                    'status',
                                    'is_delete',
                                    'api_token',
                                    'device_type',
                                    'device_token',
                                ];

    /**
     * The attributes that should be mutated to dates.
     *
     * @var array
     */
    protected $dates = [
        'created_at',
    ];

      
    
   
}
