 <%@page import="java.sql.PreparedStatement"%>
<%@include file="include/session.jsp"%>
<%@ page import="com.softdocadmin.connection.StoreDBConnection"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Arrays"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="include/head.jsp" %>    
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
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
.loader{
     
     display:none;
   }
   
 #service{
   display:none;
 }  

</style>    
<script>
function showUser(str) {
  if (str=="") {
    document.getElementById("txtHint").innerHTML="";
    return;
  }
  if (window.XMLHttpRequest) {
    // code for IE7+, Firefox, Chrome, Opera, Safari
    xmlhttp=new XMLHttpRequest();
  } else { // code for IE6, IE5
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
  xmlhttp.onreadystatechange=function() {
    if (this.readyState==4 && this.status==200) {
      document.getElementById("txtHint").innerHTML=this.responseText;
    }
  }
  console.log(str);
  xmlhttp.open("GET","ajax-department.jsp?id="+str,true);
  xmlhttp.send();
}
</script>   


<script>
function showselecteddepartment(str) {
	
	var company_id = window.location.href;
	var res = company_id.split("=");
	var company_id = res[1];

 if (str=="") {
    document.getElementById("txtHint2").innerHTML="";
    return;
  }
  if (window.XMLHttpRequest) {
    // code for IE7+, Firefox, Chrome, Opera, Safari
    xmlhttp=new XMLHttpRequest();
  } else { // code for IE6, IE5
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
  xmlhttp.onreadystatechange=function() {
    if (this.readyState==4 && this.status==200) {
      document.getElementById("txtHint2").innerHTML=this.responseText;
    }
  }
   console.log(str);
   xmlhttp.open("GET","ajax-departments2.jsp?id="+str+"&company_id="+company_id,true); 
   xmlhttp.send();
}
</script>   

</head>

<body class="theme-light-blue">
    
    <!-- Overlay For Sidebars -->
    <div class="overlay"></div>
    <!-- #END# Overlay For Sidebars -->
    
    <!-- Top Bar -->
    <nav class="navbar">
        <div class="container-fluid">
            <div class="navbar-header">
                <a href="javascript:void(0);" class="navbar-toggle collapsed"  onclick="opennav()" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false"></a>
                <a href="javascript:void(0);" class="bars" onclick="opennav()"></a>
                <a class="navbar-brand" href="index.jsp">SOFTDOC ADMIN</a>
            </div>
            <div class="collapse navbar-collapse" id="navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <!-- Notifications -->
                      <%@include file="include/notification.jsp" %>              
                    <!-- #END# Notifications -->                    
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
                      	   String  id=request.getParameter("id");
                      %>  
                      <%
                        	if(id==null) {
                        %>  
                        <div class="body mrgnbtm">
                            <form class="form-horizontal"  enctype="multipart/form-data" id="fileUploadForm">
                                <div class="row"><center><strong><h5>Customer Information</h5></strong></center></div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-3 control-label">Customer Number</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                         <%
                                         	try(Connection connect=StoreDBConnection.openConnection();PreparedStatement preparedStat=connect.prepareStatement("SELECT * FROM `sequence` ORDER BY x DESC LIMIT 1");)
                                            {
                                                        ResultSet result=preparedStat.executeQuery();
                  				                        if(result.next())
                  				                         {
                  				                        	String customernumber = String.format ("%06d",result.getInt("x"));
                      				                        String serial="C"+customernumber;
                                         %>
                  	
                                                  <input type="text"  class="form-control" id="NameSurname" name="customernum" placeholder="Customer Number" value="<%=serial%>" readonly="readonly">
                                       
                                             		 
                  		 
                  		                 <%
            		                   		             } }
             		                 				                      catch(SQLException sqlexception)
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
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Company Name<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text" pattern="[A-Za-z\s]{0,50}"  class="form-control" id="companyname" name="companyname" placeholder="Company Name" value="" required="required">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Company PAN<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text" pattern="[A-Za-z0-9]{0,60}" class="form-control" id="compan" name="compan" placeholder="Company PAN" value=""  required="required">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">GSTIN</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text" pattern="[A-Za-z0-9]{0,60}" class="form-control" id="gstin" name="gstin" placeholder="GSTIN" value="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">TAN</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text" pattern="[A-Za-z0-9]{0,60}" class="form-control" id="tan" name="tan" placeholder="TAN" value="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">PAN</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text" class="form-control" name="pan_text" placeholder="PAN" value="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-3 control-label">Type<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <select class="form-control show-tick" name="type" id="type" required>
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
                                    <label for="Email" class="col-sm-3 control-label">Industry<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <select class="form-control show-tick" name="industry" id="industry"  onchange="showUser(this.value)" required>
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
                               
                                
                                <div class="row"><center><strong><h5>Billing Address</h5></strong></center></div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-3 control-label">Address Line 1<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text" pattern="[A-Za-z0-9._%+-\s]{0,60}" class="form-control" id="billingaddressone" name="billingaddressone" placeholder="Billing Address Line 1" value="" required="required">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Address Line 2</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text"  class="form-control"  name="billingaddresstwo" placeholder="Billing Address Line 2" value="" required="required">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-3 control-label">City<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text" pattern="[A-Za-z\s]{0,50}"  class="form-control" id="billingcity" name="billingcity" placeholder="Billing Address City" value="" value="" required="required">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">State<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text" pattern="[A-Za-z\s]{0,50}" class="form-control" id="billingstate" name="billingstate" placeholder="Billing Address State" value="" required="required">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">PinCode<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="number" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                                        maxlength = "6" class="form-control" id="billingpincode" name="billingpincode" placeholder="Billing Address PinCode" value="" required="required">
                                        </div>
                                    </div>
                                </div>

                                <div class="row"><center><strong><h5>Company Contact Person Details</h5></strong></center></div>
                            
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Name<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text" pattern="[A-Za-z\s]{0,50}" class="form-control" id="compername" name="compername" placeholder="Contact Person Name" value="" required="required">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email"   class="col-sm-3 control-label">Designation<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text" pattern="[A-Za-z\s]{0,50}" class="form-control" id="comperdesignation" name="comperdesignation" placeholder="Designation" value="" required="required">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Email<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="email" class="form-control"  name="comperemail" placeholder="Email" value="" required="required">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Mobile<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="number" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                                        maxlength = "10"  class="form-control" id="Email" name="mobile" placeholder="Mobile" value="" required="">
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row"><center><strong><h5>Department Information</h5></strong></center></div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Departments<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-9">
                                    	<div class="row" id="txtHint">
                                    		
                                    	</div>
                                            
                                    </div>
                                </div>
                                
                                <div class="row"><center><strong><h5>Service Information</h5></strong></center></div>
                                
                                
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Service Type<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <select class="form-control show-tick" name="serviceType" id="serviceType" required>
                                                <option value="">Select</option>
                                                <option value="Annual">Annual</option>
                                                <option value="Monthly">Monthly</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Dpi</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <select class="form-control show-tick" name="quality" id="quality">
                                                <option value="000">Select</option>
                                                <option value="200">200</option>
                                                <option value="300">300</option>
                                                <option value="400">400</option>
                                                <option value="600">600</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                <!-- <span style="color:red; font-size:18px;">*</span> -->
                                    <label for="Email" class="col-sm-3 control-label">Colour</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <select class="form-control show-tick" name="color" id="color">
                                                <option value="" selected disabled>Select</option>
                                                <option value="black&white">Black & White</option>
                                                <option value="colour">Colour</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Storage Data</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                           <input type="number" class="form-control"  name="storageData" id="storageData" placeholder="Storage Data In GB" value="" required="required">
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">No. of Users</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="number" class="form-control" placeholder="No. of Users" name="noOfUsers" value="">
                                        </div>
                                    </div>
                                </div>
                                
                                
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Plan Start Date</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="date" class="form-control" name="planStarDate"  id="planStartDate"  onchange="currentDate()"  value="">
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="form-group" id="enddate">
                                    <label for="Email" class="col-sm-3 control-label">Plan End Date</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="date" class="form-control" name="planEndDate" id="planEndDate"  value="" readonly="readonly">
                                        </div>
                                    </div>
                                </div>
                                
                                
                                <div class="row"><center><strong><h5>Attachments</h5></strong></center></div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">GST Certificate</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="file" class="form-control" name="filegst" value="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">PAN<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="file" class="form-control" id="filepan" name="filepan">
                                        </div>
                                         <span style="color:red; font-size:13px;!important">(PNG,JPEG,JPG,PDF only) max : upto 5MB</span>
	                                     <p id="filepansize"></p>  
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">TAN</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="file" class="form-control" id="filetan" name="filetan">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Signed Contract<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="file" class="form-control" id="filesigned" name="filesigned">
                                        </div>
                                         <span style="color:red; font-size:13px;!important">(PNG,JPEG,JPG,PDF only) max : upto 5MB</span>
                                         <p id="filesignedsize"></p>
	                                    
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
                                        <button type="submit" id="btnSubmit" class="btn btn-primary" style="float: right; margin-right: 3px;">Submit</button>
                                         <div class="loader">
                                            <img src="../images/loader.gif"  alt="" style=" float:right;margin-right:3px;width: 50px;height:50px;">
                                         </div> 
                                    </div>
                                </div>
                            </form>
                        </div>
                        
                        <%
                                  } 
                                   else{
                                       try(Connection connection=StoreDBConnection.openConnection();PreparedStatement preparedStatement=connection.prepareStatement("SELECT  `id` , `customer_number`, `company_name`, `billing_address_first`, `billing_address_sec`, `city`, `state`, `pincode`, `company_pan`, `gstin`, `tan`, `type`, `industry`, `company_per_name`, `company_per_designation`, `company_per_email`, `mobile`, `depart_info`, `dpi`, `colour`,`gst_certificate`,`pan`,`tan_att`,`signed_contract`,`questionnaire`,`others` , `pan_text` , servicetype , storagedata , noofusers , planstardate , planenddate FROM `customer_details` WHERE id='"+id+"'");)
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
                                            <input type="text"  pattern="[A-Za-z0-9\s]{0,60}"  class="form-control" id="companyname" name="companyname" placeholder="Company Name" value="<%=resultset.getString("company_name")%>" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Company PAN</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text"  class="form-control" id="compan" name="compan" placeholder="Company PAN" value="<%=resultset.getString("company_pan")%>" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">GSTIN</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text" pattern="[A-Za-z0-9]{0,60}" class="form-control" id="gstin" name="gstin" placeholder="GSTIN" value="<%=resultset.getString("gstin")%>" required="required">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">TAN</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text" pattern="[A-Za-z0-9]{0,60}" class="form-control" id="tan" name="tan" placeholder="TAN" value="<%=resultset.getString("tan")%>" required="required">
                                        </div>
                                    </div>
                                </div>
                                 <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">PAN</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text" class="form-control" name="pan_text" placeholder="PAN" value="<%=resultset.getString("pan_text")%>">
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
                                            <select class="form-control show-tick" name="industry" id="industry" onchange="showselecteddepartment(this.value)">
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
                                            <input type="text"   class="form-control" id="billingaddressone" name="billingaddressone" placeholder="Billing Address Line 1" value="<%=resultset.getString("billing_address_first")%>" required="required">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Address Line 2</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text"  class="form-control" name="billingaddresstwo" placeholder="Billing Address Line 2" value="<%=resultset.getString("billing_address_sec")%>" required="required">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-3 control-label">Address City</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text" pattern="[A-Za-z\s]{0,60}" class="form-control" id="billingcity" name="billingcity" placeholder="Billing Address City" value="<%=resultset.getString("city")%>" required="required">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Address State</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text" pattern="[A-Za-z\s]{0,60}" class="form-control"  name="billingstate" placeholder="Billing Address State" value="<%=resultset.getString("state")%>" required="required">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Address PinCode</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="number" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                                        maxlength = "6" class="form-control"  name="billingpincode" placeholder="Billing Address PinCode" value="<%=resultset.getString("pincode")%>" required="required">
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row"><center><strong><h5>Company Contact Person Details</h5></strong></center></div>

                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Name</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text" pattern="[A-Za-z\s]{0,60}" class="form-control"  name="compername" placeholder="Contact Person Name" value="<%=resultset.getString("company_per_name")%>" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Designation</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text" pattern="[A-Za-z\s]{0,60}" class="form-control"  name="comperdesignation" placeholder="Designation" value="<%=resultset.getString("company_per_designation")%>" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Email</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="email" class="form-control" id="comperemail" name="comperemail" placeholder="Email" value="<%=resultset.getString("company_per_email")%>"  required="required">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Mobile</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="number" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                                        maxlength = "10" class="form-control" id="mobile" name="mobile" placeholder="Mobile" value="<%=resultset.getLong("mobile")%>"  required="required">
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
                                            <select class="form-control show-tick" name="serviceType" id="serviceType">
                                                
                                               <%if(resultset.getString("servicetype").equals("Annual")){%>
                                                     <option value="<%=resultset.getString("servicetype")%>">Annual</option>
                                                 <%}%>
                                                 <% if(resultset.getString("servicetype").equals("Monthly")){%>
                                                     <option value="<%=resultset.getString("servicetype")%>">Monthly</option>
                                                 <%} %>
                                                 
                                                     <% 
                                                        if(!"Annual".equals(resultset.getString("servicetype"))){
                                                     %> 
                                                         <option value="Annual">Annual</option>
                                                     <% } %>
                                                     <% 
                                                      if(!"Monthly".equals(resultset.getString("servicetype"))){
                                                     %> 
                                                       <option value="Monthly">Monthly</option>
                                               
                                                     <% } %>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                
                              
                                 
                                 <div class="form-group" id="hideCloudOnly">
                                    <label for="Email" class="col-sm-3 control-label">Storage Data</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                             <input type="text" class="form-control"  name="storageData" id="storageData" placeholder="Storage Data In GB" value="<%=resultset.getInt("storagedata")/1000%>" required="required">
                                        </div>
                                    </div>
                                </div>
                                
                               <div id="hideScancloud" style="display:none">
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Dpi</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <select class="form-control" name="quality">
                                                
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
                                            <select class="form-control show-tick" name="color">
                                                
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
                                
                                
                               <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">No. of Users</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="number" class="form-control" name="noOfUsers" value="<%=resultset.getString("noofusers")%>">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Plan Start Date</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="date" class="form-control" name="planStarDate"  id="planStartDate"  onchange="currentDate()"  value="<%=resultset.getString("planstardate")%>">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group" id="enddate">
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
                                            <input type="file" class="form-control" name="filegst">
                                            <a href="<%=resultset.getString("gst_certificate")%>">Download</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">PAN</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="file" class="form-control" name="filepan">
                                            <a href="<%=resultset.getString("pan")%>">Download</a>
                                        </div>
                                        
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">TAN</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="file" class="form-control" name="filetan">
                                            <a href="<%=resultset.getString("tan_att")%>" target="_blank">Download</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Signed Contract</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="file" class="form-control" name="filesigned">
                                            <a href="<%=resultset.getString("signed_contract")%>" target="_blank">Download</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Questionnaire</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="file" class="form-control" name="filequestion">
                                            <a href="<%=resultset.getString("questionnaire")%>" target="_blank">Download</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Others</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="file" class="form-control" name="fileother">
                                            <a href="<%=resultset.getString("others")%>" target="_blank">Download</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="row clearfix">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> 
                                        <button type="submit" id="updatesubmit" class="btn btn-primary" style="float: right;">Modify</button>
                                          <div class="loader">
                                             <img src="../images/loader.gif"  alt="" style=" float: right;width: 50px;height:50px;">
                                          </div> 
                                    </div>
                                </div>
                            </form>
                        </div>
                     <%
                                      }
                                }
                                catch(Exception e)
                                {
                             	   e.printStackTrace();
                                } 
                             }
                                    
                    %>
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
   <%@include file="include/script.jsp" %>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script> 
  <script src="include/custom-script.js"></script>  
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
  <script type="text/javascript">
  
  
  
  function currentDate(){
	  var d = new Date(document.getElementById('planStartDate').value);
	  var year = d.getFullYear();
	  var month = d.getMonth();
	  var day = d.getDate();
	  var c = new Date(year, month+1, day);
	  var newdate = c.toJSON().slice(0,10).replace(/-/g,'-'); 
	  document.getElementById("planEndDate").value=newdate;
  }
  
  
  
  $('#serviceType').on('change', function() { 
	  
       var serviceType = document.getElementById('serviceType').value;
       if(serviceType === 'Annual') {
       
    	  document.getElementById("enddate").style.display='none';
    	  document.getElementById("planEndDate").value='';
       
       }else if(serviceType === 'Monthly') {
       
     	   document.getElementById("enddate").style.display='block'; 
       } 
       
  })

  
  
  
   $('#filepan').on('change', function() { 
  
	     document.getElementById("filepansize").innerHTML = (this.files[0].size/1048576).toFixed(3)+' MB';
	     if(this.files[0].size >= 5000000) { 
          error('Try to upload file less than 5MB!'); 
          return false;
    } 
	     
     var ext = $('#filepan').val().split('.').pop().toLowerCase();
	      if($.inArray(ext, ['png','jpg','jpeg','pdf',]) == -1) {
	    	   error('You must select  file only');
			   return false;
	      }
   });
  
  
   $('#filesigned').on('change', function() { 
   
	  document.getElementById("filesignedsize").innerHTML = (this.files[0].size/1048576).toFixed(3)+' MB';
	  if(this.files[0].size >= 5000000) { 
       error('Try to upload file less than 5MB!'); 
       return false;
   } 
	  
  
	  var ext = $('#filesigned').val().split('.').pop().toLowerCase();
	      if($.inArray(ext, ['png','jpg','jpeg','pdf',]) == -1) {
	    	   error('You must select  file only');
			   return false;
	      }
});
   
  
   $(document).ready(function () {

	  
          $("#btnSubmit").click(function (event) {

		     var companyname=$('#companyname').val();
	    	 var compan=$('#compan').val();
		     var type=$('#type').val();
		     var industry=$('#industry').val();
		     var billingaddressone=$('#billingaddressone').val();
		     var billingcity=$('#billingcity').val();
		     var billingstate=$('#billingstate').val();
		     var billingpincode=$('#billingpincode').val();
		     var compername=$('#compername').val();
		     var comperdesignation=$('#comperdesignation').val();
		     var comperemail=$('#comperemail').val();
		     var mobile=$('#mobile').val();
		     var quality=$('#quality').val();
		     var color=$('#color').val();
		     var filepan=$('#filepan').val();
		     var filesigned=$('#filesigned').val();
		     var serviceType=$('#serviceType').val();
		     
            
         
		     if(companyname=='')
		     {
		         error('Please fill the Company name');
			     return false;	
		     }
	         else if(compan=='')
		     {
	        	 error('Please fill the Company PAN');
			     return false;	
		     }
	         else if(type=='')
		     {
	        	 error('Please Select the Type');
			     return false;	
		     }
	         else if(industry=='')
		     {
	        	 error('Please Select the Industry');
			     return false;	
		     }
	         else if(billingaddressone=='')
		     {
	        	 error('Please fill the Address Line');
			     return false;	
		     }
	         else if(billingcity=='')
		     {
	        	 error('Please fill the City');
			     return false;	
		     }
	         else if(billingstate=='')
		     {
	        	 error('Please fill the State');
			     return false;	
		     }
	         else if(billingpincode=='')
		     {
	        	 error('Please fill the Pincode');
			     return false;	
		     }
	         else if(compername=='')
		     {
	        	 error('Please fill the Contact Person Name');
			     return false;	
		     }
	         else if(comperdesignation=='')
		     {
	        	 error('Please fill the Designation');
			     return false;	
		     }
	         else if(comperemail=='')
		     {
	        	 error('Please fill the Email');
			     return false;	
		     }
	         else if(mobile=='')
		     {
	        	 error('Please fill the Mobile Number');
			     return false;	
		     }
	         else if(filepan=='')
		     {
	        	 error('Please select the file');
			     return false;	
		     
		     }
	         else if(filesigned=='')
		     {
	        	 error('Please select the file');
			     return false;	
		     }
		     else if(serviceType =='')
		     {
	        	 error('Please select the SelectType');
			     return false;	
		     }
	         
	          
		     
		     
		     
		     var filepan = $('#filepan')[0].files[0].size;
	         if(filepan  >= 5000000)
	         {
	        	 error('Try to upload file less than 5MB!');
			     return false;	
	        	 
	         }
	        
	         
             var filesigned = $('#filesigned')[0].files[0].size;
             if(filesigned >= 5000000)
	         {
	        	 error('Try to upload file less than 5MB!');
			     return false;	
		     }
		     
	         
            //stop submit the form, we will post it manually.
	        event.preventDefault();
            // Get form
	        var form = $('#fileUploadForm')[0];
            // Create an FormData object 
	        var data = new FormData(form);
            // If you want to add an extra field for the FormData
	        $("#btnSubmit").prop("disabled", true);
	        $.ajax({
	             type: "POST",
	             enctype: 'multipart/form-data',
	             url:"../Process?action=customer",
	             data: data,
	             processData: false,
	             contentType: false,
	             cache: false,
	             timeout: 600000,
	             beforeSend:function(){
		  	    	   
		  	    	 $('.loader').show();
		  	       
		  	      },
	              success: function (data) {
	            	 
	                 var result = JSON.parse(data);
	            	 console.log(result.status);
	                 if(result.status)
	            	 { 
	                      Swal.fire({
	     	    			  position: 'top-end',
	     	    			  icon: 'success',
	     	    			  title: 'Customer Create Successfully',
	     	    			  showConfirmButton: false,
	     	    			  timer: 2500
	     	    			}) 
	     	    			// disabled the submit button
	     	    			$("#btnSubmit").prop("disabled", false);
	     	    			document.getElementById("fileUploadForm"). reset();
	     	    		    $('.loader').hide();
	     	    			setTimeout(function(){
			     	    		   window.location.href="customer.jsp";
			     	    	})
	  	             }
	                 else
	                 {
	                      Swal.fire({
	    	    			  icon:'error',
	    	    			  title:'Something is Wrong',
	    	    			  text:"wrong",
	    	    			  footer:'',
	    	    			  timer:3000
	    	    			}) 
	    	    	     $("#btnSubmit").prop("disabled", false);
	                	 $('.loader').hide();
	                 }
	             },
	             error: function (e) {

	               
	                 Swal.fire({
	    	    			  icon:'error',
	    	    			  title:'Something is Wrong',
	    	    			  text:"wrong",
	    	    			  footer:'',
	    	    			  timer:3000
	    	    			})
	                     $("#btnSubmit").prop("disabled", false);

	            }
	        });

	    });

	});
   
   //======================update customer profile=========================
         $("#updatesubmit").click(function (event) {
	        event.preventDefault();
	        Swal.fire({
	        	  title: 'Are you sure',
	        	  text:" you want to make changes?",
	        	  icon: 'warning',
	        	  showCancelButton: true,
	        	  cancelButtonText: ' No ',
	        	  confirmButtonColor: '#3085d6',
	        	  cancelButtonColor: '#d33',
	        	  confirmButtonText: 'Yes'
	        	}).then((result) => {
	        	  if (result.value) {
	        		  var form = $('#updatecustomer')[0];
	                  var data = new FormData(form);
	                  $.ajax({
	      	             type: "POST",
	      	             enctype: 'multipart/form-data',
	      	             url:"../Process?action=customerupdate",
	      	             data: data,
	      	             processData: false,
	      	             contentType: false,
	      	             cache: false,
	      	             timeout: 600000,
	      	             beforeSend:function(){
			  	    	  $('.loader').show();
	  		  	         },
	      	             success: function (data) {
	      	            	    var result = JSON.parse(data);
	      	                    if(result.status)
	          	    		    {
	          	    		         Swal.fire({
	         	     	    			  position: 'top-end',
	         	     	    			  icon: 'success',
	         	     	    			  title: 'Changes Saved',
	         	     	    			  showConfirmButton: false,
	         	     	    			  timer: 2500
	         	     	    			})
	         	     	               $('.loader').hide();
	     	    		
	         	     	    			
	         	     		         setTimeout(function(){
	      			     	    		   window.location.href="customer.jsp";
	      			     	    	  }) 
	          	    	       }
	          	    		   else
	          		           {
	          	    		    	  Swal.fire({
	          	    	    			  icon:'error',
	          	    	    			  title:'Something is Wrong',
	          	    	    			  text:"wrong",
	          	    	    			  footer:'',
	          	    	    			  timer:3000
	          	    	    			}) 
	          	    	    		
	          		                  $('.loader').hide();
	
	          	    	    			
	          	    	     }
	         	    	         
	      	             },
	      	             error: function (e) {

	      	            	 console.log("error");
	      	            
	      	             }
	      	        });
	        		  
	        	 }
	          })
   	      });
	</script>
</body>
</html>
