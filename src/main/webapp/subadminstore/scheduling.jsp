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
                <h2>Scheduling</h2>
            </div>
            <div class="row clearfix dashboardBlocks">
                <!-- Latest Social Trends -->
                <!-- #END# Latest Social Trends -->
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                    <div class="card">
                        <div class="body bg-body">
                            <div class="font-bold m-b-20">Pickups</div>
                            <div class="table-responsive">
                                <table class="table   table-striped table-hover" id="myTable">
                                    <thead>
                                        <tr>
                                            <th>Company Name</th>
                                            <th>Date</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                         <%
                                           try(Connection  connection=StoreDBConnection.openConnection();PreparedStatement  preparedStatement=connection.prepareStatement("SELECT * FROM `scheduling` ORDER BY pickup_date DESC");)
                                           {
		                                                   ResultSet resultset=preparedStatement.executeQuery();
		                                                   while(resultset.next())
		                                                   {
		                    %>
                                   <tr>
                                          <th><%=resultset.getString("company_name")%></th>
                                  <%
                                     	  final String OLD_FORMAT = "yyyy-MM-dd";
                             			  final String NEW_FORMAT = "dd MMM yyyy";
                             			  SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
                                          Date d = sdf.parse(resultset.getString("pickup_date"));
                             			  sdf.applyPattern(NEW_FORMAT);
                             			  String newDateString = sdf.format(d);
                                     %>
                                        <td><%=newDateString%></td>
                                             <!-- <td><span class="label bg-green">Active</span></td> -->
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
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                    <div class="card">
                        <div class="body">
                            <div class="font-bold m-b-20">Returns</div>

                            
                            <div class="table-responsive">
                                <table class="table  dashboard-task-infos" id="myTable1">
                                    <thead>
                                        <tr>
                                            
                                            <th>Company Name</th>
                                            <th>Date</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                           try(Connection  connection=StoreDBConnection.openConnection();PreparedStatement  preparedStatement=connection.prepareStatement("SELECT * FROM `scheduling` ORDER BY return_date DESC");)
                                           {
		                                                   ResultSet resultset=preparedStatement.executeQuery();
		                                                   while(resultset.next())
		                                                   {
		                    %>
                                   <tr>
                                          <%if(resultset.getString("return_date")!=null){
                                            final String OLD_FORMAT = "yyyy-MM-dd";
                             			    final String NEW_FORMAT = "dd MMM yyyy";
                             			    SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
                                            Date d = sdf.parse(resultset.getString("return_date"));
                             			    sdf.applyPattern(NEW_FORMAT);
                             			    String newDateString = sdf.format(d);
                                         %>
                                        <td><%=resultset.getString("company_name")%></td>
                                        <td><%=newDateString%></td>
                                        
                                        <%}%>
                                        
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
     
     $(document).ready( function () {
  	   $('#myTable1').DataTable( {
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
