<?php

namespace App\Models;

use Spatie\Permission\Traits\HasRoles;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable, HasRoles;

    protected $guard_name = 'admin';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'phone',
        'image',
        'about',
        'forgot_otp',
        'is_admin',
        'status',
    ];


    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];


    /**
     * Model has Many Otp
     * 
     * @return relation
     */
    public function otp()
    {
        return $this->hasMany('App\Models\UserOtp', 'user_id', 'id');
    }

    /**
     * Model has One Bank
     * 
     * @return relation
     */
    public function bank()
    {
        return $this->belongsTo('App\Models\UserBank','id', 'user_id');
    }

    /**
     * Model has One Vehicle
     * 
     * @return relation
     */
    public function vehicle()
    {
        return $this->belongsTo('App\Models\UserVehicle','id', 'user_id');
    }

    /**
     * Model has One Document
     * 
     * @return relation
     */
    public function document()
    {
        return $this->belongsTo('App\Models\UserDocument','id', 'user_id');
    }

    /**
     * Model has Many User Wallet Transaction
     * 
     * @return relation
     */
    public function wallet()
    {
        return $this->hasMany('App\Models\UserWallet');
    }


        /**
   * define the scope variable to get user
   * 
   * @param Query bulider, $product id.
   */
  public function scopesearchBetween($query, $name, $email, $phone)
  {
        # if email is not empty
        if ($email != '') {
           # return by email
           $query = $query->where('email', $email);
        }

        # if phone is not empty
        if ($phone != '') {
           # return by phone
           $query = $query->where('phone', $phone);
        }
        
        # if name is not empty
        if ($name != '') {
           # return by name          
           $query = $query->where('name','LIKE','%'. $name .'%');
        }
       return $query;  
  }


   /**
     * @method to calculate Wallet Remaining Amount
     * @param
     * @return Remainin Amount
     */
    public function getRemainingWalletAmountAttribute()
    {
        # FEtch all the Wallet Transactions
        $walletTransaction = $this->wallet;
        
        # Fetch Credit Amount
        $creditAmount = 0;
        if($walletTransaction->isNotEmpty()) {
            $creditAmount += $walletTransaction->where('type', 'cr')->sum('amount');
        }

        # Fetch Debit Amount
        $debitAmount = 0;
        if($walletTransaction->isNotEmpty()) {
            $debitAmount += $walletTransaction->where('type','dr')->sum('amount');
        }

        # reminaing Amount
        $remainingAmount = $creditAmount - $debitAmount;

        # retunr Amount
        return $remainingAmount;
    }



  /**
    * Scope a query to only not admin.
    *
    * @param  \Illuminate\Database\Eloquent\Builder  $query
    * @return \Illuminate\Database\Eloquent\Builder
  */
  public function scopeNotAdmin($query)
  {
      return $query->where('is_admin', '0');
  }

  
}
