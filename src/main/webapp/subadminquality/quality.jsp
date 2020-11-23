<%@include file="include/session.jsp"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date" %>    
<%@ page import="java.sql.Statement"%>    
<!DOCTYPE html>
<html>
<head>
      <%@include file="include/head.jsp"%>    
        <!--Datatable-->
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
                <h2>Quality Reports</h2>
            </div>
            <div class="row clearfix">
                <div class="col-xs-12 col-sm-12">
                    <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                <div class="body">
                                    <div class="font-bold m-b-20">Pending For Quality</div>
                                    <div class="table-responsive">
                                        <table class="table" id="myTable">
                                            <thead>
                                                <tr>
                                                    <th>Company Name</th>
                                                    <th>File No.</th>
                                                    <th>Department</th>
                                                    <th>Send by Indexing Date</th>
                                                    <th>Document Count</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                <%
                                       String count="";    
                                	   try(Connection  connect=QualityDBConnection.openConnection();PreparedStatement preparedStatement=connect.prepareStatement("SELECT sum(size) as size , file_no , department , company_name , department , quality_date , document_info.id FROM customer_details, document_info WHERE document_info.company_id = customer_details.id AND document_info.status = 'quality' AND document_info.document_no !='null' GROUP BY document_info.file_no order by upload_date desc");
                                               )
                                        {
                                                ResultSet resultset=preparedStatement.executeQuery();
                                                while(resultset.next())
                                                {
                                                	
                                                	try(Connection  connection=QualityDBConnection.openConnection();Statement stat=connect.createStatement();)
								                    {
								                             ResultSet result=stat.executeQuery("SELECT COUNT(DISTINCT document_no)as count FROM document_info WHERE file_no='"+resultset.getString("file_no")+"' AND document_info.status = 'quality' ");
								                             while(result.next())
								                             {
								                            	 count=result.getString("count");
								                             }
								                    }
                                                	
                                                	
                                %>
                                               <tr>
                                                     <td><%=resultset.getString("customer_details.company_name")%></td>
                                                     <td><a href="document_single2.jsp?id=<%=resultset.getString("id")%>"><%=resultset.getString("file_no")%></a></td>
				                                    <%
				                                 	   final String OLD_FORMAT = "yyyy-MM-dd";
				                         			   final String NEW_FORMAT = "dd MMM yyyy";
				                         			   SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
				                                       Date d = sdf.parse(resultset.getString("quality_date"));
				                         			   sdf.applyPattern(NEW_FORMAT);
				                         			 %>
				                                     <td><%=resultset.getString("department")%></td>
				                                     <td><%=sdf.format(d)%></td>
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
      $(document).ready(function() {
          $('#myTableone').DataTable( {
              "searching":false,
              "lengthMenu":[25,50],
              "pageLength":25
          } );
        });
      </script>
  
   </body>
   </html>
