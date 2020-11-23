<%@ page import="com.softdocadmin.connection.StoreDBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@include file="include/session.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="include/head.jsp" %> 
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
                <a class="navbar-brand" href="index.jsp">SOFTDOC ADMIN</a>
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
          <%@include file="include/leftsidebar.jsp" %>       
        <!-- #END# Left Sidebar -->
    </section>
    <section class="content">
        <div class="container-fluid">
            <div class="row clearfix dashboardBlocks">
                <!-- Latest Social Trends -->
                <!-- #END# Latest Social Trends -->
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header  margin0">
                            <div class="row">
                                <div class="">
                                    <h2 class="col-md-4 col-lg-4 col-xs-12 pull-left">
                                        <div class="m-t-10">
                                            Industry
                                        </div>
                                    </h2>
                                </div>
                            </div>
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-hover" id="myTable">
                                <thead>
                                    <tr>
                                       <th>S.No.</th>
                                       <th>Industry</th>
                                       <th>Department Name</th>
                                       <th>Document Type</th>
                                    </tr>
                                </thead>
                                <tbody>
                                  <%
                                  	    try(Connection connection=StoreDBConnection.openConnection(); PreparedStatement  preparedStatement=connection.prepareStatement("select industry,df.id as id ,df.department as department,df.document_type as document_type from customer_details as cd,document_info as df where cd.id=df.company_id and df.document_type is not null and df.company_id= '"+request.getParameter("id")+"' and df.status='quality_approved'");)
                                        {
                                    	      ResultSet resultset=preparedStatement.executeQuery();
                                              int i = 1;
                                              while(resultset.next())
                                              {
                                  %>
                                      <tr>
                                         <td><%=i%></td>
                                         <td><%=resultset.getString("industry")%></td>
                                         <td><%=resultset.getString("department")%></td>
                                         <td><a href="documenttype.jsp?id=<%=resultset.getString("id")%>"><%=resultset.getString("document_type")%></a></td>
                                      </tr>
                                        <%
                                        i++;
                                      }
                                    }catch(SQLException sqlexception)
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
   <%@include file="include/script.jsp" %> 
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
