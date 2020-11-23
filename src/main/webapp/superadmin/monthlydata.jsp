<%@include file="include/session.jsp" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.math.RoundingMode"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import= "java.util.Calendar" %>
<%@ page import= "java.sql.Statement" %>

<!DOCTYPE html>
<html>
<head>
     <%@include file="include/head.jsp"%>
          <!--Datatable  -->   
     <link href="http://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" rel="stylesheet"/> 
   
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
                   Monthly Files
                </h2>
            </div>
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">	
                        	<div class="col-md-8">
	                            <h2>
	                                 Monthly Files
	                            </h2>
                            </div>
                             <br><br>
                            <div class="col-md-3">
	                          	
                       		</div>
                            
                           
                        </div>
                       	
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-hover" id="myTable">
                                <thead>
                                    <tr>	 
                                    	<th>File No.</th>
                                        <th>Department</th>
                                        <th>Size</th>
                                        <th>Status</th>
                                        <th>Month</th>
                                       
                                    	
                                    </tr>
                                </thead>
                                <tbody>
                              <%
                              int did = Integer.parseInt(request.getParameter("id"));
                              DecimalFormat df = new DecimalFormat("0.00");
                              final String OLD = "yyyy-MM-dd hh:mm:ss";
                			  final String NEW = "dd MMM yyyy";
                			  SimpleDateFormat simpleDateFormat = new SimpleDateFormat(OLD);
                              try(Connection  connect=DBConnection.openConnection();PreparedStatement preparedStatement=connect.prepareStatement("SELECT file_no , department , sum(size)as size , status , client_id ,  billing_month FROM document_info WHERE billing_month = (SELECT billing_month FROM document_info WHERE id ='"+did+"') AND company_id = (SELECT company_id FROM document_info WHERE id ='"+did+"') GROUP BY file_no");)
                              {
                                    ResultSet resultset=preparedStatement.executeQuery();
                                    while(resultset.next())
                                    {
                               %>
                                      <tr>                                        
                                          <td><%=resultset.getString("file_no")%></td>
                                          <td><%=resultset.getString("department")%></td>
                                          <td><%=df.format(resultset.getDouble("size"))+" MB "%></td>
                                          
                                          <%if(resultset.getInt("client_id")!=0){ %>
                                              <td>Active</td>
                                            <%}else { %>
                                   
                                          
                                          <% if(resultset.getString("status").equals("store")){ %>
                                               <td><%="STORE"%></td>
                                          <% }else if(resultset.getString("status").equals("indexing")){ %>
                                               <td><%="STORE-->INDEXING"%></td> 
                                           <%}else if(resultset.getString("status").equals("quality")){ %> 
                                               <td><%="STORE-->INDEXING --> QUALITY"%></td> 
                                           <%}else if(resultset.getString("status").equals("quality_return")){ %> 
                                                 <td><%="STORE-->INDEXING --> QUALITY "%></td> 
                                            <%}else if(resultset.getString("status").equals("return_quality")){ %> 
                                                 <td><%="STORE-->INDEXING --> QUALITY "%></td> 
                                            <%}else if(resultset.getString("status").equals("quality_approved")){ %> 
                                                <td><%="STORE--> INDEXING  --> QUALITY -->READY TO RETURN"%></td> 
                                          <%}else{%>
                                                <td></td>
                                          <%} %>
                                       <%} %>
                                          <td><%=resultset.getString("billing_month")%></td> 
                                          
                                       
                                    </tr>
                             <%	   
                                    }
                               }
                              catch(SQLException sqlexception )
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
    <script src="http://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script>
     $(document).ready( function () {
          $('#myTable').DataTable({
        	  "searching":false,
              "lengthMenu":[25,30],
              "pageLength":25
          });
     } );
   </script> 
</body>

</html>
