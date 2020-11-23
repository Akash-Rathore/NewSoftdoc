<%@ page import="com.softdocadmin.connection.StoreDBConnection"%>
<%@include file="include/session.jsp"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
  <head>
      <%@include file="include/head.jsp"%>
      <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
      <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap.min.css" rel="stylesheet" />
      <link href="https://cdn.datatables.net/buttons/1.6.0/css/buttons.bootstrap.min.css" rel="stylesheet" />
      <style>
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
                    User Center
                </h2>
            </div>
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                Create User
                            </h2>
                        </div>
                        <%
                                 String id=request.getParameter("id");
                         %>
                        <%
                        	if(id==null)
                            {
                        %>
                           
                        <div class="body mrgnbtm">
                            <form action="../Process?action=subadmine" method="post" class="form-horizontal" id="user">
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Softdoc No.</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                         <%
                                         	try(Connection connect=StoreDBConnection.openConnection();PreparedStatement preparedStat=connect.prepareStatement("SELECT * FROM `subadminsequence` ORDER BY x DESC LIMIT 1");)
                                               {
                                                              	  
                                                      ResultSet result=preparedStat.executeQuery();
                                         			  if(result.next())
                                         		      {
                                         				 String customernumber = String.format("%06d",result.getInt("x"));
                   				                  	     String serial="SDSS"+customernumber;
                                         %>
                  	
                                                   <input type="text"  class="form-control" id="NameSurname" name="softdocnum" placeholder="Softdoc No." value="<%=serial%>"  readonly="readonly">
                                        
                  		                 <%
                                              } }
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
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Employee ID.<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="text" pattern="[A-Za-z0-9]{0,60}" class="form-control" id="empid" name="empid" placeholder="Employee ID." value="" >
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Employee Name<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="text" pattern="[A-Za-z\s]{0,60}" class="form-control" id="Email" name="name" placeholder="Employee Name" value="" >
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Employee Email<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="email" class="form-control" id="Email" name="email" placeholder="Employee Email" value="" >
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Employee Mobile<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="number" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                                    maxlength = "10" class="form-control" id="mobile" name="mobile" placeholder="Employee Mobile" value="" >
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Joining Date</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="date" class="form-control" id="Email" name="joindate" placeholder="Joining Date" value="" >
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Designation<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="text" pattern="[A-Za-z\s]{0,60}" class="form-control" id="Email" name="designation" placeholder="Designation" value="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Role<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <select class="form-control show-tick" name="role" >
                                                <option value="">Select</option>
                                                <option value="store">Store</option>
                                                <option value="indexing">Indexing</option>
                                                <option value="quality">Quality</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row clearfix">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> 
                                        <button type="submit" id="usersubmit" class="btn btn-primary" style="float: right; margin-right: 3px;">Submit</button>
                                         <div class="loader">
                                             <img src="../images/loader.gif"  alt="" style=" float: right;margin-right: 3px;width: 50px;height:50px;">
                                         </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                         <%
                         	}else if(id!=null){
                                                 	   
                                	   try(Connection   connection=StoreDBConnection.openConnection();PreparedStatement preparedStatement=connection.prepareStatement("SELECT `id` , `name`, `designation`, `mobile`, `email`, `softdoc_no`, `employee_id`, `joining_date`, `activation_date`, `department`, `role` FROM `softdoc_staff` WHERE id='"+id+"'");)
                                	   {
                                    	    ResultSet resultset=preparedStatement.executeQuery();
                                           int i = 1;
                                           if(resultset.next())
                                            {
                         %>
                         <div class="body mrgnbtm">
                            <form action="../Process?action=subadminupdate&id=<%=id%>" id="updateuser" method="post" class="form-horizontal">
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Softdoc No.</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="text" pattern="[A-Za-z0-9]{0,60}" class="form-control" id="NameSurname" name="softdocnum" placeholder="Softdoc No." value="<%=resultset.getString("softdoc_no")%>" required="">
                                            <input type="hidden"  class="form-control"  name="id"   value="<%=resultset.getString("id")%>">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Employee ID.<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="text" pattern="[A-Za-z0-9]{0,60}" class="form-control"  name="empid" placeholder="Employee ID." value="<%=resultset.getString("employee_id")%>" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Employee Name<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="text" pattern="[A-Za-z\s]{0,60}" class="form-control"  name="name" placeholder="Employee Name" value="<%=resultset.getString("name")%>" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Employee Email<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="email" class="form-control"  name="email" placeholder="Employee Email" value="<%=resultset.getString("email")%>" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Employee Mobile<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="number" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                                    maxlength = "10" class="form-control"  name="mobile" placeholder="Employee Mobile" value="<%=resultset.getLong("mobile")%>" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Joining Date</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="text" class="form-control"  name="joindate" placeholder="Joining Date" value="<%=resultset.getString("joining_date")%>">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Designation<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="text" pattern="[A-Za-z\s]{0,60}" class="form-control"  name="designation" placeholder="Designation" value="<%=resultset.getString("designation")%>" required="">
                                        </div>
                                    </div>
                                </div>
                              
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Role<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <select class="form-control show-tick" name="role">
                                                <option value="<%=resultset.getString("role")%>"><%=resultset.getString("role")%></option>
                                                <option value="store">Store</option>
                                                <option value="indexing">Indexing</option>
                                                <option value="quality">Quality</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                              
                                <div class="row clearfix">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> 
                                         <button type="submit" class="btn btn-primary" style="float: right; margin-right: 3px;">Modify</button>
                                          <div class="loader">
                                             <img src="../images/loader.gif"  alt="" style=" float: right;margin-right: 3px;width: 50px;height:50px;">
                                          </div>
                                    </div>
                                </div>
                            </form>
                        </div>
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
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <%@include file="include/script.jsp"%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script> 
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script src="include/custom-script.js"></script>  
    <script type="text/javascript">
    $('#user').submit(function(e){
    	 e.preventDefault();
 	    
    	
    	 var form=$(this);
    	 var formdata=new FormData($(form)[0]);
    	 var data={};
         formdata.forEach(function(value,key)
    	 {
    		 data[key]=value;
    	 });
    	 
         if(data.empid=='')
         {
    		 error("Please fill the Employee ID");
             return false;
    	 }
    	 else if(data.name=='')
    	 {
    		 error("Please fill the Employee Name");
             return false;
    		 
    	 }
    	 else if(data.email=='')
    	 {
    		 error("Please fill the Employee Email");
             return false;
    		 
    	 }
    	 else if(data.activitiondate=='')
    	 {
    		 error("Please fill the Activation Date");
             return false;
    		 
    	 }
    	 else if(data.designation=='')
    	 {
    		 error("Please fill the Designation");
             return false;
    		 
    	 }
    	 else if(data.department=='')
    	 {
    		 error("Please fill the Department");
             return false;
    		 
    	 } 
    	 else if(data.role=='')
    	 {
    		 error("Please fill the Subadmin Role");
             return false;
    		 
    	 }
    	 else if(data.mobile=='')
    	 {
    		 error("Please fill the mobile Number");
             return false;
    		 
    	 }
    	  
         
         Swal.fire({
        	  title: "Are you sure",
        	  text:	"you want to create this user?",	  
        	  icon: 'warning',
        	  showCancelButton: true,
        	  cancelButtonText: ' No ',
        	  confirmButtonColor: '#3085d6',
        	  cancelButtonColor: '#d33',
        	  confirmButtonText: 'Yes'
        	}).then((result) => {
        	  if (result.value) {
        	    
        		  $("#usersubmit").prop("disabled", true);
        	      $.ajax({
        	    	       url:"../Process?action=subadmine",
        	    	       type:"POST",
        	    	       dataType:"json",
        	    	       data:$("#user").serialize(),
        	    	       success:function(data,textStatus,jqXHR)
        	    	       {
        	    	    	  console.log(data);
        	     	    	  if(data.status)
        	    	          {
        	     	    	   Swal.fire({
        	     	    			  position: 'top-end',
        	     	    			  icon: 'success',
        	     	    			  title: 'New user Created',
        	     	    			  showConfirmButton: false,
        	     	    			  timer: 3500
        	     	    			})
        	     	    			document.getElementById("user").reset();
        	     	    			$("#usersubmit").prop("disabled", false);
        	     	    			setTimeout(function(){
        			     	    	   window.location.href="user.jsp";
        	  	     	    	    })	
        	     	    	        
        	     	    	  }
        	    	    	  else 
        	    	    	  {
        	    	    		   Swal.fire({
        	    	    			  icon:'error',
        	    	    			  title:'Something is wrong',
        	    	    			  text:"wrong",
        	    	    			  footer:'',
        	    	    			  timer:3000
        	    	    			})
        	    	    	  }    
        	    	      },
        	    	    error:function(e)
        	    	    {
        	    	    	console.log("error in pages");
        	    	    	  Swal.fire({
            	    			  icon:'error',
            	    			  title:'Something is Wrong',
            	    			  text:"wrong",
            	    			  footer:'',
            	    			  timer:3000
            	    			})
        	    	    }
        	       
        	      });
        	  }
          })
     
     });  
  //===========================update subadmin profile====================================
  $('#updateuser').click(function(e){
	     e.preventDefault();
	  
    	 var form=$(this);
    	 var formdata=new FormData($(form)[0]);
    	 var data={};
         formdata.forEach(function(value,key)
    	 {
    		 data[key]=value;
    	 });
    	 
         if(data.empid=='')
         {
    		 error("Please fill the Employee ID");
             return false;
    	 }
    	 else if(data.name=='')
    	 {
    		 error("Please fill the Employee Name");
             return false;
    		 
    	 }
    	 else if(data.email=='')
    	 {
    		 error("Please fill the Employee Email");
             return false;
    		 
    	 }
    	 else if(data.activitiondate=='')
    	 {
    		 error("Please fill the Activation Date");
             return false;
    		 
    	 }
    	 else if(data.designation=='')
    	 {
    		 error("Please fill the Designation");
             return false;
    		 
    	 }
    	 else if(data.department=='')
    	 {
    		 error("Please fill the Department");
             return false;
    		 
    	 } 
    	 else if(data.role=='')
    	 {
    		 error("Please fill the Subadmin Role");
             return false;
    		 
    	 }
    	 else if(data.mobile=='')
    	 {
    		 error("Please fill the mobile Number");
             return false;
    		 
    	 }
         
         
         Swal.fire({
        	  title: 'Are you sure?',
        	  text: "you want to make changes?",
        	  icon: 'warning',
        	  showCancelButton: true,
        	  cancelButtonText: 'No',
        	  confirmButtonColor: '#3085d6',
        	  cancelButtonColor: '#d33',
        	  confirmButtonText: 'Yes'
        	}).then((result) => {
        	  if (result.value) {
        		  
        		  $.ajax({
   	    	       url:"../Process?action=subadminupdate",
   	    	       type:"POST",
   	    	       dataType:"json",
   	    	       data:$("#updateuser").serialize(),
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
   	     	    			  title: 'Changes saved',
   	     	    			  showConfirmButton: false,
   	     	    			  timer: 3500
   	     	    			})
   	     	    	       $('.loader').hide(); 
   	     	    	      
   	     	    	      setTimeout(function(){
   		     	    	   window.location.href="user.jsp";
   	     	    	     })	
        	    		 
   	     	    	   
   	     	    	  }
   	    	    	  else 
   	    	    	  {
   	    	    		   Swal.fire({
   	    	    			  icon:'error',
   	    	    			  title:'Something is wrong',
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
   	    	    	  Swal.fire({
       	    			  icon:'error',
       	    			  title:'Something is Wrong',
       	    			  text:"wrong",
       	    			  footer:'',
       	    			  timer:3000
       	    			})
   	    	    }
   	       
   	      });
        		  
         }
      })
         
   });
	</script> 
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.0/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.0/js/buttons.flash.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.0/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.0/js/buttons.print.min.js"></script>
     <script>
        $(document).ready(function() {
            $('#mytable').DataTable( {
                dom: 'Bfrtip',
                buttons: [
                    'copy', 'csv', 'excel', 'pdf', 'print'
                ]
            } );
        } );
        
    </script>
    </body>
</html>
