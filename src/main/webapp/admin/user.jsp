<%@ page import="com.softdocadmin.connection.StoreDBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@include file="include/session.jsp"%>
<!DOCTYPE html>
<html>

<head>
    <%@include file="include/head.jsp"%>
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/buttons/1.6.0/css/buttons.bootstrap.min.css" rel="stylesheet" />
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
                    User Center
                </h2>
            </div>
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header  margin0">
                            <div class="row">
                                <div class="">
                                    <h2 class="col-md-4 col-lg-4 col-xs-12 pull-left">
                                        <div class="m-t-10">
                                            User Center
                                        </div>
                                    </h2>
                                </div>
                            </div>
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-hover" id="myTable">
                                <thead>
                                    <tr>
                                        <th>Softdoc ID</th>
                                        <th>Employee ID.</th>
                                        <th>Name</th>
                                        <th>Designation</th>
                                        <th>Role</th>
                                        <th>Activation Date</th>
                                        <th width="20%">Action</th>
                                </thead>
                              <%
                              	 try(Connection connection=StoreDBConnection.openConnection();PreparedStatement preparedStatement=connection.prepareStatement("SELECT `softdoc_no` , `id`  ,  `employee_id` , `name` , `designation`,`role`,`joining_date`,`activation_date` FROM `softdoc_staff` where `role`!='superadmin' and role!='admin' and flag=0 ORDER BY id DESC");)
                                 {
                                         ResultSet resultset=preparedStatement.executeQuery();
                                         while(resultset.next())
                                                                  {
                              %>
                                 <tbody>
                                    <tr>
                                        <td><%=resultset.getString("softdoc_no")%></td>
                                        <td><%=resultset.getString("employee_id")%></td>
                                        <td><%=resultset.getString("name")%></td>
                                        <td><%=resultset.getString("designation")%></td>
                                        <td><%=resultset.getString("role")%></td>
                                        <td><%=resultset.getString("activation_date")%></td>
                                        <td>
                                           <a  href="create_user.jsp?id=<%=resultset.getInt("id")%>" class="btn"  title="Edit profile"><i class="material-icons">edit</i></a>
                                           <a  href="viewuser.jsp?id=<%=resultset.getInt("id")%>" class="btn" title="View profile"><i class="material-icons">remove_red_eye</i></a>
                                           <a class='delete btn' role="button" data-id='<%=resultset.getInt("id")%>' title="Delete"><i class="material-icons">delete</i></a>
                                         </td>
                                    </tr>
                                
                                <%
                                   
                                    }
                                  }catch(SQLException sqlexception)
                                  {
                            	    sqlexception.printStackTrace(); 
                                  }
                                  catch(Exception excep)
                                  {
                                	  excep.printStackTrace();
                                  }
                       
                              %>
                             </tbody>
                           </table>
                           <div class="m-t-10" style="float:right;">
                                    <a href="create_user.jsp" role="button" class="btn btn-primary">Add</a>
                                    <a href="downloaduser.jsp" role="button" class="btn btn-primary">Download</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <%@include file="include/script.jsp"%>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script type="text/javascript">
      $('#user').submit(function(e){
	     e.preventDefault();
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
	     	    			  title: 'Successfully',
	     	    			  showConfirmButton: false,
	     	    			  timer: 3500
	     	    			})
	     	    			$("#usersubmit").prop("disabled", false);
	     	    		
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
   });  
   
  $(document).on('click','.delete',function(){
    	  
	    let id=$(this).data('id');
	    let element = $(this);
	    Swal.fire({
	    	  title: 'Are you sure?',
	    	  text: "You will not be able to revert this action",
	    	  icon: 'warning',
	    	  showCancelButton: true,
	    	  cancelButtonText: 'No',
	    	  confirmButtonColor: '#3085d6',
	    	  cancelButtonColor: '#d33',
	    	  confirmButtonText: 'Yes'
	    	}).then((result) => {
	    	  if (result.value) {
	    	  
	    		  $.ajax({
	          	        url:"../Process?action=subadmindelete&id="+id,
	          	        type:"POST",
	          	        dataType:"json",
	          	        success:function(data,textStatus,jqXHR)
	          	        {
	          	      	   if(data.status)
	          	      	   {
	          	      		   console.log(data);
	          	      
	          	      		   if(data.status){
		          	      			Swal.fire({
		          	      			     position: 'center',
		          	      		         icon: 'success',
		          	      		         title: 'User Deleted',
		          	      		         timer: 3500
		          	      		    });
		          	      	       $(element).parents('tr').remove();
		          	      	       //delete_data('#customer-table');
		          	      	       //setTimeout(function(){location.reload();},4000);
	          	              	}
	          	      	   }
	          	        
	          	        },
	            	    error:function(e)
	            	    {
	            		    	console.log("error in pages");
	            		}
	              });
	    		  
	    	   }
	    	})
	    
       });   
</script> 
    
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script>
     $(document).ready( function () {
         $('#myTable').DataTable({
        	    "searching":false,
                "lengthMenu":[25,50],
                "pageLength":25
         });
     } );
 
   </script>
</body>
</html>
