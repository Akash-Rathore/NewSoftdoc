<!DOCTYPE html>
<%        
           response.setHeader("Cache-Control","no-cache,no-store,must-revalidate"); 
           String user=(String)session.getAttribute("Email");
           if(user!=null)
           {
        	   response.sendRedirect("dashboard.jsp");
           }
%>
   <html>
   <head>
   <meta charset="UTF-8">
   <meta content="width=device-width, initial-scale=1, maximum-scale=1, name="viewport">
   <title>Log IN | SoftDoc</title>
   <link rel="icon" href="../images/favicon.png" type="image/x-icon">
   <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
   <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">
   <link href="../plugins/bootstrap/css/bootstrap.css" rel="stylesheet">
   <link href="../css/style.css" rel="stylesheet">
   <style>
       .loader{
     
      display:none;
      
     }
   </style>
  
 </head>
 <body class="login-page">
    <div class="login-box">
        <div class="logo">
            <a href="javascript:void(0);">Softdoc <strong>Admin</strong></a>
            <!-- <small>Admin BootStrap Based - Material Design</small> -->
        </div>
        <div class="card">
            <div class="body">
                <form id="sign_in" action="LoginAdmin" method="post">
                    <div class="msg">Sign in to start your session</div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">person</i>
                        </span>
                        <div class="form-line">
                            <input type="email" class="form-control" id="email"  name="email" placeholder="john.doe@example.com" >
                        </div>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">lock</i>
                        </span>
                        <div class="form-line">
                            <input type="password" class="form-control" id="password" name="password" placeholder="**********">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-4">
                            <button class="btn btn-block bg-light-blue waves-effect" id="preloader" type="submit">SIGN IN</button>
                            <div class="loader">
                                <img src="../images/preloader.gif"  alt="" style="width: 50px;height:50px;">
                            </div>
                        </div>
                    </div>
                    <div class="row m-b--20">
                        <!-- <div clsass="col-xs-6">
                            <a href="sign-up.html">Register Now!</a>
                        </div> -->
                        <div class="col-xs-12 align-left">
                            <a href="forgot_password.jsp">Forgot Password?</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
   <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
   <script src ="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
   <script type="text/javascript">
      $('#sign_in').submit(function(e){
	     e.preventDefault();
	     var data={
	    		      username:$('#email').val(),
	    	          password:$('#password').val()
	              }
	      console.log(data);
	         $.ajax({
	    	        url:"../loginadmin",
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
	     	    	  if(data.status)
	    	          {
	     	    		 $('.loader').hide();
	     	    		  window.location.href='dashboard.jsp';  
	    	    		
	    	    	  }
	    	    	  else 
	    	    	  {
	    	    		    Swal.fire({
	    	    			  icon:'error',
	    	    			  title:'Password Wrong',
	    	    			  text:""+data.message+"",
	    	    			  footer:'',
	    	    			  timer:3500
	    	    			 }) 
	    	    			$('#preloader').show();
	    	    			$('.loader').hide();
	    	    		  	
	    	    	  }    
	    	    	    
	    	    },
	    	    error:function(e)
	    	    {
	    	    	console.log("error in pages");
	    	    }
	    }); 
   });
</script>
</body>
</html>