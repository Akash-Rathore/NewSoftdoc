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
                <a class="navbar-brand" href="index.jsp">SOFTDOC SUBADMIN INDEXING</a>
            </div>
            <div class="collapse navbar-collapse" id="navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    
                    <!-- Notifications -->
                    <li class="dropdown">
                        <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button">
                            <i class="material-icons">notifications</i>
                            <span class="label-count">7</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="header">NOTIFICATIONS</li>
                            <li class="body">
                                <ul class="menu">
                                    <li>
                                        <a href="javascript:void(0);">
                                            <div class="icon-circle bg-light-green">
                                                <i class="material-icons">person_add</i>
                                            </div>
                                            <div class="menu-info">
                                                <h4>12 new members joined</h4>
                                                <p>
                                                    <i class="material-icons">access_time</i> 14 mins ago
                                                </p>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);">
                                            <div class="icon-circle bg-cyan">
                                                <i class="material-icons">add_shopping_cart</i>
                                            </div>
                                            <div class="menu-info">
                                                <h4>4 sales made</h4>
                                                <p>
                                                    <i class="material-icons">access_time</i> 22 mins ago
                                                </p>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);">
                                            <div class="icon-circle bg-red">
                                                <i class="material-icons">delete_forever</i>
                                            </div>
                                            <div class="menu-info">
                                                <h4><b>Nancy Doe</b> deleted account</h4>
                                                <p>
                                                    <i class="material-icons">access_time</i> 3 hours ago
                                                </p>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);">
                                            <div class="icon-circle bg-orange">
                                                <i class="material-icons">mode_edit</i>
                                            </div>
                                            <div class="menu-info">
                                                <h4><b>Nancy</b> changed name</h4>
                                                <p>
                                                    <i class="material-icons">access_time</i> 2 hours ago
                                                </p>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);">
                                            <div class="icon-circle bg-blue-grey">
                                                <i class="material-icons">comment</i>
                                            </div>
                                            <div class="menu-info">
                                                <h4><b>John</b> commented your post</h4>
                                                <p>
                                                    <i class="material-icons">access_time</i> 4 hours ago
                                                </p>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);">
                                            <div class="icon-circle bg-light-green">
                                                <i class="material-icons">cached</i>
                                            </div>
                                            <div class="menu-info">
                                                <h4><b>John</b> updated status</h4>
                                                <p>
                                                    <i class="material-icons">access_time</i> 3 hours ago
                                                </p>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);">
                                            <div class="icon-circle bg-purple">
                                                <i class="material-icons">settings</i>
                                            </div>
                                            <div class="menu-info">
                                                <h4>Settings updated</h4>
                                                <p>
                                                    <i class="material-icons">access_time</i> Yesterday
                                                </p>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="footer">
                                <a href="javascript:void(0);">View All Notifications</a>
                            </li>
                        </ul>
                    </li>
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
                <h2>Raise Complaints</h2>
            </div>
            <div class="row clearfix">
                <div class="col-xs-12 col-sm-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                Raise Your Concern
                            </h2>
                            
                        </div>
                        <div class="body mrgnbtm">
                            <form action="" method="">
                                <div class="row clearfix">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group form-float">
                                            <div class="">
                                                <select class="form-control show-tick">
                                                    <option value="">Choose Department</option>
                                                    <option value="">Admin</option>
                                                    <option value="">Development</option>
                                                    <option value="">Testing</option>
                                                    <option value="">Operations</option>
                                                    <option value="">Human Resource</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group form-float">
                                            <div class="">
                                                <select class="form-control show-tick">
                                                    <option value="">Choose Critical</option>
                                                    <option value="">Minor</option>
                                                    <option value="">Low</option>
                                                    <option value="">Medium</option>
                                                    <option value="">High</option>
                                                    <option value="">Critical</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row clearfix">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group form-float">
                                            <select class="form-control show-tick">
                                                    <option value="">Area of Issue</option>
                                                    <option value="">Login/Upload</option>
                                                    <option value="">Machnical</option>
                                                    <option value="">Civil</option>
                                                    <option value="">Demo 1</option>
                                                    <option value="">Demo 2</option>
                                                </select>
                                        </div>
                                    </div>
                                    
                                </div>
                                <div class="row clearfix">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <textarea rows="4" class="form-control no-resize" placeholder=""></textarea>
                                                <label class="form-label">Description</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                
                                <div class="row clearfix">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <button type="button" class="btn btn-primary">Submit</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        

                    </div>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header  margin0">
                            
                            <div class="row">
                                <div class="">
                                    <h2 class="col-md-4 col-lg-4 col-xs-12 pull-left">
                                        <div class="m-t-10">
                                            Complaint List
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

                                <table class="table table-bordered table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <th>S.No.</th>
                                            <th>Raised by</th>
                                            <th>Raised on</th>
                                            <th>Start date</th>
                                            <th>Category</th>
                                            <th>Particulars</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                        <tr>
                                            <td>Tiger Nixon</td>
                                            <td>System Architect</td>
                                            <td>Edinburgh</td>
                                            
                                            <td>2011/04/25</td>
                                            <td>Demo Category</td>
                                            <td>Demo Part</td>
                                            <td class="text-center">
                                            <div class="">
                                                <div class="text-left">
                                                    <input name="group1" type="radio" id="radio_1" checked="">
                                                    <label for="radio_1">Open</label>
                                                </div>
                                                <div class="text-left">
                                                    <input name="group1" type="radio" id="radio_2">
                                                    <label for="radio_2">In Process</label>
                                                </div>
                                                <div class="text-left">
                                                    <input name="group1" type="radio" class="with-gap" id="radio_3">
                                                    <label for="radio_3">Resolved</label>
                                                </div>
                                            </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Garrett Winters</td>
                                            <td>Accountant</td>
                                            <td>Tokyo</td>
                                            
                                            <td>2011/07/25</td>
                                            <td>Demo Category</td>
                                            <td>Demo Part</td>
                                            <td class="text-center">
                                            <div class="">
                                                <div class="text-left">
                                                    <input name="group1" type="radio" id="radio_1" checked="">
                                                    <label for="radio_1">Open</label>
                                                </div>
                                                <div class="text-left">
                                                    <input name="group1" type="radio" id="radio_2">
                                                    <label for="radio_2">In Process</label>
                                                </div>
                                                <div class="text-left">
                                                    <input name="group1" type="radio" class="with-gap" id="radio_3">
                                                    <label for="radio_3">Resolved</label>
                                                </div>
                                            </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Ashton Cox</td>
                                            <td>Junior Technical Author</td>
                                            <td>San Francisco</td>
                                            
                                            <td>2009/01/12</td>
                                            <td>Demo Category</td>
                                            <td>Demo Part</td>
                                            <td class="text-center">
                                            <div class="">
                                                <div class="text-left">
                                                    <input name="group1" type="radio" id="radio_1" checked="">
                                                    <label for="radio_1">Open</label>
                                                </div>
                                                <div class="text-left">
                                                    <input name="group1" type="radio" id="radio_2">
                                                    <label for="radio_2">In Process</label>
                                                </div>
                                                <div class="text-left">
                                                    <input name="group1" type="radio" class="with-gap" id="radio_3">
                                                    <label for="radio_3">Resolved</label>
                                                </div>
                                            </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Cedric Kelly</td>
                                            <td>Senior Javascript Developer</td>
                                            <td>Edinburgh</td>
                                            
                                            <td>2012/03/29</td>
                                            <td>Demo Category</td>
                                            <td>Demo Part</td>
                                            <td class="text-center">
                                            <div class="">
                                                <div class="text-left">
                                                    <input name="group1" type="radio" id="radio_1" checked="">
                                                    <label for="radio_1">Open</label>
                                                </div>
                                                <div class="text-left">
                                                    <input name="group1" type="radio" id="radio_2">
                                                    <label for="radio_2">In Process</label>
                                                </div>
                                                <div class="text-left">
                                                    <input name="group1" type="radio" class="with-gap" id="radio_3">
                                                    <label for="radio_3">Resolved</label>
                                                </div>
                                            </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Airi Satou</td>
                                            <td>Accountant</td>
                                            <td>Tokyo</td>
                                            
                                            <td>2008/11/28</td>
                                            <td>Demo Category</td>
                                            <td>Demo Part</td>
                                            <td class="text-center">
                                            <div class="">
                                                <div class="text-left">
                                                    <input name="group1" type="radio" id="radio_1" checked="">
                                                    <label for="radio_1">Open</label>
                                                </div>
                                                <div class="text-left">
                                                    <input name="group1" type="radio" id="radio_2">
                                                    <label for="radio_2">In Process</label>
                                                </div>
                                                <div class="text-left">
                                                    <input name="group1" type="radio" class="with-gap" id="radio_3">
                                                    <label for="radio_3">Resolved</label>
                                                </div>
                                            </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Brielle Williamson</td>
                                            <td>Integration Specialist</td>
                                            <td>New York</td>
                                            
                                            <td>2012/12/02</td>
                                            <td>Demo Category</td>
                                            <td>Demo Part</td>
                                            <td class="text-center">
                                            <div class="">
                                                <div class="text-left">
                                                    <input name="group1" type="radio" id="radio_1" checked="">
                                                    <label for="radio_1">Open</label>
                                                </div>
                                                <div class="text-left">
                                                    <input name="group1" type="radio" id="radio_2">
                                                    <label for="radio_2">In Process</label>
                                                </div>
                                                <div class="text-left">
                                                    <input name="group1" type="radio" class="with-gap" id="radio_3">
                                                    <label for="radio_3">Resolved</label>
                                                </div>
                                            </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Herrod Chandler</td>
                                            <td>Sales Assistant</td>
                                            <td>San Francisco</td>
                                            
                                            <td>2012/08/06</td>
                                            <td>Demo Category</td>
                                            <td>Demo Part</td>
                                            <td class="text-center">
                                            <div class="">
                                                <div class="text-left">
                                                    <input name="group1" type="radio" id="radio_1" checked="">
                                                    <label for="radio_1">Open</label>
                                                </div>
                                                <div class="text-left">
                                                    <input name="group1" type="radio" id="radio_2">
                                                    <label for="radio_2">In Process</label>
                                                </div>
                                                <div class="text-left">
                                                    <input name="group1" type="radio" class="with-gap" id="radio_3">
                                                    <label for="radio_3">Resolved</label>
                                                </div>
                                            </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Rhona Davidson</td>
                                            <td>Integration Specialist</td>
                                            <td>Tokyo</td>
                                            
                                            <td>2010/10/14</td>
                                            <td>Demo Category</td>
                                            <td>Demo Part</td>
                                            <td class="text-center">
                                            <div class="">
                                                <div class="text-left">
                                                    <input name="group1" type="radio" id="radio_1" checked="">
                                                    <label for="radio_1">Open</label>
                                                </div>
                                                <div class="text-left">
                                                    <input name="group1" type="radio" id="radio_2">
                                                    <label for="radio_2">In Process</label>
                                                </div>
                                                <div class="text-left">
                                                    <input name="group1" type="radio" class="with-gap" id="radio_3">
                                                    <label for="radio_3">Resolved</label>
                                                </div>
                                            </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Colleen Hurst</td>
                                            <td>Javascript Developer</td>
                                            <td>San Francisco</td>
                                            
                                            <td>2009/09/15</td>
                                            <td>Demo Category</td>
                                            <td>Demo Part</td>
                                            <td class="text-center">
                                            <div class="">
                                                <div class="text-left">
                                                    <input name="group1" type="radio" id="radio_1" checked="">
                                                    <label for="radio_1">Open</label>
                                                </div>
                                                <div class="text-left">
                                                    <input name="group1" type="radio" id="radio_2">
                                                    <label for="radio_2">In Process</label>
                                                </div>
                                                <div class="text-left">
                                                    <input name="group1" type="radio" class="with-gap" id="radio_3">
                                                    <label for="radio_3">Resolved</label>
                                                </div>
                                            </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Sonya Frost</td>
                                            <td>Software Engineer</td>
                                            <td>Edinburgh</td>
                                            
                                            <td>2008/12/13</td>
                                            <td>Demo Category</td>
                                            <td>Demo Part</td>
                                            <td class="text-center">
                                            <div class="">
                                                <div class="text-left">
                                                    <input name="group1" type="radio" id="radio_1" checked="">
                                                    <label for="radio_1">Open</label>
                                                </div>
                                                <div class="text-left">
                                                    <input name="group1" type="radio" id="radio_2">
                                                    <label for="radio_2">In Process</label>
                                                </div>
                                                <div class="text-left">
                                                    <input name="group1" type="radio" class="with-gap" id="radio_3">
                                                    <label for="radio_3">Resolved</label>
                                                </div>
                                            </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Jena Gaines</td>
                                            <td>Office Manager</td>
                                            <td>London</td>
                                            
                                            <td>2008/12/19</td>
                                            <td>Demo Category</td>
                                            <td>Demo Part</td>
                                            <td class="text-center">
                                            <div class="">
                                                <div class="text-left">
                                                    <input name="group1" type="radio" id="radio_1" checked="">
                                                    <label for="radio_1">Open</label>
                                                </div>
                                                <div class="text-left">
                                                    <input name="group1" type="radio" id="radio_2">
                                                    <label for="radio_2">In Process</label>
                                                </div>
                                                <div class="text-left">
                                                    <input name="group1" type="radio" class="with-gap" id="radio_3">
                                                    <label for="radio_3">Resolved</label>
                                                </div>
                                            </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Quinn Flynn</td>
                                            <td>Support Lead</td>
                                            <td>Edinburgh</td>
                                            
                                            <td>2013/03/03</td>
                                            <td>Demo Category</td>
                                            <td>Demo Part</td>
                                            <td class="text-center">
                                            <div class="">
                                                <div class="text-left">
                                                    <input name="group1" type="radio" id="radio_1" checked="">
                                                    <label for="radio_1">Open</label>
                                                </div>
                                                <div class="text-left">
                                                    <input name="group1" type="radio" id="radio_2">
                                                    <label for="radio_2">In Process</label>
                                                </div>
                                                <div class="text-left">
                                                    <input name="group1" type="radio" class="with-gap" id="radio_3">
                                                    <label for="radio_3">Resolved</label>
                                                </div>
                                            </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Charde Marshall</td>
                                            <td>Regional Director</td>
                                            <td>San Francisco</td>
                                            
                                            <td>2008/10/16</td>
                                            <td>Demo Category</td>
                                            <td>Demo Part</td>
                                            <td class="text-center">
                                            <div class="">
                                                <div class="text-left">
                                                    <input name="group1" type="radio" id="radio_1" checked="">
                                                    <label for="radio_1">Open</label>
                                                </div>
                                                <div class="text-left">
                                                    <input name="group1" type="radio" id="radio_2">
                                                    <label for="radio_2">In Process</label>
                                                </div>
                                                <div class="text-left">
                                                    <input name="group1" type="radio" class="with-gap" id="radio_3">
                                                    <label for="radio_3">Resolved</label>
                                                </div>
                                            </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Haley Kennedy</td>
                                            <td>Senior Marketing Designer</td>
                                            <td>London</td>
                                            
                                            <td>2012/12/18</td>
                                            <td>Demo Category</td>
                                            <td>Demo Part</td>
                                            <td class="text-center">
                                            <div class="">
                                                <div class="text-left">
                                                    <input name="group1" type="radio" id="radio_1" checked="">
                                                    <label for="radio_1">Open</label>
                                                </div>
                                                <div class="text-left">
                                                    <input name="group1" type="radio" id="radio_2">
                                                    <label for="radio_2">In Process</label>
                                                </div>
                                                <div class="text-left">
                                                    <input name="group1" type="radio" class="with-gap" id="radio_3">
                                                    <label for="radio_3">Resolved</label>
                                                </div>
                                            </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Tatyana Fitzpatrick</td>
                                            <td>Regional Director</td>
                                            <td>London</td>
                                            
                                            <td>2010/03/17</td>
                                            <td>Demo Category</td>
                                            <td>Demo Part</td>
                                            <td class="text-center">
                                            <div class="">
                                                <div class="text-left">
                                                    <input name="group1" type="radio" id="radio_1" checked="">
                                                    <label for="radio_1">Open</label>
                                                </div>
                                                <div class="text-left">
                                                    <input name="group1" type="radio" id="radio_2">
                                                    <label for="radio_2">In Process</label>
                                                </div>
                                                <div class="text-left">
                                                    <input name="group1" type="radio" class="with-gap" id="radio_3">
                                                    <label for="radio_3">Resolved</label>
                                                </div>
                                            </div>
                                            </td>
                                        </tr>
                                        
                                        
                                    </tbody>
                                </table>

                                <div class="m-t-10" style="float:right;">
                                    <button class="btn btn-primary">Add</button>
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
