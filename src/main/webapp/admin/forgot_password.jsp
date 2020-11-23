<!DOCTYPE html>
<html>
<head>
    <%@include file="include/head.jsp"%>
</head>
<body class="fp-page">
    <div class="fp-box">
        <div class="logo">
            <a href="javascript:void(0);"><strong>Admin</strong></a>
          
        </div>
        <div class="card">
            <div class="body">
                <form  id="forgotpassword">
                    <div class="msg">
                        Enter your email address that you used to register. We'll send you an email with your username and a
                        link to reset your password.
                    </div>
                    <div class="input-group">
                         <span class="input-group-addon">
                             <i class="material-icons">email</i>
                         </span>
                         <div class="form-line">
                              <input type="email" class="form-control" id="email" name="email" placeholder="Email" required autofocus>
                         </div>
                    </div>

                    <button class="btn btn-block btn-lg bg-light-blue waves-effect" id="btnSubmit" type="submit">RESET MY PASSWORD</button>

                    <div class="row m-t-20 m-b--5 align-center">
                          <a href="index.jsp">Sign In!</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <%@include file="include/script.jsp"%>
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script type="text/javascript">
      $('#forgotpassword').submit(function(e){
	     e.preventDefault();
	     
	    	      var data={  email:$('#email').val() }
	    	      console.log(data);
	    	      $("#btnSubmit").prop("disabled", true);
	        $.ajax({
	    	       url:"../forgotpassword",
	    	       type:"POST",
	    	       dataType:"json",
	    	       data:data,
	    	       success:function(data,textStatus,jqXHR)
	    	       {
	    	    	  console.log(data);
	     	    	 if(data.status)
	    	         {
	     	    		
	     	    		Swal.fire({
	     	    			  
	     	    			  position: 'center',
	     	    			  icon: 'success',
	     	    			  title: 'Password sent to your registered Email address',
	     	    			  text:"Please check your email",
	     	    			  timer: 2500
	     	    			  
	     	    			})
	     	    		 $("#btnSubmit").prop("disabled", false);	
     	    			 document.getElementById("forgotpassword"). reset();
	     	    	  }
	    	    	  else 
	    	    	  {
	    	    		   Swal.fire({
	    	    			  icon:'error',
	    	    			  title:'Email address does not exist',
	    	    			  text:"Please enter valid email address",
	    	    			  footer:'',
	    	    			  timer:3000
	    	    			}) 
	    	    	      $("#btnSubmit").prop("disabled", false);
	    	    	  }    
	    	      },
	    	    error:function(e)
	    	    {
	    	 	   Swal.fire({
 	    			  icon:'error',
 	    			  title:'Something is Wrong',
 	    			  text:"wrong",
 	    			  footer:'',
 	    			  timer:3000
 	    			}) 
	    	    }
	       
	       });
   });
</script>  
</body>
</html>