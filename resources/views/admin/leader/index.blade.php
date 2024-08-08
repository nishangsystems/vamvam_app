@extends('admin.layout.app')
@section('content')
<div class="main-panel">
<div class="content">
   <div class="page-inner element-1">
      
      <div class="row">
         <div class="col-md-12">
            <div class="card">
               <div class="card-header d-flex"style="justify-content: space-between;">
                  <h4 class="card-title">Leader Management</h4>
                  <div>
                     <a class="btn btn-primary" href="{{ url('admin/leader/create') }}"><b><i class="fa fa-plus"></i> Add Leader</b></a>
                  </div>
               </div>
               <div class="card-body element-2">
                  <div class="table-responsive">
                     <table id="basic-datatables" class="display table table-striped table-hover">
                        <thead>
                           <tr>
                              <th>S.No.</th>
                              <th>Leader ID</th>
                              <th>Name</th>
                              <th>Email</th>
                              <th>Mobile</th>
                              <th>Aadhaar Card</th>
                              <th>Voter ID</th>
                              <th>Status</th>
                              <th>Action</th>
                           </tr>
                        </thead>
                        <tbody>
                            @php $sr = 1 @endphp
                        
                           @forelse($lists as $list)
                           <tr>
                              <td>{{ $sr++ }}</td>
                              <td>{{$list->leader_unique_id ?? ''}}</td>
                              <td>{{$list->name ?? ''}}</td>
                              <td>{{$list->email ?? ''}}</td>
                              <td>{{$list->mobile ?? ''}}</td>
                              <td>{{$list->aadhaar_card ?? ''}}</td>
                              <td>{{$list->voter_id ?? ''}}</td>
                              <td>
                                 @if($list->status == 1)
                                 <span class="text-success">Active</span>
                                 @else
                                 <span class="text-danger">Inactive</span>
                                 @endif
                              </td>
                              <td>
                                 <div class="form-button-action">
                                    <a href="{{ route('edit_leader',[base64_encode($list->id)]) }}" class="btn btn-primary btn-sm mr-1"title="Edit"><i class="fa fa-edit"></i>
                                    </a>
                                    
                                    <button type="button" @if($list->status == 1) class="btn btn-danger btn-xs mr-2" id="deactivate" @else class="btn btn-success btn-xs mr-2" id="activate" @endif href="{{ url('admin/status-leader')}}/{{base64_encode($list->id)}}">@if($list->status == 1) <i class="fa fa-lock" aria-hidden="true" title="In Active"></i> @else <i class="fa fa-unlock" aria-hidden="true" title="Active"></i> @endif</button>
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

