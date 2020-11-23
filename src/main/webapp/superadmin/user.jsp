<%@include file="include/session.jsp"%>
<%@page import="com.superadmin.connection.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet" %>
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
                    User center
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
                                            User center 
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
                                        <th>Employee ID.</th>
                                        <th>Name</th>
                                        <th>Designation</th>
                                        <th>Role</th>
                                        <th>Activation Date</th>
                                </thead>
                                <tbody>
                                   
                                      <%
                               try(Connection  connection=DBConnection.openConnection();PreparedStatement  preparedStatement=connection.prepareStatement("SELECT * FROM `softdoc_staff` where role!='superadmin' and role!='admin' and flag=0 order by id desc");)
                               {
                         	       ResultSet resultset=preparedStatement.executeQuery();
                                   int i = 1;
                                   while(resultset.next())
                                    {
                              %>
                                     <tr>
                                        <td><%=resultset.getString("softdoc_no")%></td>
                                        <td><%=resultset.getString("employee_id")%></td>
                                        <td><%=resultset.getString("name")%></td>
                                        <td><%=resultset.getString("designation")%></td>
                                        <td><%=resultset.getString("role")%></td>
                                        <td><%=resultset.getString("activation_date")%></td>
                                    </tr>
                                
                                <%
                                    i++;
                                    }
                                  }
                                  catch(SQLException sqlexception)
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
                                    <a href="download_user.jsp" role="button" class="btn btn-primary">Download</a>
                                    
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
        
    </section>

   <%@include file="include/script.jsp"%>
   <script src="../js/jquery.dataTables.min.js"></script>
   
    
    <script>
        $(document).ready(function() {
            $('#example').DataTable( {
            	 "searching":false,
                 "lengthMenu":[25,50],
                 "pageLength":25
            } );
        } );
        
        
    </script>
</body>

</html>
