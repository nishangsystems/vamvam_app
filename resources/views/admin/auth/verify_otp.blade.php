<!DOCTYPE html>
<html>
   <head>
      <title>BIAKA Forgot Verify OTP</title>
      <link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
      <link rel="icon" href="assets/img/favicon.png" type="../image/x-icon">
      <script src="https://kit.fontawesome.com/a81368914c.js"></script>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta property="og:url" content="" />
      <meta name="description" content="">
      <meta name="twitter:image" content="">
      <meta property="og:title" content="">
      <meta name="image" property="og:image" content=""/>
      <meta property="og:description" content=""/>
      <meta property="og:url" content=""/>
      <meta property="og:type" content="website" />
      <link rel="stylesheet" type="text/css" href="{{asset('assets/css/admin.css')}}">
      <script src="{{asset('assets/js/core/jquery.3.2.1.min.js')}}"></script>
      <link rel="stylesheet" href="{{asset('assets/css/toastr.min.css')}}">
      <style>	
         .wave{
               background: url({{asset('assets/img/loginbg.png')}});
         }
         .between_btn{
         display: flex;
         justify-content: space-between;
         }
         .between_btn a{
         display:contents;
         }
         .between_btn input{
         color: #999;
         font-size: 0.9rem;
         background: no-repeat;
         border: none;
         font-weight:bold
         }
      </style>
   </head>
   <body class="wave">
      <!-- <img class="wave" src="../auth/login-bg.png" > -->
      <div class="container">
         <div class="img">
            <!-- 	<img src="https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/bg.svg"> -->
         </div>
         <div class="login-content">
            <form class="form-horizontal auth-form"   action="{{route('admin_match_otp')}}" method="post" autocomplete="off">
               @csrf
               <input type="hidden" name="email" value="{{$email}}"> 
               <img src="https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/avatar.svg">
               <h2 class="title">Verify OTP</h2>
               <div class="input-div one">
                  <div class="i">
                     <i class="fas fa-user"></i>
                  </div>
                  <div class="div">
                     <h5>OTP</h5>
                     <input type="text" class="input" name="otp" onkeypress="return numbersonly(event)" maxlength="4">
                  </div>
               </div>
               <div class="between_btn">
                  <input type="submit" name="submit_type" class="" value="Resend  Otp">
                  <a href="{{route('admin_login')}}">Back To Login?</a>
               </div>
               <input type="submit" name="submit_type" class="btn" value="Submit">
            </form>
         </div>
      </div>
      <script>
         const inputs = document.querySelectorAll(".input");
         
         
         function addcl(){
         let parent = this.parentNode.parentNode;
         parent.classList.add("focus");
         }
         
         function remcl(){
         let parent = this.parentNode.parentNode;
         if(this.value == ""){
         parent.classList.remove("focus");
         }
         }
         
         
         inputs.forEach(input => {
         input.addEventListener("focus", addcl);
         input.addEventListener("blur", remcl);
         });
         
         //Source :- https://github.com/sefyudem/Responsive-Login-Form/blob/master/img/avatar.svg
      </script>
      <!-- <script src="{{ asset('assets/js/toastr.min.js') }}"></script> -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.1.3/toastr.min.js" integrity="sha512-lbwH47l/tPXJYG9AcFNoJaTMhGvYWhVM9YI43CT+uteTRRaiLCui8snIgyAN8XWgNjNhCqlAUdzZptso6OCoFQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
      <script type="text/javascript">
         $(document).on('submit', 'form#login', function(e) { 
         	console.log("dassdasdsad");
               e.preventDefault();
               var data = new FormData(this);
               $.ajax({
                   cache:false,
                   contentType: false,
                   processData: false,
                   url: $(this).attr("action"),
                   method: $(this).attr("method"),
                   dataType: "json",
                   data: data,
                   "_token": "{{ csrf_token() }}",
                   success: function(response) { 
                    
                     if (response.responseCode == 200) {
                         toastr.success(response.responseMessage); 
                         	//form reset
                         	$('#login')[0].reset();
                         	window.location.href= "";
                     } else {
                         
                          toastr.error(response.responseMessage);
                      }
                   }, 
                   error: function(response) {
                    toastr.error(response.responseMessage);
                    
                   }
         
               }); 
         });
      </script>
      <script>
         function numbersonly(e) {
            var k = event ? event.which : window.event.keyCode;
                     if (k == 32) return false;
                       var unicode=e.charCode? e.charCode : e.keyCode;
         
                       if (unicode!=8) { //if the key isn't the backspace key (which we should allow)
                           if (unicode<48||unicode>57) //if not a number
                           return false //disable key press
                       }
                   }
      </script>
      <script>
         function alphaonly(evt) {
                 var keyCode = (evt.which) ? evt.which : evt.keyCode
                 if ((keyCode < 65 || keyCode > 90) && (keyCode < 97 || keyCode > 123) && keyCode != 32)
                 return false;  
         }
      </script>
   </body>
</html>
