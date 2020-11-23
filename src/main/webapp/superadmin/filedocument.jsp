<%@include file="include/session.jsp" %>
<%@page import="java.io.File" %>
<!DOCTYPE html>
<html>
<head>
   <%@include file="include/head.jsp"%>
     <!--Datatable  -->   
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
                <a class="navbar-brand" href="index.jsp">SUPER ADMIN</a>
            </div>
            <div class="collapse navbar-collapse" id="navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <!-- Notifications -->
                       <%@include file="include/notification.jsp" %>
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
                  document per file
                </h2>
            </div>
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                               document per file
                            </h2>
                        </div>
                        <div class="body">
                            
                            <div class="row">
                                    
                             <%
                             	String file_no = request.getParameter("id");
                                try( Connection  connect=DBConnection.openConnection();PreparedStatement preparedStatement=connect.prepareStatement("SELECT count(document_info.id) as no_of_doc, sum(size) as size, file_no, company_name, department, upload_date FROM customer_details, document_info WHERE document_info.company_id = customer_details.id AND file_no = '"+file_no+"' GROUP BY document_info.file_no");)
                                {
                                	                                      
                                	ResultSet resultset=preparedStatement.executeQuery();
                                    if(resultset.next())
                                    {
                                    	
                              %>
                                <div class="col-md-2">File No.:-</div>
                                <div class="col-md-2"><%=resultset.getInt("file_no")%></div>
                                <div class="col-md-3"></div>
                                <div class="col-md-2">Department:-</div>
                                <div class="col-md-3">
                                    <div class="form-group form-float">
                                        <div class="">
                                           
                                           <td><%=resultset.getString("department")%></td>      
                                     
                                        </div>
                                    </div>    
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-2">Company Name</div>
                                <div class="col-md-2"><%=resultset.getString("company_name")%></div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-2">Document Counter:-</div>
                                <div class="col-md-3"><%=resultset.getInt("no_of_doc") %></div>
                                <div class="col-md-5"></div>
                                
                            </div>
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
                            
                            <div class="table-responsive">
                                <table class="table table-hover" id="myTable">
                                <thead>
                                    <tr>
                                         <th>Document Name.</th>
                                         <th>Department</th>
                                         <th>Time</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                             <%
                              
                                try(Connection  connect=DBConnection.openConnection();PreparedStatement preparedStatement=connect.prepareStatement("SELECT * FROM `document_info` WHERE file_no = '"+file_no+"'");)
                                {
                                    ResultSet resultset=preparedStatement.executeQuery();
                                    while(resultset.next())
                                    {
                                    	  %>
                                       <tr>
                                           <%
                                                  String filename=resultset.getString("file");
                                                  File file = new File(filename); 
                                           %>  
                                           <td><%=file.getName()%></td>
                                           <td><%=resultset.getString("department")%></td>
                                           <td><%=resultset.getTimestamp("upload_date")%></td>
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
                            <div class="row">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
     <%@include file="include/script.jsp"%>
     <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
     <script>
      $(document).ready( function () {
          $('#myTable').DataTable({
        	  "searching":false,
              "lengthMenu":[25,50],
              "pageLength":25
          });
      } );
   </script> 
    
    
  </body>
</html>
