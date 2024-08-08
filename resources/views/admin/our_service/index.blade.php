@extends('admin.layout.app')
@section('content')
<div class="main-panel">
<div class="content">
   <div class="page-inner element-1">
      
      <div class="row">
         <div class="col-md-12">
            <div class="card">
               <div class="card-header d-flex"style="justify-content: space-between;">
                  <h4 class="card-title">Our Service</h4>
                  <div>
                  
                  <button type="button" class="btn btn-primary "data-toggle="modal" data-target="#exampleModalCenter1"><b><i class="fa fa-plus"></i> Add Our Service</b></button>
                  </div>

               </div>
               <div class="card-body element-2">
                  <div class="table-responsive">
                     <table id="basic-datatables" class="display table table-striped table-hover">
                        <thead>
                           <tr>
                              <th>S.No.</th>
                              <th>Title</th>
                              <th>Image</th>
                              <th>Type</th>
                              <th>Display On Banner</th>
                              <th>Sequence</th>
                              <th>Assign Sub Service</th>
                              <th>Action</th>
                           </tr>
                        </thead>
                        <tbody>
                            @php $sr = 1 @endphp
                        
                           @forelse($ourServices as $ourService)
                           <tr>
                              <td>{{ $sr++ }}</td>
                              <td>{{$ourService->title ?? ''}}</td>
                              <td>
                                 <img src="{{ $ourService->image ? asset($ourService->image) : asset('notImage.jpg') }}" width="auto" height="50" alt="icon Image">
                              </td>
                              <td>{{$ourService->type ?? ''}}</td>
                              <td>{{$ourService->display_on_banner ?? ''}}</td>
                              <td>{{$ourService->sequence ?? ''}}</td>
                              <td>{{$ourService->subServiceInfo ? $ourService->subServiceInfo->title : ''}}</td>
                              
                              <td>
                                 <div class="form-button-action">
                                    <button type="button" data-href="{{ route('edit_our-service',[$ourService->id]) }}" class="btn  btn-primary btn-sm mr-1 edit_model" data-toggle="modal" data-target="#edit_model" title="Edit"><i class="fa fa-edit"></i>
                                    </button>

                                    <button id="delete" href="{{ route('delete_our-service',[$ourService->id]) }}" class="btn btn-danger btn-sm jsgrid-delete-button" type="button" title="Delete"><i class="fa fa-trash"></i>
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
   <div class="modal-dialog modal-dialog-centered modal-lg" role="document" >
      <div class="modal-content bg-dark">
         <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLongTitle">Add Our Service</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
         </div>
         <div class="modal-body">
            <form action="{{route('store_our-service') }}" method="post" id="formSubmit" enctype="multipart/form-data" >
            @csrf

               <div class="form-group">
                  <label for="" class="text-white">Title<span style="color:red;">*</span></label>
                  <input type="text" class="form-control" name="title" placeholder="Title" required>
               </div>

               <div class="form-group">
                  <label for="" class="text-white">Type<span style="color:red;">*</span></label>
                  <select class="form-control" name="type"  required>
                     <option value="">Select Type</option>
                     <option value="Home">Home</option>
                     <option value="Other">Other</option>
                  </select>
               </div>

               <div class="form-group">
                  <label for="" class="text-white">Display On Banner<span style="color:red;">*</span></label>
                  <select class="form-control" name="display_on_banner"  required>
                     <option value="">Select Status</option>
                     <option value="Yes">Yes</option>
                     <option value="No">No</option>
                  </select>
               </div>

               <div class="form-group element">
                  <label for="" class="text-white">Sequence<span style="color:red;">*</span></label>
                  <input type="text" name="sequence" class="form-control" required onkeypress="return numbersonly(event)">
               </div>
              
              <div class="form-group">
                  <label for="" class="text-white">Description<span style="color:red;">*</span></label>
                  <input type="text" class="form-control" name="description" placeholder="Description" required>
               </div>

                        
               <div class="form-group element">
                  <label for="" class="text-white">Image<span style="color:red;">*</span></label>
                  <input type="file" name="image" class="form-control" onchange="return validate_fileupload(this)" accept=".png,.jpg,.jpeg,.webp" required>
               </div>
               
             
               <div class="float-right mt-2">
                  <button type="button btn-light" class="btn btn-light" data-dismiss="modal">Close</button>
                  <button type="submit" class="btn btn-primary">Save</button>
               </div>
            </form>
         </div>
      </div>
   </div>
</div>


@endsection

@section('js')
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

@endsection


