@extends('admin.layout.app')
@section('content')

<div class="main-panel">
    <div class="content">
        <div class="page-inner element-1">

            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <div class="card-title">Edit Role</div>
                        </div>
                        <form action="{{ route('admin_update_role') }}" method="post" id="formSubmitBack" enctype="multipart/form-data">
                            @csrf
                            <input type="hidden" name="id" value="{{ $role->id }}">
                            <div class="card-body element-2">
                                <div class="row">
                                
                                     <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="role-name">Role Name<span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="role-name" name="name" placeholder="Enter Role Name" value="{{ $role->name }}" required>
                                        </div>
                                    </div>


                                    @php $count = 1; @endphp
                                        @foreach($modules as $module)
                                          @if(count($module->permissionsData) > 0)
                                          @php
                                            # all permissions by module id
                                            $allPermissions = Spatie\Permission\Models\Permission::where('module_id', $module->id)->get();
                                          
                                            foreach($allPermissions as $allPermission){
                                                $permissionIds[] = $allPermission->id;
                                            }

                                            $assignedPermissions = App\Models\RoleHasPermission::whereIn('permission_id', $permissionIds)
                                                                                               ->whereHas('assignedPermissions', function($q) use ($module){
                                                                                                   $q->where('module_id', $module->id);
                                                                                               })
                                                                                               ->where('role_id', $role->id)
                                                                                               ->get();
                                          
                                          @endphp
                                            <div class="col-md-4 mb-15"> 
                                              <div class="table-responsive acl-role">
                                                <table class="table table-striped permission_table">
                                                  <tbody>
                                                    <tr>
                                                      <th>{{ $module->name ?? '' }}</th>
                                                      <th style="width: 40px;"><input type="checkbox" name="role[]" id="role{{ $count }}" value="{{ $permission->name ?? '' }}" onclick="checkRole('{{ $count }}')" {{ (count($allPermissions) == count($assignedPermissions)) ? 'checked' : '' }}></th>
                                                    </tr>
                                                  @foreach($module->permissionsData as $permission)
                                                  <tr>
                                                    <td>{{ $permission->slug ?? '' }}</td>
                                                    <td><input type="checkbox" name="permission[]" class="permissions{{ $count }}" value="{{ $permission->name ?? '' }}" {{ in_array($permission->name, $data) ? 'checked' : '' }}></td>
                                                  </tr>
                                                  @endforeach
                                                  </tbody>
                                                </table>
                                              </div>
                                            </div>
                                            @endif
                                            @php $count++; @endphp
                                        @endforeach
                
                                    
                                    
                                </div>                                
                            </div>
                            <div class="card-action element-2 text-center">
                                <a href="{{route('admin_user')}}" class="btn btn-light mr-2 btn-size-cus">Cancel</a>
                                <button type="submit" name="Submit" id="loderButton" class="btn btn-primary px-5 rounded-0 btn-size-cus"><i class="fa fa-spinner fa-pulse fa-fw" id="loderIcon" style="display:none;"></i>Update</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @endsection

 @section('js')
       <script type="text/javascript">
            function checkRole(id)
            {
                if($('#role'+id).is(":checked")){
                    $(".permissions"+id).attr('checked' , 'checked');
                }
                else{
                    $(".permissions"+id).removeAttr('checked' , 'checked');
                }
            }
        </script>
    @endsection
