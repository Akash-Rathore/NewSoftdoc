<%@include file="include/session.jsp" %>

<%@page import="java.util.ArrayList"%>   
<%@page import="com.customeradminModal.Usercustomer"%>
<%@page import="java.util.Iterator"%> 
<!DOCTYPE html>
<html>
<head>
    <%@include file="include/head.jsp"%>   
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
         <%@include file="include/navbar.jsp" %>
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
                  
                </h2>
            </div>
            <div class="row"  style="margin-left:-148px !important;margin-right:-27px;">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" >
                    <div class="card">
                                <%
                                
                                
                                ArrayList<Usercustomer>  usercustomer= (ArrayList) request.getAttribute("profileCompleteDetails"); 
                                Iterator<Usercustomer> iterator = usercustomer.iterator();
                                 if(iterator.hasNext())  
                        	       {
                               	        Usercustomer viewRecord = iterator.next();
                               	       
       			            
                                
                             %>   
                             
                            <div class="body mrgnbtm">
                           <form class="form-horizontal" action="" method="post" enctype="multipart/form-data">
                                <div class="row"><center><strong><h5>Customer Information</h5></strong></center></div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-3 control-label">Customer Number</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text"  class="form-control"  name="customernum" placeholder="Customer Number" value="<%=viewRecord.getCustomer_number()%>" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Company Name</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text"   class="form-control"  name="companyname" placeholder="Company Name" value="<%=viewRecord.getCompany_name()%>" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Company PAN</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text"  class="form-control"  name="compan" placeholder="Company PAN" value="<%=viewRecord.getCompany_pan()%>" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">GSTIN</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text"  class="form-control"  name="gstin" placeholder="GSTIN" value="<%=viewRecord.getGstin()%>" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">TAN</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text"  class="form-control" id="tan" name="tan" placeholder="TAN" value="<%=viewRecord.getTan()%>" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">PAN</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text"  class="form-control"    name="pan_text" placeholder="PAN"  value="<%=viewRecord.getPan_text()%>" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-3 control-label">Type</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <select class="form-control show-tick" name="type" id="type" readonly>
                                                <option value=""><%=viewRecord.getType()%></option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Industry</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <select class="form-control show-tick" name="industry" id="industry" readonly>
                                                <option value=""><%=viewRecord.getIndustry()%></option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="row"><center><strong><h5>Billing Address</h5></strong></center></div>

                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-3 control-label">Address Line 1</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text"  class="form-control"  name="billingaddressone" placeholder="Billing Address Line 1" value="<%=viewRecord.getBilling_address_first()%>" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Address Line 2</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text"  class="form-control" id="Email" name="billingaddresstwo" placeholder="Billing Address Line 2" value="<%=viewRecord.getBilling_address_sec()%>" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-3 control-label">Address City</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text"  class="form-control"  name="billingcity" placeholder="Billing Address City" value="<%=viewRecord.getCity()%>" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Address State</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text"  class="form-control"  name="billingstate" placeholder="Billing Address State" value="<%=viewRecord.getState()%>" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Address PinCode</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="number" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                                        maxlength = "6" class="form-control" id="Email" name="billingpincode" placeholder="Billing Address PinCode" value="<%=viewRecord.getPincode()%>" readonly>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row"><center><strong><h5>Company Contact Person Details</h5></strong></center></div>

                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Name</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text"  class="form-control"  name="compername" placeholder="Contact Person Name" value="<%=viewRecord.getCompany_per_name()%>" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Designation</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text"  class="form-control"  name="comperdesignation" placeholder="Designation" value="<%=viewRecord.getCompany_per_designation()%>" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Email</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="email" class="form-control" id="comperemail" name="comperemail" placeholder="Email" value="<%=viewRecord.getCompany_per_email()%>" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Mobile</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="number" class="form-control" id="mobile" name="mobile" placeholder="Mobile" value="<%=viewRecord.getMobile()%>" readonly>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row"><center><strong><h5>Department Information</h5></strong></center></div>
                                
                                  
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Departments</label>
                                    <div class="col-sm-9">
                                    
                                    <%
                                         String deptinfo =viewRecord.getDepart_info();
                                         String array[]=deptinfo.split(",");
                                         for(int i=0;i<array.length;i++)
                                         {
                                  %>
                                        <div class="col-md-3">
                                     
                                               <label class="container"><%=array[i]%>
                                                  <input type="checkbox" name="vardepartment" value="<%=array[i]%>" checked disabled="disabled">
                                                  <span class="checkmark"></span>
                                               </label>
                                            	
                                          </div>
                                         <% } %>      
                                          
                                     </div>
                                  </div>    
                                        
                                          
                               <div class="row"><center><strong><h5>Service Information</h5></strong></center></div>
                                
                                        <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Service Type</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <select class="form-control show-tick" name="serviceType" readonly>
                                                 <option value="<%=viewRecord.getServiceType()%>">Scan + Cloud</option>
                                            </select>
                                        </div>
                                    </div>
                                 </div>
                                
                                
                               <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Subscription Type</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <select class="form-control show-tick" name="subscriptionType" id="subscriptionType" readonly>
                               
                                               
                                               <%if(viewRecord.getSubscription_type()==null){ %>
                                                     <option value="Annual">Annual</option>
                                                     <option value="Monthly">Monthly</option>
                                               <%}else {%>
                                                                
                                                
                                               <%if(viewRecord.getSubscription_type().equals("Annual")){%>
                                                     <option value="<%=viewRecord.getSubscription_type()%>">Annual</option>
                                                 <%}%>
                                                 
                                                 <% if(viewRecord.getSubscription_type().equals("Monthly")){%>
                                                     <option value="<%=viewRecord.getSubscription_type()%>">Monthly</option>
                                                 <%} %>
                                                 
                                                     <% 
                                                        if(!"Annual".equals(viewRecord.getSubscription_type())){
                                                     %> 
                                                         <option value="Annual">Annual</option>
                                                     <% } %>
                                                    
                                                     <% 
                                                      if(!"Monthly".equals(viewRecord.getSubscription_type())){
                                                     %> 
                                                       <option value="Monthly">Monthly</option>
                                               
                                                     <%
                                                      }
                                                     }
                                                    %>
                                            </select>
                                        </div>
                                    </div>
                                 </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Storage Data</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                             <input type="text" class="form-control"  name="storageData" id="storageData" placeholder="Storage Data In GB" value="<%=Integer.parseInt(viewRecord.getStorageData())/1000%>" readonly="readonly">
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Dpi</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <select class="form-control" name="quality" readonly>
                                                   <option value=""><%=viewRecord.getDpi()%></option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                               
                               
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Colour</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                   
                                            <select class="form-control show-tick" name="color" readonly>
                                              
                                          
                                                
                                                <%if(viewRecord.getColour()==null){%>
                                                   <option value="<%=viewRecord.getColour()%>"><%=viewRecord.getColour()%></option>
                                                 <%}else {%>
                                                  <option value="<%=viewRecord.getColour()%>"><%=viewRecord.getColour()%></option>
                                                 <%}%>
                                               
                                                <% 
                                                    if(!"black&white".equals(viewRecord.getColour())){
                                                 %> 
                                                      <option value="black&white">Black & White</option>
                                                 <% } %>
                                                 <% 
                                                    if(!"colour".equals(viewRecord.getColour())){
                                                 %> 
                                                      <option value="colour">Colour</option>
                                               
                                                 <% } %>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                               
                               <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">No. of Users</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="number" class="form-control" name="noOfUsers" value="<%=viewRecord.getNoOfUsers()%>" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Plan Start Date</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="date" class="form-control" name="planStarDate"    value="<%=viewRecord.getPlanStarDate()%>" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group" id="monthlyhide">
                                    <label for="Email" class="col-sm-3 control-label">Plan End Date</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="date" class="form-control" name="planEndDate" id="planEndDate"  value="<%=viewRecord.getPlanEndDate()%>" readonly>
                                        </div>
                                    </div>
                                </div>
                        
                                
                                
                                <div class="row"><center><strong><h5>Attachments</h5></strong></center></div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">GST Certificate</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <a href="<%=viewRecord.getGst_certificate()%>">Download</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">PAN</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <a href="<%=viewRecord.getPan()%>">Download</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">TAN</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                             <a href="<%=viewRecord.getTan_att()%>" target="_blank">Download</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Signed Contract</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <a href="<%=viewRecord.getSigned_contract()%>" target="_blank">Download</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Questionnaire</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <a href="<%=viewRecord.getQuestionnaire()%>" target="_blank">Download</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Others</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <a href="<%=viewRecord.getOthers()%>" target="_blank">Download</a>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <%	  
                                }
                                
                         %>
                    </div>
                </div>
            </div>
            
        </div>
    </section>
  <%@include file="include/footer.jsp" %>
</body>
</html>
