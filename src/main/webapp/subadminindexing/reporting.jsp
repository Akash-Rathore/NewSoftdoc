<%@include file="include/session.jsp"%>
<%@ page import="com.softdocindexing.connection.IndexingDBConnection"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%> 
<%@ page import="java.math.RoundingMode"%>
<%@ page import="java.text.DecimalFormat"%>
 
 <!DOCTYPE html>
 <html>
 <head>
    <%@include file="include/head.jsp"%>   
     
       <!--Datatable  -->
    <link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" rel="stylesheet"/>
    <script type="text/javascript">
       function reportfilter(str) {
        
        var start_date = $('#start_date').val();
    	  var end_date = $('#end_date').val(); 
           
       if (str=="") {
          document.getElementById("txtHint").innerHTML="";
          return;
        }
        if (window.XMLHttpRequest) {
          // code for IE7+, Firefox, Chrome, Opera, Safari
          xmlhttp=new XMLHttpRequest();
        } else { // code for IE6, IE5
          xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange=function() {
          if (this.readyState==4 && this.status==200) {
            document.getElementById("txtHint").innerHTML=this.responseText;
          }
        }
         
         xmlhttp.open("POST","ajax-report.jsp?start="+start_date+"&end="+end_date,true); 
         xmlhttp.send();
      }
    </script>
    
    
    
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
                <h2>Log Reports</h2>
            </div>
            <div class="row clearfix dashboardBlocks">
                <!-- Latest Social Trends -->
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <div class="row">
                                <h2 class="col-md-4 col-lg-4 col-xs-12 pull-left">
                                    <div class="m-t-10">
                                        Log Reports
                                    </div>
                                </h2>
                                 <!-- Start  date filter -->
                                  <div class="col-md-8 col-lg-8 col-xs-12 pull-right accessCutomerTable">
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
                                     
                                    </div>
                               <!-- End date filter -->
                            </div>
                        </div>                        
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-hover" id="myTable">
                                <thead>
                                    <tr>
                                         <th>S.No.</th>
                                         <th width="15%">Login ID</th>
                                         <th>System IP</th>
                                         <th>Login Time</th>
                                         <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody id="txtHint">
                                       <%
                                       	try(Connection  connection=IndexingDBConnection.openConnection();PreparedStatement preparedStatement=connection.prepareStatement("SELECT * FROM `logfile` where user_id='"+(int)session.getAttribute("index_id")+"' and role='"+(String)session.getAttribute("index_role")+"' ORDER BY logintime DESC");)
                                                                               {
                                                                           	    ResultSet resultset=preparedStatement.executeQuery();
                                                                                   int i = 1;
                                                                                   while(resultset.next())
                                                                                   {
                                       %>
                                     
                                        <tr>
                                           <td><%=i%></td>
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
                                        	i++;
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
                                <!--     <a href="download_log.html" class="btn btn-primary" role="button">Generate Report</a> -->
                                </div>
                            </div>
                        </div>
                    </div>

            </div>
        </div>
       </div>
        <div class="container-fluid">
            <div class="block-header">
                <h2>History</h2>
            </div>
            <div class="row clearfix dashboardBlocks">
                <!-- Latest Social Trends -->
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <div class="row">
                                <h2 class="col-md-4 col-lg-4 col-xs-12 pull-left">
                                    <div class="m-t-10">
                                        History
                                    </div>
                                </h2>
                            </div>
                        </div>                        
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-hover" id="myTableone">
                                <thead>
                                    <tr>
                                        <th>File No. </th>
                                        <th width="15%">Company Name</th>
                                        <th>Department</th>
                                        <th>Size</th>
                                        <th>Created Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                    
                              <%
                                              DecimalFormat df = new DecimalFormat("0.00");
                                              try(Connection  connect=IndexingDBConnection.openConnection();PreparedStatement preparedStatement=connect.prepareStatement("SELECT sum(size) as size,document_info.id as id , file_no, company_name, department, upload_date FROM customer_details, document_info WHERE document_info.company_id = customer_details.id and history_indexing='history_indexing' and history_indexing is not null and document_no is not null GROUP BY document_info.file_no");)
                                              {
                                                      ResultSet resultset=preparedStatement.executeQuery();
                                                       while(resultset.next())
                                                     {
                                                                                                  %>      
                                        <tr>
                                           <td><a href="historydocument.jsp?id=<%=resultset.getString("id")%>"><%=resultset.getString("file_no")%></a></td>
                                           <td><%=resultset.getString("company_name")%></td>
                                           <td><%=resultset.getString("department")%></td>
                                           <td><%=df.format(resultset.getDouble("size"))+" MB "%></td>
                                      <%
                                     	   final String OLD_FORMAT = "yyyy-MM-dd hh:mm:ss";
                             			   final String NEW_FORMAT = "dd MMM yyyy";
                             			   SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
                                           Date d = sdf.parse(resultset.getString("upload_date"));
                             			   sdf.applyPattern(NEW_FORMAT);
                             			   String newDateString = sdf.format(d);
                                     %>
                                           <td><%=newDateString%></td>
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
                                <div class="m-t-10" style="float:right;">
                                <!--     <a href="download_log.html" class="btn btn-primary" role="button">Generate Report</a> -->
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
              $('#myTable').DataTable( {
                  dom: 'Bfrtip',
                  buttons: [
                      'copy', 'csv', 'excel', 'pdf', 'print'
                  ],
                  "searching":false,
                  "lengthMenu":[25,50],
                  "pageLength":25
              } );
              $('#myTableone').DataTable( {
                  dom: 'Bfrtip',
                  buttons: [
                      'copy', 'csv', 'excel', 'pdf', 'print'
                  ],"searching":false,
                  "lengthMenu":[25,50],
                  "pageLength":25 
              } );
          } );
          
 
   </script>  
</body>

</html>
