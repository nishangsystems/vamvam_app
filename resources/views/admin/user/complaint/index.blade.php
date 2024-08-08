@extends('admin.layout.app')
@section('content')
<div class="main-panel">
<div class="content">
   <div class="page-inner element-1">
      
      <div class="row">
         <div class="col-md-12">
            <div class="card">
               <div class="card-header d-flex"style="justify-content: space-between;">
                  <h4 class="card-title">User Wise Complaint Management</h4>
                  <div>
                       <button type="button" data-href="{{ url('admin/user-complaint/create') }}/{{$id}}" class="btn btn-primary add_model" data-toggle="modal" data-target="#add_model" title="Add Complaint"><b><i class="fa fa-plus"></i> Add Complaint</b></button>
                  </div>
               </div>
               <div class="card-body element-2">
                  <div class="table-responsive">
                     <table id="basic-datatables" class="display table table-striped table-hover">
                        <thead>
                           <tr>
                              <th>S.No.</th>
                              <th>User ID</th>
                              <th>Name</th>
                              <th>Mobile</th>
                              <th>Voter ID</th>
                              <th>Aadhaar Card</th>
                              <th>Department</th>
                              <th>IssueType</th>
                              <th>Message</th>
                              <th>Complaint Date</th>
                              <th>Action</th>
                           </tr>
                        </thead>
                        <tbody>
                            @php $sr = 1 @endphp
                        
                           @forelse($lists as $list)
                           <tr>
                              <td>{{ $sr++ }}</td>
                              <td>{{$list->customerInfo ? $list->customerInfo->customer_unique_id : ''}}</td>
                              <td>{{$list->customerInfo ? $list->customerInfo->name : ''}}</td>
                              <td>{{$list->customerInfo ? $list->customerInfo->mobile : ''}}</td>
                              <td>{{$list->customerInfo ? $list->customerInfo->voter_id : ''}}</td>
                              <td>{{$list->customerInfo ? $list->customerInfo->aadhaar_card : ''}}</td>
                              <td>{{$list->departmentInfo ? $list->departmentInfo->name : ''}}</td>
                              <td>{{$list->issueInfo ? $list->issueInfo->name : ''}}</td>
                              <td>{{$list->message ?? ''}}</td>
                              <td>{{$list->complaint_date ?? ''}}</td>
                              
                              <td>
                                 
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

