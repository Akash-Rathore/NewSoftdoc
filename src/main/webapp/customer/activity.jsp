<%@include file="include/session.jsp" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%> 
<%@page import="com.customeradmin.connection.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet" %>
 
<!DOCTYPE html>
<html>
<head>
    
    <%@include file="include/head.jsp"%>
      <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/buttons/1.6.0/css/buttons.bootstrap.min.css" rel="stylesheet" />
 
</head>
<body class="theme-light-blue">

    <div class="overlay"></div>
       
    <!-- Top Bar -->
    <nav class="navbar">
        <div class="container-fluid">
            <div class="navbar-header">
                <a href="javascript:void(0);" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false"></a>
                <a href="javascript:void(0);" class="bars"></a>
                <a class="image" href="index.jsp"><img src="../images/logo5.png" class="logoClient" alt="User" /></a>
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
            <div class="row clearfix">
                <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <div class="row">
                           <!--      <div class="col-md-12">
                                    <h2 class="col-md-7 p-l-0 p-t-10">Current Activity</h2>
                           
                                </div> -->
                            </div>
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-hover table-striped m-b-0" id="mytable">
                                    <thead>
                                        <tr>
                                            <th>File No.</th>
                                            <th>Department</th>
                                            <th>Pickup Date</th>
                                            <th>Tracking</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                         <%                 
                         
                           try(Connection  connection=DBConnection.openConnection();  PreparedStatement  preparedStatement=connection.prepareStatement("SELECT df.client_id as client_id, df.department , df.file_no , sd.pickup_date AS pickup_date, df.status AS STATUS FROM `document_info` df,customer_details cd , scheduling sd WHERE  df.company_id= sd.company_id AND df.company_id=cd.id AND cd.id='"+(int)session.getAttribute("customer_id")+"'  AND sd.return_date IS NOT NULL  and df.document_no is not null  group by  df.file_no  ORDER BY sd.pickup_date");)
                           {
                                ResultSet resultset=preparedStatement.executeQuery();
                              
                                while(resultset.next())
                                {
                           %>
                                   <tr> 
                                          <td><%=resultset.getString("file_no")%></td>
                                          <td><%=resultset.getString("department")%></td>
                                          
                                          
                                          <%if(resultset.getInt("client_id")>0){%>
                                           
                                            <td></td>
                                            <td>Active</td>                                           
                                         
                                         
                                           <%}else{%>
                                           
                                          <%
                                          final String OLD = "yyyy-MM-dd";
                           			      final String NEW = "dd MMM yyyy";
                           			      SimpleDateFormat simpleDateFormat = new SimpleDateFormat(OLD);
                                          Date date = simpleDateFormat.parse(resultset.getString("pickup_date"));
                                          simpleDateFormat.applyPattern(NEW);
                           			      String pickup_date = simpleDateFormat.format(date);
                                          %>
                                          <td><%=pickup_date%></td>
                                          <% if(resultset.getString("status").equals("store")){ %>
                                               <td><%=" STORE "%></td>
                                          <% }else if(resultset.getString("status").equals("indexing")){ %>
                                               <td><%=" STORE-->INDEXING "%></td> 
                                           <%}else if(resultset.getString("status").equals("quality_return")){ %> 
                                               <td><%="STORE-->INDEXING --> QUALITY "%></td> 
                                           <%}else if(resultset.getString("status").equals("return_quality")){ %> 
                                           
                                               <td><%="STORE-->INDEXING --> QUALITY "%></td> 
                                           
                                           <%}else if(resultset.getString("status").equals("quality")){ %> 
                                          
                                               <td><%="STORE-->INDEXING --> QUALITY "%></td> 
                                          
                                           <%}else if(resultset.getString("status").equals("quality_approved")){ %> 
                                               <td><%="STORE-->INDEXING --> QUALITY-->READY TO RETURN"%></td> 
                                           <%}else{ %>        
                                              <td></td>
                                           <%} %>
                                           
                                           
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
   <%@include file="include/footer.jsp" %>
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
            $('#mytable').DataTable( {
               "searching":false,
               "lengthMenu":[25,50],
               "pageLength":25
               
            } );
        } );
        
    </script>
</body>
</html>
