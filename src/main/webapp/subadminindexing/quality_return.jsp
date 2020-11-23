<%@include file="include/session.jsp" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date" %>    
<%@ page import="java.sql.Statement" %>    
<%@ page import="java.math.RoundingMode"%>
<%@ page import="java.text.DecimalFormat"%>

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
                    Quality Return
                </h2>
            </div>
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                File Number
                            </h2>
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-hover" id="myTable">
                                <thead>
                                    <tr>
                                        <th>File No. </th>
                                        <th width="15%">Company Name</th>
                                        <th>Department</th>
                                        <th>Size</th>
                                        <th>Created Date</th>
                                        <th>Document Count</th>
                                    </tr>
                                </thead>
                                <tbody>
                                         <%
                                            String count="";
                                            DecimalFormat df = new DecimalFormat("0.00");
                                         	try(Connection  connect=IndexingDBConnection.openConnection();PreparedStatement preparedStatement=connect.prepareStatement("SELECT document_info.id as id,document_no,sum(size) as size, file_no, company_name, department, upload_date FROM customer_details, document_info WHERE document_info.company_id = customer_details.id AND document_info.status = 'quality_return'  GROUP BY document_info.file_no ORDER BY document_info.upload_date desc");)
                                              {
                                                          ResultSet resultset=preparedStatement.executeQuery();
                                                          while(resultset.next())
                                                          {
                                                        	  
                                                        	 	try(Connection  connection=IndexingDBConnection.openConnection();Statement stat=connect.createStatement();)
            								                    {
            								                             ResultSet result=stat.executeQuery("SELECT COUNT(DISTINCT document_no)as count FROM document_info WHERE file_no='"+resultset.getString("file_no")+"' AND document_info.status = 'quality_return'");
            								                             while(result.next())
            								                             {
            								                            	 count=result.getString("count");
            								                             }
            								                    }
                                         %>
                                     <tr>
                                          <td><a href="documentstwo.jsp?id=<%=resultset.getString("id")%>"><%=resultset.getString("file_no")%></a></td>
                                          <td><%=resultset.getString("company_name")%></td>
                                          <td><%=resultset.getString("department")%></td>
                                          <td><%= df.format(resultset.getDouble("size")) +" MB "%></td>
                                       <%
                                     	   final String OLD_FORMAT = "yyyy-MM-dd hh:mm:ss";
                             			   final String NEW_FORMAT = "dd MMM yyyy";
                             			   SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
                                           Date d = sdf.parse(resultset.getString("upload_date"));
                             			   sdf.applyPattern(NEW_FORMAT);
                             			   String upload_date = sdf.format(d);
                                       %>
                                          <td><%=upload_date%></td>
                                          <td><%=count%></td>
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
