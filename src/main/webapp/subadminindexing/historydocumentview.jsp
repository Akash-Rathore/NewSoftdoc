<%@include file="include/session.jsp" %>
<%@page import="java.io.File" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>    
<!DOCTYPE html>
<html>
<head>
    <%@include file="include/head.jsp"%>
     <link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" rel="stylesheet"/>
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
                            
                            <div class="row">
                                    
                             <%
                                        
                                     
                                       String file_no="";
                                       String document_no = "";
                                       try(Connection  connect=IndexingDBConnection.openConnection();PreparedStatement preparedStatement=connect.prepareStatement("SELECT questionone , remarks, questiontwo, questionthree, count(attachment_no)as count,customer_name,customer_code,invoice_date,date_of_joining,employee_code,employee_name,invoice_number,vendor_name,vendor_code,document_type,document_no,sum(size) as size, file_no, company_name, department, upload_date, documentType1 , documentType2 , documentType3 , documentType4 , documentType5 , documentType6 FROM customer_details, document_info WHERE document_info.company_id = customer_details.id AND document_info.id = '"+request.getParameter("id")+"' and history_indexing='history_indexing' and history_indexing is not null GROUP BY document_info.file_no");)
                                       {
                                       	  ResultSet resultset=preparedStatement.executeQuery();
                                          if(resultset.next())
                                           {
                                        	  
                                        	  document_no=resultset.getString("document_no");
                                        	  file_no=resultset.getString("file_no");
                                        	  
                                        	  
                                                                 %>
                                <div class="form-group">
                                   <label for="NameSurname" class="col-sm-2 control-label">Company Name:-</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type='text' value="<%=resultset.getString("company_name")%>"  class="form-control show-tick" readonly="readonly">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">File No:-</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type='text' value="<%=resultset.getString("file_no")%>" name="companyname"  class="form-control show-tick" readonly="readonly">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Document No:-</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type='text' value="<%=resultset.getString("document_no")%>"  class="form-control show-tick" readonly="readonly">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                   <label for="NameSurname" class="col-sm-2 control-label">Department:-</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type='text' value="<%=resultset.getString("department")%>"  class="form-control show-tick" readonly="readonly">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                   <label for="NameSurname" class="col-sm-2 control-label">Document Type:-</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type='text' value="<%=resultset.getString("document_type")%>"  class="form-control show-tick" readonly="readonly">
                                       </div>
                                    </div>
                                </div>
                                <%if(resultset.getString("department").equals("Purchase")&&resultset.getString("document_type").equals("Vendor Registration")){ %>
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Vendor Code</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type='text' value="<%=resultset.getString("vendor_code")%>" name="vendorcode" class="form-control show-tick" readonly="readonly">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Vendor Name</label>
                                    <div class="col-sm-10">
                                         <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("vendor_name")%>" name="vendorname" class="form-control show-tick" readonly="readonly">
                                         </div>
                                     </div>
                                 </div>
                            
                              <%}%>
                                <%if(resultset.getString("department").equals("Purchase")&&resultset.getString("document_type").equals("Purchase")){ %>
                                   <div class="form-group" >
                                    <label for="NameSurname" class="col-sm-2 control-label">Invoice Date:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("invoice_date")%>" name="invoicedate" class="form-control show-tick" readonly="readonly">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Invoice Number:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("invoice_number")%>" name="invoicenumber" class="form-control show-tick" readonly="readonly">
                                       </div>
                                    </div>
                                </div>
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Vendor Code:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("vendor_code")%>" name="vendorcode" class="form-control show-tick" readonly="readonly">
                                       </div>
                                    </div>
                                </div>
                                  <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Vendor Name:</label>
                                       <div class="col-sm-10">
                                         <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("vendor_name")%>" name="vendorname" class="form-control show-tick" readonly="readonly">
                                       </div>
                                    </div>
                                </div>
                                <%}%>
                              <%if(resultset.getString("department").equals("Hr")&&resultset.getString("document_type").equals("Employee OutBoarding")){ %>
                                 
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Employee Code</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type='text' value="<%=resultset.getString("employee_code")%>" name="employecode" class="form-control show-tick" readonly="readonly">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Employee Name</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type='text' value="<%=resultset.getString("employee_name")%>" name="employename" class="form-control show-tick" readonly="readonly">
                                       </div>
                                    </div>
                                </div>
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Date Of Joining</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type='text' value="<%=resultset.getString("date_of_joining")%>" name="joiningdate" class="form-control show-tick" readonly="readonly">
                                       </div>
                                    </div>
                                 </div>
                              
                              <%}%>
                               <%if(resultset.getString("department").equals("Sales")&&resultset.getString("document_type").equals("Customer Registration")){ %>
                                  <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Customer Code:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("customer_code")%>" name="customercode" class="form-control show-tick" readonly="readonly">
                                       </div>
                                    </div>
                                  </div>
                                 
                                  <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Customer Name:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("customer_name")%>" name="customername" class="form-control show-tick" readonly="readonly">
                                       </div>
                                    </div>
                                  </div>
                             <%}%>
                             <%if(resultset.getString("department").equals("Sales")&&resultset.getString("document_type").equals("Sales")){ %>
                               
                                  <div class="form-group" >
                                     <label for="NameSurname" class="col-sm-2 control-label">Invoice Date:</label>
                                     <div class="col-sm-10">
                                         <div class="form-line">
                                              <input type='date' value="<%=resultset.getString("invoice_date")%>" name="invoicedate" class="form-control show-tick" readonly="readonly">
                                        </div>
                                     </div>
                                 </div>
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Invoice Number:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("invoice_number")%>" name="invoicenumber" class="form-control show-tick" readonly="readonly">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Customer Code:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("customer_code")%>" name="customercode" class="form-control show-tick" readonly="readonly">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Customer Name:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("customer_name")%>" name="customername" class="form-control show-tick" readonly="readonly">
                                       </div>
                                    </div>
                                </div>
                             <%}%>
                             <%if(resultset.getString("department").equals("Direct Tax") && resultset.getString("document_type").equalsIgnoreCase("challen")){ %>
                           
                              
                               <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Tax Type</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Challen Date</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Challen No.</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Period/AM</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType4")%>" name="documentType4" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">BSR Code</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType5")%>" name="documentType5" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                           
                             <%}%>
                             
                              <%if(resultset.getString("department").equals("Direct Tax") && resultset.getString("document_type").equalsIgnoreCase("Tax Audit Report")){ %>
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Financial Year</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Assessment Year</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div><div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Date</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div><div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Membership No.</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType4")%>" name="documentType4" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div><div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Firm Name/Reg No.</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType5")%>" name="documentType5" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div><div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">UDIN</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType6")%>" name="documentType6" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                             <%}%>
                             
                             <%if(resultset.getString("department").equals("Direct Tax") && resultset.getString("document_type").equalsIgnoreCase("Power of Attorney")){ %>
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Date</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">A4 / F4</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Authorization authority</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                             <%} %>
                            
                             <%if(resultset.getString("department").equals("Direct Tax") && resultset.getString("document_type").equalsIgnoreCase("Notice")){ %>
                             
                                   
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Financial Year</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Assessment Year</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Date</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Section</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType4")%>" name="documentType4" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">DIN</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType5")%>" name="documentType5" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">CIN</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType6")%>" name="documentType6" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                     
                             
                             <%} %>
                             <%if(resultset.getString("department").equals("Direct Tax") && resultset.getString("document_type").equalsIgnoreCase("Submission")){ %>
                               
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Financial Year</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                               <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Assessment Year</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                               <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Submission Date</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                               <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Order Reference / Notice Reference</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType4")%>" name="documentType4" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                             <%} %>
                             <%if(resultset.getString("department").equals("Direct Tax") && resultset.getString("document_type").equalsIgnoreCase("Assessment Order")){ %>
                             
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Financial Year</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Assessment Year</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div><div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Date</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div><div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Section</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType4")%>" name="documentType4" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div><div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Jurisdiction</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType5")%>" name="documentType5" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div><div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Document Indentification No.(DIN)</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType6")%>" name="documentType6" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                             <%} %>
                              <%if(resultset.getString("department").equals("Direct Tax") && resultset.getString("document_type").equalsIgnoreCase("Income Tax Return")){ %>
                             
                             
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Financial Year</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Assessment Year</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Date of Filling</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">ITR Form No/ACR.No</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType4")%>" name="documentType4" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                             <%} %>
                             
                             <%if(resultset.getString("department").equals("Direct Tax") && resultset.getString("document_type").equalsIgnoreCase("Engagement Letter")){ %>
                                  
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Date</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Period</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Authorization</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                              
                             <%} %>
                            
                            
                            <%if(resultset.getString("department").equals("Statutory Audit") && resultset.getString("document_type").equalsIgnoreCase("Confirmations")){ %>
                             
                               <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Confirmation Type</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Company / Bank Name</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Date</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                             <%} %>
                             
                             <%if(resultset.getString("department").equals("Statutory Audit") && resultset.getString("document_type").equalsIgnoreCase("Minutes")){ %>
                                  <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Period</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                  
                                  <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Meeting Type</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                  
                                  <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Meeting Date</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                             <%} %>
                             
                              <%if(resultset.getString("department").equals("Statutory Audit") && resultset.getString("document_type").equalsIgnoreCase("General")){ %>
                                
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Name</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Description</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Date</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                              
                              <%} %> 
                             
                             <%if(resultset.getString("department").equals("Statutory Audit") && resultset.getString("document_type").equalsIgnoreCase("Workpaper")){ %>
                              
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Audit Period</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Workpaper Name</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Description</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                              
                              
                              <%}%>
                             
                             <%if(resultset.getString("department").equals("Statutory Audit") && resultset.getString("document_type").equalsIgnoreCase("Financials")){ %>
                             
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Financial Year</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                               <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Signing Date</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">UDIN</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                             
                             <%} %>
                             
                            <%if(resultset.getString("department").equals("Statutory Audit") && resultset.getString("document_type").equalsIgnoreCase("Engegement Letter")){ %>
                             
                                  <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Date</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                               
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Period</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                               
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Authorization</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                             <%} %>
                            <%if(resultset.getString("department").equals("Indirect Tax") && resultset.getString("document_type").equalsIgnoreCase("Challen")){ %>
                             
                             
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Authorization</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Challen Date</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                               <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Challen No.</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Period / A4 /F4</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType4")%>" name="documentType4" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">BSR code</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType5")%>" name="documentType5" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                             <%} %>
                             
                             <%if(resultset.getString("department").equals("Indirect Tax") && resultset.getString("document_type").equalsIgnoreCase("GSTR-1 Returns")){ %>
                               <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Legal / Trade Name</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Month / Year</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">GSTN</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Authorization</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType4")%>" name="documentType4" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                               <%} %> 
                               <%if(resultset.getString("department").equals("Indirect Tax") && resultset.getString("document_type").equalsIgnoreCase("Invoice / Docs - Output")){ %>
                                       
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Doc / Invoice No.</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Date</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">GSTN</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Name of Party</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType4")%>" name="documentType4" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                             <%} %>
                             <%if(resultset.getString("department").equals("Indirect Tax") && resultset.getString("document_type").equalsIgnoreCase("GSTR-3B Returns")){ %>
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Legal / Trade Name</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Tax Period</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">GSTN</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Authorized Sign</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType4")%>" name="documentType4" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                             <%} %>
                             <%if(resultset.getString("department").equals("Indirect Tax") && resultset.getString("document_type").equalsIgnoreCase("Input Detail/Docs/Invoices")){ %>
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Invoice No.</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Date</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">GSTN</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Name of Party</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType4")%>" name="documentType4" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                             <%} %>
                               
                             <%if(resultset.getString("department").equals("Indirect Tax") && resultset.getString("document_type").equalsIgnoreCase("E-way Bill")){ %>
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">E-way Bill No.</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Date of Generation</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Name of Generation</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">NSN Code</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType4")%>" name="documentType4" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">GSTN of Supplier</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType5")%>" name="documentType5" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div><div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Vehicle No.</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType6")%>" name="documentType6" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                             <%} %>
                             
                             <%if(resultset.getString("department").equals("Indirect Tax") && resultset.getString("document_type").equalsIgnoreCase("Refund Forms RFD OS/01A")){ %>
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">GSTN of Supplier</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Serial Number</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Date of Issue</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Authorization</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType4")%>" name="documentType4" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                             <%} %>
                             
                             <%if(resultset.getString("department").equals("Indirect Tax") && resultset.getString("document_type").equalsIgnoreCase("Refund Forms RFD OS/01A")){ %>
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Legal/Trade Name</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Tax Period</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">GSTN</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Authorized Sign</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType4")%>" name="documentType4" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                             <%} %>
                             
                             
                             <%if(resultset.getString("department").equals("Indirect Tax") && resultset.getString("document_type").equalsIgnoreCase("Debit / Credit Note")){ %>
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">GSTN of Supplier</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Serial Number</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Date of Issue</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Authorization</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType4")%>" name="documentType4" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                             <%} %>
                            </div>
                                      <%
                                      	}
                                                                     }
                                                                    catch(SQLException sqlexception )
                                                                    {
                                                                  	  sqlexception.printStackTrace();
                                                                    }
                                                                    catch(Exception exception)
                                                                    {
                                                                  	  exception.printStackTrace();
                                                                    }
                                      %>
                            
                            <div class="table-responsive">
                                <table class="table table-hover" id="myTable">
                                <thead>
                                    <tr>
                                         <th>Document No. </th>
                                         <th>Department</th>
                                         <th>Date</th>
                                         <!-- <th>Edit</th> -->
                                    </tr>
                                </thead>
                                <tbody>
                             <%
                                                 try(Connection  connect=IndexingDBConnection.openConnection(); PreparedStatement preparedStatement=connect.prepareStatement("SELECT * FROM `document_info` WHERE  document_no = '"+document_no+"' and file_no='"+file_no+"' and history_indexing='history_indexing' and history_indexing is not null");)
                                                                                            {
                                                                                                 ResultSet resultset=preparedStatement.executeQuery();
                                                                                                 while(resultset.next())
                                                                                                 {
                                                             %>
                                       <tr>
                                            <td><%=resultset.getString("attachment_no")%></td>
                                            <td><%=resultset.getString("department")%></td>
                                             <%
                                                 final String OLD_FORMAT = "yyyy-MM-dd hh:mm:ss";
      			                                 final String NEW_FORMAT = "dd MMM yyyy";
      			                                 SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
                                                 Date d = sdf.parse(resultset.getString("upload_date"));
                             			         sdf.applyPattern(NEW_FORMAT);
                             			         String upload_date = sdf.format(d);
                                             %>
                                             <td><%=upload_date%></td>
                                       </tr>
                                    	
                                    	
                                    	<%
                                        
                                    }
                               }
                              catch(SQLException sqlexception )
                              {
                            	  sqlexception.printStackTrace();
                              }
                              catch(Exception exception)
                              {
                            	  exception.printStackTrace();
                              }
                             %> 
                                
                                
                                </tbody>
                                </table>
                            </div>   
                            <div class="row">
                                <center>
                                     
                                 <%--       <button type="button" class="btn btn-success" id="btnclick" data-id="<%=file_no%>">Send to Quality Team</button>
                                  --%>  
                                </center>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
   <%@include file="include/script.jsp"%>
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
   <script type="text/javascript">
   
   
   
     $("#btnclick").click(function(){    
    	
  	  
  	   let id=$(this).data('id'); 
  	  
  	   console.log(id);
  	   $.ajax({
           
  		    url: "../indexingprocess?action=indexingupdatequality&id="+id,
            dataType:"json",
            type: "post",
            success: function(data)
            {
              if(data.status)
  	          {
   	    		
   	          	Swal.fire({
   	    			  position: 'top-end',
   	    			  icon: 'success',
   	    			  title: 'To send Document to Quality Team',
   	    			  showConfirmButton: false,
   	    			  timer: 3500
   	    			})
   	    		  setTimeout(function() {
   	    	       window.location.href = "indexing.jsp"
   	    	      }, 3500);
   	    			
   	    	      //setTimeout(function(){location.reload();},3500);
   	    			
   	    	  }
  	    	  else 
  	    	  {
  	    		   Swal.fire({
  	    			  icon:'error',
  	    			  title:'Some thing is wrong',
  	    			  text:"wrong",
  	    			  footer:'',
  	    			  timer:3000
  	    			}) 
  	    	  } 
             
           },
  	    error:function(e)
  	    {
  	    	console.log("error in pages");
  	    }
        }); 
   });
    
   </script>
   <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
   <script>
    $(document).ready( function () {
	     $('#myTable').DataTable({
	    	 "searching":false,
             "lengthMenu":[25,50],
             "pageLength":25
	     });
    } );
  </script>
   
 </body>
</html>
