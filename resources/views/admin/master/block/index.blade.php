@extends('admin.layout.app')
@section('content')
<div class="main-panel">
<div class="content">
   <div class="page-inner element-1">
      
      <div class="row">
         <div class="col-md-12">
            <div class="card">
               <div class="card-header d-flex"style="justify-content: space-between;">
                  <h4 class="card-title">Block Management</h4>
                  <div>
                       <button type="button" data-href="{{ route('admin_create_block') }}" class="btn btn-primary add_model" data-toggle="modal" data-target="#add_model" title="Add Block"><b><i class="fa fa-plus"></i> Add Block</b></button>
                  </div>
               </div>
               <div class="card-body element-2">
                  <div class="table-responsive">
                     <table id="basic-datatables" class="display table table-striped table-hover">
                        <thead>
                           <tr>
                              <th>S.No.</th>
                              <th>State</th>
                              <th>District</th>
                              <th>Tehsil</th>
                              <th>Block</th>
                              <th>Status</th>
                              <th>Action</th>
                           </tr>
                        </thead>
                        <tbody>
                            @php $sr = 1 @endphp
                        
                           @forelse($lists as $list)
                           <tr>
                              <td>{{ $sr++ }}</td>
                              <td>{{$list->stateInfo ? $list->stateInfo->name : ''}}</td>
                              <td>{{$list->districtInfo ? $list->districtInfo->name : ''}}</td>
                              <td>{{$list->tehsilInfo ? $list->tehsilInfo->name : ''}}</td>
                              <td>{{$list->name ?? ''}}</td>
                              <td>
                                 @if($list->status == 1)
                                 <span class="text-success">Active</span>
                                 @else
                                 <span class="text-danger">Inactive</span>
                                 @endif
                              </td>
                              
                              <td>
                                 <div class="form-button-action">
                                    <button type="button" data-href="{{ route('admin_edit_block',[$list->id]) }}" class="btn  btn-primary btn-sm mr-1 edit_model" data-toggle="modal" data-target="#edit_model" title="Edit"><i class="fa fa-edit"></i>
                                    </button>

                                    <button type="button" @if($list->status == 1) class="btn btn-danger btn-xs mr-2" id="deactivate" @else class="btn btn-success btn-xs mr-2" id="activate" @endif href="{{ url('admin/status-block')}}/{{base64_encode($list->id)}}">@if($list->status == 1) <i class="fa fa-lock" aria-hidden="true" title="In Active"></i> @else <i class="fa fa-unlock" aria-hidden="true" title="Active"></i> @endif</button>

                                   <button id="delete" href="{{ route('admin_delete_block',[$list->id]) }}" class="btn btn-danger btn-sm jsgrid-delete-button" type="button" title="Delete"><i class="fa fa-trash"></i>
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

