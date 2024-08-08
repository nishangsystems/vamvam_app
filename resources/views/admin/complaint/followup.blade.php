@extends('admin.layout.app')
@section('content')
<div class="main-panel">
<div class="content">
   <div class="page-inner element-1">
      
      <div class="row">
         <div class="col-md-12">
            <div class="card">
               <div class="card-header d-flex"style="justify-content: space-between;">
                  <h4 class="card-title">Complaint Followup Management</h4>
               </div>
               <div class="card-body element-2">
                  <div class="table-responsive">
                     <table id="basic-datatables" class="display table table-striped table-hover">
                        <thead>
                           <tr>
                              <th>S.No.</th>
                              <th>Complaint Code</th>
                              <th>Executive Name</th>
                              <th>Name</th>
                              <th>Mobile</th>
                              <th>Department</th>
                              <th>IssueType</th>
                              <th>Remarks</th>
                              <th>DateTime</th>
                              <th>Status</th>
                           </tr>
                        </thead>
                        <tbody>
                            @php $sr = 1 @endphp
                        
                           @forelse($lists as $list)
                           <tr>
                              <td>{{ $sr++ }}</td>
                              <td>{{$list->complaintData ? $list->complaintData->complaint_code : ''}}</td>
                              
                              <td>{{$list->assignComplaintData ? ($list->assignComplaintData->executiveData ? $list->assignComplaintData->executiveData->name : '') : ''}}</td>
                             
                              <td>{{$list->complaintData ? ($list->complaintData->customerInfo ? $list->complaintData->customerInfo->name : '') : ''}}</td>
                              <td>{{$list->complaintData ? ($list->complaintData->customerInfo ? $list->complaintData->customerInfo->mobile : '') : ''}}</td>
                              <td>{{$list->complaintData ? ($list->complaintData->departmentInfo ? $list->complaintData->departmentInfo->name : '') : ''}}</td>
                              <td>{{$list->complaintData ? ($list->complaintData->issueInfo ? $list->complaintData->issueInfo->name : '') : ''}}</td>

                              <td>{{$list->remarks ?? ''}}</td>
                              <td>{{$list->date ?? ''}} {{$list->time ?? ''}}</td>
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

