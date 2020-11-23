<%@page import="java.sql.PreparedStatement"%>
<%@include file="include/session.jsp"%>
<%@ page import="com.softdocadmin.connection.StoreDBConnection"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>

<head>
  <%@include file="include/head.jsp"%>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet"/>
 <style>
.modal-open .content{
    -webkit-filter: blur(7px);
    -moz-filter: blur(15px);
    -o-filter: blur(15px);
    -ms-filter: blur(15px);
    filter: blur(15px);
}
  
.modal-backdrop {background: #f7f7f7;}

.close {
    font-size: 50px;
    display:block;
}

 .loader{
     
     display:none;
      
   }
</style>	 
</head>

<body class="theme-light-blue">
    
    <!-- Overlay For Sidebars -->
    <div class="overlay"></div>
    <!-- #END# Overlay For Sidebars -->
    
    <!-- Top Bar -->
    <nav class="navbar">
        <div class="container-fluid">
            <div class="navbar-header">
                <a href="javascript:void(0);" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false"></a>
                <a href="javascript:void(0);" class="bars"></a>
                <a class="navbar-brand" href="index.jsp">SOFTDOC ADMIN</a>
            </div>
            <div class="collapse navbar-collapse" id="navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    
                    <!-- Notifications -->
                          <%@include file="include/notification.jsp" %>
                    <!-- #END# Notifications -->                    
                    <!-- <li class="pull-right"><a href="javascript:void(0);" class="js-right-sidebar" data-close="true"><i class="material-icons">more_vert</i></a></li> -->
                </ul>
            </div>
        </div>
    </nav>
    <!-- #Top Bar -->
    <section>
        <!-- Left Sidebar -->
          <%@include file="include/leftsidebar.jsp" %>
        <!-- #END# Left Sidebar -->
        
    </section>

    <section class="content">
        <div class="container-fluid">
            <div class="block-header">
                <h2>
                    Profile
                </h2>
            </div>
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                Profile
                            </h2>
                       </div>
                     
                       <%
                       	try(Connection connection=StoreDBConnection.openConnection();PreparedStatement  preparedStatement=connection.prepareStatement("SELECT `username`, `password`, `name`, `designation`, `mobile`, `email`, `location` FROM `softdoc_staff` WHERE `id`='"+(int)session.getAttribute("id")+"'");)
                                              {
                                                 ResultSet resultset=preparedStatement.executeQuery();
                                                 if(resultset.next())
                                                 {
                     %>     <div class="body mrgnbtm">
                              <form  id="profile" class="form-horizontal">
                                          <%--   <div class="form-group">
                                                <label for="NameSurname" class="col-sm-2 control-label">User Name</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="text" class="form-control" id="username" name="username" placeholder="User Name" value="<%=resultset.getString("username") %>" required="">
                                                    </div>
                                                </div>
                                            </div> --%>
                                            <div class="form-group">
                                                <label for="Email" class="col-sm-2 control-label">Password</label>
                                                <div class="col-sm-8">
                                                    <div class="form-line">
                                                        <input type="password" STYLE="color: #696D6D; font-family: Verdana; font-weight: bold; font-size: 12px; background-color: #EAFDFD;" class="form-control" id="password" name="password" placeholder="******" value="<%=resultset.getString("password")%>" readonly>
                                                    </div>
                                                </div>
                                                <div class="col-sm-2">
                                                    <div class="form-line">
                                                          <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                                                             Change password
                                                          </button>
                                                    </div>
                                                </div>
                                                 
                                            </div>
                                            <div class="form-group">
                                                <label for="NameSurname" class="col-sm-2 control-label">Name</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="text" class="form-control" id="name" name="name" placeholder="Name" value="<%=resultset.getString("name")%>" required="">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Email" class="col-sm-2 control-label">Designation</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="text" class="form-control" id="designation" name="designation" placeholder="Designation" value="<%=resultset.getString("designation")%>" required="">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Email"  class="col-sm-2 control-label">Mobile No.</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="number"  oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                                        maxlength = "10"	class="form-control" id="mobile" name="mobile" placeholder="Mobile" value="<%=resultset.getLong("mobile")%>" required="">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Email" class="col-sm-2 control-label">Email</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="text" STYLE="color: #696D6D; font-family: Verdana; font-weight: bold; font-size: 12px; background-color: #EAFDFD;" class="form-control" id="email" name="email" placeholder="Email" value="<%=resultset.getString("email")%>" readonly>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Email" class="col-sm-2 control-label">Location</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="text"  class="form-control" id="location" name="location" placeholder="Location" value="<%=resultset.getString("location")%>" >
                                                    </div>
                                                </div>
                                            </div>
                                               <div class="row clearfix" align="right">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> 
                                                        <button type="button" class="btn btn-primary"   data-toggle="modal" data-target="#exampleModalphoto">
                                                            Edit Profile Pic
                                                        </button>
                                                      &nbsp;&nbsp;&nbsp;
                                                     <button type="submit" class="btn btn-primary" >Modify</button>
                                                     <div class="loader">
                                                           <img src="../images/loader.gif"  alt="" style="width: 50px;height:50px;">
                                                      </div>
                                                  </div>
                                            </div>
                        </form>
                           <%
                             } 
                            }
                             catch(SQLException sqlexception)
                             {
                                 sqlexception.printStackTrace();	 
                             }
                            catch(Exception exception)
                            {
                                exception.printStackTrace();	 
                            }
                           %>
                                    </div>
                        

                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Change Password</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form   method='post' class='form-submit'>
          <div class="form-group">
             <label for="recipient-name" class="col-form-label">Enter Current Password<span style="color:red; font-size:18px;">*</span></label>
            <div class="form-line">
                <input type="password" class="form-control" name="currentpassword" placeholder="Current Password">
            </div>
          </div>
           <div class="form-group">
             <label for="recipient-name" class="col-form-label">Enter New Password<span style="color:red; font-size:18px;">*</span></label>
            <div class="form-line">
                <input type="text" class="form-control" name="newpassword" placeholder="New Password">
            </div>
          </div>
           <div class="form-group">
             <label for="recipient-name" class="col-form-label">Enter Confirm Password<span style="color:red; font-size:18px;">*</span></label>
            <div class="form-line">
                <input type="password" class="form-control" name="confirmpassword" placeholder="Confirm Password">
            </div>
          </div>
           <div class="modal-footer">
               <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
               <button type="submit" class="btn btn-primary">Submit</button>
               <div class="loader">
                   <img src="../images/loader.gif"  alt="" style="width: 50px;height:50px;">
               </div>
           </div>
         </form>
      </div>
     
    </div>
  </div>
</div>

<!--Modal upload profile photo start -->
<div class="modal fade" id="exampleModalphoto" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Edit Profile Pic</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action=".." method="post" class="form-upload">
          <div class="form-group">
             <label for="recipient-name" class="col-form-label">Edit Profile Pic</label>
               <div class="form-line">
                   <input type="file" class="form-control" name="uploadprofile" accept="image/png,image/jpeg,image/jpg" required="required">
               </div>
          </div>
           <div class="modal-footer">
               <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
               <button type="submit" class="btn btn-primary">Submit</button>
               <div class="loader">
                   <img src="../images/loader.gif"  alt="" style="width: 50px;height:50px;">
               </div>
           </div>
         </form>
      </div>
    </div>
  </div>
 </div>
<!--Modal upload profile photo end -->

   <%@include file="include/script.jsp"%>
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script> 
   <script src="include/custom-script.js"></script> 
     <script type="text/javascript">
      $('#profile').submit(function(e){
	     e.preventDefault();
	     
	    	      var data={
	    	                  username:$('#username').val(),
	    	                  password:$('#password').val(),
	    	                      name:$('#name').val(),
	    	               designation:$('#designation').val(),
	    	                    mobile:$('#mobile').val(),
	    	                     email:$('#email').val(),
	    	                  location:$('#location').val()
	    	                 
	    	                 }
	    	      console.log(data);
	      $.ajax({
	    	       url:"../Process?action=updateprofile",
	    	       type:"POST",
	    	       dataType:"json",
	    	       data:data,
                   beforeSend:function(){
	    	    	   
	    	    	   $('.loader').show();
	    	       
	    	       },
	    	       success:function(data,textStatus,jqXHR)
	    	       {
	    	    	  console.log(data);
	     	    	 if(data.status)
	    	         {
	     	    		
	     	    		Swal.fire({
	     	    			  position: 'top-end',
	     	    			  icon: 'success',
	     	    			  title: 'Update profile',
	     	    			  showConfirmButton: false,
	     	    			  timer: 2000
	     	    			})
	     	    		 $('.loader').hide();	
	     	    			
	     	    	  }
	    	    	  else 
	    	    	  {
	    	    		   Swal.fire({
	    	    			  icon:'error',
	    	    			  title:'Not insert profile',
	    	    			  text:"wrong",
	    	    			  footer:'',
	    	    			  timer:3000
	    	    			}) 
	    	    		  $('.loader').hide();	
	    	    	  }    
	    	      },
	    	    error:function(e)
	    	    {
	    	    	console.log("error in pages");
	    	    }
	       
	      });
   });
 //=================//========================================
  $(document).on('submit', '.form-submit', function (e) {
    e.preventDefault();
   
     var form=$(this);
	 var formdata=new FormData($(form)[0]);
	 var data={};
     formdata.forEach(function(value,key)
	 {
		  data[key]=value;
	 }); 
	 
     console.log(data);
     if(data.currentpassword=='')
     {
    	 error("Please fill the Current Password");
         return false;
		 
     }
     else if(data.newpassword=='')
     {
    	 error("Please fill the New Password");
         return false; 
     }
     else if(data.confirmpassword=='')
     {
    	 error("Please fill the Confirm Password");
         return false; 	  
     }
     
     if(data.newpassword==data.confirmpassword)
     {
    	 console.log("Password match");
     }
     else
     {
    	 error("Please fill the correct password");
         return false; 	 
     }
     //===============//================
     $.ajax({
	       url:"../Process?action=changepassword",
	       type:"POST",
	       dataType:"json",
	       data:data,
	       beforeSend:function(){
	    	   
	    	   $('.loader').show();
	       
	       },
	       success:function(data,textStatus,jqXHR)
	       {
	    	  if(data.status){
	    		  
	    		  Swal.fire({
	    			  position: 'top-end',
	    			  icon: 'success',
	    			  title: 'Password Change Successfully',
	    			  showConfirmButton: false,
	    			  timer: 2000
	    			})
	    			$('.form-submit').trigger("reset");	
	    		    $('.loader').hide();
	    			
	    	  }
	    	  else
	    	  {
	    		   Swal.fire({
 	    			  icon:'error',
 	    			  title:'Password Not Change',
 	    			  text:"Something went Wrong",
 	    			  footer:'',
 	    			  timer:3000
 	    			})
 	    		   $('.loader').hide();
 	    	  }
	    	  
	      },
	     error:function(e)
	    {
	    	console.log("error in pages");
	    }
  
     });
      
  });
//==================//==========================================
	$(document).on('submit', '.form-upload', function (e) {
     e.preventDefault();
     var form = $('.form-upload')[0];
     var data = new FormData(form);
     
     $.ajax({
            
    	    type: "POST",
            enctype: 'multipart/form-data',
            url:"../Process?action=uploadphoto",
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            beforeSend:function(){
 	    	   $('.loader').show();
 	        },
            success: function (data)
            {
            	 var result = JSON.parse(data);
         	     if(result.status){
  	    		  
  	    		  Swal.fire({
  	    			  position: 'top-end',
  	    			  icon: 'success',
  	    			  title: 'Success',
  	    			  showConfirmButton: false,
  	    			  timer: 2000
  	    			})
  	    			$('.form-upload').trigger("reset");	
  	    		    $('.loader').hide();
  	    			setTimeout(function(){location.reload();},3500);
  	    	    }
  	    	    else
  	    	   {
  	    		   Swal.fire({
   	    			  icon:'error',
   	    			  title:'wrong',
   	    			  text:"Something went Wrong",
   	    			  footer:'',
   	    			  timer:3000
   	    			})
   	    		   $('.loader').hide();
   	    	   }
            },
            error: function (e) {

              console.log("error");

          }
     });

 });
      
</script>
</body>
</html>
