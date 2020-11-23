<%@include file="include/session.jsp"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
    
    <%@include file="include/head.jsp"%>
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
                <a class="navbar-brand" href="index.jsp">SUPER ADMIN</a>
            </div>
            <div class="collapse navbar-collapse" id="navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                   <!-- Notifications -->
                     <%@include file="include/notification.jsp"%>
                   <!-- #END# Notifications -->                    
                </ul>
            </div>
        </div>
    </nav>
    <!-- #Top Bar -->
    <section>
        <!-- Left Sidebar -->
          <%@include file="include/sidebar.jsp"%>
        <!-- #END# Left Sidebar -->
    </section>
    <section class="content">
        <div class="container-fluid">
            <div class="block-header">
                <h2>
                   Download Users
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
                                            Download Users 
                                        </div>
                                    </h2>
                                </div>
                            </div>
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                              <table class="table table-hover" id="example" >
                                <thead>
                                    <tr>
                                        <th>Softdoc ID</th>
                                        <th>Employee ID</th>
                                        <th>Name</th>
                                        <th>Designation</th>
                                        <th>Role</th>
                                        <th>Email</th>
                                        <th>Mobile No</th>
                                        <th>joining Date</th>
                                        <th>Created On</th>
                                        <th>Deleted On</th>
                                        <th>Status(Active/Deleted)</th>
                                    </tr>
                                </thead>
                                <tbody>
                       <%
                            try(Connection  connection=DBConnection.openConnection(); PreparedStatement  preparedStatement=connection.prepareStatement("SELECT * FROM `softdoc_staff` where `role`!='superadmin' and role!='admin' order by id desc");)
                           {
                                ResultSet resultset=preparedStatement.executeQuery();
                                int i=1;
                                while(resultset.next())
                                {
                      %>
                      
                                 <tr>
                                        <td><%=resultset.getString("softdoc_no")%></td>
                                        <td><%=resultset.getString("employee_id")%></td>
                                        <td><%=resultset.getString("name")%></td>
                                        <td><%=resultset.getString("designation")%></td>
                                        <td><%=resultset.getString("role")%></td>
                                        <td><%=resultset.getString("email")%></td>
                                        <td><%=resultset.getString("mobile")%></td>
                                        <td><%=resultset.getString("joining_date")%></td>
                                        <td><%=resultset.getString("activation_date")%></td>
                                        <%if(resultset.getInt("flag")==0){ %>
                                        
                                              <td><%="N/A"%></td>
                                        
                                              <td><%="Active"%></td>
                                          
                                         <% }else{%>
                                                 <%
                                     	 
                                          final String OLD_FORMAT = "yyyy-MM-dd hh:mm:ss";
                             			  final String NEW_FORMAT = "dd MMM yyyy";
                             			  SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
                                          Date d = sdf.parse(resultset.getString("leaving_date"));
                             			  sdf.applyPattern(NEW_FORMAT);
                             			  String newDateString = sdf.format(d);
                                          
                                        %>
                                               <td><%=newDateString%></td>
                                               <td><%="Deleted"%></td>
                                        
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
	    <script src="../js/jquery.dataTables.min.js"></script>
	    <script src="../js/dataTables.buttons.min.js"></script>
	    <script src="../js/buttons.flash.min.js"></script>
	    <script src="../js/pdfmake.min.js"></script>
	    <script src="../js/vfs_fonts.js"></script>
	    <script src="../js/buttons.html5.min.js"></script>
	    <script src="../js/buttons.print.min.js"></script>
	    <script src="../js/jszip.min.js"></script>
	    
   <script>
        $(document).ready(function() {
            $('#example').DataTable( {
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
