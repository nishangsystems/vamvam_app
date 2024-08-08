@extends('admin.layout.app')
@section('content')
<div class="main-panel">
<div class="content">
   <div class="page-inner element-1">
      <div class="page-header">
         
      </div>
      <div class="row">
         <div class="col-md-12">
            <div class="card">
               <div class="card-header d-flex"style="justify-content: space-between;">
                  <h4 class="card-title">Survey Answer</h4>
                  <div>
                     <a type="button" href="{{ route('survey_question_list') }}" class="btn btn-secondary btn-sm">Back</a>
                     <a type="button" class="btn btn-primary btn-sm "data-toggle="modal" data-target="#exampleModalCenter1"><b><i class="fa fa-plus"></i> Add Answer</b></a>
                  </div>
               </div>
               <div class="card-body element-2">
                  <div class="table-responsive">
                     <table id="multi-filter-select" class="display table table-striped table-hover">
                        <thead>
                           <tr>
                              <th>S.No.</th>
                              <th>Answer</th>
                              <th>Status</th>
                              <th>Action</th>
                           </tr>
                        </thead>
                        <tbody>
                           @php $sr = 1 @endphp
                           @forelse($answers as $answer)
                           <tr>
                              <td>{{ $sr++ }}</td>
                              <td>{{$answer->answer ?? ''}}</td>
                              <td> 
                                 @if($answer->status == 1)
                                 <span class="text-success">Active</span>
                                 @else
                                 <span class="text-danger">Inactive</span>
                                 @endif
                              </td>
                              <td>
                                 <div class="form-button-action">
                                    <button type="button" data-href="{{ route('edit-survey-answer',[$answer->id]) }}" class="btn  btn-primary btn-sm mr-1 edit_model" data-toggle="modal" data-target="#edit_model" title="Edit"><i class="fa fa-edit"></i></button>

                                    <button type="button" @if($answer->status == 1) class="btn btn-danger btn-xs mr-2" id="deactivate" @else class="btn btn-success btn-xs mr-2" id="activate" @endif href="{{ route('survey-answer-status',[$answer->id]) }}">@if($answer->status == 1) <i class="fa fa-lock" aria-hidden="true" title="In Active"></i> @else <i class="fa fa-unlock" aria-hidden="true" title="Active"></i> @endif</button>

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
<!-- modal page add  -->
<!-- Button trigger modal -->
<!-- Modal -->
<div class="modal fade" id="exampleModalCenter1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" data-toggle="modal" data-backdrop="static" data-keyboard="false">
   <div class="modal-dialog modal-dialog-centered" role="document" >
      <div class="modal-content bg-dark">
         <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLongTitle">Add City</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
         </div>
         <div class="modal-body">
            <form action="{{ route('add_survey_answer')}}" method="post" id="formSubmit" enctype="multipart/form-data">
               @csrf
               <input type="hidden" name="survey_question_id" value="{{ $survey_question_id }}">
               <div class="form-group">
                  <label for="" class="text-white">Answer<span style="color:red;">*</span></label>
                  <input type="text" class="form-control"  name="answer" placeholder="answer" required>
               </div>
               <div class="float-right">
                  <button type="button" class="btn btn-light" data-dismiss="modal">Close</button>
                  
                  <button type="submit"  id="loderButton" class="btn btn-primary "><i class="fa fa-spinner fa-pulse fa-fw" id="loderIcon" style="display:none;"></i>Submit</button>

               </div>
            </form>
         </div>
      </div>
   </div>
</div>
@endsection
@section('js')
@endsection