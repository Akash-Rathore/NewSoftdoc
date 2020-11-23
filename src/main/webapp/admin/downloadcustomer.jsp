<%@include file="include/session.jsp"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>SOFTDOC ADMIN|SOFTDOC</title>
    <!-- Favicon-->
    <link rel="icon" href="../images/favicon.png" type="image/x-icon">
     <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">
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
    
    <link href="../css/dataTables.bootstrap.min.css" rel="stylesheet" />
 
     
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
          <%@include file="include/leftsidebar.jsp"%>
       <!-- #END# Left Sidebar -->
    </section>
    <section class="content">
        <div class="container-fluid">
            <div class="block-header">
                <h2>
                  Download Users
                </h2>
            </div>
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header  margin0">
                            
                            <div class="row">
                                <div class="">
                                    <h2 class="col-md-4 col-lg-4 col-xs-12 pull-left">
                                        <div class="m-t-10">
                                             Download Users 
                                        </div>
                                    </h2>
                                
                                </div>
                            </div>
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-hover" id="example" >
                                <thead>
                                    <tr>
                                         <th>Customer Code</th>
                                        <th>Company Name</th>
                                        <th>Type</th>
                                        <th>Industry</th>
                                        <th>PAN</th>
                                        <th>TAN</th>
                                        <th>GSTIN</th>
                                        <th>Billing Address</th>
                                        <th>Scanning Quality (DPI)</th>
                                        <th>Scanning Quality (Colour/B&W)</th>
                                        <th>Active Department</th>
                                        <th>Created On</th>
                                        <th>Modified On</th>
                                        <th>Delete On</th>
                                        <th>Status(Active/Deleted)</th>
                                    </tr>
                                </thead>
                                <tbody>
                         <%
                                         
                                         try(Connection connection=StoreDBConnection.openConnection();PreparedStatement  preparedStatement=connection.prepareStatement("SELECT customer_number,company_name,type,industry,pan_text,tan,gstin,billing_address_first,dpi,colour,depart_info,DATE_FORMAT(DATE,'%d %b %Y') AS DATE,DATE_FORMAT(modify,'%d %b %Y') AS modify, DATE_FORMAT(leaving_date,'%d %b %Y') AS leaving_date,flag FROM `customer_details` as c  ORDER BY id DESC");)
                                         {
                                          
                                          ResultSet resultset=preparedStatement.executeQuery();
                                          while(resultset.next())
                                          {
                         %>
                                 <tr>
                                        <td><%=resultset.getString("customer_number")%></td>
                                        <td><%=resultset.getString("company_name")%></td>
                                        <td><%=resultset.getString("type")%></td>
                                        <td><%=resultset.getString("industry")%></td>
                                        <td><%=resultset.getString("pan_text")%></td>
                                        <td><%=resultset.getString("tan")%></td>
                                        <td><%=resultset.getString("gstin")%></td>
                                        <td><%=resultset.getString("billing_address_first")%></td>
                                       
                                        <%if(resultset.getInt("dpi") !=0){%>
                                          <td><%=resultset.getString("dpi")%></td>
                                        <%}else{%>
                                          <td></td>
                                        <%} %>
                                       
                                        <%if(resultset.getString("colour") !=null){%>
                                            <td><%=resultset.getString("colour")%></td>
                                        <%}else{%>
                                            <td></td>
                                        <%} %>
                                   
                                        <td><%=resultset.getString("depart_info")%></td>
                                        <td><%=resultset.getString("date")%></td>
                                        <td><%=resultset.getString("modify")%></td>
                                        <%if(resultset.getInt("flag")==0){ %>
                                           <td><%="N/A"%></td>
                                           <td><%="Active"%></td>
                                         <% }else{%>
                                            <td><%=resultset.getString("leaving_date")%></td>
                                            <td><%="Deleted"%></td>
                                        <%} %>  
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
                            
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
        
    </section>

    <%@include file="include/script.jsp" %>
    <script src="../js/jquery.dataTables.min.js"></script>
    <script src="../js/dataTables.buttons.min.js"></script>
    <script src="../js/buttons.flash.min.js"></script>
    <script src="../js/pdfmake.min.js"></script>
    <script src="../js/vfs_fonts.js"></script>
    <script src="../js/buttons.html5.min.js"></script>
    <script src="../js/buttons.print.min.js"></script>
    <script src="../js/jszip.min.js"></script>
    
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
        
    </script>
</body>

</html>
