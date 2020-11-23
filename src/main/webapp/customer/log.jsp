<%@ page import="com.customeradmin.connection.DBConnection"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement"%>
<%@include file="include/session.jsp"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date" %>    
<!DOCTYPE html>
<html>
<head>
    <%@include file="include/head.jsp"%>
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/buttons/1.6.0/css/buttons.bootstrap.min.css" rel="stylesheet" />

</head>

<body class="theme-light-blue">
    
    <!-- Overlay For Sidebars -->
    <div class="overlay"></div>
    <!-- #END# Overlay For Sidebars -->
    
    <%@include file="include/navbar.jsp"%>
    
   <section>
		<!-- Left Sidebar -->
		<%@include file="include/sidebar.jsp"%>
		<!-- #END# Left Sidebar -->
	</section>
       
       <section class="content">
        <div class="container-fluid">
            
            <div class="block-header">
                <h2>
                </h2>
            </div>
            
            <div class="row"  style="margin-left: -148px !important; margin-right: -27px;">
			
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header  margin0">
                            
                            <div class="row">
                                <div class="">
                                    <h2 class="col-md-4 col-lg-4 col-xs-12 pull-left">
                                         <div class="m-t-10">
                                            Login/Logout Report
                                        </div>
                                    </h2>
                                     <!-- <div class="col-md-8 col-lg-8 col-xs-12 pull-right accessCutomerTable">
                                        <div class="col-md-1">
                                            <h2 class="">From</h2>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="date" id="start_date" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-1">
                                            <h2 class="">To</h2>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group form-float">
                                            <div class="form-line">
                                                <input type="date" id="end_date" class="form-control">
                                            </div>
                                        </div>
                                         </div>
                                       <div class="col-md-4">
     								       <input type="button" name="search" onclick="reportfilter(this.value)" value="Search" class="btn btn-info" />
      						           </div>
                                     
                                    </div> -->
                                </div>
                            </div>
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-hover" id="example" >
                                <thead>
                                    <tr>
                                         <th>Softdoc ID</th>
                                         <th>Employee ID</th>
                                         <th>User Name</th>
                                         <th>User Email</th>
                                         <th>IP Address</th>
                                         <th>Date</th>
                                         <th>Activity</th>
                                    </tr>
                                </thead>
                                <tbody id="txtHint1">
                                     <%
                                        try(Connection  connection=DBConnection.openConnection();
                                        		PreparedStatement preparedStatement=connection.prepareStatement("SELECT action , softdoc_id , employee_id , employee_name , loginid , ip , logintime FROM logfile, client_details, customer_details WHERE client_details.customer_id = logfile.company_id and logfile.user_id = client_details.id AND client_details.customer_id = customer_details.id AND customer_details.id = '"+(int)session.getAttribute("customer_id")+"' AND logfile.role = 'client' AND logfile.action IN ('Login','Logout')  ORDER BY logfile.logintime DESC");
                                                )
                                        {
                                    	     ResultSet resultset=preparedStatement.executeQuery();
                                             while(resultset.next())
                                            {
                                   %>
                                     <tr>
                                        <td><%=resultset.getString("softdoc_id")%></td>
                                        <td><%=resultset.getString("employee_id")%></td>
                                        <td><%=resultset.getString("employee_name")%></td>
                                        <td><%=resultset.getString("loginid")%></td>
                                        <td><%=resultset.getString("ip")%></td>
                                       <%
                                     	  final String OLD_FORMAT = "yyyy-MM-dd hh:mm:ss";
                             			  final String NEW_FORMAT = "dd MMM yyyy";
                             			  SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
                                          Date d = sdf.parse(resultset.getString("logintime"));
                             			  sdf.applyPattern(NEW_FORMAT);
                             			  String newDateString = sdf.format(d);
                                        %>
                                        <td><%=newDateString%></td>
                                        <td><%=resultset.getString("action")%></td>
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
                              <!-- <div class="m-t-10" style="float:right;">
                                    <a href="download_log.jsp" class="btn btn-primary" role="button">Generate Report</a>
                                </div> -->
                            </div>
                        </div>
                    </div>
                </div>
                
                
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header  margin0">
                            
                            <div class="row">
                                <div class="">
                                    <h2 class="col-md-4 col-lg-4 col-xs-12 pull-left">
                                        <div class="m-t-10">
                                             User Center Report
                                        </div>
                                    </h2>
                                   </div>
                            </div>
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-hover" id="examplemy" >
                                <thead>
                                    <tr>
                                         <th>Softdoc ID</th>
                                         <th>Employee ID</th>
                                         <th>User Name</th>
                                         <th>User Email</th>
                                         <th>IP Address</th>
                                         <th>Date</th>
                                         <th>Activity</th>
                                    </tr>
                                </thead>
                                <tbody>
                                     <%
                                        try(Connection  connection=DBConnection.openConnection();
                                        		PreparedStatement preparedStatement=connection.prepareStatement("SELECT action , softdoc_id , employee_id , employee_name , loginid , ip , logintime FROM logfile, client_details, customer_details WHERE  client_details.customer_id = logfile.company_id and logfile.user_id = client_details.id AND client_details.customer_id = customer_details.id AND customer_details.id = '"+(int)session.getAttribute("customer_id")+"' AND logfile.role = 'customeradmin'  AND logfile.action IN ('User Created','User Deleted','User Modified')  ORDER BY logfile.logintime DESC");
                                       	     )
                                        {
                                    	     ResultSet resultset=preparedStatement.executeQuery();
                                             while(resultset.next())
                                             {
                                            	
                                     %>
                                        <tr>
                                        <td><%=resultset.getString("softdoc_id")%></td>
                                        <td><%=resultset.getString("employee_id")%></td>
                                        <td><%=resultset.getString("employee_name")%></td>
                                        <td><%=resultset.getString("loginid")%></td>
                                        <td><%=resultset.getString("ip")%></td>
                                       <%
                                     	  final String OLD_FORMAT = "yyyy-MM-dd hh:mm:ss";
                             			  final String NEW_FORMAT = "dd MMM yyyy";
                             			  SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
                                          Date d = sdf.parse(resultset.getString("logintime"));
                             			  sdf.applyPattern(NEW_FORMAT);
                             			  String newDateString = sdf.format(d);
                                        %>
                                        <td><%=newDateString%></td>
                                        <td><%=resultset.getString("action")%></td>
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
                             <!--  <div class="m-t-10" style="float:right;">
                                      <a href="mylog.jsp" class="btn btn-primary" role="button">Generate Report</a>
                                </div> -->
                            </div>
                        </div>
                    </div>
                </div>
                
                
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header  margin0">
                            
                            <div class="row">
                                <div class="">
                                    <h2 class="col-md-4 col-lg-4 col-xs-12 pull-left">
                                        <div class="m-t-10">
                                             Document Report
                                        </div>
                                    </h2>
                                   </div>
                            </div>
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-hover" id="examplemysec" >
                                <thead>
                                    <tr>
                                         <th>Softdoc ID</th>
                                         <th>Employee ID</th>
                                         <th>User Name</th>
                                         <th>User Email</th>
                                         <th>IP Address</th>
                                         <th>Date</th>
                                         <th>File No.</th>
                                         <th>Document No.</th>
                                         <th>Activity</th>
                                    </tr>
                                </thead>
                                <tbody>
                                     <%
                                        //(int)session.getAttribute("customer_id")
                                        try(Connection  connection=DBConnection.openConnection();
                                        		PreparedStatement preparedStatement=connection.prepareStatement("SELECT action , document_no , file_no , softdoc_id , employee_id , employee_name , loginid , ip , logintime FROM logfile ,  client_details , customer_details  WHERE client_details.id=logfile.user_id and client_details.customer_id = customer_details.id and logfile.company_id = customer_details.id  and customer_details.id = '"+(int)session.getAttribute("customer_id")+"' AND logfile.role = 'doc'  AND logfile.action IN ('Document Access','Document Created','Document Modified','Document Deleted')");
                                       	     )
                                        {
                                    	     ResultSet resultset=preparedStatement.executeQuery();
                                             while(resultset.next())
                                             {
                                            	
                                     %>
                                        <tr>
                                        <td><%=resultset.getString("softdoc_id")%></td>
                                        <td><%=resultset.getString("employee_id")%></td>
                                        <td><%=resultset.getString("employee_name")%></td>
                                        <td><%=resultset.getString("loginid")%></td>
                                        <td><%=resultset.getString("ip")%></td>
                                       <%
                                     	  final String OLD_FORMAT = "yyyy-MM-dd hh:mm:ss";
                             			  final String NEW_FORMAT = "dd MMM yyyy";
                             			  SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
                                          Date d = sdf.parse(resultset.getString("logintime"));
                             			  sdf.applyPattern(NEW_FORMAT);
                             			  String newDateString = sdf.format(d);
                                        %>
                                        <td><%=newDateString%></td>
                                        <td><%=resultset.getString("file_no")%></td>
                                        <td><%=resultset.getString("document_no")%></td>
                                        <td><%=resultset.getString("action")%></td>
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
                             <!--  <div class="m-t-10" style="float:right;">
                                      <a href="mylog.jsp" class="btn btn-primary" role="button">Generate Report</a>
                                </div> -->
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
            $('#example').DataTable( {
            	  dom: 'Bfrtip',
                  buttons: [
                      'copy', 'csv', 'excel', 'pdf', 'print'
                  ],
                  "searching":false,
                  "lengthMenu":[25,50],
                  "pageLength":25
            } );
        } );
        $(document).ready(function() {
            $('#examplemy').DataTable( {
            	dom: 'Bfrtip',
                buttons: [
                    'copy', 'csv', 'excel', 'pdf', 'print'
                ],
                "searching":false,
                "lengthMenu":[25,50],
                "pageLength":25
            } );
        } );
        $(document).ready(function() {
            $('#examplemysec').DataTable( {
            	dom: 'Bfrtip',
                buttons: [
                    'copy', 'csv', 'excel', 'pdf', 'print'
                ],
                "searching":false,
                "lengthMenu":[25,50],
                "pageLength":25
            } );
        } );
    </script>
</body>

</html>
