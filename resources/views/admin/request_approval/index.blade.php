@extends('admin.layout.app')
@section('content')
<div class="main-panel">
<div class="content">
   <div class="page-inner element-1">
      
      <div class="row">
         <div class="col-md-12">
            <div class="card">
               <div class="card-header d-flex"style="justify-content: space-between;">
                  <h4 class="card-title">Request Approval Management</h4>
               </div>
               <div class="card-body element-2">
                  <div class="table-responsive">
                     <table id="basic-datatables" class="display table table-striped table-hover">
                        <thead>
                           <tr>
                              <th>S.No.</th>
                              <th>Complaint Code</th>
                              <th>Executive Name</th>
                              <th>Ticket No</th>
                              <th>Ticket Date</th>
                              <th>Message</th>
                              <th>Leader Name</th>
                              <th>Reply Message</th>
                              <th>Status</th>
                           </tr>
                        </thead>
                        <tbody>
                            @php $sr = 1 @endphp
                           @forelse($lists as $list)
                           <tr>
                              <td>{{ $sr++ }}</td>
                              <td>{{$list->compaintInfo ? $list->compaintInfo->complaint_code : ''}}</td>
                              <td>{{$list->executiveInfo ? $list->executiveInfo->name : ''}}</td>
                              <td>{{$list->ticket_no ?? ''}}</td>
                              <td>{{$list->ticket_date ?? ''}}</td>
                              <td>{{$list->message ?? ''}}</td>
                              <td>{{$list->leaderInfo ? $list->leaderInfo->name : ''}}</td>
                              <td>{{$list->reply_message ?? ''}}</td>
                              <td>{{$list->status_string ?? ''}}</td>
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

