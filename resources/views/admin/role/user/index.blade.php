@extends('admin.layout.app')
@section('content')
<div class="main-panel">
<div class="content">
   <div class="page-inner element-1">
      
      <div class="row">
         <div class="col-md-12">
            <div class="card">
               <div class="card-header d-flex"style="justify-content: space-between;">
                  <h4 class="card-title">System User Management</h4>
                  <div>
                       <button type="button" data-href="{{ route('admin_create_system_user') }}" class="btn btn-primary add_model" data-toggle="modal" data-target="#add_model" title="Add System User"><b><i class="fa fa-plus"></i> Add System User</b></button>
                  </div>
               </div>
               <div class="card-body element-2">
                  <div class="table-responsive">
                     <table id="basic-datatables" class="display table table-striped table-hover">
                        <thead>
                           <tr>
                              <th>S.No.</th>
                              <th>Name</th>
                              <th>Email</th>
                              <th>Mobile</th>
                              <th>Role</th>
                              <th>Action</th>
                           </tr>
                        </thead>
                        <tbody>
                           @forelse($users as $key=>$user)
                           <tr>
                              <td>{{ $key+1 }}</td>
                              <td>{{$user->name ?? ''}}</td>
                              <td>{{$user->email ?? ''}}</td>
                              <td>{{$user->phone ?? ''}}</td>
                              <td>
                                 @php
                                    $roleName = $user->getRoleNames() ?? '';
                                 @endphp
                                   {{ preg_replace('/[^A-Za-z0-9 ]/', '', $roleName) }}
                              </td>
                              
                              <td>
                                 <div class="form-button-action">
                                    <button type="button" data-href="{{ route('admin_edit_system_user',[$user->id]) }}" class="btn  btn-primary btn-sm mr-1 edit_model" data-toggle="modal" data-target="#edit_model" title="Edit"><i class="fa fa-edit"></i>
                                    </button>
                                 </div>
                              </td>
                           </tr>
                           @empty
                           
                           @endforelse
                     </table>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>


@endsection

