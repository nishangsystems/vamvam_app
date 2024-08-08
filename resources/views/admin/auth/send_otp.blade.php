<!DOCTYPE html>
<html>
   <head>
      <title>BIAKA Forgot Password</title>
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
            <form class="form-horizontal auth-form"   action="{{route('admin_send_otp')}}" method="post" autocomplete="off">
               @csrf
               <img src="https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/avatar.svg">
               <h2 class="title">Forget Password</h2>
               <div class="input-div one">
                  <div class="i">
                     <i class="fas fa-user"></i>
                  </div>
                  <div class="div">
                     <h5>Enter Your Registered Email</h5>
                     <input type="email" class="input" name="email" required>
                  </div>
               </div>
               <a href="{{route('admin_login')}}">Back To Login?</a>
               <button  class="btn" value="Send OTP" type="submit">Send OTP</button>
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
                    
                     if (response.code == 200) {
                         toastr.success(response.message); 
                         	$('#login')[0].reset();
                         	window.location.href= "";
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
   </body>
</html>
