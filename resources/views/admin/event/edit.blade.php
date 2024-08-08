@extends('admin.layout.app')
@section('content')
<div class="main-panel">
    <div class="content">
        <div class="page-inner element-1">

            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <div class="card-title">Edit Event</div>
                        </div>
                        <form action="{{ route('admin_event_update') }}" method="post" id="formSubmitBack" enctype="multipart/form-data">
                            @csrf
                            <input type="hidden" name="event_id" value="{{ base64_encode($event->id) }}">
                            <div class="card-body element-2">
                                <div class="row">
                                    
                                     <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="name">Title<span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="title" name="title" placeholder="Enter Title" value="{{$event->title ?? ''}}" required>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="name">Address<span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="address" name="address" placeholder="Enter Address" value="{{$event->address ?? ''}}" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="name">Start Date Time<span class="text-danger">*</span></label>
                                            <input type="datetime-local" class="form-control" id="start_date_time" name="start_date_time" placeholder="Enter Start Date Time" value="{{$event->start_date_time ?? ''}}" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="name">End Date Time<span class="text-danger">*</span></label>
                                            <input type="datetime-local" class="form-control" id="end_date_time" name="end_date_time" placeholder="Enter End Date Time" value="{{$event->end_date_time ?? ''}}" required>
                                        </div>
                                    </div>

                                     <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="name">Image</label>
                                            <input type="file" class="form-control" id="image" name="image" accept="image/*">

                                            @if($event->image)
                                               <img src="{{asset($event->image)}}" class="profile_img">
                                            @endif 
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="name">Video</label>
                                            <input type="file" class="form-control" id="video" name="video" accept="video/*">
                                         @if($event->video)
                                            <img src="{{asset($event->video)}}" class="profile_img">
                                            <video width="220" height="150" controls>
                                              <source src="{{asset($event->video)}}" type="video/mp4">
                                              <!-- <source src="movie.ogg" type="video/ogg"> -->
                                            </video>
                                         @endif   
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="Mobile-no">Description<span class="text-danger">*</span></label>
                                            <textarea class="form-control" name="description" required>{{$event->description ?? ''}}</textarea>
                                        </div>
                                    </div>




                                </div>                                
                            </div>
                            <div class="card-action element-2 text-center">
                                <a href="{{route('admin_leader')}}" class="btn btn-light mr-2 btn-size-cus">Cancel</a>
                                <button type="submit" name="Submit" id="loderButton" class="btn btn-primary px-5 rounded-0 btn-size-cus"><i class="fa fa-spinner fa-pulse fa-fw" id="loderIcon" style="display:none;"></i>Update</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @endsection

@section('js')
    <script type="text/javascript">
        // Destroy on button
        $("#area").change(function(){  
          //e.preventDefault();
          var area_type = document.getElementById('area').value;
          
          $("#ruralForm").hide();
          $("#urbanForm").hide();

          if(area_type == 'Urban'){
            $("#urbanForm").show();
          }
          if(area_type == 'Rural'){
            $("#ruralForm").show();
          }
        }); // end Document.
    </script>

    @endsection
