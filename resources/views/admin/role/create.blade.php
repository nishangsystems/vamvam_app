@extends('admin.layout.app')
@section('css')
<style>
    .dob-cls {
    box-sizing: border-box;
    outline: 0;
    padding: .75rem;
    position: relative;
    width: 100%;
}

.dob-cls[type="date"]::-webkit-calendar-picker-indicator {
    background: transparent;
    bottom: 0;
    color: transparent;
    cursor: pointer;
    height: auto;
    left: 0;
    position: absolute;
    right: 0;
    top: 0;
    width: auto;
}
</style>
@endsection

@section('content')
<div class="main-panel">
    <div class="content">
        <div class="page-inner element-1">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <div class="card-title">Add Role</div>
                        </div>
                        <form action="{{ route('admin_role_store') }}" method="post" id="formSubmitBack" enctype="multipart/form-data">
                            @csrf
                            <div class="card-body element-2">
                                <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="role-name">Role Name<span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" id="role-name" name="name" placeholder="Enter Role Name" required>
                                    </div>
                                </div>

                                @foreach($modules as $key=>$module)
                                @if(count($module->permissionsData) > 0)
                                  <div class="col-md-4 mb-15"> 
                                  <div class="table-responsive acl-role">
                                    <table class="table table-striped permission_table">
                                      <tbody>
                                        <tr>
                                          <th>{{ $module->name ?? '' }}</th>
                                          <th style="width: 40px;"><input type="checkbox" name="role[]" id="role{{ $key }}" value="{{ $permission->name ?? '' }}" onclick="checkRole('{{ $key }}')"></th>
                                        </tr>
                                      @foreach($module->permissionsData as $permission)
                                      <tr>
                                        <td>{{ $permission->slug ?? '' }}</td>
                                        <td><input type="checkbox" name="permission[]" class="permissions{{ $key }}" value="{{ $permission->name ?? '' }}"></td>
                                      </tr>
                                      @endforeach
                                      </tbody>
                                    </table>
                                  </div>
                                </div>
                                @endif
                                @endforeach   
                                    
                                    
                                    
                                </div>                                
                            </div>
                            <div class="card-action element-2 text-center">
                                <a href="{{route('admin_user')}}" class="btn btn-light mr-2 btn-size-cus">Cancel</a>
                                <button type="submit" name="Submit" id="loderButton" class="btn btn-primary px-5 rounded-0 btn-size-cus"><i class="fa fa-spinner fa-pulse fa-fw" id="loderIcon" style="display:none;"></i>Submit</button>
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
