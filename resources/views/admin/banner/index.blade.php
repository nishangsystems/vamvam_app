@extends('admin.layout.app')
@section('content')
<div class="main-panel">
<div class="content">
   <div class="page-inner element-1">
      
      <div class="row">
         <div class="col-md-12">
            <div class="card">
               <div class="card-header d-flex"style="justify-content: space-between;">
                  <h4 class="card-title">Banner</h4>
                  <div>
                    <button type="button" class="btn btn-primary "data-toggle="modal" data-target="#exampleModalCenter1"><b><i class="fa fa-plus"></i> Add Banner</b></button>
                  </div>
               </div>
               <div class="card-body element-2">
                  <div class="table-responsive">
                     <table id="basic-datatables" class="display table table-striped table-hover">
                        <thead>
                           <tr>
                              <th>Image</th>
                              <th>Action</th>
                           </tr>
                        </thead>
                        <tbody>
                     
                           @forelse($banners as $banner)
                           <tr>
                              <td>
                                 <img src="{{ $banner->image ? asset($banner->image) : asset('notImage.jpg') }}" width="auto" height="150" alt="Banner Image">
                              </td>
                              <td>
                                 <div class="form-button-action">
                                    <button type="button" data-href="{{ route('edit_banner',[$banner->id]) }}" class="btn  btn-primary btn-sm mr-1 edit_model" data-toggle="modal" data-target="#edit_model" title="Edit"><i class="fa fa-edit"></i>
                                    </button>

                                    <button id="delete" href="{{ route('delete_banner',[$banner->id]) }}" class="btn btn-danger btn-sm jsgrid-delete-button" type="button" title="Delete"><i class="fa fa-trash"></i>
                                    </button>
                                
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
<div class="modal fade" id="exampleModalCenter1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" data-toggle="modal" data-backdrop="static" data-keyboard="false">
   <div class="modal-dialog modal-dialog-centered" role="document" >
      <div class="modal-content bg-dark">
         <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLongTitle">Add Banner</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
         </div>
         <div class="modal-body">
            <form action="{{route('store_banner') }}" method="post" id="formSubmit" enctype="multipart/form-data" >
            @csrf

               <div class="form-group element">
                  <label for="" class="text-white">Banner Image<span style="color:red;">*</span></label>
                  <input type="file" name="image" class="form-control" onchange="return validate_fileupload(this)" accept=".png,.jpg,.jpeg,.webp,.gif" >
               </div>

                              
             
               <div class="float-right mt-2">
                  <button type="button btn-light" class="btn btn-light" data-dismiss="modal">Close</button>
                  <button type="submit" name="Submit"  id="loderButton"  class="btn btn-primary px-5 rounded-0 btn-size-cus"><i class="fa fa-spinner fa-pulse fa-fw" id="loderIcon" style="display:none;"></i>Save</button>
               </div>
            </form>
         </div>
      </div>
   </div>
</div>


@endsection

@section('js')
<script type="text/javascript">
   
</script>

@endsection


