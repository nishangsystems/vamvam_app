@extends('admin.layout.app')
@section('content')
<div class="main-panel">
<div class="content">
   <div class="page-inner element-1">
      
      <div class="row">
         <div class="col-md-12">
            <div class="card">
               <div class="card-header d-flex"style="justify-content: space-between;">
                  <h4 class="card-title">Complaint Management</h4>
                  <div>
                     <a class="btn btn-primary" href="{{ url('admin/complaint/create') }}"><b><i class="fa fa-plus"></i> Add Complaint</b></a>
                  </div>
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
                              <th>Voter ID</th>
                              <th>Aadhaar Card</th>
                              <th>Department</th>
                              <th>IssueType</th>
                              <th>Message</th>
                              <th>Complaint Date</th>
                              <th>Status</th>
                              <th>Action</th>
                           </tr>
                        </thead>
                        <tbody>
                            @php $sr = 1 @endphp
                        
                           @forelse($lists as $list)
                           <tr>
                              <td>{{ $sr++ }}</td>
                              <td>{{$list->complaint_code ?? ''}}</td>
                              <td>{{$list->assignInfo ? ($list->assignInfo->executiveData ? $list->assignInfo->executiveData->name : '') : ''}}</td>
                              <td>{{$list->customerInfo ? $list->customerInfo->name : ''}}</td>
                              <td>{{$list->customerInfo ? $list->customerInfo->mobile : ''}}</td>
                              <td>{{$list->customerInfo ? $list->customerInfo->voter_id : ''}}</td>
                              <td>{{$list->customerInfo ? $list->customerInfo->aadhaar_card : ''}}</td>
                              <td>{{$list->departmentInfo ? $list->departmentInfo->name : ''}}</td>
                              <td>{{$list->issueInfo ? $list->issueInfo->name : ''}}</td>
                              <td>{{$list->message ?? ''}}</td>
                              <td>{{$list->complaint_date ?? ''}}</td>
                              <td>{{$list->status_string ?? ''}}</td>
                              
                              <td>
                                 
                                    <button type="button" data-href="{{ route('assign_complaint',[$list->id]) }}" class="btn  btn-primary btn-sm mr-1 edit_model" data-toggle="modal" data-target="#edit_model" title="Assign Complaint"><i class="fa fa-edit"></i>
                                    </button>
                                    
                                    <a class="btn btn-primary" href="{{ url('admin/complaint/followup') }}/{{base64_encode($list->id)}}"><i class="fa fa-eye"></i></a>
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

