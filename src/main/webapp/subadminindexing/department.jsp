<%@include file="include/session.jsp" %>
<%@page import="java.io.File" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date" %>    
<!DOCTYPE html>
<html>
<head>
    <%@include file="include/head.jsp"%>   
               <!-- Datatable -->
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
                <a class="navbar-brand" href="index.jsp">SOFTDOC SUBADMIN INDEXING</a>
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
             <%@include file="include/sidebar.jsp" %>
         <!-- #END# Left Sidebar -->
    </section>
    <section class="content">
        <div class="container-fluid">
            <div class="block-header">
                <h2>
                    Documents
                </h2>
            </div>
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                              <%
                                try(Connection  connect=IndexingDBConnection.openConnection();PreparedStatement preparedStatement=connect.prepareStatement("select * from customer_details where id='"+request.getParameter("id")+"'");)
                                {
                                 	ResultSet result=preparedStatement.executeQuery();
                                    if(result.next())
                                    {
                       %>
                            <h2>
                               Documents <%=result.getString("company_name")%>
                            </h2>
                         <%
                                      	}
                                 }
                                 catch(Exception exception)
                                 {
                               	  exception.printStackTrace();
                                 }
                          %> 
                        </div>
                        <div class="body">
                            <div class="row">
                            <div class="table-responsive">
                            <table class="table table-hover" id="myTable">
                                <thead>
                                    <tr>
                                         <th>Document No. </th>
                                         <th>Department</th>
                                         <th>Document Type</th>
                                         <th>Time</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                              String id = request.getParameter("id");
                                              String dept=request.getParameter("dept"); 
                                              try(Connection  connect=IndexingDBConnection.openConnection();PreparedStatement preparedStatement=connect.prepareStatement("SELECT * FROM document_info WHERE company_id='"+id+"' AND department='"+dept+"' and document_no is not null AND STATUS='indexing'  GROUP BY document_no");)
                                              {
                                                  	    ResultSet resultset=preparedStatement.executeQuery();
                                                        while(resultset.next())
                                                        {
                                  %>
                                        <tr>
                                           <td><a href="viewdocument.jsp?id=<%=resultset.getString("id")%>"><%=resultset.getString("document_no")%></a></td>
                                           <td><%=resultset.getString("department")%></td>
                                           <td><%=resultset.getString("document_type")%></td>
		                                      <%
		                                    	   final String OLD_FORMAT = "yyyy-MM-dd hh:mm:ss";
		                            			   final String NEW_FORMAT = "dd MMM yyyy";
		                            			   SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
		                                           Date d = sdf.parse(resultset.getString("upload_date"));
		                            			   sdf.applyPattern(NEW_FORMAT);
		                            			   String upload_date = sdf.format(d);
		                                       %>
		                                    <td><%=upload_date%></td>
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
