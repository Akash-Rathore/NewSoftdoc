<%@include file="include/session.jsp"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.Statement"%>
<%@ page import= "java.util.Calendar" %>
<%@ page import= "java.text.SimpleDateFormat" %>
<%@ page import="java.math.RoundingMode"%>
<%@ page import="java.text.DecimalFormat"%>
   
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>SOFTDOC ADMIN</title>
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
                <a class="navbar-brand" href="index.jsp">SOFTDOC ADMIN</a>
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
           <%@include file="include/leftsidebar.jsp" %>
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
                                        <th>File Size</th>
                                        <th>Document Count</th>
                                        <th>GO-Live Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                 <%
                                                 Date date = new Date();
                                                 SimpleDateFormat simpleDateFormatM = new SimpleDateFormat("EEEE");
                                                 simpleDateFormatM = new SimpleDateFormat("MMMM");
                                                 SimpleDateFormat simpleDateFormatY = new SimpleDateFormat("EEEE");
                                                 simpleDateFormatY = new SimpleDateFormat("YYYY");
                                                 String currentdate=simpleDateFormatM.format(date).toUpperCase()+" , "+simpleDateFormatY.format(date).toUpperCase();
                                                 int did = Integer.parseInt(request.getParameter("id"));
                                                 String count="";
                                                 try(Connection  connect=StoreDBConnection.openConnection();PreparedStatement preparedStatement=connect.prepareStatement("SELECT file_no ,approved_date, department , SUM(ROUND(size,2))AS size , status FROM document_info WHERE billing_month =(select billing_month from document_info where id='"+request.getParameter("id")+"') and company_id=(select company_id from document_info where id='"+request.getParameter("id")+"') and status='quality_approved' GROUP BY file_no");
                                                     )
                                                  {
                                                          ResultSet resultset=preparedStatement.executeQuery();
                                                          while(resultset.next())
                                                          {
                                                         
                                                        try(Connection  connect2=StoreDBConnection.openConnection();Statement stat=connect.createStatement();)
                               {
                                                       ResultSet result=stat.executeQuery("SELECT COUNT(DISTINCT document_no)as count,sum(size) as size FROM document_info WHERE file_no='"+resultset.getString("file_no")+"' and status='quality_approved'");
					                                     if(result.next())
					                                     {
					                                     count=result.getString("count");
					                                     }
                               }
                                    %>
                                 
                               
                                    <tr>                                        
                                          <td><%=resultset.getString("file_no")%></td>
                                          <td><%=resultset.getString("department")%></td>
                                          <td><%=resultset.getString("size") +" "+"MB"%></td>
                                          <td><%=count%></td>
                                          <%
                                          
                                          final String OLD_FORMAT = "yyyy-MM-dd";
                           			      final String NEW_FORMAT = "dd MMM yyyy";
                           			      SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
                                          Date d = sdf.parse(resultset.getString("approved_date"));
                           			      sdf.applyPattern(NEW_FORMAT);
                           			      String approved_date = sdf.format(d);
                                          %>
                                          <td><%=approved_date%></td>
                                         
                                         
                                           
                                       
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