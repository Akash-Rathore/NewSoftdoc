<%@page import="com.customerclient.connection.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet" %>
<%@include file="include/session.jsp" %>
<%@page import="java.io.File" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
      <%@include file="include/head.jsp"%>    
      <link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" rel="stylesheet"/>
      <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
      <style>
        .loader{
            display:none;
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
                <a class="image" href="index.jsp"><img src="../images/logo5.png" class="logoClient" alt="User" /></a>
            </div>
            <div class="collapse navbar-collapse" id="navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <!-- Notifications -->
                       <%@include file="include/notification.jsp" %>
                    <!-- Notifications -->                    
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
                   My Document
                </h2>
            </div>
           
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                <a href="filenumber.jsp?id=<%=request.getParameter("id")%>"  class="btn btn-primary">Back</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;       Document
                            </h2>
                        </div>
                       
                     <form   class="form-horizontal form-submit">
                       
                        <div class="body">
                       
                            <div class="row">
                             <%
                                    try(Connection  connect=DBConnection.openConnection();PreparedStatement preparedStatement=connect.prepareStatement("SELECT attachment_no , document_info.id as id , count(attachment_no)as count , customeradmincode ,customer_name,customer_code,invoice_date,date_of_joining,employee_code,employee_name,invoice_number,vendor_name,vendor_code,document_type,document_no,sum(size) as size, file_no, company_name, department, upload_date ,documentType1,documentType2,documentType3,documentType4,documentType5 , documentType6 FROM customer_details, document_info WHERE document_info.company_id = customer_details.id  AND  document_info.file_no =(select file_no from document_info where id='"+request.getParameter("id")+"') AND document_info.document_no =(select document_no from document_info where id='"+request.getParameter("id")+"') and trash='0' and folder_status='folder'");)
                                    {
                                         ResultSet resultset=preparedStatement.executeQuery();
                                              if(resultset.next())
                                              {
                                                     
                           %>
                             
                             
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Company Name:-</label>
                                    <div class="col-sm-10">
                                          <input type='text' value="<%=resultset.getString("company_name")%>" name="companyname" class="form-control show-tick" readonly="readonly">
                                          <input type='hidden' value="<%=resultset.getInt("id")%>" name="document_info_id">
                                          <input type='hidden' value="<%=resultset.getString("customeradmincode")%>"  name="customer_code">
                                          <input type='hidden' value="<%=resultset.getString("count")%>"  name="attachment_no">
                                          
                                    </div>
                                </div>
                                <div class="form-group">
                                      <label for="NameSurname" class="col-sm-2 control-label">File No:-</label>
                                         <div class="col-sm-10">
                                             <input type='text' value="<%=resultset.getString("file_no")%>" name="companyname" class="form-control show-tick" readonly="readonly">
                                         </div>
                                </div>
                               
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Document No:-</label>
                                    <div class="col-sm-10">
                                           <input type='text' value="<%=resultset.getString("document_no")%>" name="companyname" class="form-control show-tick" readonly="readonly">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Department:-</label>
                                       <div class="col-sm-10">
                                          <input type='text' value="<%=resultset.getString("department")%>" name="companyname" class="form-control show-tick" readonly="readonly">
                                      </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Document Type:-</label>
                                    <div class="col-sm-10">
                                        <input type='text' value="<%=resultset.getString("document_type")%>" name="companyname" class="form-control show-tick" readonly="readonly">
                                    </div>
                                </div>
                              </div>  
                             <div class="row">
                                 <%if(resultset.getString("department").equals("Purchase")&&resultset.getString("document_type").equals("Vendor Registration")){ %>
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Vendor Code</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type='text' value="<%=resultset.getString("vendor_code")%>" name="vendorcode" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Vendor Name</label>
                                    <div class="col-sm-10">
                                         <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("vendor_name")%>" name="vendorname" class="form-control show-tick">
                                         </div>
                                     </div>
                                 </div>
                               
                                 <%}%>
                                 
                                <%if(resultset.getString("department").equals("Purchase")&&resultset.getString("document_type").equals("Purchase")){ %>
                               
                                     <div class="form-group" >
                                    <label for="NameSurname" class="col-sm-2 control-label">Invoice Date:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("invoice_date")%>" name="invoicedate" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Invoice Number:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("invoice_number")%>" name="invoicenumber" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Vendor Code:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("vendor_code")%>" name="vendorcode" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                  <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Vendor Name:</label>
                                       <div class="col-sm-10">
                                         <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("vendor_name")%>" name="vendorname" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                   
                                <%}%>
                                <%if(resultset.getString("department").equals("Hr")&&resultset.getString("document_type").equals("Employee OutBoarding")){ %>
                                 
                                 
                                  <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Employee Code</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type='text' value="<%=resultset.getString("employee_code")%>" name="employecode" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Employee Name</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type='text' value="<%=resultset.getString("employee_name")%>" name="employename" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Date Of Joining</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type='text' value="<%=resultset.getString("date_of_joining")%>" name="joiningdate" class="form-control show-tick" >
                                       </div>
                                    </div>
                                 </div>
                               
                               
                                <%}%>
                                <%if(resultset.getString("department").equals("Sales")&&resultset.getString("document_type").equals("Customer Registration")){ %>
                           
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Customer Code:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("customer_code")%>" name="customercode" class="form-control show-tick">
                                       </div>
                                    </div>
                                  </div>
                                 
                                  <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Customer Name:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("customer_name")%>" name="customername" class="form-control show-tick">
                                       </div>
                                    </div>
                                  </div>
                           
                                <%}%>
                                 
                           
                              <%if(resultset.getString("department").equals("Sales")&&resultset.getString("document_type").equals("Sales")){ %>
                               
                                  <div class="form-group" >
                                     <label for="NameSurname" class="col-sm-2 control-label">Invoice Date:</label>
                                     <div class="col-sm-10">
                                         <div class="form-line">
                                              <input type='date' value="<%=resultset.getString("invoice_date")%>" name="invoicedate" class="form-control show-tick">
                                        </div>
                                     </div>
                                 </div>
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Invoice Number:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("invoice_number")%>" name="invoicenumber" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Customer Code:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("customer_code")%>" name="customercode" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Customer Name:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("customer_name")%>" name="customername" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                
                             <%}%>
                                  <%if(resultset.getString("department").equals("Direct Tax") && resultset.getString("document_type").equalsIgnoreCase("Challen")){ %>
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
                                </div><div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Challen No.</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div><div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Period/AM</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType4")%>" name="documentType4" class="form-control show-tick">
                                       </div>
                                    </div>
                                    
                                </div><div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">BSR Code</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType5")%>" name="documentType5" class="form-control show-tick">
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
                          
                            
                            
                           
                                 <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Select Option<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <select class="form-control show-tick" id="status_document" name="document_status"  onchange="statuschange(this.value)">
                                                 <option value="">Select</option>
                                                 <option value="update_document">Update Document</option>
                                                 <option value="add_attachment">Add Attachment</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                   <label for="NameSurname" class="col-sm-2 control-label">Attachment Upload</label>
                                      <div class="col-sm-8 table-responsive add_attchment">
                                         <table class="table table-bordered table-hover" id="documentuploading">
                                           <thead>
                                 
                                          </thead>
                                         <tbody>
                                        </tbody>
                                        </table>
                                 </div>
                                 
                                 <!-- <div class="col-sm-1">
                                     
                                      <br>
                                      <button   type="submit"   class="btn btn-success">Save Changes</button><br>
                                      <div class="loader">
                                          <img src="../images/loader.gif"  style="float: left;width: 50px;height:50px;"> 
                                     </div> 
                                </div> -->    
                         </div>    
                         <div class="row">
                         
                                <div class="col-md-8"></div>
                         
                                <div class="col-md-2">
                                   <div class="add_attchment">
                                         <button id="addmore" class="btn btn-primary btn-sm addmore" type="button"> Add Attachment </button>
                                    </div> 
                                </div>
                                <div class="col-md-2">
                                    <button   type="submit"   class="btn btn-success">Save Changes</button><br>
                                      <div class="loader">
                                          <img src="../images/loader.gif"  style="float: left;width: 50px;height:50px;"> 
                                     </div>
                                </div>
                          </div>
                       </div> 
                    </form>
                      
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
                                         <th>Attachment No.</th>
                                         <th>Attachment Name</th>
                                         <th>Department</th>
                                         <th>Time</th>
                                         <th>Delete Attachment</th>
                                         <th>Hit</th>
                                    </tr>
                                </thead>
                                <tbody>
                             <%
                             try(Connection  connect=DBConnection.openConnection();PreparedStatement preparedStatement=connect.prepareStatement("SELECT * FROM `document_info` WHERE document_no =(select document_no from document_info where id='"+request.getParameter("id")+"') and file_no=(select file_no from document_info where id='"+request.getParameter("id")+"') and folder_status='folder' and trash='0'");)
                             {
                                ResultSet resultset=preparedStatement.executeQuery();
                                int i=1;
                                while(resultset.next())
                                {
                                     %>
                                       <tr>
                                            <td><a href="<%=resultset.getString("file")%>"><%=resultset.getString("attachment_no")%></a></td>
                                            <%
                                             
                                             File file = new File(resultset.getString("file"));
                                             String fileName=file.getName();
                                             String file_name="";
                                             for (int j=0; j<=fileName.length()-1; j++) {  
                                            if(fileName.charAt(j) == '?'){
                                   
                                                  break;
                                         
                                            }
                                            else
                                            {
                                              file_name =file_name+fileName.charAt(j);
                                            }
                                   
                                     }
                                            %>
                                            <td><%=file_name%></td>
                                            <td>
                                                <%=resultset.getString("department")%>
                                            </td>
                                    <%
                                       final String OLD_FORMAT = "yyyy-MM-dd hh:mm:ss";
                                       final String NEW_FORMAT = "dd MMM yyyy";
                                       SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
                                       Date d = sdf.parse(resultset.getString("upload_date"));
                                       sdf.applyPattern(NEW_FORMAT);
                                       String newDateString = sdf.format(d);
                                    %>
                                           <td><%=newDateString%></td>
                                             <td>
                                                 <button type="button" class="btn btn-primary delete"   data-file='<%=resultset.getString("file")%>' data-what='<%=resultset.getString("document_no")%>' data-id="<%=resultset.getInt("id")%>">Delete</button>
                                             </td>
                                           <td><%=resultset.getInt("hit")%></td>
                                       </tr>
                                   <%
                                       i++;                  
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
                           </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
   <%@include file="include/script.jsp"%>
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script> 
   <script src="include/custom-script.js"></script>  
   <script type="text/javascript">
  
   
   
   function statuschange(statuschnage) {

	   if(statuschnage == 'update_document'){
		     $('.add_attchment').hide();
	   }else{
		    $('.add_attchment').show();
	   }
	   
   }
   
  
      
         $(".delete").click(function(){    
    		      //===================confirmation=====================
    		   Swal.fire({
    		     title: 'Are you sure?',
    		     text: "You will not be able to revert this action.",
    		     icon: 'warning',
    		     showCancelButton: true,
    		     cancelButtonText: 'No',
    		     confirmButtonColor: '#3085d6',
    		     cancelButtonColor: '#d33',
    		     confirmButtonText: 'Yes'
    		    }).then((result) => {
    		     if (result.value) {
    		      let element = $(this);
    		     
    		      var id=$(this).data('id');
    		      
    		      $.ajax({
    		               url: "../clientprocess?action=deletedocument",
    		               dataType:"json",
    		               type: "post",
    		               data:{"file_no":$(this).data('what'),"file":$(this).data('file'),"id":$(this).data('id')},
    		               success: function(data)
    		               {
    		                 
    		                 if(data.status)
    		               {
    		         
    		                Swal.fire({
    		                position: 'top-end',
    		                icon: 'success',
    		                title: 'Delete Document',
    		                showConfirmButton: false,
    		                timer: 3500
    		                  })
    		             
    		             $(element).parents('tr').remove();
    		             
    		                var location_id = window.location.href;
    	 	    		    var res = location_id.split("=");
    	 	    		    var  doc = res[1];
    	                    setTimeout(function(){
    		     	    		 window.location.href="filenumber.jsp?id="+doc;
    		     	        })	
    	                      
        		                
    		                
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
    		      }
    		    })
    		   
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
  
  <script>
  
  var i=$('table#documentuploading tr').length;
  
  $("#addmore").on('click',function(){
   html = '<tr>';
   html+= '<td><input class="case" type="checkbox" id="checkmark"/></td>'; 
   html+= '<td><input type="file" name="multidocument['+i+']"></td>';
   html+= '<td><button class="delete-appended-row btn btn-danger" type="button">Remove Attachment</button></td>';
   html+= '</tr>';
   $('table#documentuploading').append(html);
   i++;
 });
  
  $(document).on('click','.delete-appended-row',function(){
 		 $(this).parent().parent().remove();
  });
    
  
  
    
  
  
  
  $(document).on('submit', '.form-submit', function (e) {
	    
	     
      event.preventDefault();
      var form = $('.form-submit')[0];
      var data = new FormData(form);
     
      var status_document=$("#status_document").val();
        
       
      
      if(status_document=='')
      {
 		 error('Please  Select Option');
 		 return false;
 	  }
      
      
      $.ajax({
    	  
          type: "POST",
          enctype: 'multipart/form-data',
          url: "../clientprocess?action=updatefolderdocument",
          data: data,
          processData: false,
          contentType: false,
          cache: false,
          timeout: 600000,
          beforeSend:function(){
 	    	   
	  	    	 $('.loader').show();
	  	       
	  	  },
          success: function (data){

             var result = JSON.parse(data);
             console.log(result);
             if(result.status)
             {
               Swal.fire({
                position: 'center',
                icon: 'success',
                title: 'Document Updated',
                timer: 3500
              })   
             $('.loader').hide();
               
             var location_id = window.location.href;
    		 var res = location_id.split("=");
    		 var  doc = res[1];
             setTimeout(function(){
    	    		 window.location.href="folder.jsp?id="+doc;
    	     }) 
               
   	     	  
            
           }
           else
          {
              Swal.fire({
              icon:'error',
              title:'Attachment Missing',
              text:"wrong",
              footer:'',
              timer:3000
              })
             
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
             console.log("ERROR : ", e);
             
          }
       });
	  
 });

  </script>
  </body>
</html>
