<%@include file="include/session.jsp"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>

<!DOCTYPE html>
<html>

  <head>
     <%@include file="include/head.jsp"%>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
     <link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" rel="stylesheet"/>
     <style>
     
      .loader{
                display:none;
        }
      
      
    .fa{
            font-size:18px !important;
            color: yellow;
      }  
        
      .logoClient{
      
      width:55px !important;
      height:50px !important;
      
      
      }
          
       .mrgnbtm .form-group {
          margin-bottom: 0px !important;
       }   
          
     </style>
  </head>

  <body class="theme-light-blue">

     <div class="overlay"></div>
           <%@include file="include/navbar.jsp"%>
    <section>
           <%@include file="include/sidebar.jsp"%>
    </section>    

    <section class="content">
        <div class="container-fluid">
            <div class="block-header">
                <h2>
                    
                </h2>
            </div>
            <div class="row" style="margin-right: -35px !important;margin-left: -156px !important;">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                
                            </h2>
                        </div>
                        <div class="body mrgnbtm">
                            <form class="form-horizontal" id="viewdocument">
                               
                             
                              <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Created On</label>
                                    
                                    <div class="col-md-1">
                                            <h2 style="font-size:12px;">From</h2>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="date" name="createdStart"  value=""  class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-1">
                                            <h2 style="font-size:12px;">To</h2>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group form-float">
                                            <div class="form-line">
                                                <input type="date" name="createdEnd" value="" class="form-control">
                                            </div>
                                        </div>
                                     </div>
                                </div> 
                               
                               
                               
                              <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Department</label>
                                    <div class="col-sm-10">
                                      <div class="form-line">
                                        <select class="form-control show-tick" id="department" onchange="showdocument(this.value)" name="department">	
                                        	<option selected disabled value>Select Department</option>
                                        <%
                                            String department=(String)session.getAttribute("client_department");
                                    		String client_industry=(String)session.getAttribute("client_industry");
                                        	
                                    		
                                    		JSONParser jsonParser = new JSONParser();
	          								JSONArray jsonArray = (JSONArray) jsonParser.parse(department);
	          								for(Object object : jsonArray) {
		          							    	JSONObject  access_level1 = (JSONObject) object;
		          				
		          						
		          							    	if(client_industry.equalsIgnoreCase("Services-CA/CS")){%>
		          							    	
		          							    	 
		          							    	 <option value="<%=(String)access_level1.get("department")%>:Services-CA/CS"><%=(String)access_level1.get("department")%></option>
        
		          							    	
		          							    	<%}else{%>
		          							    	
		          							    	<option value="<%=(String)access_level1.get("department")%>"><%=(String)access_level1.get("department")%></option>
                  							    	
		          							    	<%}}%>
		          							    	
		          					
		          					    
                                        </select>
                                      </div>  
                                    </div>
                                </div>
                             
                             
                             
                            <div class="form-group" id="purchase" style="display:none">
                                    <label for="NameSurname" class="col-sm-2 control-label">Document Type</label>
                                    <div class="col-sm-10">
                                      <div class="form-line">
                                      
                                        <select class="form-control" name="documenttype" onchange="showform(this.value)">
                                        	<option selected disabled value>SELECT A DOCUMENT TYPE</option>
                                        	<option value="Vendor Registration">Vendor Registration</option>
                                        	<option value="Purchase">Purchase</option>
                                        </select>
                                      </div>  
                                    </div>
                                </div>
                               <div class="form-group" id="sales" style="display:none">
                                    <label for="NameSurname" class="col-sm-2 control-label">Document Type</label>
                                    <div class="col-sm-10">
                                      <div class="form-line">
                                        <select class="form-control" name="documenttype" onchange="salesmarketing(this.value)">
                                        	<option selected disabled value>SELECT A DOCUMENT TYPE</option>
                                        	<option value="Customer Registration">Customer Registration</option>
                                        	<option value="Sales">Sales</option>
                                        </select>
                                       </div>
                                    </div>
                                </div>
                                
                                  <div class="form-group" id="human" style="display:none">
                                    <label for="NameSurname" class="col-sm-2 control-label">Document Type</label>
                                    <div class="col-sm-10">
                                       <div class="form-line">
                                        <select class="form-control" name="documenttype">
                                            <option selected disabled value>SELECT A DOCUMENT TYPE</option> 
                                        	<option value="Employee OutBoarding">Employee OutBoarding</option>
                                        </select>
                                        </div>
                                    </div>
                                </div> 
                                
                                <div class="form-group directtax" id="directtax" style="display:none">
                                    <label for="NameSurname" class="col-sm-2 control-label">Document Type</label>
                                    <div class="col-sm-10">
                                       <div class="form-line">
                                        <select class="form-control" name="documenttype"  onchange="directtaxdoc(this.value)">
                                            <option selected disabled value>SELECT A DOCUMENT TYPE</option> 
                                        	<option value="Challen">Challen</option>
                                        	<option value="Tax Audit Report">Tax Audit Report</option>
                                            <option value="Power of Attorney">Power Of Attorney</option>
                                            <option value="Notice">Notice</option>
                                            <option value="Submission">Submission</option>
                                            <option value="Assessment Order">Assessment Order</option>
                                            <option value="Income Tax Return">Income Tax Return</option>
                                            <option value="Engagement Letter">Engagement Letter</option>
                                        </select>
                                        </div>
                                    </div>
                                </div> 
                                  
                                
                                <div class="form-group statutoryaudit" id="statutoryaudit" style="display:none">
                                    <label for="NameSurname" class="col-sm-2 control-label">Document Type</label>
                                    <div class="col-sm-10">
                                       <div class="form-line">
                                        <select class="form-control" name="documenttype" onchange="statutoryaudit(this.value)">
                                        	<option selected disabled value>SELECT A DOCUMENT TYPE</option> 
                                        	<option value="Confirmations">Confirmations</option>
                                        	<option value="General">General</option>
                                        	<option value="Minutes">Minutes</option>
                                        	<option value="Workpaper">Workpaper</option>
                                        	<option value="Financials">Financials</option>
                                            <option value="Engegement Letter">Engagement Letter</option>
                                        </select>
                                        </div>
                                    </div>
                                </div>
                               
                               <div class="form-group indirecttax" id="indirecttax" style="display:none">
                                    <label for="NameSurname" class="col-sm-2 control-label">Document Type</label>
                                    <div class="col-sm-10">
                                       <div class="form-line">
                                          <select class="form-control" name="documenttype" onchange="indirecttax(this.value)">
                                             <option selected disabled value>SELECT A DOCUMENT TYPE</option> 
                                        	 <option value="Challen">Challen</option>
                                        	 <option value="GSTR-1 Returns">GSTR-1 Returns</option>
                                        	 <option value="Invoice / Docs - Output">Invoice / Docs - Output</option>
                                        	 <option value="GSTR-3B Returns">GSTR-3B Returns</option>
                                        	 <option value="Input Detail/Docs/Invoices">Input Detail/Docs/Invoices</option>
                                        	 <option value="E-way Bill">E-way Bill</option>
                                        	 <option value="Refund Forms RFD OS/01A">Refund Forms RFD OS/01A</option>
                                        	 <option value="Debit / Credit Note">Debit / Credit Note</option>
                                          </select>
                                        </div>
                                    </div>
                                </div> 
                              
                              
                               <div class="form-group" id="finance_ &_accounts" style="display:none">
                                    <label for="NameSurname" class="col-sm-2 control-label">Document Type</label>
                                    <div class="col-sm-10">
                                       <div class="form-line">
                                          <select class="form-control" name="documenttype" onchange="finance_accounts(this.value)">
                                             <option selected disabled value>SELECT A DOCUMENT TYPE</option> 
                                        	 <option value="Audit Report">Audit Report</option>
                                        	 <option value="Balance Sheet">Balance Sheet</option>
                                        	 <option value="Other">Other</option>
                                          </select>
                                        </div>
                                    </div>
                                </div> 
                              
                               <div class="form-group" id="legal" style="display:none">
                                    <label for="NameSurname" class="col-sm-2 control-label">Document Type</label>
                                    <div class="col-sm-10">
                                       <div class="form-line">
                                          <select class="form-control" name="documenttype" onchange="legal(this.value)">
                                             <option selected disabled value>SELECT A DOCUMENT TYPE</option> 
                                        	 <option value="Contract">Contract</option>
                                        	 <option value="Other">Other</option>
                                        	 <option value="Registration">Registration</option>
                                          </select>
                                        </div>
                                    </div>
                                </div> 
                             
                              
                               <div class="form-group" id="people_hr" style="display:none">
                                    <label for="NameSurname" class="col-sm-2 control-label">Document Type</label>
                                    <div class="col-sm-10">
                                       <div class="form-line">
                                          <select class="form-control" name="documenttype" onchange="people_hr(this.value)">
                                             <option selected disabled value>SELECT A DOCUMENT TYPE</option> 
                                        	 <option value="Employee Documents">Employee Documents</option>
                                        	 <option value="Other">Other</option>
                                        	 <option value="Salary Regsiter">Salary Regsiter</option>
                                          </select>
                                        </div>
                                    </div>
                                </div> 
                              
                               <div class="form-group" id="sale" style="display:none">
                                    <label for="NameSurname" class="col-sm-2 control-label">Document Type</label>
                                    <div class="col-sm-10">
                                       <div class="form-line">
                                          <select class="form-control" name="documenttype" onchange="sale(this.value)">
                                             <option selected disabled value>SELECT A DOCUMENT TYPE</option> 
                                        	 <option value="Other">Other</option>
                                        	 <option value="Sale(Goods)">Sale(Goods)</option>
                                        	 <option value="Sale(Services)">Sale(Services)</option>
                                        	  <option value="Customer Registration">Customer Registration</option>
                                       
                                        	 
                                          </select>
                                        </div>
                                    </div>
                                </div> 
                              
                               <div class="form-group" id="purchase:service-ca/cs" style="display:none">
                                    <label for="NameSurname" class="col-sm-2 control-label">Document Type</label>
                                    <div class="col-sm-10">
                                       <div class="form-line">
                                          <select class="form-control" name="documenttype" onchange="purchaseservicecacs(this.value)">
                                             <option selected disabled value>SELECT A DOCUMENT TYPE</option> 
                                        	 <option value="Other">Other</option>
                                        	 <option value="Purchase(Goods)">Purchase(Goods)</option>
                                        	 <option value="Purchase(Services)">Purchase(Services)</option>
                                        	 <option value="Vendor Registration">Vendor Registration</option>
                                          </select>
                                        </div>
                                    </div>
                                </div> 
                              
                              
                                
                              <div id="humandiv" style="display:none"> 
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Employee Code</label>
                                    <div class="col-sm-10">
                                         <div class="form-line" style="text-decoration:underline">
                                             <input type='text' value="" name="employecode" id="employecode" class="form-control show-tick">
                                         </div>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Employee Name</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="" name="employename" id="employename" class="form-control">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Date Of Joining</label>
                                    <div class="col-sm-10">
                                         <div class="form-line" style="border-bottom:1px solid">
                                             <input type='date' value=""  name="joiningdate" id="joiningdate" class="form-control">
                                       </div>
                                    </div>
                                </div>
                             </div>
                                
                                <!-- start Vendor -->
                                <div id="vendordiv" style="display:none">
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Vendor Code</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="" name="vendorcode" id="vendorcode" class="form-control show-tick">
                                       </div>
                                    </div>
                                 </div>
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Vendor Name</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="" name="vendorname"  id="vendorname" class="form-control show-tick">
                                       </div>
                                    </div>
                                 </div>
                               </div> 
                                <!-- end vendor  -->
                             
                                <!-- purchase vendor -->
                               <div id="purchasediv" style="display:none">  
                                 
                                 
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Invoice Date:</label>
                                    
                                    <div class="col-md-1">
                                            <h2 style="font-size:12px;">From</h2>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="date" name="invoicedate"  id="invoicedate" value=""  class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-1">
                                            <h2 style="font-size:12px;">To</h2>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group form-float">
                                            <div class="form-line">
                                                <input type="date" name="invoicedateend" value="" class="form-control">
                                            </div>
                                        </div>
                                     </div>
                                </div>
                                
                                
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Invoice Number:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="" name="invoicenumber" id="invoicenumber" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Vendor Code:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text'  value="" name="vendorcodesec" id="vendorcodesec" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                               
                               <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Vendor Name:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="" name="vendornamesec" id="vendornamesec" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                             </div>  
                                <!-- purchase vendor -->
                                
                                
                                
                                <!-- start Sales & Marketing  -->
                              <div id="customerdiv" style="display:none">   
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Customer Code:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="" name="customercode" id="customercode" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Customer Name:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="" name="customername" id="customername" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                              </div> 
                              
                              <div id="salesdiv" style="display:none">   
                                
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Invoice Date:</label>
                                         <div class="col-md-1">
                                            <h2 style="font-size:12px;">From</h2>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                   <input type='date' value="" name="invoicedatesec" id="invoicedatesec" class="form-control show-tick">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-1">
                                            <h2 style="font-size:12px;">To</h2>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group form-float">
                                              <div class="form-line">
                                                 <input type="date" name="invoicedateendsec" value="" class="form-control">
                                              </div>
                                            </div>
                                        </div>
                                 </div>
                                
                                
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Invoice Number:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="" name="invoicenumbersec" id="invoicenumbersec" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Customer Code:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="" name="customercodesec" id="customercodesec" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Customer Name:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="" name="customernamesec"  id="customernamesec" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                              </div> 
                              
                                <div id="challeninner">
                              </div>
                              <div id="taxauditinner">
                              </div>
                              <div id="powerinner">
                              </div>
                              <div id="noticeinner">
                              </div>
                              <div id="submissioninner">
                              </div>
                              <div id="returninner">
                              </div>
                              <div id="assessmentinner">
                              </div>
                              <div id="engagementinner">
                              </div>
                              <div id="confirmationinner">
                              </div>
                              <div id="generalinner">
                              </div>
                              <div id="minutesinner">
                              </div>
                              <div id="workinner">
                              </div>
                              <div id="financialsinner">
                              </div>
                              <div id="engegementinner">
                              </div>
                              <div id="indirectchalleninner">
                              </div>
                              <div id="indirectgstrinner">
                              </div>
                              <div id="indirectinvoceinner">
                              </div>
                              <div id="gstr3returninner">
                              </div>
                              <div id="inputdetailinner">
                              </div>
                              <div id="ewaybillinner">
                              </div>
                              <div id="refundformsinner">
                              </div>
                              <div id="debit_creditinner">
                              </div>
                              <div id="audit_report">
                              </div>
                              <div id="balance_sheet">
                              </div>
                               <div id="other">
                              </div>
                            
                              <div id="salary_register">
                              </div>
                            
                               <div id="employee_documents">
                              </div>
                            
                            <div id="contract">
                              </div>
                              
                            <div id="registration">
                              </div>
                            
                            <div id="sale(services)">
                              </div>
                              
                            <div id="sale(goods)">
                              </div>
                            
                            <div id="purchase(goods)">
                              </div>
                              
                            <div id="purchase(services)">
                              </div>
                            
                            <div id="purchase(vendor_registration)">
                            </div>
                            
                            <div id="sale(customer_registration)">
                            </div>    
                              
                              
                                <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="text-align:center;"> 
                                                     <button type="submit" class="btn" style="width:120px;border:1px solid #6c757d;color: #f8fcff;background: #6c757d;">Submit</button>
                                                     <button type="reset" class="btn" style="width:120px;border:1px solid #6c757d;color: #f8fcff;background: #6c757d;">Reset</button>
                                                </div>
                                        </div>
                                 </form>
                           </div>
                     </div>
                </div>
            </div>
         
            <div class="row"  style="margin-right: -35px !important;margin-left: -156px !important;">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header  margin0">
                            <div class="row">
                                <div class="">
                                   
                                  <h2 class="col-md-4 col-lg-4 col-xs-12 pull-left">
                                        <div class="m-t-10">
                                             Document List
                                        </div>
                                   </h2>
                                </div>
                            </div>
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                               <table class="table table-hover" id="searchDocument">
                                <thead>
                                    <tr>
                                        <th>File No.</th>
                                        <th>File Name</th>
                                        <th>Department</th>
                                        <th>Doc. No.</th>
                                        <th>Doc. Type</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                               </tbody>
                            </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
         </div>
    </section>

  <%@include file="include/script.jsp" %>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <!-- <script src="https://cdn.datatables.net/buttons/1.6.0/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.0/js/buttons.flash.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.0/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.0/js/buttons.print.min.js"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    
    
    <script>
    
     function showdocument() {
    	  
    	 //$('.remove').remove();
    	 var x = document.getElementById("department").value;
    	 
    	  
    	  if(x == 'Purchase') {
    		  
    		  document.getElementById("purchase").style.display='block';
    		  document.getElementById("sales").style.display='none'; 
    		  document.getElementById("human").style.display='none';
    		  document.getElementById("humandiv").style.display='none';
    		  document.getElementById("purchasediv").style.display='none';
    		  document.getElementById("salesdiv").style.display='none';
    		  document.getElementById("customerdiv").style.display='none';
    		  document.getElementById("vendordiv").style.display='none';
    		  document.getElementById("people_hr").style.display='none';
    		  document.getElementById("finance_ &_accounts").style.display='none';
    		  document.getElementById("legal").style.display='none';
    		  document.getElementById("sale").style.display='none';
    		  document.getElementById("purchase:service-ca/cs").style.display='none';

    		  
    	  }else if(x === 'Hr') {
    		
    		  document.getElementById("purchase").style.display='none';
    		  document.getElementById("sales").style.display='none'; 
    		  document.getElementById("human").style.display='block';
    		  document.getElementById("humandiv").style.display='block';
    		  document.getElementById("purchasediv").style.display='none';
    		  document.getElementById("salesdiv").style.display='none';
    		  document.getElementById("customerdiv").style.display='none';
    		  document.getElementById("vendordiv").style.display='none';
    		  document.getElementById("people_hr").style.display='none';
    		  document.getElementById("finance_ &_accounts").style.display='none';
    		  document.getElementById("legal").style.display='none';
    		  document.getElementById("sale").style.display='none';
    		  document.getElementById("purchase:service-ca/cs").style.display='none';

    		  
    	  }else if(x == 'Sales') {
    		  
    		  document.getElementById("purchase").style.display='none';
    		  document.getElementById("sales").style.display='block'; 
    		  document.getElementById("human").style.display='none';
    		  document.getElementById("humandiv").style.display='none';
    		  document.getElementById("purchasediv").style.display='none';
    		  document.getElementById("salesdiv").style.display='none';
    		  document.getElementById("customerdiv").style.display='none';
    		  document.getElementById("vendordiv").style.display='none';
    		  document.getElementById("people_hr").style.display='none';
    		  document.getElementById("finance_ &_accounts").style.display='none';
    		  document.getElementById("legal").style.display='none';
    		  document.getElementById("sale").style.display='none';
    		  document.getElementById("purchase:service-ca/cs").style.display='none';

    		  
    	  }else if(x == 'Direct Tax'){
    		  
    		  document.getElementById("directtax").style.display='block';
      		  document.getElementById("indirecttax").style.display='none'; 
    		  document.getElementById("purchase").style.display='none';
    		  document.getElementById("sales").style.display='none'; 
    		  document.getElementById("human").style.display='none';
    		  document.getElementById("humandiv").style.display='none';
    		  document.getElementById("purchasediv").style.display='none';
    		  document.getElementById("salesdiv").style.display='none';
    		  document.getElementById("customerdiv").style.display='none';
    		  document.getElementById("vendordiv").style.display='none';
    		  document.getElementById("people_hr").style.display='none';
    		  document.getElementById("finance_ &_accounts").style.display='none';
    		  document.getElementById("legal").style.display='none';
    		  document.getElementById("sale").style.display='none';
    		  document.getElementById("purchase:service-ca/cs").style.display='none';
    	  
    		  
    		  
    	  }
    	  else if(x=='Statutory Audit') 
    	  {
    		
    		  document.getElementById("statutoryaudit").style.display='block';
    		  document.getElementById("directtax").style.display='none';
    		  document.getElementById("purchase").style.display='none';
    		  document.getElementById("sales").style.display='none'; 
    		  document.getElementById("human").style.display='none';
    		  document.getElementById("humandiv").style.display='none';
    		  document.getElementById("purchasediv").style.display='none';
    		  document.getElementById("salesdiv").style.display='none';
    		  document.getElementById("customerdiv").style.display='none';
    		  document.getElementById("vendordiv").style.display='none';
    		  document.getElementById("people_hr").style.display='none';
    		  document.getElementById("finance_ &_accounts").style.display='none';
    		  document.getElementById("legal").style.display='none';
    		  document.getElementById("sale").style.display='none';
    		  document.getElementById("purchase:service-ca/cs").style.display='none';
    		  document.getElementById("indirecttax").style.display='none';
    		  
     		  
    		  
    		  
    	  }
    	  else if(x=='Indirect Tax')
    	  {
    		  document.getElementById("indirecttax").style.display='block';
    		  document.getElementById("statutoryaudit").style.display='none';
    		  document.getElementById("directtax").style.display='none';
    		  document.getElementById("purchase").style.display='none';
    		  document.getElementById("sales").style.display='none'; 
    		  document.getElementById("human").style.display='none';
    		  document.getElementById("humandiv").style.display='none';
    		  document.getElementById("purchasediv").style.display='none';
    		  document.getElementById("salesdiv").style.display='none';
    		  document.getElementById("customerdiv").style.display='none';
    		  document.getElementById("vendordiv").style.display='none';
    		  document.getElementById("people_hr").style.display='none';
    		  document.getElementById("finance_ &_accounts").style.display='none';
    		  document.getElementById("legal").style.display='none';
    		  document.getElementById("sale").style.display='none';
    		  document.getElementById("purchase:service-ca/cs").style.display='none';
    		 	
    		  
    	  }else if(x=='Finance & Accounts:Services-CA/CS'){
    		  
    		  document.getElementById("indirecttax").style.display='none';
    		  document.getElementById("statutoryaudit").style.display='none';
    		  document.getElementById("directtax").style.display='none';
    		  document.getElementById("purchase").style.display='none';
    		  document.getElementById("sales").style.display='none'; 
    		  document.getElementById("human").style.display='none';
    		  document.getElementById("humandiv").style.display='none';
    		  document.getElementById("purchasediv").style.display='none';
    		  document.getElementById("salesdiv").style.display='none';
    		  document.getElementById("customerdiv").style.display='none';
    		  document.getElementById("vendordiv").style.display='none';
    		  document.getElementById("finance_ &_accounts").style.display='block';
    		  document.getElementById("people_hr").style.display='none';
    		  document.getElementById("legal").style.display='none';
    		  document.getElementById("sale").style.display='none';
    		  document.getElementById("purchase:service-ca/cs").style.display='none';
     		  
    		  
            }else if(x=='People & HR:Services-CA/CS'){
    		  
    		  document.getElementById("indirecttax").style.display='none';
    		  document.getElementById("statutoryaudit").style.display='none';
    		  document.getElementById("directtax").style.display='none';
    		  document.getElementById("purchase").style.display='none';
    		  document.getElementById("sales").style.display='none'; 
    		  document.getElementById("human").style.display='none';
    		  document.getElementById("humandiv").style.display='none';
    		  document.getElementById("purchasediv").style.display='none';
    		  document.getElementById("salesdiv").style.display='none';
    		  document.getElementById("customerdiv").style.display='none';
    		  document.getElementById("vendordiv").style.display='none';
    		  document.getElementById("finance_ &_accounts").style.display='none';
    		  document.getElementById("people_hr").style.display='block';
    		  document.getElementById("legal").style.display='none';
    		  document.getElementById("sale").style.display='none';
    		  document.getElementById("purchase:service-ca/cs").style.display='none';
    		  
    		  
            }else if(x=='Legal:Services-CA/CS'){
    		  
    		  document.getElementById("indirecttax").style.display='none';
    		  document.getElementById("statutoryaudit").style.display='none';
    		  document.getElementById("directtax").style.display='none';
    		  document.getElementById("purchase").style.display='none';
    		  document.getElementById("sales").style.display='none'; 
    		  document.getElementById("human").style.display='none';
    		  document.getElementById("humandiv").style.display='none';
    		  document.getElementById("purchasediv").style.display='none';
    		  document.getElementById("salesdiv").style.display='none';
    		  document.getElementById("customerdiv").style.display='none';
    		  document.getElementById("vendordiv").style.display='none';
    		  document.getElementById("finance_ &_accounts").style.display='none';
    		  document.getElementById("people_hr").style.display='none';
    		  document.getElementById("legal").style.display='block';
    		  document.getElementById("sale").style.display='none';
    		  document.getElementById("purchase:service-ca/cs").style.display='none';

    		  
            }else if(x=='Sale:Services-CA/CS'){
      		  
      		  document.getElementById("indirecttax").style.display='none';
      		  document.getElementById("statutoryaudit").style.display='none';
      		  document.getElementById("directtax").style.display='none';
      		  document.getElementById("purchase").style.display='none';
      		  document.getElementById("sales").style.display='none'; 
      		  document.getElementById("human").style.display='none';
      		  document.getElementById("humandiv").style.display='none';
      		  document.getElementById("purchasediv").style.display='none';
      		  document.getElementById("salesdiv").style.display='none';
      		  document.getElementById("customerdiv").style.display='none';
      		  document.getElementById("vendordiv").style.display='none';
      		  document.getElementById("finance_ &_accounts").style.display='none';
      		  document.getElementById("people_hr").style.display='none';
      		  document.getElementById("legal").style.display='none';
   		      document.getElementById("sale").style.display='none';
   		      document.getElementById("purchase:service-ca/cs").style.display='none';
      		  document.getElementById("sale").style.display='block';
            
            
            }else if(x=='Purchase:Services-CA/CS'){
        		  
        		  document.getElementById("indirecttax").style.display='none';
        		  document.getElementById("statutoryaudit").style.display='none';
        		  document.getElementById("directtax").style.display='none';
        		  document.getElementById("purchase").style.display='none';
        		  document.getElementById("sales").style.display='none'; 
        		  document.getElementById("human").style.display='none';
        		  document.getElementById("humandiv").style.display='none';
        		  document.getElementById("purchasediv").style.display='none';
        		  document.getElementById("salesdiv").style.display='none';
        		  document.getElementById("customerdiv").style.display='none';
        		  document.getElementById("vendordiv").style.display='none';
        		  document.getElementById("finance_ &_accounts").style.display='none';
        		  document.getElementById("people_hr").style.display='none';
        		  document.getElementById("legal").style.display='none';
        		  document.getElementById("sale").style.display='none';//
        		  document.getElementById("purchase:service-ca/cs").style.display='block';   
            
             }else if(x == 'Direct Tax:Services-CA/CS'){
      		  
            
              $('.directtax').show();
              $('.indirecttax').hide();
              $('.statutoryaudit').hide();
              document.getElementById("purchase").style.display='none';
      		  document.getElementById("sales").style.display='none'; 
      		  document.getElementById("human").style.display='none';
      		  document.getElementById("humandiv").style.display='none';
      		  document.getElementById("purchasediv").style.display='none';
      		  document.getElementById("salesdiv").style.display='none';
      		  document.getElementById("customerdiv").style.display='none';
      		  document.getElementById("vendordiv").style.display='none';
      		  document.getElementById("people_hr").style.display='none';
      		  document.getElementById("finance_ &_accounts").style.display='none';
      		  document.getElementById("legal").style.display='none';
      		  document.getElementById("sale").style.display='none';
      		  document.getElementById("purchase:service-ca/cs").style.display='none';
      		
      		  
      	  }else if(x=='Indirect Tax:Services-CA/CS'){
      		  
      		  
      		  
	      	  $('.directtax').hide();
	          $('.indirecttax').show();
	          $('.statutoryaudit').hide();
	          document.getElementById("purchase").style.display='none';
    		  document.getElementById("sales").style.display='none'; 
    		  document.getElementById("human").style.display='none';
    		  document.getElementById("humandiv").style.display='none';
    		  document.getElementById("purchasediv").style.display='none';
    		  document.getElementById("salesdiv").style.display='none';
    		  document.getElementById("customerdiv").style.display='none';
    		  document.getElementById("vendordiv").style.display='none';
    		  document.getElementById("people_hr").style.display='none';
    		  document.getElementById("finance_ &_accounts").style.display='none';
    		  document.getElementById("legal").style.display='none';
    		  document.getElementById("sale").style.display='none';
    		  document.getElementById("purchase:service-ca/cs").style.display='none';
    		  
    		  
    	  }else if(x=='Statutory Audit:Services-CA/CS'){
    		
    		  
    		  
    		  $('.directtax').hide();
	          $('.indirecttax').hide();
	          $('.statutoryaudit').show();
	          document.getElementById("purchase").style.display='none';
    		  document.getElementById("sales").style.display='none'; 
    		  document.getElementById("human").style.display='none';
    		  document.getElementById("humandiv").style.display='none';
    		  document.getElementById("purchasediv").style.display='none';
    		  document.getElementById("salesdiv").style.display='none';
    		  document.getElementById("customerdiv").style.display='none';
    		  document.getElementById("vendordiv").style.display='none';
    		  document.getElementById("people_hr").style.display='none';
    		  document.getElementById("finance_ &_accounts").style.display='none';
    		  document.getElementById("legal").style.display='none';
    		  document.getElementById("sale").style.display='none';
    		  document.getElementById("purchase:service-ca/cs").style.display='none';
   	    	  
    	  }
    	  
    	  
    	  
   }

     
     

    	function showform(data){
    		
    		if(data == 'Vendor Registration') {
    			
    			document.getElementById("customerdiv").style.display='none';
    			document.getElementById("salesdiv").style.display='none';
    			document.getElementById("humandiv").style.display='none';
    			document.getElementById("purchasediv").style.display='none';
    			document.getElementById("vendordiv").style.display='block';
    		
    		}else if(data == 'Purchase') {
    		
    			document.getElementById("customerdiv").style.display='none';
    			document.getElementById("salesdiv").style.display='none';
    			document.getElementById("humandiv").style.display='none';
    			document.getElementById("purchasediv").style.display='block';
    			document.getElementById("vendordiv").style.display='none';
    		}

    	}
    	
    	
    	
    	function salesmarketing(datas){
    		
    		if(datas == 'Customer Registration') {
    			
    			document.getElementById("customerdiv").style.display='block';
    			document.getElementById("salesdiv").style.display='none';
    			document.getElementById("humandiv").style.display='none';
    			document.getElementById("purchasediv").style.display='none';
    			document.getElementById("vendordiv").style.display='none';
    			
    		}
    		else if(datas =='Sales')
    	    {
    			document.getElementById("customerdiv").style.display='none';
    			document.getElementById("salesdiv").style.display='block';
    			document.getElementById("humandiv").style.display='none';
    			document.getElementById("purchasediv").style.display='none';
    			document.getElementById("vendordiv").style.display='none';
    			document.getElementById("human").style.display='none';
    			
    		}
    	}
    	
    	
    	
    
    	
    	
    	
    	 function directtaxdoc(datatax)
    	 {
    		 $('.remove').remove();
    		 if(datatax == 'Challen'){

    			 
    			 var field_name = ["Tax Type", "Challen Date", "Challen No.","Period/AM" ,"BSR Code"];
    	         var type=["text","date","text","text","number"];
    	         var name=["documentType1","documentType2","documentType3","documentType4","documentType5"];
    			 var challen="";
    			 for(var num=0;num<=field_name.length-1;num++)
    			 {
    				 challen +='<div class="form-group remove">'
    			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
    			     challen +='<div class="col-sm-10">'
    			     challen +='<div class="form-line">'
    			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
    		         challen +='</div>'
    			     challen +='</div>'
    			     challen +='</div>'
    			 }
    			 
    			  document.getElementById("challeninner").innerHTML=challen;
    		  
    		  }else if(datatax == 'Tax Audit Report'){
    			  
    			    
    			     var field_name = ["Financial Year", "Assessment Year", "Date","Membership No." ,"Firm Name/Reg No.","UDIN"];
    		         var type=["text","text","date","number","number","number"];
    		         var name=["documentType1","documentType2","documentType3","documentType4","documentType5","documentType6"];
    				 var challen="";
    				 for(var num=0;num<=field_name.length-1;num++)
    				 {
    					 challen +='<div class="form-group remove">'
    				     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
    				     challen +='<div class="col-sm-10">'
    				     challen +='<div class="form-line">'
    				     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
    			         challen +='</div>'
    				     challen +='</div>'
    				     challen +='</div>'
    				 }
    				 
    				document.getElementById("taxauditinner").innerHTML=challen;
    			  
    			  
    			  
    		  }else if(datatax == 'Power of Attorney'){
    			  
    			    
    			     var field_name = ["Date", "A4 / F4", "Authorization authority"];
    		         var type=["date","text","text"];
    		         var name=["documentType1","documentType2","documentType3"];
    				 var challen="";
    				 for(var num=0;num<=field_name.length-1;num++)
    				 {
    					 challen +='<div class="form-group remove">'
    				     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
    				     challen +='<div class="col-sm-10">'
    				     challen +='<div class="form-line">'
    				     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
    			         challen +='</div>'
    				     challen +='</div>'
    				     challen +='</div>'
    				 }
    				 document.getElementById("powerinner").innerHTML=challen;
    			  
    			  
    			  
    		  }else if(datatax == 'Notice'){
    			  
    			    
    			     var field_name = ["Financial Year", "Assessment Year", "Date","Section","DIN","CIN"];
    		         var type=["text","text","date","text","number","number"];
    		         var name=["documentType1","documentType2","documentType3","documentType4","documentType5","documentType6"];
    				 var challen="";
    				 for(var num=0;num<=field_name.length-1;num++)
    				 {
    					 challen +='<div class="form-group remove">'
    				     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
    				     challen +='<div class="col-sm-10">'
    				     challen +='<div class="form-line">'
    				     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
    			         challen +='</div>'
    				     challen +='</div>'
    				     challen +='</div>'
    				 }
    				 document.getElementById("noticeinner").innerHTML=challen;
    			  
    			  
    			  
    		  }else if(datatax == 'Submission'){
    			  
    			    
    			     var field_name = ["Financial Year", "Assessment Year", "Submission Date","Order Reference / Notice Reference"];
    		         var type=["text","text","date","text"];
    		         var name=["documentType1","documentType2","documentType3","documentType4"];
    				 var challen="";
    				 for(var num=0;num<=field_name.length-1;num++)
    				 {
    					 challen +='<div class="form-group remove">'
    				     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
    				     challen +='<div class="col-sm-10">'
    				     challen +='<div class="form-line">'
    				     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
    			         challen +='</div>'
    				     challen +='</div>'
    				     challen +='</div>'
    				 }
    				 document.getElementById("submissioninner").innerHTML=challen;
    			  
    			  
    			  
    		  }else if(datatax == 'Assessment Order'){
    			  
    			    
    			     var field_name = ["Financial Year", "Assessment Year", "Date","Section","Jurisdiction","Document Indentification No.(DIN)"];
    		         var type=["text","text","date","number","number","number"];
    		         var name=["documentType1","documentType2","documentType3","documentType4","documentType5","documentType6"];
    				 var challen="";
    				 for(var num=0;num<=field_name.length-1;num++)
    				 {
    					 challen +='<div class="form-group remove">'
    				     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
    				     challen +='<div class="col-sm-10">'
    				     challen +='<div class="form-line">'
    				     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
    			         challen +='</div>'
    				     challen +='</div>'
    				     challen +='</div>'
    				 }
    				 document.getElementById("assessmentinner").innerHTML=challen;
    			  
    			  
    			  
    		  }else if(datatax == 'Income Tax Return'){
    			  
    			    
    			     var field_name = ["Financial Year", "Assessment Year", "Date of Filling","ITR Form No/ACR.No"];
    		         var type=["text","text","date","text"];
    		         var name=["documentType1","documentType2","documentType3","documentType4"];
    				 var challen="";
    				 for(var num=0;num<=field_name.length-1;num++)
    				 {
    					 challen +='<div class="form-group remove">'
    				     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
    				     challen +='<div class="col-sm-10">'
    				     challen +='<div class="form-line">'
    				     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
    			         challen +='</div>'
    				     challen +='</div>'
    				     challen +='</div>'
    				 }
    				 document.getElementById("returninner").innerHTML=challen;
    			  
    			  
    			  
    		  }else if(datatax == 'Engagement Letter'){
    			  
    			    
    			     var field_name = ["Date", "Period", "Authorization"];
    		         var type=["date","text","text"];
    		         var name=["documentType1","documentType2","documentType3"];
    				 var challen="";
    				 for(var num=0;num<=field_name.length-1;num++)
    				 {
    					 challen +='<div class="form-group remove">'
    				     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
    				     challen +='<div class="col-sm-10">'
    				     challen +='<div class="form-line">'
    				     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
    			         challen +='</div>'
    				     challen +='</div>'
    				     challen +='</div>'
    				 }
    				 document.getElementById("engagementinner").innerHTML=challen;
    			  
    		  }
    	          
    	 }
    	 
    	 
    	 
    
    	 
    	 function statutoryaudit(dataaudit)
    	 {
    		 $('.remove').remove();
    		 if(dataaudit=='Confirmations')
    	     {
    			
    		     var field_name = ["Confirmation Type", "Company / Bank Name", "Date"];
    	         var type=["text","text","date"];
    	         var name=["documentType1" , "documentType2" , "documentType3"];
    			 var challen="";
    			 for(var num=0;num<=field_name.length-1;num++)
    			 {
    				 challen +='<div class="form-group remove">'
    			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
    			     challen +='<div class="col-sm-10">'
    			     challen +='<div class="form-line">'
    			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
    		         challen +='</div>'
    			     challen +='</div>'
    			     challen +='</div>'
    			 }
    			 document.getElementById("confirmationinner").innerHTML=challen;
    		
    			 
    	     }else if(dataaudit=='Minutes'){
    	    
    	         var field_name = ["Period", "Meeting Type", "Meeting Date"];
    	         var type=["text","text","date"];
    	         var name=["documentType1" , "documentType2" , "documentType3"];
    			 var challen="";
    			 for(var num=0;num<=field_name.length-1;num++)
    			 {
    				 challen +='<div class="form-group remove">'
    			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
    			     challen +='<div class="col-sm-10">'
    			     challen +='<div class="form-line">'
    			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
    		         challen +='</div>'
    			     challen +='</div>'
    			     challen +='</div>'
    			 }
    			 document.getElementById("minutesinner").innerHTML=challen;
    		
    	    	 
    	    	 
    	    	  
    	     }else if(dataaudit=='General'){
    	    
    	         var field_name = ["Name", "Description", "Date"];
    	         var type=["text","text","date"];
    	         var name=["documentType1" , "documentType2" , "documentType3"];
    			 var challen="";
    			 for(var num=0;num<=field_name.length-1;num++)
    			 {
    				 challen +='<div class="form-group remove">'
    			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
    			     challen +='<div class="col-sm-10">'
    			     challen +='<div class="form-line">'
    			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
    		         challen +='</div>'
    			     challen +='</div>'
    			     challen +='</div>'
    			 }
    			 document.getElementById("generalinner").innerHTML=challen;
    		
    	     }else if(dataaudit=='Workpaper'){
    	    
    	         var field_name = ["Audit Period", "Workpaper Name", "Description"];
    	         var type=["text","text","text"];
    	         var name=["documentType1" , "documentType2" , "documentType3"];
    			 var challen="";
    			 for(var num=0;num<=field_name.length-1;num++)
    			 {
    				 challen +='<div class="form-group remove">'
    			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
    			     challen +='<div class="col-sm-10">'
    			     challen +='<div class="form-line">'
    			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
    		         challen +='</div>'
    			     challen +='</div>'
    			     challen +='</div>'
    			 }
    			 document.getElementById("workinner").innerHTML=challen;
    		
    	     }else if(dataaudit=='Financials'){
    	    
    	         var field_name = ["Financial Year", "Signing Date", "UDIN"];
    	         var type=["text","date","number"];
    	         var name=["documentType1" , "documentType2" , "documentType3"];
    			 var challen="";
    			 for(var num=0;num<=field_name.length-1;num++)
    			 {
    				 challen +='<div class="form-group remove">'
    			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
    			     challen +='<div class="col-sm-10">'
    			     challen +='<div class="form-line">'
    			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
    		         challen +='</div>'
    			     challen +='</div>'
    			     challen +='</div>'
    			 }
    			 document.getElementById("financialsinner").innerHTML=challen;
    		
    	     }else if(dataaudit=='Engegement Letter'){
    	    
    	         var field_name = ["Date", "Period", "Authorization"];
    	         var type=["date","text","text"];
    	         var name=["documentType1" , "documentType2" , "documentType3"];
    			 var challen="";
    			 for(var num=0;num<=field_name.length-1;num++)
    			 {
    				 challen +='<div class="form-group remove">'
    			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
    			     challen +='<div class="col-sm-10">'
    			     challen +='<div class="form-line">'
    			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
    		         challen +='</div>'
    			     challen +='</div>'
    			     challen +='</div>'
    			 }
    			 document.getElementById("engegementinner").innerHTML=challen;
    		
    	     }
    		 
    	 }
    	 
    	 
    	 
    	 
    	 function indirecttax(dataindirect)
    	 {
    		 $('.remove').remove();
    		 if(dataindirect=='Challen')
    		 {
    		     
    		     var field_name = ["Tax Type", "Challen Date", "Challen No.","Period / A4 /F4","BSR code"];
    	         var type=["text","date","number","number","text"];
    	         var name=["documentType1" , "documentType2" , "documentType3","documentType4","documentType5"];
    			 var challen="";
    			 for(var num=0;num<=field_name.length-1;num++)
    			 {
    				 challen +='<div class="form-group remove">'
    			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
    			     challen +='<div class="col-sm-10">'
    			     challen +='<div class="form-line">'
    			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
    		         challen +='</div>'
    			     challen +='</div>'
    			     challen +='</div>'
    			 }
    			 document.getElementById("indirectchalleninner").innerHTML=challen;
    		
    	     }
    		 else if(dataindirect=='GSTR-1 Returns')
    		 {
    		     
    		     var field_name = ["Legal / Trade Name", "Month / Year", "GSTN","Authorization"];
    	         var type=["text","date","number","text"];
    	         var name=["documentType1" , "documentType2" , "documentType3","documentType4"];
    			 var challen="";
    			 for(var num=0;num<=field_name.length-1;num++)
    			 {
    				 challen +='<div class="form-group remove">'
    			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
    			     challen +='<div class="col-sm-10">'
    			     challen +='<div class="form-line">'
    			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
    		         challen +='</div>'
    			     challen +='</div>'
    			     challen +='</div>'
    			 }
    			 document.getElementById("indirectgstrinner").innerHTML=challen;
    		
    	     }else if(dataindirect=='Invoice / Docs - Output')
    		 
    	     {
    		     
    		     var field_name = ["Doc / Invoice No.", "Date", "GSTN","Name of Party"];
    	         var type=["text","date","number","text"];
    	         var name=["documentType1" , "documentType2" , "documentType3","documentType4"];
    			 var challen="";
    			 for(var num=0;num<=field_name.length-1;num++)
    			 {
    				 challen +='<div class="form-group remove">'
    			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
    			     challen +='<div class="col-sm-10">'
    			     challen +='<div class="form-line">'
    			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
    		         challen +='</div>'
    			     challen +='</div>'
    			     challen +='</div>'
    			 }
    			 document.getElementById("indirectinvoceinner").innerHTML=challen;
    		
    	     }else if(dataindirect=='GSTR-3B Returns')
    		 
    	     {
    		     
    		     var field_name = ["Legal / Trade Name", "Tax period", "GSTN","Authorized Sign"];
    	         var type=["text","date","number","text"];
    	         var name=["documentType1" , "documentType2" , "documentType3","documentType4"];
    			 var challen="";
    			 for(var num=0;num<=field_name.length-1;num++)
    			 {
    				 challen +='<div class="form-group remove">'
    			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
    			     challen +='<div class="col-sm-10">'
    			     challen +='<div class="form-line">'
    			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
    		         challen +='</div>'
    			     challen +='</div>'
    			     challen +='</div>'
    			 }
    			 document.getElementById("gstr3returninner").innerHTML=challen;
    		
    	     }else if(dataindirect=='Input Detail/Docs/Invoices')
    		 
    	     {
    		     
    		     var field_name = ["Invoice No.", "Date", "GSTN","Name of Party"];
    	         var type=["number","date","number","text"];
    	         var name=["documentType1" , "documentType2" , "documentType3","documentType4"];
    			 var challen="";
    			 for(var num=0;num<=field_name.length-1;num++)
    			 {
    				 challen +='<div class="form-group remove">'
    			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
    			     challen +='<div class="col-sm-10">'
    			     challen +='<div class="form-line">'
    			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
    		         challen +='</div>'
    			     challen +='</div>'
    			     challen +='</div>'
    			 }
    			 document.getElementById("inputdetailinner").innerHTML=challen;
    		
    	     }
    	     else if(dataindirect=='E-way Bill')
    		 {
    		     
    		     var field_name = ["E-way Bill No.", "Date of Generation", "Name of Generation","NSN Code","GSTN of Supplier","Vehicle No."];
    	         var type=["number","date","text","number","number","number"];
    	         var name=["documentType1" , "documentType2" , "documentType3","documentType4","documentType5","documentType6"];
    			 var challen="";
    			 for(var num=0;num<=field_name.length-1;num++)
    			 {
    				 challen +='<div class="form-group remove">'
    			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
    			     challen +='<div class="col-sm-10">'
    			     challen +='<div class="form-line">'
    			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
    		         challen +='</div>'
    			     challen +='</div>'
    			     challen +='</div>'
    			 }
    			 document.getElementById("ewaybillinner").innerHTML=challen;
    		
    	     }else if(dataindirect=='Refund Forms RFD OS/01A')
    		 {
    		     
    		     var field_name = ["Legal/Trade Name", "Tax Period", "GSTN","Authorized Sign"];
    	         var type=["text", "date" , "number" , "text"];
    	         var name=["documentType1" , "documentType2" , "documentType3","documentType4"];
    			 var challen="";
    			 for(var num=0;num<=field_name.length-1;num++)
    			 {
    				 challen +='<div class="form-group remove">'
    			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
    			     challen +='<div class="col-sm-10">'
    			     challen +='<div class="form-line">'
    			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
    		         challen +='</div>'
    			     challen +='</div>'
    			     challen +='</div>'
    			 }
    			 document.getElementById("refundformsinner").innerHTML=challen;
    		
    	     }
    	     else if(dataindirect=='Debit / Credit Note')
    		 {
    		     
    		     var field_name = ["GSTN Of Supplier", "Serial Number", "Date of Issue","Authorization"];
    	         var type=["number", "number" , "date" , "text"];
    	         var name=["documentType1" , "documentType2" , "documentType3","documentType4"];
    			 var challen="";
    			 for(var num=0;num<=field_name.length-1;num++)
    			 {
    				 challen +='<div class="form-group remove">'
    			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
    			     challen +='<div class="col-sm-10">'
    			     challen +='<div class="form-line">'
    			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
    		         challen +='</div>'
    			     challen +='</div>'
    			     challen +='</div>'
    			 }
    			 document.getElementById("debit_creditinner").innerHTML=challen;
    		
    		 }
    		 
    	  }	 
    	
    	</script>
        <script type="text/javascript">
         
        
        function finance_accounts(data){
   		 
        	$('.remove').remove();
    	    if(data =='Audit Report'){
 				
			     var field_name = ["Employee ID", "Employee Name", "Hiring Date"];
		         var type=["text","text","text"];
		         var name=["documentType1" , "documentType2" , "documentType3"];
		         var challen="";
  			 
		     for(var num=0;num<=field_name.length-1;num++)
  			 {
  				 challen +='<div class="form-group remove">'
  			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
  			     challen +='<div class="col-sm-10">'
  			     challen +='<div class="form-line">'
  			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
  		         challen +='</div>'
  			     challen +='</div>'
  			     challen +='</div>'
  			 }
  			  
  			 document.getElementById("audit_report").innerHTML=challen;
  	    		
			    
		   }else if(data =='Balance Sheet'){
				
			  var field_name = ["Financial Year", "Period" , "Description"];
			  var type=["text" , "text" , "text"];
			  var name=["documentType1" , "documentType2" , "documentType3"];
			  var challen="";
			 for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			  
			 document.getElementById("balance_sheet").innerHTML=challen;
	    		
			    
		   }else if(data =='Other'){
				
			   var field_name = ["Document Name", "Description"];
 		       var type=["text", "text"];
 		       var name=["documentType1" , "documentType2"];
 		       var challen="";
			 
		     for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			  
			 document.getElementById("other").innerHTML=challen;
	    		
			    
		   }

    }
        
        
     function people_hr(data){

    	   
    	$('.remove').remove();
 	    if(data =='Employee Documents'){
				
 	    	  var field_name = ["Employee ID", "Employee Name", "Hiring Date"];
	          var type=["text","text","text"];
	          var name=["documentType1" , "documentType2" , "documentType3"];
	          var challen="";
			 
		     for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			  
			 document.getElementById("employee_documents").innerHTML=challen;
	    		
			    
		   }else if(data =='Other'){
			
			 var field_name = ["Document Name", "Description"];
 		     var type=["text", "text"];
 		     var name=["documentType1" , "documentType2"];
 		     var challen="";
			 for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			  
			 document.getElementById("other").innerHTML=challen;
	    		
			    
		   }else if(data =='Salary Regsiter'){
		
			   
			   
			  var field_name = ["Period", "Description"];
		      var type=["text", "text"];
		      var name=["documentType1" , "documentType2"];
		     var challen="";
			 
		     for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			  
			 document.getElementById("salary_register").innerHTML=challen;
	      }

     }
     
     function legal(data){

     	$('.remove').remove();
 	    if(data =='Contract'){
			
 	    	
 	         var field_name = ["Contract Date", "Party" , "Description"];
	         var type=["date" , "text" , "text"];
	         var name=["documentType1" , "documentType2" , "documentType3"];
	     	 var challen="";
			 
		     for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			  
			 document.getElementById("contract").innerHTML=challen;
	    		
			    
		   }else if(data =='Other'){
			
			 var field_name = ["Document Name", "Description"];
 		     var type=["text", "text"];
 		     var name=["documentType1" , "documentType2"];
 		     var challen="";
			 for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			  
			 document.getElementById("other").innerHTML=challen;
	    		
			    
		   }else if(data =='Registration'){
		
			   
			 var field_name = ["Registration Type", "Registration Date" , "Description"];
		     var type=["text" , "date" , "text"];
		     var name=["documentType1" , "documentType2" , "documentType3"];
		     var challen="";
			 
		     for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			  
			 document.getElementById("registration").innerHTML=challen;
	      }
    	 
     }
       
     function sale(data){

      	$('.remove').remove();
      	
 	    if(data =='Sale(Goods)'){
			
 	    	
 	    	 var field_name = ["Invoice Date", "Invoice Number" , "Description" , "Customer Code" , "Customer Name"];
		     var type=["date" , "text" , "text" , "text" , "text" , "text"];
		     var name=["documentType1" , "documentType2" , "documentType3" , "documentType4" , "documentType5" , "documentType6"];
		       
	         var challen="";
			 for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			  
			 document.getElementById("sale(goods)").innerHTML=challen;
	    		
			    
		   }else if(data =='Other'){
			
			 var field_name = ["Document Name", "Description"];
 		     var type=["text", "text"];
 		     var name=["documentType1" , "documentType2"];
 		     var challen="";
			 for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			  
			 document.getElementById("other").innerHTML=challen;
	    		
			    
		   }else if(data =='Sale(Services)'){
		
			 
			 var field_name = ["Invoice Date", "Invoice Number" , "Description" , "Customer Code" , "Customer Name"];
		     var type=["date" , "text" , "text" , "text" , "text" , "text"];
		     var name=["documentType1" , "documentType2" , "documentType3" , "documentType4" , "documentType5" , "documentType6"];
		     var challen="";
			 
		     for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			  
			 document.getElementById("sale(services)").innerHTML=challen;
		   
		   }else if(data =='Customer Registration'){
				
				 
				 var field_name = ["Customer Code", "Customer Name"];
			     var type=["text" , "text"];
			     var name=["customercode" , "customername"];
			     var challen="";
				 
			     for(var num=0;num<=field_name.length-1;num++)
				 {
					 challen +='<div class="form-group remove">'
				     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
				     challen +='<div class="col-sm-10">'
				     challen +='<div class="form-line">'
				     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
			         challen +='</div>'
				     challen +='</div>'
				     challen +='</div>'
				 }
				  
				 document.getElementById("sale(customer_registration)").innerHTML=challen;
		      }	 
     
     }
     
     
     function purchaseservicecacs(data){
 
      	$('.remove').remove();
      	if(data =='Purchase(Goods)'){
			
 	    	
 	    	 var field_name = ["Invoice Date", "Invoice Number" , "Description" , "Vendor Code" , "Vendor Name" , "Voucher Number"];
	         var type=["date" , "text" , "text" , "text" , "text" , "text"];
	         var name=["documentType1" , "documentType2" , "documentType3" , "documentType4" , "documentType5" , "documentType6"];
	           
	         var challen="";
			 for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			  
			 document.getElementById("purchase(goods)").innerHTML=challen;
	    		
			    
		   }else if(data =='Other'){
			
			 var field_name = ["Document Name", "Description"];
 		     var type=["text", "text"];
 		     var name=["documentType1" , "documentType2"];
 		     var challen="";
			 for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			  
			 document.getElementById("other").innerHTML=challen;
	    		
			    
		   }else if(data =='Purchase(Services)'){
		
			
			 var field_name = ["Invoice Date", "Invoice Number" , "Description" , "Vendor Code" , "Vendor Name" , "Voucher Number"];
		     var type=["date" , "text" , "text" , "text" , "text" , "text"];
		     var name=["documentType1" , "documentType2" , "documentType3" , "documentType4" , "documentType5" , "documentType6"];
		     var challen="";
			 
		     for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			  
			 document.getElementById("purchase(services)").innerHTML=challen;
		   
		    }else if(data =='Vendor Registration'){
				
			   //, "Registration Date"
			   
		    	 var field_name = ["Vendor Code", "Vendor Name"];
			     var type=["text" , "text"];
			     var name=["vendorcode" , "vendorname"];
			     var challen="";
				 
			     for(var num=0;num<=field_name.length-1;num++)
				 {
					 challen +='<div class="form-group remove">'
				     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
				     challen +='<div class="col-sm-10">'
				     challen +='<div class="form-line">'
				     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
			         challen +='</div>'
				     challen +='</div>'
				     challen +='</div>'
				 }
		    	
		    	
		    	document.getElementById("purchase(vendor_registration)").innerHTML=challen;
	        
		    }
    	 
    	 
     }
       /* 
        $('#viewdocument').submit(function(e){
        
         e.preventDefault();
         $.ajax({
   	    	       url:"../clientprocess?action=clientviewdocumentfilter",
   	    	       type:"POST",
   	    	       dataType:"json",
   	    	       data:$("#viewdocument").serialize(),
   	    	       success:function(data,textStatus,jqXHR)
   	    	       {
   	    	    	            var obj = JSON.parse(data.data);
   	    	   	    	        console.log(obj);	
   	    	   	    	    	let html_data = 'No record found !';
   	    	   	    	    	let i=1;
   	    	   	    	    	$.each(obj, function( key, value ) {
   	    							html_data +='<tr>'; 
   	    							html_data+='<td>'+i+'</td>';
   	    						    html_data+='<td><a href="javascript:void(0);" onclick="openpage('+value.id+')">'+value.document_no+'</a></td>';
 	    	   	    	 	        html_data+='<td>'+value.upload_date+'</td>';
   	    	   	    	 		    html_data+='<td>'+value.document_size+'</td>';
   	    	   	    	 	        html_data+='<td><button type="button" class="btn btn-primary"  onclick="myFunction(this.value , '+value.id+')" value="'+value.document_no+'" target="_black"><i class="fa fa-star" aria-hidden="true"></i></i></button></td>';
   	    	   	    	 	        html_data +='</tr>';
	    	   	    	 	        i++;
   	    	                    });
   	    	   	    	    $('.tbody_data').html(html_data);
   	    	   	    	
   	    	   	    		 
   	    	      },
   	    	      error:function(e)
   	    	      {
   	    	    	  console.log("error in pages");
   	    	     }
   	       
   	      });
     });  */
         
         
        
        
        
        
        
        
        function openpage(id) {
        	 window.open('attachment.jsp?id='+id , '_blank');
         }
         
         /* function myFunction(star,id) {
               
             $.ajax({
       	            url: "../clientprocess?action=clientbookmarkupdate",
       	            type: "post",
       	            dataType:"json",
       	            data:{"id":id,"star":star},
       	            success: function(data)
       	            {
       	            	
       	               if(data.status)
       	               {
       	            	  Swal.fire({
	     	    			  position: 'center',
	     	    			  icon: 'success',
	     	    			  title: 'Star Success',
	     	    			  timer: 2000
	     	    			})
	     	    		   
       	               }
       	               else
       	               {
       	            	  Swal.fire({
	     	    			  position: 'top-end',
	     	    			  icon: 'warning',
	     	    			  title: 'Something is wrong',
	     	    			  timer: 2000
	     	    			})   
       	               }
       	              
       	             
       	           },
       	  	    error:function(e)
       	  	    {
       	  	    	console.log("error in pages");
       	  	    }
       	     }); 
       	  
       	}
  
   */
          
      
   
   
   $('#viewdocument').submit(function(e){
       e.preventDefault();
   
       
       
       var form=$(this);
       var formdata=new FormData($(form)[0]);
       var data={};
       formdata.forEach(function(value,key)
       {
    		  data[key]=value;
       }); 
       
       console.log(data);
       
       $('#searchDocument').DataTable().destroy();
       $('#searchDocument tbody').empty();
       $("#searchDocument").dataTable( {
   	    
   	     "lengthMenu":[25,50],
         "pageLength":25,
   		 "searching":false,
         "bProcessing": false,
         "bServerSide": false,
         "sort": "position",
          "ajax":{
        	   
        	   url:"../clientprocess?action=clientviewdocumentfilter",
   	  	       type:"POST",
   	  	       dataType:"json",
   	  	       data:data,
             },
             "aoColumns": [

           	   { "mData": "file_no" }, 
               { "mData": "file_name" },
               { "mData": "department" },
               { "mData": "document_no" },
               { "mData": "documenttype" },
               
           ]
       } ); 
           
       
       
    });  
   function notification(){
   	
   	
   	
   	$.ajax({
         	
     	    url:"../clientprocess?action=notification",
  	        type:"post",
  	        dataType:"json",
  	        success: function(data)
  	        {
  	        	
  	             console.log(data.notification);
  	             
  	             var obj = JSON.parse(JSON.stringify(data.notification));
	        	 var html_data ='<li class="header">NOTIFICATIONS</li>';
	             $.each(obj,  function( key, value ) {
	            	 html_data +='<ul class="menu" style="overflow:hidden">'
	            	 html_data +='<li>'
	                 html_data +='<a href="javascript:void(0);">'
	            	 html_data +='<div class="icon-circle bg-light-green">'
	                 if(value.image_upload){
	                	 html_data +='<img src="'+value.image_upload+'" width="35" height="40">'
	     	      	  }else{
	                	 html_data +='<img src="https://cdn.iconscout.com/icon/free/png-512/avatar-380-456332.png" alt="client_logo" width="35" height="35">'
	      	         }
	            	 //html_data +='<i class="material-icons">person_add</i>'
	                 html_data +='</div>'
	                 html_data +='<div class="menu-info">'
	                 html_data +='<h4>'+value.new_message+'</h4>'
	                 html_data +='<p>'+value.email+'</p>'
	                 html_data +='<p><i class="material-icons">access_time</i>'+value.date_time+'</p>'
	                 html_data +='</div>'
	                 html_data +='</a>'
	                 html_data +='</li>'
	                 html_data +='</ul>'
	            });
	             
	             console.log(html_data);
	             
	        	 $('.notification').html(html_data);
	             
           
  	        },
   	    error:function(e)
   	    {
   	         console.log("error in pages");
   	    }  
      
   }); 
   	
   	
 }
   
   
  
 setTimeout(notification , 3000); 
   
    
   
  
  
 </script> 
</body>
</html>
