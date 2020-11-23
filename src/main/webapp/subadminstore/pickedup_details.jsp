<%@include file="include/session.jsp" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date" %> 
<!DOCTYPE html>
<html>
<head>
      <%@include file="include/head.jsp"%>
            <!--Datatable -->
     <link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" rel="stylesheet"/>
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
                <a class="navbar-brand" href="index.jsp">SOFTDOC SUBADMIN STORE</a>
            </div>
            <div class="collapse navbar-collapse" id="navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <!-- Notifications -->
                     <%@include file="include/notification.jsp"%>
                    <!-- #END# Notifications -->                    
                    <!-- <li class="pull-right"><a href="javascript:void(0);" class="js-right-sidebar" data-close="true"><i class="material-icons">more_vert</i></a></li> -->
                </ul>
            </div>
        </div>
    </nav>
    <!-- #Top Bar -->
    <section>
      <!-- Left Sidebar -->       
         <%@include file="include/sidebar.jsp" %>
      <!-- #END# Left Sidebar -->
    </section>
    <section class="content">
        <div class="container-fluid">
            <div class="block-header">
                <h2>Pickedup</h2>
            </div>
            <div class="row clearfix dashboardBlocks">
                <!-- Latest Social Trends -->
                <!-- #END# Latest Social Trends -->
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="card">
                        <div class="body bg-body">
                            <div class="font-bold m-b-20">Pickedup Details</div>
                            <div class="table-responsive">
                                <table class="table   table-striped table-hover" id="myTable">
                                    <thead>
                                        <!-- <tr>
                                            <td>File No.</td>
                                            <th>Attachment No.</th>
                                            <th>Pickup Date</th>
                                            <td>Location</td>
                                        </tr> -->
                                    </thead>
                                    <tbody id="myTable">
                         <%

                         try(Connection  connection=StoreDBConnection.openConnection();PreparedStatement  preparedStatement=connection.prepareStatement("SELECT * FROM customer_details,customer_location,scheduling WHERE  scheduling.id='"+request.getParameter("id")+"' AND customer_details.id=customer_location.company_id AND scheduling.company_id=customer_details.id");)
                          {
		                                                    ResultSet resultset=preparedStatement.executeQuery();
		                                                    String file_no="";
		                                                    if(resultset.next())
		                                                    {
		                                                    	
		                                                    	 try(Connection connect=StoreDBConnection.openConnection();PreparedStatement  prepared=connect.prepareStatement("SELECT * FROM document_info WHERE scheduling_id ='"+request.getParameter("id")+"' group by file_no");)
		                                                         {
		            		                                                    ResultSet result=prepared.executeQuery();
		            		                                                    while(result.next())
		            		                                                    {
		            		                                                    	file_no +=result.getString("file_no")+"("+result.getString("department")+")"+"  ,  ";
		            		                                                    	 
		            		                                                    }
		                                                         }
		                    %>
                                  
                                         
                                          <tr>
                                              <td>Pic</td>
                                              <td> <img src="<%=resultset.getString("images")%>" width="80" height="80" alt="location_man"/></td>
                                          <tr>
                                           <tr>
                                              <td>File No.</td>
                                              <td><%=file_no%></td>
                                          <tr>
                                  
                                    <%
                                     	  final String OLD_FORMAT = "yyyy-MM-dd";
                             			  final String NEW_FORMAT = "dd MMM yyyy";
                             			  SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
                                          Date d = sdf.parse(resultset.getString("scheduling.pickup_date"));
                             			  sdf.applyPattern(NEW_FORMAT);
                             			  String newDateString = sdf.format(d);
                                    %>
                                         <tr>
                                             <td>Pickup Date</td>
                                             <td><%=newDateString%><td>
                                         </tr>
                                          <tr>
                                            <td>Company Name</td>
                                            <td><%=resultset.getString("company_name")%></td>
                                        <tr>
                                        
                                         <tr>
                                            <td>Location</td>
                                            <td><%=resultset.getString("address_line_one")+" "+resultset.getString("address_line_two")+" "+resultset.getString("city")%></td>
                                        </tr>
                                       
                                        <tr>
                                            <td>Location Person Name</td>
                                            <td><%=resultset.getString("loc_person_name")%></td>
                                       </tr>
                                   
                                        <tr>
                                            <td>Location Person Mobile</td>
                                            <td><%=resultset.getString("loc_person_mobile")%></td>
                                       </tr>
                                    
                       
                       
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
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
             <div class="row clearfix dashboardBlocks">
                <!-- Latest Social Trends -->
                <!-- #END# Latest Social Trends -->
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="card">
                        <div class="body bg-body">
                            <div class="font-bold m-b-20">Return Details</div>
                            <div class="table-responsive">
                                <table class="table   table-striped table-hover" id="myTable">
                                    <thead>
                                        <!-- <tr>
                                            <td>File No.</td>
                                            <th>Attachment No.</th>
                                            <th>Pickup Date</th>
                                            <td>Location</td>
                                        </tr> -->
                                    </thead>
                                    <tbody id="myTable">
                         <%

                         try(Connection  connection=StoreDBConnection.openConnection();PreparedStatement  preparedStatement=connection.prepareStatement("SELECT * FROM scheduling WHERE id='"+request.getParameter("id")+"'");)
                          {
		                                                    ResultSet resultset=preparedStatement.executeQuery();
		                                                    if(resultset.next())
		                                                    {
		                    %>
                                  
                                        
                                          <tr>
                                              <td>Pic</td>
                                              <td> <img src="<%=resultset.getString("return_images")%>" width="80" height="80" alt="location_man"/></td>
                                          <tr>
                                 
                                          <tr>
                                             <td>Return Name</td>
                                             <%if(resultset.getString("return_to")!=null){ %>
                                                 <td><%=resultset.getString("return_to")%></td>
                                              <%} %>
                                               
                                          <tr>
                                          <tr>
                                       <%
                                     	  final String OLD_FORMAT = "yyyy-MM-dd";
                             			  final String NEW_FORMAT = "dd MMM yyyy";
                             			  SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
                                          Date d = sdf.parse(resultset.getString("return_date"));
                             			  sdf.applyPattern(NEW_FORMAT);
                             			  String newDateString = sdf.format(d);
                                      %>
                                             <td>Return Date</td>
                                             <td><%=newDateString%><td>
                                         </tr>
                                           <tr>
                                             <td>Return Contact</td>
                                              <%if(resultset.getString("return_contact")!=null){ %>
                                                 <td><%=resultset.getString("return_contact")%></td>
                                              <%} %>
                                         </tr>
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
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <%@include file="include/script.jsp"%>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.0/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.0/js/buttons.flash.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.0/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.0/js/buttons.print.min.js"></script>
    <script>
     $(document).ready( function () {
    	   $('#myTable').DataTable( {
               dom: 'Bfrtip',
               buttons: [
                   'copy', 'csv', 'excel', 'pdf', 'print'
               ],
               "searching":false,
               "lengthMenu":[25,50],
               "pageLength":25
           } );
     } );
 
   </script>
 
    
</body>

</html>
