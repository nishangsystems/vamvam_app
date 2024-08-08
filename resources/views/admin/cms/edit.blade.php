@extends('admin.layout.app')
@section('content')

<div class="main-panel">
         <div class="content">
            <div class="page-inner element-1">
               
               <div class="row">
                  <div class="col-md-12">
                     <div class="card">
                        <div class="card-header">
                           <div class="card-title">Edit CMS Form</div>
                        </div>
                        <form action="{{route('edit_cms')}}" method="post" enctype="multipart/form-data" >
                           @csrf
                        <input type="hidden" name="id" value="{{$cms->id}}">
                        <div class="card-body element-2">
                           <div class="row">
                              <div class="col-md-12">
                                 <div class="form-group">
                                    <label for="inlineinput">Title<span class="text-danger">*</span></label>
                                    <input type="text" name="name" class="form-control" id="inlineinput" placeholder="Enter Question" value="{{$cms->name}}" required>
                                 </div>
                              </div>
                              <div class="col-md-12">
                                 <div class="form-group">
                                    <label>Description<span style="color:red;">*</span></label>
                            <textarea class="summernote"  name="details" class="form-control" spellcheck="false" required>{{$cms->details ?? ''}}</textarea>
                                 </div>
                              </div>
                             
                           </div>
                        </div>
                        <div class="card-action element-2 text-center">
                           <a href="{{url('admin/cms')}}" class="btn btn-light mr-2 btn-size-cus">Cancel</a>
                           {{-- <button class="btn btn-primary" type="submit">Update</button> --}}
                           <button type="submit" name="Submit"  id="loderButton"  class="btn btn-primary px-5 rounded-0 btn-size-cus"><i class="fa fa-spinner fa-pulse fa-fw" id="loderIcon" style="display:none;"></i>Update</button>
                        </div>
                        </form>
                     </div>
                  </div>
               </div>
            </div>
         </div>
@endsection