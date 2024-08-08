<!-- Modal -->
<div class="modal fade edit_model" id="exampleModalCenter1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" data-toggle="modal" data-backdrop="static" data-keyboard="false">
   <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content bg-dark">
         <div class="modal-header">
            <h5 class="modal-title my_edit_title" id="exampleModalLongTitle">Edit Banner</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
         </div>
         <div class="modal-body">
            <form  action="{{route('update_banner') }}" method="post"  enctype="multipart/form-data"  id="formSubmit">
            @csrf
               <input type="hidden" name="id" value="{{$banner->id}}">
                              
               <div class="form-group element">
                  <label for="" class="text-white">Banner Image<span><small class="text-danger mx-2">(Only 631px * 519px Size , Upto 500kb)</small></span></label>
                  <input type="file" class="form-control"  value="{{asset($banner->image)}}"  name="image" onchange="return validate_fileupload(this)" accept=".png,.jpg,.jpeg,.webp,.gif" >
                  @if($banner->image)
                  <img src="{{asset($banner->image)}}" class="img-circle mt-2" style="height: 125px;max-width: 100%" alt="{{$banner->name}}">
                  @endif
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
    
</script>