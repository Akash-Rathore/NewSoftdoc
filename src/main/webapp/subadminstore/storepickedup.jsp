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
                <h2>File Details</h2>
            </div>
            <div class="row clearfix dashboardBlocks">
                <!-- Latest Social Trends -->
                <!-- #END# Latest Social Trends -->
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="card">
                        <div class="body bg-body">
                            <div class="font-bold m-b-20">File Details</div>
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
                                           try(Connection  connection=StoreDBConnection.openConnection();PreparedStatement  preparedStatement=connection.prepareStatement("SELECT * FROM document_info,customer_details,customer_location,scheduling WHERE document_info.company_id=customer_details.id AND scheduling.id=(select scheduling_id from document_info where id='"+request.getParameter("id")+"' and status='store') AND document_info.file_no=(select file_no from document_info where id='"+request.getParameter("id")+"' and status='store')  AND customer_details.id=customer_location.company_id AND scheduling.company_id=customer_details.id order by document_info.id limit 1");)
                                             {
		                                             ResultSet resultset=preparedStatement.executeQuery();
		                                             if(resultset.next())
		                                             {
		                    %>
                                  
                                          
                                         <tr>
                                              <td>Pic</td>
                                              <td> <img src="<%=resultset.getString("images")%>" width="80" height="80" alt="location_man"/></td>
                                          <tr>
                                          <tr>
                                             <td>File No.</td>
                                             <td><%=resultset.getString("file_no")%></td>
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
                                            <td>Department</td>
                                            <td><%=resultset.getString("department")%></td>
                                        <tr>
                                       
                                        <tr>
                                            <td>Company Name</td>
                                            <td><%=resultset.getString("company_name")%></td>
                                        <tr>
                                        
                                         <tr>
                                            <td>Location</td>
                                            <td><%=resultset.getString("address_line_one")+""+resultset.getString("address_line_two")+""+resultset.getString("city")%></td>
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
                                     	  final String OLD_FORMAT1 = "yyyy-MM-dd";
                             			  final String NEW_FORMAT1 = "dd MMM yyyy";
                             			  SimpleDateFormat sdf1 = new SimpleDateFormat(OLD_FORMAT1);
                                          Date d1 = sdf1.parse(resultset.getString("scheduling.return_date"));
                             			  sdf.applyPattern(NEW_FORMAT1);
                             			  String returndate = sdf.format(d1);
                                    %>
                                        <tr>
                                            <td>Return Date</td>
                                            <td><%=returndate%></td>
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
