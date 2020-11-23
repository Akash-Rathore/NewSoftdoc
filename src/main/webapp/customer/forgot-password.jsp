<!DOCTYPE html>
<html lang="en">
   <head>
      <title>SoftDoc Login</title>
      <!-- Meta tags -->
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
      <meta name="keywords" />
      <link rel="icon" href="images/favicon.png" type="image/x-icon">
      <script>
         addEventListener("load", function () { setTimeout(hideURLbar, 0); }, false); function hideURLbar() { window.scrollTo(0, 1); }
      </script>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
      <link href="../css/login.css" rel="stylesheet" type='text/css' media="all">
      <style>
        body{
              background:url("../images/background.jpg");
            }
        
        .loader{
     
          display:none;
         
        } 
            
     </style>
   
   </head>
   <body>

      <div class="mid-class">
         <div class="art-right-w3ls">
            <h2>Forgot Password</h2>
            <form id="sign_in" method="post">
               <div class="main">
                  <div class="form-left-to-w3l">
                     <input type="email"  name="email" placeholder="softdoc@gmail.com" required="required">
                  </div>
                 <div class="form-left-to-w3l ">
                     <div class="form-line"> 
                        <select class="form-control show-tick"  name="role_status" required="required">
                              <option value="">Select</option>
                              <option value="admin">Admin</option>
                              <option value="client">Client</option>
                       </select>
                   	</div>
                    <div class="clear"></div>                 
                 </div>
               </div>
               <div class="clear"></div>
               <div class="btnn">   
                  <button type="submit" id="preloader" name="submit">RESET MY PASSWORD</button>
                  <br>
                  <br>
                  <div class="loader">
                       <img src="../images/preloader.gif"  alt="Loader" style="width: 60px;height:60px;">
                  </div>
                  <div class="align-left">
                      <a href="index.jsp">Sign IN</a>
                  </div>
                  
               </div>
            </form>
            <!-- popup-->
            <div id="content1" class="popup-effect">
               <div class="popup">
                  <!--login form-->
                  <div class="letter-w3ls">
                     <form method="post">
                        <div class="form-left-to-w3l">
                           <input type="text" name="name" placeholder="Username" required="">
                        </div>
                        <div class="form-left-to-w3l">
                           <input type="text" name="name" placeholder="Phone" required="">
                        </div>
                        <div class="form-left-to-w3l">
                           <input type="email" name="email" placeholder="Email" required="">
                        </div>
                        <div class="form-left-to-w3l">
                           <input type="password" name="password" placeholder="Password" required="">
                        </div>
                        <div class="form-left-to-w3l margin-zero">
                           <input type="password" name="password" placeholder="Confirm Password" required="">
                        </div>
                        <div class="btnn">
                           <button class="btn btn-block bg-light-blue"  type="submit">SIGN IN</button>
                           
                        </div>
                     </form>
                     <div class="clear"></div>
                  </div>
                  <!--//login form-->
                  <a class="close" href="#">&times;</a>
               </div>
            </div>
            <!-- //popup -->
         </div>
         <div class="art-left-w3ls">
            <div class="logo-login">
               <a>
                  <img src="../images/logo.png" alt="SoftDoc">
               </a>
            </div>
            <h1 class="header-w3ls">
               SoftDoc LogIn
            </h1>
         </div>
      </div>
      <footer class="bottem-wthree-footer">
         <p>
            Copyright © 2020. All Rights Reserved.
         </p>
      </footer>
  
  <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
   
<script>
  $('#sign_in').submit(function(e){
    e.preventDefault();
    
     var form=$(this);
	 var formdata=new FormData($(form)[0]);
	 var data={};
     formdata.forEach(function(value,key)
	 {
		 data[key]=value;
	 });
	 
     console.log(data);
     
     
     $.ajax({
    	 
    	    url:"../customerforgot",
   	        type:"POST",
   	        dataType:"json",
   	        data:data,
   	        beforeSend:function(){
	        	
 	            $('#preloader').hide(); 
	        	$('.loader').show();
 	    
	        },
   	        success:function(data,textStatus,jqXHR)
   	        {
   	        
   	          console.log(data);	
   	          if(data.status){	
   	        	
   	        	 $('.loader').hide();
   	        	  Swal.fire({
	    			  position: 'center',
	    			  icon: 'success',
	    			  title: 'Password sent to your registered Email address',
	    			  text:"Please check your email",
	    			  timer: 2500
	    			  
	    			})
	       	  }
	    	  else 
	    	  {
	    		 $('.loader').hide();
	   	           Swal.fire({
	    			  icon:'error',
	    			  title:'Email address does not exist',
	    			  text:"Please enter valid email address",
	    			  footer:'',
	    			  timer:3000
	    			}) 
	    	  }
        
   	    	    
   	      },
   	      error:function(e)
   	      {
   	    	
   	    	Swal.fire({
	    			  icon:'error',
	    			  title:'Password Wrong',
	    			  text:"Something went wrong",
	    			  footer:'',
	    			  timer:3500
	    			 })
   	    	
   	    	console.log("error in pages");
   		    $('#preloader').show();
			$('.loader').hide();
		
   	    }
      
   	     
    });
    
 });
</script>
</body>
</html>


