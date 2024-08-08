<!-- Modal -->
<div class="modal fade edit_model" id="exampleModalCenter1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" data-toggle="modal" data-backdrop="static" data-keyboard="false">
   <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
      <div class="modal-content bg-dark">
         <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLongTitle">Edit IssueType</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
         </div>
         <div class="modal-body">
            <form  action="{{route('admin_update_issue-type') }}" method="post"  enctype="multipart/form-data"  id="formSubmit">
            @csrf
               <input type="hidden" name="id" value="{{$list->id}}">
               
               <div class="form-group">
                  <label for="" class="text-white">Name</label>
                  <input type="text" class="form-control" placeholder="Name" name="name" value="{{$list->name}}" required>
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