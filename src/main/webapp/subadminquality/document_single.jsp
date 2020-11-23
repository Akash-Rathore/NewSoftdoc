<%@include file="include/session.jsp" %>
<!DOCTYPE html>
<html>
   <head>
        <%@include file="include/head.jsp"%>     
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
                <h2>
                    Documents Status
                </h2>
            </div>
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                Documents
                            </h2>
                        </div>
                        <div class="body">
                            
                            <div class="table-responsive">
                                <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Document No. </th>
                                        <th>Document Type</th>
                                        <th>Quality Report</th>
                                        <th>Reason</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>000001</td>
                                        <td>HR</td>
                                        <td><a href="indexing_form.html">Open Report</a></td>
                                        <td>Page Shortage</td>
                                    </tr>
                                    <tr>
                                        <td>000002</td>
                                        <td>Sales</td>
                                        <td><a href="indexing_form.html">Open Report</a></td>
                                        <td>Incorrect file</td>
                                    </tr>
                                    <tr>
                                        <td>000003</td>
                                        <td>201301</td>
                                        <td><a href="indexing_form.html">Open Report</a></td>
                                        <td>Page Shortage</td>
                                    </tr>
                                    <tr>
                                        <td>000004</td>
                                        <td>201301</td>
                                        <td><a href="indexing_form.html">Open Report</a></td>
                                        <td>Page Shortage</td>
                                    </tr>
                                </tbody>
                                </table>
                            </div>    
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
      <%@include file="include/script.jsp"%>
    </body>
</html>
