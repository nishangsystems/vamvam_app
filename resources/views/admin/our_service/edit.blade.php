<!-- Modal -->
<div class="modal fade edit_model" id="exampleModalCenter1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" data-toggle="modal" data-backdrop="static" data-keyboard="false">
   <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
      <div class="modal-content bg-dark">
         <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLongTitle">Edit Our Service</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
         </div>
         <div class="modal-body">
            <form  action="{{route('update_our-service') }}" method="post"  enctype="multipart/form-data"  id="formSubmit">
            @csrf
               <input type="hidden" name="id" value="{{$ourService->id}}">
               <div class="form-group">
                  <label for="" class="text-white">Title</label>
                  <input type="text" class="form-control" placeholder="Title" name="title" value="{{$ourService->title}}" required>
               </div>

               <div class="form-group">
                  <label for="" class="text-white">Type<span style="color:red;">*</span></label>
                  <select class="form-control" name="type"  required>
                     <option value="">Select Type</option>
                     <option value="Home" @if($ourService->type == 'Home') Selected @endif>Home</option>
                     <option value="Other" @if($ourService->type == 'Other') Selected @endif>Other</option>
                  </select>
               </div>

               <div class="form-group">
                  <label for="" class="text-white">Display On Banner<span style="color:red;">*</span></label>
                  <select class="form-control" name="display_on_banner"  required>
                     <option value="">Select Status</option>
                     <option value="Yes" @if($ourService->display_on_banner == 'Yes') Selected @endif>Yes</option>
                     <option value="No" @if($ourService->display_on_banner == 'No') Selected @endif>No</option>
                  </select>
               </div>


               <div class="form-group element">
                  <label for="" class="text-white">Sequence<span style="color:red;">*</span></label>
                  <input type="text" name="sequence" class="form-control" value="{{$ourService->sequence}}" required onkeypress="return numbersonly(event)">
               </div>
               
              
               <div class="form-group">
                  <label for="" class="text-white">Description<span style="color:red;">*</span></label>
                  <input type="text" class="form-control" name="description" placeholder="Description" required value="{{$ourService->description ?? ''}}">
               </div>
               <div class="form-group element">
                  <label for="" class="text-white">Image</label>
                  <input type="file" class="form-control"  name="image" onchange="return validate_fileupload(this)" accept=".png,.jpg,.jpeg" >
                  @if($ourService->image)
                  <img src="{{asset($ourService->image)}}" class="img-circle mt-2" style="height: 125px;max-width: 100%" alt="image">
                  @endif
               </div>

               <div class="form-group">
                  <label for="" class="text-white">Assign Sub Service</label>
                  <select class="form-control" name="assign_sub_service" id="assign_sub_service">
                     <option value="">Select Service</option>
                     @foreach($ourSubService as $service)
                         <option value="{{ $service->id }}" @if ($ourService->assign_sub_service == $service->id) selected @endif>{{ $service->title }}
                         </option>
                     @endforeach
                 </select>
               </div>
               
              
               <div class="float-right mt-2">
                  <button type="button btn-light" class="btn btn-light btn-size-cus" data-dismiss="modal">Close</button>
                  <button type="submit" name="Submit"  id="loderButton"  class="btn btn-primary px-5 rounded-0 btn-size-cus"><i class="fa fa-spinner fa-pulse fa-fw" id="loderIcon" style="display:none;"></i>Update</button>
               </div>
            </form>
         </div>
      </div>
   </div>
</div>
<!--Vehicle Sub Category on the basis of Category  -->
<script type="text/javascript">
    function numbersonly(e) {
        var k = event ? event.which : window.event.keyCode;
        if (k == 32) return false;
        var unicode = e.charCode ? e.charCode : e.keyCode;

        if (unicode != 8) { //if the key isn't the backspace key (which we should allow)
            if (unicode < 48 || unicode > 57) //if not a number
                return false //disable key press
        }
    }

    function alphaonly(evt) {
        var keyCode = (evt.which) ? evt.which : evt.keyCode
        if ((keyCode < 65 || keyCode > 90) && (keyCode < 97 || keyCode > 123) && keyCode != 32)
            return false;
    }
</script>