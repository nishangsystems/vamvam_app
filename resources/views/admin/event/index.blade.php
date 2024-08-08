@extends('admin.layout.app')
@section('content')
<div class="main-panel">
<div class="content">
   <div class="page-inner element-1">
      
      <div class="row">
         <div class="col-md-12">
            <div class="card">
               <div class="card-header d-flex"style="justify-content: space-between;">
                  <h4 class="card-title">Event Management</h4>
                  <div>
                     <a class="btn btn-primary" href="{{ url('admin/event/create') }}"><b><i class="fa fa-plus"></i> Add Event</b></a>
                  </div>
               </div>
               <div class="card-body element-2">
                  <div class="table-responsive">
                     <table id="basic-datatables" class="display table table-striped table-hover">
                        <thead>
                           <tr>
                              <th>S.No.</th>
                              <th>Title</th>
                              <th>Address</th>
                              <th>Start DateTime</th>
                              <th>End DateTime</th>
                              <th>Status</th>
                              <th>Action</th>
                           </tr>
                        </thead>
                        <tbody>
                            @php $sr = 1 @endphp
                        
                           @forelse($lists as $list)
                           <tr>
                              <td>{{ $sr++ }}</td>
                              <td>{{$list->title ?? ''}}</td>
                              <td>{{$list->address ?? ''}}</td>
                              <td>{{$list->start_date_time ?? ''}}</td>
                              <td>{{$list->end_date_time ?? ''}}</td>
                              <td>
                                 @if($list->status == 1)
                                 <span class="text-success">Active</span>
                                 @else
                                 <span class="text-danger">Inactive</span>
                                 @endif
                              </td>
                              <td>
                                 <div class="form-button-action">
                                    <a href="{{ route('edit_event',[base64_encode($list->id)]) }}" class="btn btn-primary btn-sm mr-1"title="Edit"><i class="fa fa-edit"></i>
                                    </a>
                                    
                                    <button type="button" @if($list->status == 1) class="btn btn-danger btn-xs mr-2" id="deactivate" @else class="btn btn-success btn-xs mr-2" id="activate" @endif href="{{ url('admin/status-event')}}/{{base64_encode($list->id)}}">@if($list->status == 1) <i class="fa fa-lock" aria-hidden="true" title="In Active"></i> @else <i class="fa fa-unlock" aria-hidden="true" title="Active"></i> @endif</button>
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

