@extends('admin.layout.app')
@section('css')
<style>
    .dob-cls {
    box-sizing: border-box;
    outline: 0;
    padding: .75rem;
    position: relative;
    width: 100%;
}

.dob-cls[type="date"]::-webkit-calendar-picker-indicator {
    background: transparent;
    bottom: 0;
    color: transparent;
    cursor: pointer;
    height: auto;
    left: 0;
    position: absolute;
    right: 0;
    top: 0;
    width: auto;
}

 .search-by-dv {
        display: flex;
        flex-direction: row;
        flex-wrap: nowrap;
        align-content: center;
        justify-content: center;
        align-items: center;
    }
    .card-action-searchby {
        display: flex;
        flex-direction: row;
        flex-wrap: nowrap;
        align-content: center;
        justify-content: center;
        align-items: center;
        margin-top: 25px;
    }
</style>
@endsection

@section('content')
<div class="main-panel">
    <div class="content">
        <div class="page-inner element-1">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <div class="card-title">Add Event</div>
                        </div>
                        <form action="{{ route('admin_event_store') }}" method="post" id="formSubmitBack" enctype="multipart/form-data">
                            @csrf
                            <div class="card-body element-2">
                                <div class="row">
                                    

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="name">Title<span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="title" name="title" placeholder="Enter Title" required>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="name">Address<span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="address" name="address" placeholder="Enter Address" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="name">Start Date Time<span class="text-danger">*</span></label>
                                            <input type="datetime-local" class="form-control" id="start_date_time" name="start_date_time" placeholder="Enter Start Date Time" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="name">End Date Time<span class="text-danger">*</span></label>
                                            <input type="datetime-local" class="form-control" id="end_date_time" name="end_date_time" placeholder="Enter End Date Time" required>
                                        </div>
                                    </div>
                                     <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="name">Image</label>
                                            <input type="file" class="form-control" id="image" name="image" accept="image/*">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="name">Video</label>
                                            <input type="file" class="form-control" id="video" name="video" accept="video/*">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="Mobile-no">Description<span class="text-danger">*</span></label>
                                            <textarea class="form-control" name="description" required></textarea>
                                        </div>
                                    </div>
                                                                      
                                </div>                                
                            </div>
                            <div class="card-action element-2 text-center">
                                <a href="{{route('admin_event')}}" class="btn btn-light mr-2 btn-size-cus">Cancel</a>
                                <button type="submit" name="Submit" id="loderButton" class="btn btn-primary px-5 rounded-0 btn-size-cus"><i class="fa fa-spinner fa-pulse fa-fw" id="loderIcon" style="display:none;"></i>Submit</button>
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
         $(window).on("load", function () {
            var today = new Date().toISOString().slice(0, 16);
            document.getElementsByName("start_date_time")[0].min = today;
            document.getElementsByName("end_date_time")[0].min = today;
         });
     </script>
     
    @endsection

 