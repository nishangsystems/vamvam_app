<?php

namespace App\Models; 

use Illuminate\Database\Eloquent\Model;

class RoleHasPermission extends Model
{
  # define table
  protected $table ='role_has_permissions';
  
  # define fillable fields
  protected $fillable = [
  	                   'permission_id',
  	                   'role_id',
  ];

  /**
   * belongs to relation with Permission
   * @param
   * @return
   */
  public function assignedPermissions()
  {
  	return $this->belongsTo('Spatie\Permission\Models\Permission', 'permission_id', 'id');
  }

}
