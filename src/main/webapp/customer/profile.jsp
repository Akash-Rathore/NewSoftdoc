<%@include file="include/session.jsp"%>
<%@page import="java.util.ArrayList"%>   
<%@page import="com.customeradminModal.Usercustomer"%>
<%@page import="java.util.Iterator"%> 

<!DOCTYPE html>
<html>
<head>
     <%@include file="include/head.jsp"%>
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
  <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet"/>   
</head>

<body class="theme-light-blue">
    
    <!-- Overlay For Sidebars -->
    <div class="overlay"></div>
    <!-- #END# Overlay For Sidebars -->
    
       <%@include file="include/navbar.jsp"%>
      
    <section>
        <!-- Left Sidebar -->
        <%@include file="include/sidebar.jsp"%>
        <!-- #END# Left Sidebar -->
    </section>
    <section class="content">
        <div class="container-fluid">
            <div class="block-header">
                <h2>
                   
                </h2>
            </div>
            <div class="row"  style="margin-left:-148px !important;margin-right:-27px;">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                        </div>
                     
                        <div class="body mrgnbtm">
                        
                         <%
                                     
                         ArrayList<Usercustomer>  usercustomer= (ArrayList) request.getAttribute("profileRecord"); 
                         Iterator<Usercustomer> iterator = usercustomer.iterator();
                          if(iterator.hasNext())  // iterate through all the data until the last record
                 	       {
                        	  Usercustomer fetchRecord = iterator.next();
			                                    
                                    %>
                            <form   id="profile" method="post" class="form-horizontal">
                               <div class="container">
                                 <div class="row">
                                    <div class="col-6 col-md-6">
                                         <div class="form-group">
                                                <label for="Email" class="col-sm-4 control-label">Softdoc ID</label>
                                                <div class="col-sm-8">
                                                    <div class="form-line">
                                                        <input type="text"   class="form-control"  name="password" placeholder="******" value="<%=fetchRecord.getCustomer_number()%>" readonly>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="NameSurname" class="col-sm-4 control-label">Name</label>
                                                <div class="col-sm-8">
                                                    <div class="form-line">
                                                        <input type="text"  class="form-control" id="name" name="name" placeholder="Name" value="<%=fetchRecord.getCompany_per_name()%>" readonly>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Email" class="col-sm-4 control-label">Designation</label>
                                                <div class="col-sm-8">
                                                    <div class="form-line">
                                                        <input type="text"  class="form-control" id="designation" name="designation" placeholder="Designation" value="<%=fetchRecord.getCompany_per_designation()%>"  readonly>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Email" class="col-sm-4 control-label">Email</label>
                                                <div class="col-sm-8">
                                                    <div class="form-line">
                                                        <input type="email"  class="form-control" id="email" name="email" placeholder="Email" value="<%=fetchRecord.getEmail()%>"  readonly>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Email" class="col-sm-4 control-label">Mobile No.</label>
                                                <div class="col-sm-8">
                                                    <div class="form-line">
                                                        <input type="number"  oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                                        maxlength = "10" class="form-control" id="mobile" name="mobile" placeholder="Mobile" value="<%=fetchRecord.getMobile()%>" readonly>
                                                    </div>
                                                </div>
                                           </div>
                                    </div>
                           <div class="col-6 col-md-6">
                   
                   <div>            
                                 <%if(fetchRecord.getUpload()!=null){ %>
                                  <img src="<%=fetchRecord.getUpload()%>" style="width:200px;height:150px;margin:auto" alt="User" />
                                  <%}else{%>
                                  <img src="../images/user.png" style="width:200px;height:150px;margin:auto" alt="User" />
                                 <%} %>
                        </div>
                          <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalphoto" style="margin-top:30px !important;width:200px !important;">Edit Picture</button>                
                          <br>
                          <button type="button" class="btn btn-primary" style="margin-top:18px !important;width:200px !important;"  data-toggle="modal" data-target="#exampleModal">Change Password</button>                
                          <br/>
                          <button type="button" class="btn btn-primary" onclick="pageRedirect('./customerprocess?action=profileView')" style="margin-top:18px !important;width:200px !important;">View My Company Info</button>                
                         </div>
                       </div>
                      </div>
                   </form>
                   
                   <%
                   
                            	       }
                   
                   %>
                   
                   </div>
                  </div>
                </div>
             </div>
          </div>
    </section>

