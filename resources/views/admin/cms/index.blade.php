@extends('admin.layout.app')
@section('content')
<div class="main-panel">
<div class="content">
   <div class="page-inner element-1">
     
      <div class="row">
         <div class="col-md-12">
            <div class="card">
               <div class="card-header">
                  <h5 class="card-title">CMS Management</h5>
               </div>
               <div class="card-body element-2">
                  <div class="table-responsive">
                     <table id="multi-filter-select" class="display table table-striped table-hover">
                        <thead>
                           <tr>
                              <th>S.No.</th>
                              <th>Title</th>
                              
                              <th>Action</th>
                           </tr>
                        </thead>
                        <tbody>
                           @foreach($cms_list as $key=>$cms)
                    <tr>
                      <td>{{$key+1}}</td>
                      <td>{{$cms->name ?? ''}}</td>
                      
                      <td>
                          <div class="form-button-action">
                           <a type="button" class="btn  btn-primary btn-sm mr-1" href="{{ route('update_cms',[$cms->short_name]) }}" title="Edit">
                              <i class="fa fa-edit"></i>
                           </a>
                    
                         
                        </div>  
                      </td>
                    </tr>
                    @endforeach
                     </table>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>


@endsection



