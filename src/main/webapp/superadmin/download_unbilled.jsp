<%@include file="include/session.jsp"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>SUPER ADMIN</title>
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
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/buttons/1.6.0/css/buttons.bootstrap.min.css" rel="stylesheet" />
  

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
                <a class="navbar-brand" href="index.jsp">SUPER ADMIN</a>
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
          <%@include file="include/sidebar.jsp"%>
       <!-- #END# Left Sidebar -->
        
    </section>


    <section class="content">
        <div class="container-fluid">
            <div class="block-header">
                <h2>
                     UnBilled Report
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
                                             UnBilled Report 
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
                                                  <th>S.NO.</th>
                                            <th>Company Name</th>
                                            <th>Storage</th>
                                            <!-- <th>Month</th> -->
                                            <th>Total Document</th> 
                                            <th>Month</th>
                                            <th>Payment Status</th>
                                            
                                    </tr>
                                </thead>
                                <tbody>
                                  
                                                 
                              <%
                                                                                                                 	try{
                                                                                                                                                  	  Connection  connect=DBConnection.openConnection();
                                                                                                                                                       PreparedStatement preparedStatement=connect.prepareStatement("SELECT document_info.id as did , count(document_info.id) as total_doc, customer_details.id as id, sum(size) as size, billing_month, file_no, company_name, department, upload_date FROM customer_details, document_info WHERE document_info.company_id = customer_details.id  GROUP BY document_info.company_id, document_info.billing_month");
                                                                                                                                                       ResultSet resultset=preparedStatement.executeQuery();
                                                                                                                                                       int i=1;    
                                                                                                                                                       while(resultset.next())
                                                                                                                                                      {
                                                                                                                 %>
                                                  
                                         <tr>
                                         
                                               <th><%=i%></th>
                                               <td><%=resultset.getString("company_name")%></td>
                                               <td><%=resultset.getInt("size")+" MB "%></td>
                                               <td><%=resultset.getInt("total_doc")%></td>
                                               <td><%=resultset.getString("billing_month")%></td>  
                                               <td><span class="label bg-green">Unpaid</span></td>
                                              
                                               
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
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
        
    </section>

    <!-- Jquery Core Js -->
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>

    <!-- Bootstrap Core Js -->
    <script src="../plugins/bootstrap/js/bootstrap.js"></script>

    <!-- Select Plugin Js -->
    <script src="../plugins/bootstrap-select/js/bootstrap-select.js"></script>

    <!-- Slimscroll Plugin Js -->
    <script src="../plugins/jquery-slimscroll/jquery.slimscroll.js"></script>

    <!-- Waves Effect Plugin Js -->
    <script src="../plugins/node-waves/waves.js"></script>


    <!-- Custom Js -->
    <script src="../js/admin.js"></script>

    <!-- Demo Js -->
    <script src="../js/demo.js"></script>
    
    <script src="../js/pages/forms/basic-form-elements.js"></script>
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
                "lengthMenu":[25,30],
                "pageLength":25
            } );
        } );
        
    </script>
</body>

</html>
