<!-- Modal -->
<div class="modal fade edit_model" id="exampleModalCenter1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" data-toggle="modal" data-backdrop="static" data-keyboard="false">
   <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content bg-dark">
         <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLongTitle">Edit Answer</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
            </button>
         </div>
         <div class="modal-body">
            <form  action="{{ route('edit-survey-answer-update') }}" method="post" enctype="multipart/form-data"  id="formSubmit">
               @csrf
               <input type="hidden" name="id" value="{{$answer->id}}">
               <input type="hidden" name="survey_question_id" value="{{$answer->survey_question_id}}">
               <div class="form-group">
                  <label for="" class="text-white">Answer<span style="color:red;">*</span></label>
                  <input type="text" class="form-control" placeholder="answer" name="answer" value="{{$answer->answer?? ''}}" required>
               </div>
               <div class="float-right">
                  <button type="button" class="btn btn-light" data-dismiss="modal">Close</button>

                  <button type="submit"  id="loderButton" class="btn btn-primary "><i class="fa fa-spinner fa-pulse fa-fw" id="loderIcon" style="display:none;"></i>Update</button>

               </div>
            </form>
         </div>
      </div>
   </div>
</div>
<script type="text/javascript">
   $(function () {
      $('[id*=btnSave]').click(function () {
         $('[id*=myModal]').modal('hide');
      });
   });
</script>