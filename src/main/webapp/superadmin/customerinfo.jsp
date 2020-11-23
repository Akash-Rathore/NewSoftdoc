<%@include file="include/session.jsp"%>
<%@ page import="java.math.RoundingMode"%>
<%@ page import="java.text.DecimalFormat"%>

<!DOCTYPE html>
<html>

<head>
    <%@include file="include/head.jsp"%>
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/buttons/1.6.0/css/buttons.bootstrap.min.css" rel="stylesheet" />
</head>
  <body class="theme-light-blue">
    <div class="page-loader-wrapper">
        <div class="loader">
            <div class="preloader">
                <div class="spinner-layer pl-blue">
                    <div class="circle-clipper left">
                        <div class="circle"></div>
                    </div>
                    <div class="circle-clipper right">
                        <div class="circle"></div>
                    </div>
                </div>
            </div>
            <p>Please wait...</p>
        </div>
    </div>
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
                    Customer Information
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
                                             Customer Information 
                                        </div>
                                    </h2>
                                </div>
                            </div>
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-hover" id="example">
                                <thead>
                                    <tr>
                                        <th>S.No.</th>
                                        <th>Company Name</th>
                                        <th>Storage</th>
                                        <th>Department</th>
                                        <th>Month</th>
                                        
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                
                                
                                
                                 <% 
                                      int did=Integer.parseInt(request.getParameter("id"));  
                                 %>
                                 
                         <%
                          DecimalFormat df = new DecimalFormat("0.00");
                      	  try(Connection connection=DBConnection.openConnection();
                        		  PreparedStatement preparedStatement=connection.prepareStatement("SELECT sum(d.size) as size, d.*, c.* FROM customer_details as c, document_info as d WHERE c.id = d.company_id AND d.company_id = '"+did+"' and d.document_no is not null GROUP BY d.department, d.billing_month");
                                     )
                          {
                      	    ResultSet resultset=preparedStatement.executeQuery();
                            int i = 1;
                            while(resultset.next())
                            {
                      	   
                 
                    %>
                                   <tr>
                                        <td><%=i%></td>
                                           <td><%=resultset.getString("company_name")%></td>
                                        <% if(resultset.getString("size")==null){ %>
                                           <td> 0 MB</td> 
                                        <%}else{ %>
                                           <td><%=df.format(resultset.getDouble("size")) +" MB "%></td>
                                        <%} %>
                                           <td><%=resultset.getString("department")%></td>
                                         <%if(resultset.getString("billing_month")==null){ %>
                                            <td></td> 
                                        <%}else{ %>
                                          <td><%=resultset.getString("billing_month")%></td>
                                        <%}%>
                                     </tr>
                                           <% i++;
                                           
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
                                 <!--    <a href="download_clients.jsp" role="button" class="btn btn-primary">Download</a> -->
                            </div>
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
        $(document).ready(function() {
            $('#example').DataTable( {
                dom: 'Bfrtip',
                buttons: [
                    'copy', 'csv', 'excel', 'pdf', 'print'
                ] 
            } );
        } );
        
    </script>
  


  
</body>
</html>
