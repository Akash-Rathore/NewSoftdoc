<%@include file="include/session.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <%@include file="include/head.jsp"%>
    <!--Data Table  -->
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
                <a class="navbar-brand" href="index.jsp">SOFTDOC SUBADMIN STORE</a>
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
                <h2>
                    Log Report
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
                                            Log Reports
                                        </div>
                                    </h2>
                                    <div class="col-md-8 col-lg-8 col-xs-12 pull-right accessCutomerTable">
                                        <div class="col-md-1">
                                            <h2 class="">From</h2>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="date" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-1">
                                            <h2 class="">To</h2>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-group form-float">
                                            <div class="form-line">
                                                <input type="date" class="form-control">
                                            </div>
                                        </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-hover" id="example" >
                                <thead>
                                    <tr>
                                        <th>S.No.</th>
                                        <th width="15%">Date</th>
                                        <th>Employee Code</th>
                                        <th>Name</th>
                                        <th>Login Time</th>
                                        <th>Logout Time</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>24/10/2019</td>
                                        <td>EMP123456</td>
                                        <td>Aman</td>
                                        <td>21/10/2019 14:10:45</td>
                                        <td>21/10/2019 17:54:49</td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>24/10/2019</td>
                                        <td>EMP123456</td>
                                        <td>Aman</td>
                                        <td>21/10/2019 14:10:45</td>
                                        <td>21/10/2019 17:54:49</td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>24/10/2019</td>
                                        <td>EMP123456</td>
                                        <td>Aman</td>
                                        <td>21/10/2019 14:10:45</td>
                                        <td>21/10/2019 17:54:49</td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>24/10/2019</td>
                                        <td>EMP123456</td>
                                        <td>Aman</td>
                                        <td>21/10/2019 14:10:45</td>
                                        <td>21/10/2019 17:54:49</td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>24/10/2019</td>
                                        <td>EMP123456</td>
                                        <td>Aman</td>
                                        <td>21/10/2019 14:10:45</td>
                                        <td>21/10/2019 17:54:49</td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>24/10/2019</td>
                                        <td>EMP123456</td>
                                        <td>Aman</td>
                                        <td>21/10/2019 14:10:45</td>
                                        <td>21/10/2019 17:54:49</td>
                                    </tr>
                                    
                                </tbody>
                            </table>
                            <!--<div class="m-t-10" style="float:right;">
                                <button class="btn btn-primary">Download</button>
                            </div>-->
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
            $('#example').DataTable( {
                dom: 'Bfrtip',
                buttons: [
                    'copy', 'csv', 'excel', 'pdf', 'print'
                ]
            } );
        } );
        
    </script>
</body>

</html>
