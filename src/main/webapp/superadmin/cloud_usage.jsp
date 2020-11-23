<!DOCTYPE html>
    <%@include file="include/session.jsp" %>
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
              <%@include file="include/sidebar.jsp" %>
        <!-- #END# Left Sidebar -->
        
    </section>

    <section class="content">
        <div class="container-fluid">
            <div class="block-header">
                <h2>
                    Cloud Usage 
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
                                            Cloud Usage Reports
                                        </div>
                                    </h2>
                                   
                                </div>
                            </div>
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table  dashboard-task-infos display nowrap" id="mytable">
                                    <thead>
                                      <tr>
                                            <th>Customer Code</th>
                                            <th>Company Name</th>
                                            <th>Cloud Usage</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    
                                 <%
                                	try(Connection  connect=DBConnection.openConnection();
                                			PreparedStatement preparedStatement=connect.prepareStatement("SELECT document_info.id as did , customer_number , customer_details.id as id , SUM(ROUND(size,2))AS size , company_name FROM customer_details, document_info WHERE document_info.company_id = customer_details.id and document_no is not null  GROUP BY document_info.company_id");
                                            )
                                   {
                                          ResultSet resultset=preparedStatement.executeQuery();
                                          while(resultset.next())
                                         {
                                 %>
                                        <tr>
                                            <td><%=resultset.getString("customer_number")%></td>
                                            <td><a href="companystorage.jsp?id=<%=resultset.getString("id")%>"><%=resultset.getString("company_name")%></a></td>
                                            <td><%=resultset.getString("size")+" MB "%></td>
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
                                <div class="m-t-10" style="float:right;">
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
            $('#mytable').DataTable( {
                "searching":false,
                "lengthMenu":[25,50],
                "pageLength":25
            } );
        } );
    </script>
</body>
</html>
