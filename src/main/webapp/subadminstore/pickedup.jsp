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
                <h2>Picked Up</h2>
            </div>
            <div class="row clearfix dashboardBlocks">
                <!-- Latest Social Trends -->
                <!-- #END# Latest Social Trends -->
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="card">
                        <div class="body bg-body">
                            <div class="font-bold m-b-20">Picked Up</div>
                            <div class="table-responsive">
                                <table class="table   table-striped table-hover" id="myTable">
                                    <thead>
                                        <tr>
                                            <th>S. No.</th>
                                            <th>Pickup Form No.</th>
                                            <th>Company Code</th>
                                            <th>Company Name</th>
                                            <th>File Count</th>
                                            <th>Pickup Date</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            <%                   
                                           try(Connection  connection=StoreDBConnection.openConnection();PreparedStatement  preparedStatement=connection.prepareStatement("SELECT id , company_id , DATE_FORMAT(pickup_date,'%d %b %Y')AS pickup_date  FROM scheduling  WHERE return_date IS NOT NULL");)
                                             {
		                                                    ResultSet resultset=preparedStatement.executeQuery();
		                                                    int i=1;
		                                                    while(resultset.next())
		                                                    {
		                                                    	  
		                                                    	   PreparedStatement  preparedStatementtwo = connection.prepareStatement("SELECT COUNT(df.file_no)AS COUNT , cd.company_name , cd.customer_number  FROM customer_details AS cd INNER JOIN document_info AS df ON cd.id=df.company_id AND df.scheduling_id='"+resultset.getInt("id")+"' and cd.company_name is not null");
		                                                    	   ResultSet resultset2 = preparedStatementtwo.executeQuery();
		                                                    	   resultset2.next();
		                   %>
                                   <tr>
                                             <td><%=i%></td>
                                             <td><a href="pickedup_details.jsp?id=<%=resultset.getInt("id")%>"><%=String.format("%06d",resultset.getInt("id"))%></a></td>
                                             <td><%=resultset2.getString("customer_number")%></td>
                                             <td><%=resultset2.getString("company_name")%></td>
                                             <td><%=resultset2.getString("count")%></td>
                                             <td><%=resultset.getString("pickup_date")%></td>
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
