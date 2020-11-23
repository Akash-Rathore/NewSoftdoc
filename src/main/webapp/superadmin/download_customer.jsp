<%@include file="include/session.jsp"%>
<%@page import="com.superadmin.connection.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet" %>
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
                </ul>
            </div>
        </div>
    </nav>
    <!-- #Top Bar -->
    <section>
        <!-- Left Sidebar -->
             <aside id="leftsidebar" class="sidebar">
            <!-- User Info -->
            <div class="user-info">
                <div class="image">
                       <%
                try(Connection  connect=DBConnection.openConnection();PreparedStatement preparedStatement=connect.prepareStatement("SELECT * FROM `softdoc_staff` WHERE `id`='"+(int)session.getAttribute("super_id")+"'");)
                {
                         ResultSet result=preparedStatement.executeQuery();
                         if(result.next())
                         {
               %>
                             <%if(result.getString("profile_photo") !=null){%>                        
                                  <img src="<%=result.getString("profile_photo")%>" width="48" height="48" alt="User" />
                             <%}else{%>
                                  <img src="../images/user.png" width="48" height="48" alt="User" />
                             <%}%>  
               
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
                
                </div>
                <div class="info-container">
                    <div class="name" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><%=(String)session.getAttribute("supername")%></div>
                    <div class="email"><%=(String)session.getAttribute("superemail")%></div>
                </div>
            </div>
            <!-- #User Info -->
            <!-- Menu -->
            <div class="menu">
                <ul class="list">
                    <li class="header">MAIN NAVIGATION</li>
                    <li class="<% if(request.getRequestURI().equals("/superadmin/dashboard.jsp")) { out.print("active"); } %>">
                        <a href="dashboard.jsp">
                            <i class="material-icons">home</i>
                            <span>Home</span>
                        </a>
                    </li>
                    <li class="<% if(request.getRequestURI().equals("/superadmin/customer.jsp")) { out.print("active"); } %>">
                        <a href="customer.jsp">
                            <i class="material-icons">accessibility</i>
                            <span>Customer Center</span>
                        </a>
                    </li>
                    <li class="<% if(request.getRequestURI().equals("/superadmin/user.jsp")) { out.print("active"); } %>">
                        <a href="user.jsp">
                            <i class="material-icons">supervised_user_circle</i>
                            <span>User Center</span>
                        </a>
                    </li>
                    <li class="<% if(request.getRequestURI().equals("/superadmin/client.jsp")) { out.print("active"); } %>">
                        <a href="client.jsp">
                            <i class="material-icons">supervised_user_circle</i>
                            <span>Client Center</span>
                        </a>
                    </li>
                    <li class="<% if(request.getRequestURI().equals("/superadmin/file_number.jsp")) { out.print("active"); } %>">
                        <a href="file_number.jsp">
                            <i class="material-icons">accessibility</i>
                            <span>All Files</span>
                        </a>
                    </li>
                    <li class="<% if(request.getRequestURI().equals("/superadmin/cloud_usage.jsp")){ out.print("active"); }%>">
                        <a href="cloud_usage.jsp">
                            <i class="material-icons">cloud_circle</i>
                            <span>Cloud Usage</span>
                        </a>
                    </li>
                    <li class="<% if(request.getRequestURI().equals("/superadmin/department.jsp")) { out.print("active"); } %>">
                        <a href="department.jsp">
                            <i class="material-icons">file_copy</i>
                            <span>Departments</span>
                        </a>
                    </li>
                    <li class="<% if(request.getRequestURI().equals("/superadmin/report.jsp")) { out.print("active"); } %>">
                        <a href="report.jsp">
                            <i class="material-icons">policy</i>
                            <span>Billing Reports</span>
                        </a>
                    </li>
                   <%--  <li class="<% if(request.getRequestURI().equals("/superadmin/complaint.jsp")) { out.print("active"); } %>">
                        <a href="complaint.jsp">
                            <i class="material-icons">account_balance</i>
                            <span>Complaint Center</span>
                        </a>
                    </li> --%>
                    <li class="<% if(request.getRequestURI().equals("/superadmin/log.jsp")) { out.print("active"); } %>">
                        <a href="log.jsp">
                            <i class="material-icons">settings_applications</i>
                            <span>Log Reports</span>
                        </a>
                    </li>
                    <!-- <li>
                        <a href="../superprocess?action=superlogout">
                            <i class="material-icons">lock</i>
                            <span>Logout</span>
                        </a>
                   </li> -->
            </ul>      
               
            </div>
            <!-- #Menu -->
            <!-- Footer -->
            <div class="legal">
                <div class="copyright">
                    &copy; 2019 <a href="dashboard.jsp">SoftDoc</a>. All Right Reserved
                </div>

            </div>
            <!-- #Footer -->
        </aside>
        
        <!-- #END# Left Sidebar -->
        
    </section>


    <section class="content">
        <div class="container-fluid">
            <div class="block-header">
                <h2>
                    Download  Customers  
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
                                           Download  Customers
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
                                        
                                        <th>Customer Code</th>
                                        <th>Company Name</th>
                                        <th>Type</th>
                                        <th>Industry</th>
                                        <th>PAN</th>
                                        <th>TAN</th>
                                        <th>GSTIN</th>
                                        <th>Billing Address</th>
                                        <th>Scanning Quality (DPI)</th>
                                        <th>Scanning Quality (Colour/B&W)</th>
                                        <th>Active Department</th>
                                        <th>Created On</th>
                                        <th>Modified On</th>
                                        <th>Delete On</th>
                                        <th>Status(Active/Deleted)</th>
                                       
                                    </tr>
                                </thead>
                                <tbody>
                       <%
                            try(Connection connection=DBConnection.openConnection();PreparedStatement  preparedStatement=connection.prepareStatement("SELECT * FROM `customer_details` order by joining_date desc");)
                           {
                               
                                ResultSet resultset=preparedStatement.executeQuery();
                               
                               while(resultset.next())
                               {
                       %>
                      
                                 <tr>
                                       
                                        <td><%=resultset.getString("customer_number")%></td>
                                        <td><%=resultset.getString("company_name")%></td>
                                        <td><%=resultset.getString("type")%></td>
                                        <td><%=resultset.getString("industry")%></td>
                                        <td><%=resultset.getString("pan_text")%></td>
                                        <td><%=resultset.getString("tan")%></td>
                                        <td><%=resultset.getString("gstin")%></td>
                                        <td><%=resultset.getString("billing_address_first")%></td>
                                      
                                        <%if(resultset.getInt("dpi") !=0){%>
                                          <td><%=resultset.getString("dpi")%></td>
                                        <%}else{%>
                                          <td></td>
                                        <%} %>
                                       
                                        <%if(resultset.getString("colour") !=null){%>
                                            <td><%=resultset.getString("colour")%></td>
                                        <%}else{%>
                                            <td></td>
                                        <%} %>
                                        <td><%=resultset.getString("depart_info")%></td>
                                        <%
                                     	  final String OLD_FORMAT = "yyyy-MM-dd hh:mm:ss";
                             			  final String NEW_FORMAT = "dd MMM yyyy";
                             			  SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
                                          Date d = sdf.parse(resultset.getString("date"));
                             			  sdf.applyPattern(NEW_FORMAT);
                             			  String newDateString = sdf.format(d);
                                         %>
                                        <td><%=newDateString%></td>
                                        <%
                                     	  final String OLD_FORMAT1 = "yyyy-MM-dd hh:mm:ss";
                             			  final String NEW_FORMAT1 = "dd MMM yyyy";
                             			  SimpleDateFormat sdf1 = new SimpleDateFormat(OLD_FORMAT1);
                                          Date d1 = sdf1.parse(resultset.getString("modify"));
                             			  sdf.applyPattern(NEW_FORMAT1);
                             			  String modify = sdf.format(d1);
                                         %>
                                        <td><%=modify%></td>
                                       
                                        
                                        
                                        <%if(resultset.getInt("flag")==0){ %>
                                           <td><%="N/A"%></td>
                                           <td><%="Active"%></td>
                                          
                                         <% }else{%>
                                       <%
                                        final String OLD = "yyyy-MM-dd hh:mm:ss";
                           			    final String NEW = "dd MMM yyyy";
                           			    SimpleDateFormat simpledateformate = new SimpleDateFormat(OLD);
                           			    Date date = simpledateformate.parse(resultset.getString("leaving_date"));
                           			    simpledateformate.applyPattern(NEW);
                             			String leaving_date = simpledateformate.format(date);
                                          
                                       %>
                                            <td><%=leaving_date%></td>
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
                "lengthMenu":[25,30],
                "pageLength":25
            } );
        } );
        
    </script>
</body>

</html>
