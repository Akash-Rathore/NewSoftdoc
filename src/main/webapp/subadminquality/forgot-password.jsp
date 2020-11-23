<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>Dashboard | SoftDoc</title>
    <!-- Favicon-->
    <link rel="icon" href="images/favicon.png" type="image/x-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">

    <!-- Bootstrap Core Css -->
    <link href="../plugins/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Waves Effect Css -->
    <link href="../plugins/node-waves/waves.css" rel="stylesheet" />

    <!-- Animation Css -->
    <link href="../plugins/animate-css/animate.css" rel="stylesheet" />

    <!-- Bootstrap Select Css -->
    <link href="../plugins/bootstrap-select/css/bootstrap-select.css" rel="stylesheet" />


    <!-- Custom Css -->
    <link href="../css/style.css" rel="stylesheet">

    <!-- AdminBSB Themes. You can choose a theme from css/themes instead of get all themes -->
    <link href="../css/themes/all-themes.css" rel="stylesheet" />
</head>
<body class="fp-page">
    <div class="fp-box">
        <div class="logo">
            <a href="javascript:void(0);"><strong>SOFTDOC SUBADMIN QUALITY</strong></a>
            <!-- <small>Admin BootStrap Based - Material Design</small> -->
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
     <!-- Jquery Core Js -->
    <script src="../plugins/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core Js -->
    <script src="../plugins/bootstrap/js/bootstrap.js"></script>

    <!-- Select Plugin Js -->
    <script src="../plugins/bootstrap-select/js/bootstrap-select.js"></script>

    <!-- Slimscroll Plugin Js -->
    <script src="../plugins/jquery-slimscroll/jquery.slimscroll.js"></script>

    <!-- Waves Effect Plugin Js -->
    <script src="../plugins/node-waves/waves.js"></script>

    <!-- Custom Js -->
    <script src="../js/admin.js"></script>
    <script src="../js/pages/forms/basic-form-elements.js"></script>

    <!-- Demo Js -->
    <script src="../js/demo.js"></script>
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script type="text/javascript">
      $('#forgotpassword').submit(function(e){
	     e.preventDefault();
	     
	    	      var data={  email:$('#email').val() }
	    	      console.log(data);
	    	      $("#btnSubmit").prop("disabled", true);
	        $.ajax({
	    	       url:"../qualityforgot",
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
     	    			 document.getElementById("forgotpassword").reset();
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