<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Setting extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table    =   'settings';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable     =   [
                                    'phone_no_one',
                                    'phone_no_two',
                                    'email',
                                    'address',
                                    'logo',
                                    'fevicon',
                                    'website',
                                    'summary',
                                    'description',
                                    'facebook_link',
                                    'instagram_link',
                                    'twitter_link',
                                    'linkedin_link',
                                    'youtube_link',
                                    'map_code',
                                    'our_service_image',
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
