<%@page import="java.sql.PreparedStatement"%>
<%@include file="include/session.jsp"%>
<%@page import="com.superadmin.connection.DBConnection"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Arrays"%>
<%@ page import="java.util.List"%>

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
                <a class="navbar-brand" href="index.jsp">SUPER ADMIN </a>
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
          <%@include file="include/sidebar.jsp" %>
       <!-- #END# Left Sidebar -->
        
    </section>

    <section class="content">
        <div class="container-fluid">
            <div class="block-header">
                <h2>
                    Customer Centre
                </h2>
            </div>
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                Create Customers
                            </h2>
                            
                        </div> 
                                <%
                                  	try(Connection connection=DBConnection.openConnection();PreparedStatement preparedStatement=connection.prepareStatement("SELECT `id` , `customer_number`, `company_name`, `billing_address_first`, `billing_address_sec`, `city`, `state`, `pincode`, `company_pan`, `gstin`, `tan`, `type`, `industry`, `company_per_name`, `company_per_designation`, `company_per_email`, `mobile`, `depart_info`, `dpi`, `colour`,`gst_certificate`,`pan`,`tan_att`,`signed_contract`,`questionnaire`,`others` , `pan_text` , servicetype , storagedata , noofusers , planstardate , planenddate FROM `customer_details` WHERE id='"+request.getParameter("id")+"'");)
                                    {
                             	             ResultSet resultset=preparedStatement.executeQuery();
                                             if(resultset.next())
                                             {
                                  %> 
                                                          <div class="body mrgnbtm">
                            <form class="form-horizontal"  id="updatecustomer" method="post" enctype="multipart/form-data">
                                <div class="row"><center><strong><h5>Customer Information</h5></strong></center></div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-3 control-label">Customer Number</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text"  class="form-control"  name="customernum" placeholder="Customer Number" value="<%=resultset.getString("customer_number")%>" readonly>
                                            <input type="hidden"  class="form-control"  name="id"  value="<%=resultset.getString("id")%>">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Company Name</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text"  pattern="[A-Za-z0-9\s]{0,60}"  class="form-control" id="companyname" name="companyname" placeholder="Company Name" value="<%=resultset.getString("company_name")%>" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Company PAN</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text"  class="form-control" id="compan" name="compan" placeholder="Company PAN" value="<%=resultset.getString("company_pan")%>" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">GSTIN</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text" pattern="[A-Za-z0-9]{0,60}" class="form-control" id="gstin" name="gstin" placeholder="GSTIN" value="<%=resultset.getString("gstin")%>" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">TAN</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text" pattern="[A-Za-z0-9]{0,60}" class="form-control" id="tan" name="tan" placeholder="TAN" value="<%=resultset.getString("tan")%>"  readonly>
                                        </div>
                                    </div>
                                </div>
                                 <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">PAN</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text" class="form-control" name="pan_text" placeholder="PAN" value="<%=resultset.getString("pan_text")%>" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-3 control-label">Type</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <select class="form-control show-tick" name="type" id="type" readonly>
                                                <option value="<%=resultset.getString("type")%>"><%=resultset.getString("type")%></option>
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
                                            <select class="form-control show-tick" name="industry" id="industry" readonly>
                                                <option value="<%=resultset.getString("industry")%>"><%=resultset.getString("industry")%></option>
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

                                <div class="row"><center><strong><h5>Billing Address</h5></strong></center></div>

                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-3 control-label">Address Line 1</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text"   class="form-control" id="billingaddressone" name="billingaddressone" placeholder="Billing Address Line 1" value="<%=resultset.getString("billing_address_first")%>" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Address Line 2</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text"  class="form-control" name="billingaddresstwo" placeholder="Billing Address Line 2" value="<%=resultset.getString("billing_address_sec")%>"  readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-3 control-label">Address City</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text" pattern="[A-Za-z\s]{0,60}" class="form-control" id="billingcity" name="billingcity" placeholder="Billing Address City" value="<%=resultset.getString("city")%>" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Address State</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text" pattern="[A-Za-z\s]{0,60}" class="form-control"  name="billingstate" placeholder="Billing Address State" value="<%=resultset.getString("state")%>" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Address PinCode</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="number" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                                        maxlength = "6" class="form-control"  name="billingpincode" placeholder="Billing Address PinCode" value="<%=resultset.getString("pincode")%>" readonly>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row"><center><strong><h5>Company Contact Person Details</h5></strong></center></div>

                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Name</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text" pattern="[A-Za-z\s]{0,60}" class="form-control"  name="compername" placeholder="Contact Person Name" value="<%=resultset.getString("company_per_name")%>" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Designation</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text" pattern="[A-Za-z\s]{0,60}" class="form-control"  name="comperdesignation" placeholder="Designation" value="<%=resultset.getString("company_per_designation")%>" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Email</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="email" class="form-control" id="comperemail" name="comperemail" placeholder="Email" value="<%=resultset.getString("company_per_email")%>"  readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Mobile</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="number" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                                        maxlength = "10" class="form-control" id="mobile" name="mobile" placeholder="Mobile" value="<%=resultset.getLong("mobile")%>"  readonly>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row"><center><strong><h5>Department Information</h5></strong></center></div>
                                
                                  
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Departments</label>
                                    <div class="col-sm-9" id="txtHint2">   
                                      <%
                                          String deptinfo =resultset.getString("depart_info");
                                          String array[]=deptinfo.split(",");
                                          for(int i=0;i<array.length;i++)
                                          {
                                      %>
                                        	 <div class="col-md-3">
                                                <label class="container"><%=array[i]%>
                                                   <input type="checkbox" name="vardepartment" value="<%=array[i]%>" checked>
                                                   <span class="checkmark"></span>
                                                </label>
                                           	 </div>
                                        
                                      <% } %>    
                                     </div>
                                 
                                  </div>    
                               <div class="row"><center><strong><h5>Service Information</h5></strong></center></div>
                                
                                
                                
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Service Type<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <select class="form-control show-tick" name="serviceType"  readonly>
                                                
                                               <%if(resultset.getString("servicetype").equals("scan+cloud")){%>
                                                     <option value="<%=resultset.getString("servicetype")%>">Scan + Cloud</option>
                                                 <%}%>
                                                 <% if(resultset.getString("servicetype").equals("cloudonly")){%>
                                                     <option value="<%=resultset.getString("servicetype")%>">Cloud Only</option>
                                                 <%} %>
                                                 
                                                     <% 
                                                        if(!"cloudonly".equals(resultset.getString("servicetype"))){
                                                     %> 
                                                         <option value="cloudonly">Cloud Only</option>
                                                     <% } %>
                                                     <% 
                                                      if(!"scan+cloud".equals(resultset.getString("servicetype"))){
                                                     %> 
                                                       <option value="scan+cloud">Scan + Cloud</option>
                                               
                                                     <% } %>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                
                                <%if(resultset.getString("servicetype").equals("cloudonly")){%>
                                 
                                 <div class="form-group" id="hideCloudOnly">
                                    <label for="Email" class="col-sm-3 control-label">Storage Data</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                             <input type="text" class="form-control"  name="storageData" id="storageData" placeholder="Storage Data In GB" value="<%=resultset.getInt("storagedata")/1000%>"  readonly>
                                        </div>
                                    </div>
                                </div>
                                
                               <div id="hideScancloud" style="display:none">
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Dpi</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <select class="form-control" name="quality" readonly>
                                                
                                                  <%if(resultset.getString("dpi")=="null"){%>
                                                   <option value="<%=resultset.getString("dpi")%>"><%=resultset.getString("dpi")%></option>
                                                  <%}else {%>
                                                   <option value="" selected disabled>Select</option>
                                                  <%}  %>
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
                                            <select class="form-control show-tick" name="color" readonly>
                                                
                                                <%if(resultset.getString("colour")=="null"){%>
                                                   <option value="<%=resultset.getString("colour")%>"><%=resultset.getString("colour")%></option>
                                                 <%}else {%>
                                                  <option value="" selected disabled>Select</option>
                                                 <%}%>
                                               
                                                <% 
                                                    if(!"black&white".equals(resultset.getString("colour"))){
                                                 %> 
                                                      <option value="black&white">Black & White</option>
                                                 <% } %>
                                                 <% 
                                                    if(!"colour".equals(resultset.getString("colour"))){
                                                 %> 
                                                      <option value="colour">Colour</option>
                                               
                                                 <% } %>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                             </div>
                                
                                <%} else {%>
                                
                                <div id="hideScancloud">
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Dpi</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <select class="form-control" name="quality" readonly>
                                                <option value="<%=resultset.getString("dpi")%>"><%=resultset.getString("dpi")%></option>
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
                                            <select class="form-control show-tick" name="color" readonly>
                                                <option value="<%=resultset.getString("colour")%>"><%=resultset.getString("colour")%></option>
                                                <% 
                                                    if(!"black&white".equals(resultset.getString("colour"))){
                                                 %> 
                                                      <option value="black&white">Black & White</option>
                                                 <% } %>
                                                 <% 
                                                    if(!"colour".equals(resultset.getString("colour"))){
                                                 %> 
                                                      <option value="colour">Colour</option>
                                                 <% } %>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                </div>
                                <div class="form-group" id="hideCloudOnly" style="display:none">
                                    <label for="Email" class="col-sm-3 control-label">Storage Data</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text" class="form-control"  name="storageData" id="storageData" placeholder="Storage Data In GB" value="<%=resultset.getInt("storagedata")/1000%>" required="required" readonly>
                                        </div>
                                    </div>
                                </div>
                               <%}%>
                               <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">No. of Users</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="number" class="form-control" name="noOfUsers" value="<%=resultset.getString("noofusers")%>" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Plan Start Date</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="date" class="form-control" name="planStarDate"  id="planStartDate"  onchange="currentDate()"  value="<%=resultset.getString("planstardate")%>" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Plan End Date</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="date" class="form-control" name="planEndDate" id="planEndDate"  value="<%=resultset.getString("planenddate")%>" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="row"><center><strong><h5>Attachments</h5></strong></center></div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">GST Certificate</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="file" class="form-control" name="filegst" readonly>
                                            <a href="<%=resultset.getString("gst_certificate")%>">Download</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">PAN</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="file" class="form-control" name="filepan" readonly>
                                            <a href="<%=resultset.getString("pan")%>">Download</a>
                                        </div>
                                        
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">TAN</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="file" class="form-control" name="filetan" readonly>
                                            <a href="<%=resultset.getString("tan_att")%>" target="_blank">Download</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Signed Contract</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="file" class="form-control" name="filesigned" readonly>
                                            <a href="<%=resultset.getString("signed_contract")%>" target="_blank">Download</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label" >Questionnaire</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="file" class="form-control" name="filequestion" readonly>
                                            <a href="<%=resultset.getString("questionnaire")%>" target="_blank">Download</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Others</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="file" class="form-control" name="fileother" readonly>
                                            <a href="<%=resultset.getString("others")%>" target="_blank">Download</a>
                                        </div>
                                    </div>
                                </div>
                            </form>
                          </div>
                                  
                         <%	  
                                }
                                  }
                                  catch(SQLException  sqlexception)
                                  {
                              	         sqlexception.printStackTrace();
                                  }
                                  catch(Exception exception)
                                  {
                                         exception.printStackTrace();  	  
                                  }
                         %>
                    </div>
                </div>
            </div>
            
        </div>
    </section>
  <%@include file="include/script.jsp" %>
</body>
</html>
