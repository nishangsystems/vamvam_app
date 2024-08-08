@extends('admin.layout.app')
@section('content')
<div class="main-panel">
<div class="content">
   <div class="page-inner element-1">
      <div class="page-header">
         <!-- <h4 class="page-title text-white">Forum Category</h4> -->
      </div>
      <div class="row">
         <div class="col-md-12">
            <div class="card">
               <div class="card-header d-flex"style="justify-content: space-between;">
                  <h4 class="card-title">Survey Question </h4>
                  <div>
                     <a href="{{route('survey_question_create')}}" class="btn btn-primary" ><b><i class="fa fa-plus"></i> Add Question</b></a>
                  </div>

               </div>
               <div class="card-body element-2">
                  <div class="table-responsive">
                     <table id="multi-filter-select" class="display table table-striped table-hover">
                        <thead>
                           <tr>
                              <th>S.No.</th>
                              <th>Question</th>
                              <th>Week Start Date</th>
                              <th>Week End Date</th>
                              <th> Status</th>
                              <th>Action</th>
                           </tr>
                        </thead>
                        <tbody>
                           @php $sr = 1 @endphp
                           @foreach($lists as $key => $value)

                           @php
                           $newStr = explode("-", $value->week_date);
                           $weekNum =  ltrim($newStr[1], 'W');
                           $year = $newStr[0];

                           $week_array = getStartAndEndDate($weekNum,$year);
                           @endphp
                           <tr>
                              <td>{{ $sr++ }}</td>
                              <td>{{ $value->question ?? '' }}</td>
                              <td>{{ isset($week_array) ? $week_array['week_start'] : '' }}</td>
                              <td>{{ isset($week_array) ? $week_array['week_end'] : '' }}</td>
                              <td> 
                                 @if($value->status == 1)
                                 <span class="text-success">Active</span>
                                 @else
                                 <span class="text-danger">Inactive</span>
                                 @endif
                              </td>
                              
                              <td>
                                 <div class="form-button-action">
                                    <a type="button" class="btn  btn-primary btn-sm mr-1" href="{{ route('survey_question_edit',[$value->id]) }}" title="Edit">
                                    <i class="fa fa-edit"></i>
                                    </a>

                                    <button type="button" @if($value->status == 1) class="btn btn-danger btn-xs mr-2" id="deactivate" @else class="btn btn-success btn-xs mr-2" id="activate" @endif href="{{ route('survey_question_status',[$value->id]) }}">@if($value->status == 1) <i class="fa fa-lock" aria-hidden="true" title="In Active"></i> @else <i class="fa fa-unlock" aria-hidden="true" title="Active"></i> @endif</button>

                                    <a type="button" class="btn  btn-info btn-sm mr-1" href="{{ route('survey_answer',[$value->id]) }}" title="Answer">
                                    <i class="fa fa-list"></i>
                                    </a>
                                 </div>
                              </td>
                           </tr>
                           @endforeach
                        </tbody>
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
@endsection