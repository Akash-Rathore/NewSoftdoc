<%        
       
        response.setHeader("Cache-Control","no-cache,no-store,must-revalidate"); 
		String user=(String)session.getAttribute("customeremail");
		if(user!=null)
		{
			   response.sendRedirect("./dashboard.jsp");
		}
      
		 String client_user=(String)session.getAttribute("clientemail");
         if(client_user !=null)
         {
      	   response.sendRedirect("../client/dashboard.jsp");
         }
      
      
 %>
<!DOCTYPE html>
<html lang="en">
   <head>
      <title>SoftDoc Login</title>
      <!-- Meta tags -->
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
      <meta name="keywords" />
      <link rel="icon" href="../images/favicon.png" type="image/x-icon">
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
            <h2>Sign In</h2>
            <form id="sign_in" method="post">
               <div class="main">
                  <div class="form-left-to-w3l">
                     <input type="email"  name="email" placeholder="softdoc@gmail.com" required="required">
                  </div>
                  <div class="form-left-to-w3l ">
                     <input type="password"  name="password" placeholder="**********" required="required">
                     <div class="clear"></div>
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
                  <button type="submit" id="preloader" name="submit">Sign In</button>
                  <br>
                  <br>
                  <div class="loader">
                       <img src="../images/preloader.gif"  alt="Loader" style="width: 60px;height:60px;">
                  </div>
                  <div class="align-left">
                     <a href="forgot-password.jsp">Forgot Password?</a>
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
                           <br>
                           <div class="loader">
                               <img src="../images/preloader.gif"  alt="" style="width: 60px;height:60px;background-color:yellow">
                           </div>
                           
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
         <p>This site performs best on Google Chrome</p>
        
      </footer>
  
   <script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   
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
   	        url:"../customerlogin",
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
    	      if(data.status && data.role == 'admin')
   	          {
    	    	   $('.loader').hide();
    	    	   window.location.href='./dashboard.jsp';     
   	    		
   	    	  }
    	      else if(data.status && data.role == 'client')
     	      {
    	    	    $('.loader').hide();
    	    	    sessionStorage.setItem("department", data.department);
    	    	    window.location.href='../client/dashboard.jsp';     
       	    		 
     	    		
     	      }
    	      else 
   	    	  {
   	    		    Swal.fire({
   	    			  icon:'error',
   	    			  title:'Password Wrong',
   	    			  text:"Something went wrong",
   	    			  footer:'',
   	    			  timer:3500
   	    			 }) 
   	    			 $('#preloader').show();
	    			 $('.loader').hide();
	    		  	 
   	    			 
   	    		  	
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