<%@include file="include/footer.jsp"%>
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script> 
  <script src="include/custom-script.js"></script> 
     <script type="text/javascript">
     
      function pageRedirect(page)
      {
    	  var base_url = window.location.origin+'/'+'customer';
    	  window.location.href=base_url+'/'+page;
      }
     
      
      $('#profile').submit(function(e){
	     e.preventDefault();
	     
	    	      var data={
	    	                  
	    	                      name:$('#name').val(),
	    	               designation:$('#designation').val(),
	    	                    mobile:$('#mobile').val(),
	    	                  
	    	                 }
	    	      console.log(data);
	      $.ajax({
	    	       url:"../customerprocess?action=customerupdateprofile",
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
	     	    		
	     	    		Swal.fire({
	     	    			  position: 'top-end',
	     	    			  icon: 'success',
	     	    			  title: 'Update profile',
	     	    			  showConfirmButton: false,
	     	    			  timer: 2000
	     	    			})
	     	    		 	 
	     	    	        $('#preloader').show();
				    	    $('.loader').hide();
	     	    			
	     	    			
	     	    	  }
	    	    	  else 
	    	    	  {
	    	    		   Swal.fire({
	    	    			  icon:'error',
	    	    			  title:'Not update profile',
	    	    			  text:"wrong",
	    	    			  footer:'',
	    	    			  timer:3000
	    	    			}) 
	    	    		  $('.loader').hide();
	    	    		  $('#preloader').show();
				    	    
	    	    	  }    
	    	      },
	    	    error:function(e)
	    	    	{
	    	    	 console.log("error in pages");
	    	    	  Swal.fire({
    	    			  icon:'error',
    	    			  title:'Not update profile',
    	    			  text:"wrong",
    	    			  footer:'',
    	    			  timer:3000
    	    			}) 
    	    		 $('.loader').hide();	
	    	    }
	       
	      });
   });
      
      //=======================//=======================
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
    	       url:"../customerprocess?action=customerchangepassword",
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
  //===================================================//============
	     $(document).on('submit', '.form-upload', function (e) {
		     e.preventDefault();
		     var form = $('.form-upload')[0];
		     var data = new FormData(form);
		     $.ajax({
		            
		    	    type: "POST",
		            enctype: 'multipart/form-data',
		            url:"../customerprocess?action=uploadphoto",
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
<!--Modal Chand password start  -->
 <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Change Password Form</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form  method='post' class='form-submit'>
          <div class="form-group">
             <label for="recipient-name" class="col-form-label">Enter old Password<span style="color:red; font-size:18px;">*</span></label>
            <div class="form-line">
                <input type="password" class="form-control" name="currentpassword" placeholder="Old Password">
            </div>
          </div>
           <div class="form-group">
             <label for="recipient-name" class="col-form-label">Enter New Password<span style="color:red; font-size:18px;">*</span></label>
            <div class="form-line">
                <input type="text" class="form-control" name="newpassword" placeholder="New Password">
            </div>
          </div>
           <div class="form-group">
             <label for="recipient-name" class="col-form-label">Confirm New Password<span style="color:red; font-size:18px;">*</span></label>
            <div class="form-line">
                <input type="password" class="form-control" name="confirmpassword" placeholder="Confirm Password">
            </div>
          </div>
           <div class="modal-footer">
               <button type="submit" class="btn btn-primary">Submit</button>
               <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
               
                <div class="loader">
                   <img src="../images/loader.gif"  alt="" style="width: 50px;height:50px;">
                </div>
           </div>
         </form>
      </div>
    </div>
  </div>
</div>
<!--Modal Chand password end  -->

<!--Modal upload profile photo start -->
<div class="modal fade" id="exampleModalphoto" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Upload Profile Photo</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action=".." method="post" class="form-upload">
          <div class="form-group">
             <label for="recipient-name" class="col-form-label">Upload Photo</label>
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

</body>
</html>





