<%        
           response.setHeader("Cache-Control","no-cache,no-store,must-revalidate"); 
           String user=(String)session.getAttribute("clientemail");
           if(user!=null)
           {
        	   response.sendRedirect("dashboard.jsp");
           }
%>
<!DOCTYPE html>
<html>
<head>
 
     <!--    Url script -->
    <script type="0598a266b6e30489ab271305-text/javascript">
            if (window.location.protocol == 'http:') {
                window.location = 'https://softdoc-262410.appspot.com/client/' + window.location.pathname;
            }
    </script>
    
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
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
            <a href="javascript:void(0);">Customer <strong>Client</strong></a>
        </div>
        <div class="card">
            <div class="body">
                <form action="../clientlogin" method="POST" id="sign_in" >
                    <div class="msg">This site performs best on Google Chrome</div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">person</i>
                        </span>
                        <div class="form-line">
                            <input type="text" class="form-control" id="email" name="email" placeholder="softdoc@gmail.com" required autofocus>
                        </div>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">lock</i>
                        </span>
                        <div class="form-line">
                            <input type="password" class="form-control" id="password" name="password" placeholder="**********" required>
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
                        
                        <div class="col-xs-12 align-left">
                             <a href="forgot-password.jsp">Forgot Password?</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
   <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
   <script type="text/javascript">
   
      $('#sign_in').submit(function(e){
	     e.preventDefault();
	     var data={
	    		      email:$('#email').val(),
	    	          password:$('#password').val()
	              }
	         console.log(data);
	         $.ajax({
	    	        url:"../clientlogin",
	    	        type:"POST",
	    	        dataType:"json",
	    	        data:data,
	    	        beforeSend:function(){
	    	        	
		    	        $('#preloader').hide(); 
	    	        	$('.loader').show();
		    	    
	    	        },
	    	        success:function(data,textStatus,jqXHR)
	    	        {
	    	    	  
	    	          sessionStorage.setItem("department", data.department);
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