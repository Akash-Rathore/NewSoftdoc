<%@page import="java.sql.PreparedStatement"%>
<%@include file="include/session.jsp"%>
<%@ page import="com.softdocadmin.connection.StoreDBConnection"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="include/head.jsp" %>    
    
<style>

  h5{
      margin-bottom:25px;
      text-decoration:underline;
  }    

    .container {
  display: block;
  position: relative;
  padding-left: 35px;
  margin-bottom: 12px;
  cursor: pointer;
  font-size: 16px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* Hide the browser's default checkbox */
.container input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  height: 0;
  width: 0;
}

/* Create a custom checkbox */
.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 25px;
  width: 25px;
  background-color: #eee;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
  background-color: #ccc;
}

/* When the checkbox is checked, add a blue background */
.container input:checked ~ .checkmark {
  background-color: #2196F3;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the checkmark when checked */
.container input:checked ~ .checkmark:after {
  display: block;
}

/* Style the checkmark/indicator */
.container .checkmark:after {
  left: 9px;
  top: 5px;
  width: 5px;
  height: 10px;
  border: solid white;
  border-width: 0 3px 3px 0;
  -webkit-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  transform: rotate(45deg);
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
                <!-- <h2>
                    Customer Centre
                </h2> -->
            </div>
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                             <h2>
                                  Edit Customers
                            </h2>
                            
                        </div>
                        <div class="body mrgnbtm">
                          
                          <%!String sql=null;
                            Connection connection=null;
                            ResultSet resultset=null;
                            PreparedStatement  preparedStatement=null;%>
                         <%
                         	connection=StoreDBConnection.openConnection();
                         %>
                       
                        
                            <form class="form-horizontal" action="../Process?action=customer" method="post" enctype="multipart/form-data">
                                <div class="row"><center><strong><h5>Edit Information</h5></strong></center></div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-3 control-label">Customer Number</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text" class="form-control" id="NameSurname" name="customernum" placeholder="Customer Number" value="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Company Name</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text" class="form-control" id="Email" name="companyname" placeholder="Company Name" value="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-3 control-label">Billing Address Line 1</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text" class="form-control" id="NameSurname" name="billingaddressone" placeholder="Billing Address Line 1" value="" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Billing Address Line 2</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text" class="form-control" id="Email" name="billingaddresstwo" placeholder="Billing Address Line 2" value="" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-3 control-label">Billing Address City</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text" class="form-control" id="NameSurname" name="billingcity" placeholder="Billing Address City" value="" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Billing Address State</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text" class="form-control" id="Email" name="billingstate" placeholder="Billing Address State" value="" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Billing Address PinCode</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="number" class="form-control" id="Email" name="billingpincode" placeholder="Billing Address PinCode" value="" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Company PAN</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text" class="form-control" id="Email" name="compan" placeholder="Company PAN" value="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">GSTIN</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text" class="form-control" id="Email" name="gstin" placeholder="GSTIN" value="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">TAN</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text" class="form-control" id="Email" name="tan" placeholder="TAN" value="" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-3 control-label">Type</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <select class="form-control show-tick" name="type">
                                                <option value="">Select</option>
                                                <option value="Individual/HUF">Individual/HUF</option>
                                                <option value="Partnership">Partnership</option>
                                                <option value="LLP">LLP</option>
                                                <option value="Private Limited">Private Limited</option>
                                                <option value="Public Unlisted Company">Public Unlisted Company</option>
                                                <option value="Public Listed Company">Public Listed Company</option>
                                                <option value="NGO/Society">NGO/Society</option>
                                                <option value="Government">Government</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Industry</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <select class="form-control show-tick" name="industry">
                                                <option value="">Select</option>
                                                <option value="Manufacturing">Manufacturing</option>
                                                <option value="FMCG">FMCG</option>
                                                <option value="Services-CA/CS">Services-CA/CS</option>
                                                <option value="Services-Legal">Services-Legal</option>
                                                <option value="Services-Others">Services-Others</option>
                                                <option value="Education">Education</option>
                                                <option value="NGO/Society/RWA">NGO/Society/RWA</option>
                                                <option value="Media & Entertainment">Media & Entertainment</option>
                                                <option value="Banking, Finance & NBFC">Banking, Finance & NBFC</option>
                                                <option value="Automobile">Automobile</option>
                                                <option value="Healthcare">Healthcare</option>
                                                <option value="Government">Government</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Company Contact Person Name</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text" class="form-control" id="Email" name="compername" placeholder="Contact Person Name" value="" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Company Contact Person Designation</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text" class="form-control" id="Email" name="comperdesignation" placeholder="Designation" value="" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Company Contact Person Email</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="email" class="form-control" id="Email" name="comperemail" placeholder="Email" value="" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Mobile</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="number" class="form-control" id="Email" name="mobile" placeholder="Mobile" value="" required="">
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row"><center><strong><h5>Department Information</h5></strong></center></div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Departments</label>
                                    <div class="col-sm-9">
                                        <div class="col-md-3">
                                            <label class="container">HR
                                              <input type="checkbox" name="vardepartment" checked="checked" value="hr">
                                              <span class="checkmark"></span>
                                            </label>
                                        </div>
                                        <div class="col-md-3">
                                            <label class="container">Sales
                                              <input type="checkbox" name="vardepartment" value="sales">
                                              <span class="checkmark"></span>
                                            </label>
                                        </div>
                                        <div class="col-md-3">
                                            <label class="container">Purchase
                                              <input type="checkbox" name="vardepartment" value="purchase">
                                              <span class="checkmark"></span>
                                            </label>
                                        </div>
                                        <div class="col-md-3">
                                            <label class="container">Demo
                                              <input type="checkbox" name="vardepartment" value="demo">
                                              <span class="checkmark"></span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row"><center><strong><h5>Scanning Quality</h5></strong></center></div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Dpi</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <select class="form-control show-tick" name="quality">
                                                <option value="">Select</option>
                                                <option value="200">200</option>
                                                <option value="300">300</option>
                                                <option value="400">400</option>
                                                <option value="600">600</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Colour</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <select class="form-control show-tick" name="color">
                                                <option value="">Select</option>
                                                <option value="black&white">Black & White</option>
                                                <option value="colour">Colour</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row"><center><strong><h5>Attachments</h5></strong></center></div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">GST Certificate</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="file" class="form-control" name="filegst">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">PAN</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="file" class="form-control" name="filepan">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">TAN</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="file" class="form-control" name="filetan">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Signed Contract</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="file" class="form-control" name="filesigned">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Questionnaire</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="file" class="form-control" name="filequestion">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Others</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="file" class="form-control" name="fileother">
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row clearfix">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> 
                                        <button type="button" class="btn btn-primary" style="float: right;">Modify</button>
                                        <button type="submit" class="btn btn-primary" style="float: right; margin-right: 3px;">Submit</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    </section>
  <%@include file="include/script.jsp" %>
</body>
</html>
