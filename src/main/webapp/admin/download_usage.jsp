<%@include file="include/session.jsp"%>
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
                    Cloud Usage
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
                                            Cloud Usage Reports
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
                                <table class="table table-hover" id="example" style="width:100%">
                                    <thead>
                                        <tr>
                                            <th>Department</th>
                                            <th>File</th>
                                            <th>Upload</th>
                                            <th>Size</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>A</td>
                                            <td>00001</td>
                                            <td>100 GB</td>
                                            <td>100</td>
                                        </tr>
                                        <tr>
                                            <td>B</td>
                                            <td>00002</td>
                                            <td>200 GB</td>
                                            <td>200</td>
                                        </tr>
                                        <tr>
                                            <td>C</td>
                                            <td>00003</td>
                                            <td>300 GB</td>
                                            <td>300</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <br>
                            <div class="row">
                                    <div class="col-md-2"><strong>Department A Total :</strong></div>
                                    <div class="col-md-2">100 GB</div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2"><strong>Department B Total :</strong></div>
                                    <div class="col-md-2">200 GB</div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2"><strong>Department C Total :</strong></div>
                                    <div class="col-md-2">300 GB</div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2"><strong>Cloud Total :</strong></div>
                                    <div class="col-md-2">600 GB</div>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
        
    </section>
     
    <%@include file="include/script.jsp"%>
    <script src="js/pages/forms/basic-form-elements.js"></script>
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
