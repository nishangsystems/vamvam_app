<!DOCTYPE html>
<html>
   <head>
      <title>BIAKA Forgot Password Update</title>
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
      </style>
   </head>
   <body class="wave">
      <div class="container">
         <div class="img">
         </div>
         <div class="login-content">
            <form class="form-horizontal auth-form formSubmit"  id="login" action="{{route('admin_updatePassword',[$email])}}" method="post" autocomplete="off">
               @csrf
               <img src="https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/avatar.svg">
               <h2 class="title">Reset Password</h2>
               <div class="input-div one">
                  <div class="i">
                     <i class="fas fa-user"></i>
                  </div>
                  <div class="div">
                     <h5>Password</h5>
                     <input type="password" class="input" name="password"  maxlength="15" required>
                     {{-- <i class="toggle-password fa fa-fw fa-eye-slash icone-eye"></i> --}}
                  </div>
               </div>
               <div class="input-div pass">
                  <div class="i"> 
                     <i class="fas fa-lock"></i>
                  </div>
                  <div class="div">
                     <h5>Confirm Password</h5>
                     <input type="password" class="input" name="confirm_password"  maxlength="15" required>
                  </div>
               </div>
               <a href="{{route('admin_login')}}">Back To Login?</a>
               <!-- <input type="submit" class="btn" value="Login"> -->
               {{-- <button  class="btn" value="submit" type="submit">Submit</button> --}}
               <button type="submit" name="Submit" value="Login"  id="loderButton"  class="btn "><i class="fa fa-spinner fa-pulse fa-fw" id="loderIcon" style="display:none;"></i>Login</button>
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
         
      </script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.1.3/toastr.min.js" integrity="sha512-lbwH47l/tPXJYG9AcFNoJaTMhGvYWhVM9YI43CT+uteTRRaiLCui8snIgyAN8XWgNjNhCqlAUdzZptso6OCoFQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
      <script type="text/javascript">
         $(document).on('submit', 'form#login', function(e) { 
         	$('#loderIcon').show();
            $('#loderButton').prop("disabled", true);
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
                     $('#loderIcon').hide();
                     $('#loderButton').prop("disabled", false);
                     if (response.code == 200) {
                         toastr.success(response.message); 
                         	//form reset
                         	$('#login')[0].reset();
                         	window.location.href= "{{route('admin_login')}}";
                     } else {
                         
                          toastr.error(response.message);
                      }
                   }, 
                   error: function(response) {
                    toastr.error(response.message);
                    
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
