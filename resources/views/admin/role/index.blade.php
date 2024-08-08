@extends('admin.layout.app')
@section('content')
<div class="main-panel">
<div class="content">
   <div class="page-inner element-1">
      
      <div class="row">
         <div class="col-md-12">
            <div class="card">
               <div class="card-header d-flex"style="justify-content: space-between;">
                  <h4 class="card-title">Role Management</h4>
                  <div>
                     <a class="btn btn-primary" href="{{ route('admin_create_role')}}"><b><i class="fa fa-plus"></i> Add Role</b></a>
                  </div>
               </div>
               <div class="card-body element-2">
                  <div class="table-responsive">
                     <table id="basic-datatables" class="display table table-striped table-hover">
                        <thead>
                           <tr>
                              <th>S.No.</th>
                              <th>Role Name</th>
                              <th>Action</th>
                           </tr>
                        </thead>
                        <tbody>
                            @php $sr = 1 @endphp
                        
                           @forelse($roles as $role)
                           <tr>
                              <td>{{ $sr++ }}</td>
                              <td>{{$role->name ?? ''}}</td>
                              <td>
                                 <div class="form-button-action">
                                    <a href="{{ route('admin_edit_role',[base64_encode($role->id)]) }}" class="btn  btn-primary btn-sm mr-1"title="Edit"><i class="fa fa-edit"></i>
                                    </a>
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

@section('js')
<script type="text/javascript">
   
</script>

@endsection


