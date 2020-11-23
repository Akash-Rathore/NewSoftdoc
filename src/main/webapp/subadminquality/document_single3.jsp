<%@include file="include/session.jsp"%>

<!DOCTYPE html>
<html>
<head>
       
      <%@include file="include/head.jsp"%>
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
                <a class="navbar-brand" href="index.jsp">SOFTDOC SUBADMIN QUALITY</a>
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
             <%@include file="include/sidebar.jsp" %>
        <!-- #END# Left Sidebar -->
    </section>

    <section class="content">
        <div class="container-fluid">
            <div class="block-header">
                <h2>
                    Documents Status
                </h2>
            </div>
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                Documents
                            </h2>
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-hover" id="myTable">
                                <thead>
                                    <tr>
                                        <th>Document No. </th>
                                        <th>Department</th>
                                        <th>Document Type</th>
                                        <th>Attachment Count</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                  <%
          	                              String file_no ="";
                                          try(Connection  connect=QualityDBConnection.openConnection();
                                        		  PreparedStatement preparedStatement=connect.prepareStatement("SELECT  id , count(attachment_no)as count,file_no,document_no,department,document_type FROM `document_info` WHERE file_no = (select file_no from document_info where id='"+request.getParameter("id")+"') and status='return_quality' group by document_no");
                                                     )
                                          {
                                          	   ResultSet resultset=preparedStatement.executeQuery();
                                               while(resultset.next())
                                               {
                                            	   file_no=resultset.getString("file_no");
                                  %>
                                        <tr>
                                             <td><a href="attachment_return.jsp?id=<%=resultset.getString("id")%>"><%=resultset.getString("document_no")%></a></td>
                                             <td><%=resultset.getString("department")%></td>
                                             <td><%=resultset.getString("document_type")%>
                                             <td><%=resultset.getString("count")%></td>
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
   <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function() {
          $('#myTable').DataTable( {
              "searching":false,
              "lengthMenu":[25,50],
              "pageLength":25
          } );
        });
   </script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
 </body>
</html>