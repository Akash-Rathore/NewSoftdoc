<%@include file="include/session.jsp" %>
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
                <a class="image" href="index.jsp"><img src="../images/logo5.png" class="logoClient" alt="User" /></a>
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
        <%@ include file="include/sidebar.jsp"%>
        <!-- #END# Left Sidebar -->
        
    </section>

    <section class="content">
        <div class="container-fluid">
            <div class="block-header">
                <h2>
                    Create Clients
                </h2>
            </div>
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                Create Clients
                            </h2>
                            
                        </div>
                        <div class="body mrgnbtm">
                            <form class="form-horizontal">
                                            <div class="form-group">
                                                <label for="NameSurname" class="col-sm-2 control-label">Company Name</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="text" class="form-control" id="NameSurname" name="Name" placeholder="Company Name" value="" required="">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Email" class="col-sm-2 control-label">Billing Address</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="email" class="form-control" id="Email" name="Email" placeholder="Billing Address" value="" required="">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="NameSurname" class="col-sm-2 control-label">Company Contact</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="text" class="form-control" id="NameSurname" name="Name" placeholder="Company Contact" value="" required="">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Email" class="col-sm-2 control-label">Company PAN</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="email" class="form-control" id="Email" name="Email" placeholder="Company PAN" value="" required="">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Email" class="col-sm-2 control-label">Company GSTIN</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="email" class="form-control" id="Email" name="Email" placeholder="Company GSTIN" value="" required="">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row clearfix">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> 
                                                    <button type="button" class="btn btn-primary" style="float: right;">Modify</button>
                                                    <button type="button" class="btn btn-primary" style="float: right; margin-right: 3px;">Change Password</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                        

                    </div>
                </div>
            </div>
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header  margin0">
                            
                            <div class="row">
                                <div class="">
                                    <h2 class="col-md-4 col-lg-4 col-xs-12 pull-left">
                                        <div class="m-t-10">
                                            Picking Location
                                        </div>
                                    </h2>
                                    <div class="col-md-7 col-lg-7 col-xs-12 pull-right accessCutomerTable">
                                        <div class="col-md-2 m-t-10">
                                            <h2 class="">Filter</h2>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control">
                                                    <label class="form-label">Search</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-group form-float">
                                            <div class="">
                                                <select class="form-control show-tick">
                                                    <option value="">Type of Documents</option>
                                                    <option value="">Business</option>
                                                    <option value="">Personal</option>
                                                    <option value="">Confidential</option>
                                                </select>
                                            </div>
                                        </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>S.No.</th>
                                        <th width="15%">Address</th>
                                        <th>Pincode</th>
                                        <th>Location Contact</th>
                                        <th>Picking Frequency</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>Demo Name</td>
                                        <td>Demo Company</td>
                                        <td>21 Aug 2019</td>
                                        <td>Demo Title</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>Demo Name</td>
                                        <td>Demo Company</td>
                                        <td>21 Aug 2019</td>
                                        <td>Demo Title</td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>Demo Name</td>
                                        <td>Demo Company</td>
                                        <td>21 Aug 2019</td>
                                        <td>Demo Title</td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>Demo Name</td>
                                        <td>Demo Company</td>
                                        <td>21 Aug 2019</td>
                                        <td>Demo Title</td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td>Demo Name</td>
                                        <td>Demo Company</td>
                                        <td>21 Aug 2019</td>
                                        <td>Demo Title</td>
                                    </tr>
                                    <tr>
                                        <td>6</td>
                                        <td>Demo Name</td>
                                        <td>Demo Company</td>
                                        <td>21 Aug 2019</td>
                                        <td>Demo Title</td>
                                    </tr>
                                </tbody>

                            </table>
                            <div class="m-t-10" style="float:right;">
                                <button class="btn btn-primary">Add</button>
                                <button class="btn btn-primary">Modify</button>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

             <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header  margin0">
                            
                            <div class="row">
                                <div class="">
                                    <h2 class="col-md-4 col-lg-4 col-xs-12 pull-left">
                                        <div class="m-t-10">
                                            Active Departments
                                        </div>
                                    </h2>
                                    <div class="col-md-7 col-lg-7 col-xs-12 pull-right accessCutomerTable">
                                        <div class="col-md-2 m-t-10">
                                            <h2 class="">Filter</h2>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control">
                                                    <label class="form-label">Search</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-group form-float">
                                            <div class="">
                                                <select class="form-control show-tick">
                                                    <option value="">Type of Documents</option>
                                                    <option value="">Business</option>
                                                    <option value="">Personal</option>
                                                    <option value="">Confidential</option>
                                                </select>
                                            </div>
                                        </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>S.No.</th>
                                        <th>Departments</th>
                                        <th>Activation Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>Demo Name</td>
                                        <td>21 Aug 2019</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>Demo Name</td>
                                        <td>21 Aug 2019</td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>Demo Name</td>
                                        <td>21 Aug 2019</td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>Demo Name</td>
                                        <td>21 Aug 2019</td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td>Demo Name</td>
                                        <td>21 Aug 2019</td>
                                    </tr>
                                    <tr>
                                        <td>6</td>
                                        <td>Demo Name</td>
                                        <td>21 Aug 2019</td>
                                    </tr>
                                </tbody>

                            </table>
                            <div class="m-t-10" style="float:right;">
                                    <button class="btn btn-primary">Add</button>
                                    <button class="btn btn-primary">Modify</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    </section>

<%@include file="include/footer.jsp" %>
</body>

</html>
