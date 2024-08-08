@extends('admin.layout.app')
@section('content')
    <div class="main-panel">
        <div class="content">
            <div class="page-inner element-1">

                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <div class="card-title">Add Question</div>
                            </div>
                            <form action="{{ route('survey_question_store') }}" method="post" enctype="multipart/form-data" id="formSubmit">
                                @csrf
                                
                                <div class="card-body element-2">
                                    
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="inlineinput">Quesstion<span class="text-danger">*</span></label>
                                                <input type="text" name="question" class="form-control" id="inlineinput"
                                                    placeholder="Enter question" value="" required>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="week_date">Select Week<span class="text-danger">*</span></label>
                                                <input type="week" name="week_date" class="form-control" id="week_date" required>
                                            </div>
                                        </div>
                                                                               
                                    </div>
                                </div>
                                
                                <div class="card-action element-2 text-center">
                                <a href="{{ route('survey_question_list') }}" class="btn btn-light mr-2">Cancel</a>
                                    
                                <button type="submit"  id="loderButton" class="btn btn-primary "><i class="fa fa-spinner fa-pulse fa-fw" id="loderIcon" style="display:none;"></i>Submit</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    @endsection
