<%@include file="include/session.jsp"%>
<%@ page import="com.softdocadmin.connection.StoreDBConnection"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html>
 <head>
    <%@include file="include/head.jsp" %> 
    <link href="../css/dataTables.bootstrap.min.css" rel="stylesheet" />
       
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
                    Customer Center
                </h2>
           </div>
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header  margin0">
                             <h2>  Customer Center </h2>
                            <div class="row">
                            </div>
                           
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-hover" id="mytable">
                                <thead>
                                    <tr>
                                        <th>Customer Code</th>
                                        <th>Company Name</th>
                                        <th>Service Type</th>
                                        <th>Industry</th>
                                        <th>Created On</th>
                                        <th>View Location</th>
                                        <th width="20%">Action</th>
                                    </tr>
                                </thead>
                                <%
                                  try(Connection connection=StoreDBConnection.openConnection();PreparedStatement preparedStatement=connection.prepareStatement("SELECT customer_number,company_name,industry, DATE_FORMAT(DATE,'%d %b %Y') AS DATE,id,servicetype FROM `customer_details` WHERE flag = 0 ORDER BY id DESC"))
                                  {
                                      	   ResultSet resultset=preparedStatement.executeQuery();
                                           int i = 1;
                                           while(resultset.next())
                                           {
                                                        %>
                                   <tbody>
                                   <tr>
                                        <td><%=resultset.getString("customer_number")%></td>
                                        
                                        <td><%=resultset.getString("company_name")%></td>
                                         <%if(resultset.getString("servicetype")==null){%>
                                       
                                          <td></td>
                                       
                                        <%}else{%>
                                       
                                            <td><%=resultset.getString("servicetype")%></td>
                                       
                                        <%} %>
                                       
                                        <td><%=resultset.getString("industry")%></td>
                                        <td><%=resultset.getString("date")%></td>
                                        <td>
                                           <a  href="location.jsp?id=<%=resultset.getInt("id")%>"  class="btn" title="Location"><i class="material-icons">remove_red_eye</i></a>
                                        </td>
                                         <td>
                                           <a href="create_customer.jsp?id=<%=resultset.getInt("id")%>"  class="btn"  title="Edit profile"><i class="material-icons">edit</i></a>
                                           <a  href="viewcustomer.jsp?id=<%=resultset.getInt("id")%>" class="btn" title="View profile"><i class="material-icons">remove_red_eye</i></a>
                                           <a class='delete btn' role="button" data-url='Process' data-what='customer' data-id='<%=resultset.getInt("id")%>' title="delete document"><i class="material-icons">delete</i></a>
                                        </td>
                                       
                                    </tr>
                                           <%
                                           
                                      } 
                                   }
                                  catch(Exception e)
                                  {
                                     e.printStackTrace();	 
                                  }
                             %>
                                </tbody>

                            </table>
                            <div class="m-t-10" style="float:right;">
                                   
                                    <a href="create_customer.jsp" role="button" class="btn btn-primary">Add</a>
                                    <a href="downloadcustomer.jsp" role="button" class="btn btn-primary">Download</a>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
   <%@include file="include/script.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
   <script type="text/javascript">
     $(document).on('click','.delete',function(){
   
	//let url = $(this).data('url');
	//let what = $(this).data('what');
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
          	        url:"../Process?action=customerdelete&id="+id,
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
	          	      		         title: 'Customer Deleted',
	          	      		         timer: 3500
	          	      		    });
	          	      	       $(element).parents('tr').remove();
	          	      	      // delete_data('#customer-table');
	          	      	     
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
  
  function delete_data(table){
     $(`${table} tbody tr`).each(function(a,b) {
	    console.log(a);
	    console.log(b);
     });
  }
 </script>
 
  <script src="../js/jquery.dataTables.min.js"></script>
   <script>
        $(document).ready(function() {
            $('#mytable').DataTable( {
                "searching":false,
                "lengthMenu":[25,50],
                "pageLength":25
            } );
        } );
        
    </script>
 </body>
</html>
 	