<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Module extends Model
{
  
  # define table
  protected $table ='modules';
  
  # define fillable fields
  protected $fillable = [
  	                   'name',
  ];

  public function permissionsData()
  {
    return $this->hasMany('Spatie\Permission\Models\Permission', 'module_id', 'id');
  }
}
