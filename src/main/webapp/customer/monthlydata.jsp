<%@include file="include/session.jsp" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date" %>  
<%@ page import="java.math.RoundingMode"%>
<%@ page import="java.text.DecimalFormat"%>
<%@page import="com.customeradmin.connection.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet" %>
 

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>CUSTOMER ADMIN</title>
    <!-- Favicon-->
    <link rel="icon" href="../images/favicon.png" type="image/x-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">
    
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <!-- Bootstrap Core Css -->
    <link href="../plugins/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Waves Effect Css -->
    <link href="../plugins/node-waves/waves.css" rel="stylesheet" />

    <!-- Animation Css -->
    <link href="../plugins/animate-css/animate.css" rel="stylesheet" />

    <!-- Bootstrap Select Css -->
    <link href="../plugins/bootstrap-select/css/bootstrap-select.css" rel="stylesheet" />

    <!-- Custom Css -->
    <link href="../css/style.css" rel="stylesheet">

    <!-- AdminBSB Themes. You can choose a theme from css/themes instead of get all themes -->
    <link href="../css/themes/all-themes.css" rel="stylesheet" />
    
    <link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" rel="stylesheet"/>
    
    <style>
    
      .logoClient{
      
      width:55px !important;
      height:50px !important;
      
     }
    </style>
   
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
                <a class="image" href="index.jsp"><img src="../images/logo5.png" class="logoClient" alt="User" /></a>
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
                                    	<th>S.No.</th>
                                    	<th>File No.</th>
                                        <th>Department</th>
                                        <th>File Size</th>
                                        <th>Document Count</th>
                                        <th>Go-Live Date</th>
                                   </tr>
                                </thead>
                                <tbody>
                              <%
                              int did = Integer.parseInt(request.getParameter("id"));
                              DecimalFormat df = new DecimalFormat("0.00");
                              try(  Connection  connect=DBConnection.openConnection();
                					  PreparedStatement preparedStatement=connect.prepareStatement("SELECT  approved_date , COUNT(DISTINCT document_no)as document_count , file_no , department , sum(size) as size  FROM document_info WHERE billing_month = (SELECT billing_month FROM document_info WHERE id ='"+did+"') AND company_id = (SELECT company_id FROM document_info WHERE id ='"+did+"') AND document_info.STATUS='quality_approved' and document_no is not null GROUP BY file_no");
                                       )
                			  {
                            	     int i=1;
                                     ResultSet resultset=preparedStatement.executeQuery();
                                     while(resultset.next())
                                     {
                                    	
                               %>
                                    <tr>     
                                          <td><%=i%></td>                                   
                                          <td><%=resultset.getString("file_no")%></td>
                                          <td><%=resultset.getString("department")%></td>
                                          <td><%=df.format(resultset.getDouble("size")) +" MB "%></td>
                                          <td><%=resultset.getString("document_count")%></td>
                                           <%if(resultset.getString("approved_date")==null){%>
                                           
                                             <td></td>
                                           
                                           <%}else{%>
                                          <%
                                    	    final String OLD_FORMAT = "yyyy-MM-dd";
                            		  	    final String NEW_FORMAT = "dd MMM yyyy";
                            			    SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
                            			    Date d = sdf.parse(resultset.getString("approved_date"));
                            			    sdf.applyPattern(NEW_FORMAT);
                            		      %>
                                         <td><%=sdf.format(d)%></td>
                                            
                                            
                                           
                                           
                                           
                                           <%} %> 
                                         
                                    </tr>
                             <%	   
                                      i++;
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

   <%@include file="include/footer.jsp" %>
     
     <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
     <script src="https://cdn.datatables.net/buttons/1.6.0/js/dataTables.buttons.min.js"></script>
     <script src="https://cdn.datatables.net/buttons/1.6.0/js/buttons.flash.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
     <script src="https://cdn.datatables.net/buttons/1.6.0/js/buttons.html5.min.js"></script>
     <script src="https://cdn.datatables.net/buttons/1.6.0/js/buttons.print.min.js"></script>
    
     <script type="text/javascript">
     $(document).ready( function () {
   	  $('#myTable').DataTable( {
        
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
