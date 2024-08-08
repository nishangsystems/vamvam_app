<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Leader extends Model
{

     /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table    =   'leaders';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable     =   [
                                    'leader_unique_id',
                                    'voter_id',
                                    'aadhaar_card',
                                    'name',
                                    'mobile',
                                    'email',
                                    'password',
                                    'show_password',
                                    'otp',
                                    'forgot_otp',
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
