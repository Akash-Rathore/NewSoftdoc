<%@include file="include/session.jsp"%>
<!DOCTYPE html>
<html>

<head>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>SUPER ADMIN|SOFTDOC</title>
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
                    Location
                </h2>
            </div>
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                Add Location
                            </h2>
                            
                        </div>
                        <div class="body mrgnbtm">
                            <form class="form-horizontal">
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Address Line1</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="text" class="form-control" id="NameSurname" name="Name" placeholder="Address Line1" value="" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Address Line2</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="email" class="form-control" id="Email" name="Email" placeholder="Address Line2" value="" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">City</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="email" class="form-control" id="Email" name="Email" placeholder="City" value="" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">District</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="email" class="form-control" id="Email" name="Email" placeholder="District" value="" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">State</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="email" class="form-control" id="Email" name="Email" placeholder="State" value="" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Pincode</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="email" class="form-control" id="Email" name="Email" placeholder="Pincode" value="" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Pickup Frequency</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <select class="form-control show-tick">
                                                <option value="">Select</option>
                                                <option value="">Weekly</option>
                                                <option value="">Fortnightly</option>
                                                <option value="">Monthly</option>
                                                <option value="">Quaterly</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Start Date</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="date" class="form-control" id="Email" name="Email" placeholder="Start Date" value="" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Contact Person Name</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="text" class="form-control" id="Email" name="Email" placeholder="Contact Person Name" value="" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Contact Person Mobile</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="number" class="form-control" id="Email" name="Email" placeholder="Contact Person Mobile" value="" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Contact Person Email</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="email" class="form-control" id="Email" name="Email" placeholder="Contact Person Email" value="" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Contact Person Designation</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="text" class="form-control" id="Email" name="Email" placeholder="Contact Person Designation" value="" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="row clearfix">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> 
                                        <button type="button" class="btn btn-primary" style="float: right;">Modify</button>
                                        <button type="button" class="btn btn-primary" style="float: right; margin-right: 3px;">Submit</button>
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
                                            Location Information & Pickup
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
                                        <th>Pickup Frequency</th>
                                        <th>Contact Details</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>Noida</td>
                                        <td>201301</td>
                                        <td>Gr</td>
                                        <td>9897969594</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>Noida</td>
                                        <td>201301</td>
                                        <td>Gr</td>
                                        <td>9897969594</td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>Noida</td>
                                        <td>201301</td>
                                        <td>Gr</td>
                                        <td>9897969594</td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>Noida</td>
                                        <td>201301</td>
                                        <td>Gr</td>
                                        <td>9897969594</td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td>Noida</td>
                                        <td>201301</td>
                                        <td>Gr</td>
                                        <td>9897969594</td>
                                    </tr>
                                    <tr>
                                        <td>6</td>
                                        <td>Noida</td>
                                        <td>201301</td>
                                        <td>Gr</td>
                                        <td>9897969594</td>
                                    </tr>
                                </tbody>

                            </table>
                            <div class="body mrgnbtm">
                            <form class="form-horizontal">
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Billing Address</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="text" class="form-control" id="NameSurname" name="Name" placeholder="Billing Address" value="" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">PAN</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="text" class="form-control" id="Email" name="Email" placeholder="PAN" value="" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">GSTIN</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="text" class="form-control" id="Email" name="Email" placeholder="GSTIN" value="" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">TAN</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="text" class="form-control" id="Email" name="Email" placeholder="TAN" value="" required="">
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                            <div class="m-t-10" style="float:right;">
                                    <button class="btn btn-primary">Add</button>
                                    <button class="btn btn-primary">Reports</button>
                                </div>
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
