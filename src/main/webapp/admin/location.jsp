<%@include file="include/session.jsp"%>
<%@ page import="com.softdocadmin.connection.StoreDBConnection"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>

<head>
   <%@include file="include/head.jsp"%>
   <link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" rel="stylesheet" />
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
       
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header  margin0">
                            
                            <div class="row">
                                <div class="">
                                    <h2 class="col-md-4 col-lg-4 col-xs-12 pull-left">
                                        <div class="m-t-10">
                                            Location Information & Pickup
                                        </div>
                                    </h2>
                                    
                                 
                                </div>
                            </div>
                            <br>
                            
                        </div>
                        
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-hover" id="myTable">
                                <thead>
                                   <tr>
                                        <th>S.No.</th>
                                        <th>Address Line</th>
                                        <th>City</th>
                                        <th>Pincode</th>
                                        <th>Start Date</th>
                                        <th>Pickup Frequency</th>
                                        <th>Contact Person Name</th>
                                        <th>Contact Person Designation</th>
                                        <th>Contact Person Mobile </th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                             
                                <tbody>
                                
                                     <%
                                    	int loc_id = Integer.parseInt(request.getParameter("id")); 
                                        try(Connection connection=StoreDBConnection.openConnection(); PreparedStatement preparedStatement=connection.prepareStatement("SELECT customer_location.city, customer_location.id as id , address_line_one , loc_person_name , customer_location.pincode , customer_location.date , pickup_frequency , loc_per_designation , loc_person_mobile FROM `customer_location`,customer_details WHERE customer_details.company_name = customer_location.company_name AND customer_details.id = '"+loc_id+"' order by customer_location.date desc");)
                                         {
                                	        
                                	        ResultSet resultset=preparedStatement.executeQuery();
                                            int i = 1;
                                            while(resultset.next())
                                            {
                                    %>
                             
                                 
                                    <tr>
                                        <td><%=i%></td>
                                        <td><%=resultset.getString("address_line_one")%></td>
                                        <td><%=resultset.getString("city")%></td>
                                        <td><%=resultset.getString("pincode")%></td>
                                        <td><%=resultset.getDate("date")%></td>
                                         <%if("7".equals(resultset.getString("pickup_frequency"))){ %>
                                                        <td>Weekly</td>
                                              <%}else if("14".equals(resultset.getString("pickup_frequency"))){ %>
                                                        <td>Fortnightly</td>
                                               <%}else if("30".equals(resultset.getString("pickup_frequency"))){%>
                                                        <td>Monthly</td>
                                                <% 
                                                 }else if("90".equals(resultset.getString("pickup_frequency"))){
                                               %>                 <td>Quarterly</td>
                                         <%}%>  
                                        <td><%=resultset.getString("loc_person_name")%></td>
                                        <td><%=resultset.getString("loc_per_designation")%></td>
                                        <td><%=resultset.getString("loc_person_mobile")%></td>
                                        <td>
                                             <a href="locationedit.jsp?id=<%=resultset.getString("id")%>&did=<%=request.getParameter("id")%>" title="Edit location"><i class="material-icons">edit</i></a>
                                             <a class='delete' role="button" data-id='<%=resultset.getInt("id")%>' title="delete"><i class="material-icons">delete</i></a>
                                        </td>
                                       
                                        
                                    </tr>
                                    
                                       <%        
                                   i++;
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
                                </tbody>
                             
                            </table>
                            <div class="body mrgnbtm">
                      
                         </div>
                            <div class="m-t-10" style="float:right;">
                                    <a href="add_location.jsp?id=<%=loc_id %>" role="button" class="btn btn-primary">Add</a>
                                     <a href="locationdownload.jsp" role="button" class="btn btn-primary">Download All Location</a>
                                    
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
   <script>
   $(document).on('click','.delete',function(){
	 	  
	    let id=$(this).data('id');
	    let element = $(this);
	       Swal.fire({
	    	  title: 'Are you sure?',
	    	  text: " You will not be able to revert this action.",
	    	  icon: 'warning',
	    	  showCancelButton: true,
	    	  cancelButtonText: 'No',
	    	  confirmButtonColor: '#3085d6',
	    	  cancelButtonColor: '#d33',
	    	  confirmButtonText: 'Yes'
	    	}).then((result) => {
	    	  if (result.value) {
	    	  
	    		  $.ajax({
	          	        url:"../Process?action=deletelocation&id="+id,
	          	        type:"POST",
	          	        dataType:"json",
	          	        success:function(data,textStatus,jqXHR)
	          	        {
	          	      	   if(data.status)
	          	      	   {
	          	      		   
	          	      		   if(data.status){
		          	      			Swal.fire({
		          	      			     
		          	      				 position:'center',
		          	      		         icon: 'success',
		          	      		         title: 'Location Deleted',
		          	      		         timer: 3500
		          	      		         
		          	      		    });
		          	      	       $(element).parents('tr').remove();
		          	      	       setTimeout(function(){location.reload();},4000);
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
  
</body>

</html>
