<%@include file="include/session.jsp" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%> 
<%@ page import="com.customerclient.connection.DBConnection"%>
<%@ page import="java.io.File"%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="include/head.jsp"%>       
    <link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" rel="stylesheet"/>

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
            <%@include file="include/leftsidebar.jsp" %>
        <!-- #END# Left Sidebar -->
    </section>
    <section class="content">
        <div class="container-fluid">
            <div class="block-header">
                <h2>
                    Document
                </h2>
            </div>
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                Document Readonly
                            </h2>
                           
                        </div>
                        <div class="body mrgnbtm">
                            <form  class="form-horizontal" >
                               <%
                                   
                                  	try(Connection connect=DBConnection.openConnection();PreparedStatement preparedStat=connect.prepareStatement("select * from document_info where id='"+request.getParameter("id")+"' and status='quality_approved'");)
                                    {
                                             ResultSet resultset=preparedStat.executeQuery();
                                             if(resultset.next()){
                                  	   
                                %> 
                           
                              <!--start document_information  -->
                                  <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Softdoc File No.</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                           <input type='text' value="<%=resultset.getString("file_no")%>" name="" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Department</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                           <input type='text' value="<%=resultset.getString("department")%>" name="" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Softdoc Document No.</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                           <input type='text' value="<%=resultset.getString("document_no")%>" name="" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Document Type</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                           <input type='text' value="<%=resultset.getString("document_type")%>" name="" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                  <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Upload Date</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                        <%
                                     	  final String OLD_FORMAT = "yyyy-MM-dd hh:mm:ss";
                             			  final String NEW_FORMAT = "dd MMM yyyy";
                             			  SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
                                          Date d = sdf.parse(resultset.getString("upload_date"));
                             			  sdf.applyPattern(NEW_FORMAT);
                             			  String newDateString = sdf.format(d);
                                      %>
                                           <input type='text' value="<%=newDateString%>" name="" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <!--end document_information  -->
                                <div class="row"><center><strong><h5>Indexing Information</h5></strong></center></div>
                                
                          <!--==================================================start of Hr==================================  -->
                          <%if(resultset.getString("department").equals("Hr")){ %>  
                                
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Employee Code</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                           <input type='text' value="<%=resultset.getString("employee_code")%>" name="employecode" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Employee Name</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("employee_name")%>" name="employename" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Date Of Joining</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("date_of_joining")%>" name="joiningdate" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                              <%} %>
                       <!--==================================================end of Hr==================================  -->
                           <%if(resultset.getString("department").equals("Purchase")&&resultset.getString("document_type").equals("Vendor Registration")){ %>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Vendor Code</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">	
                                            <input type='text' value="<%=resultset.getString("vendor_code")%>" name="vendorcode" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Vendor Name</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("vendor_name")%>" name="vendorname" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                              <% } %>
                              
                              <%if(resultset.getString("department").equals("Purchase")&&resultset.getString("document_type").equals("Purchase")){ %>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Invoice Date:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("invoice_date")%>" name="invoicedate" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Invoice Number:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("invoice_number")%>" name="invoicenumber" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Vendor Code:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("vendor_code")%>" name="vendorcode" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Vendor Name:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("vendor_name")%>" name="vendorname" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <%} %>
                            
                            <%if(resultset.getString("department").equals("Sales")&&resultset.getString("document_type").equals("Customer Registration")){ %>
                                 <div class="form-group">
                                     <label for="NameSurname" class="col-sm-2 control-label">Customer Code:</label>
                                     <div class="col-sm-10">
                                        <div class="form-line">
                                              <input type='text' value="<%=resultset.getString("customer_code")%>" name="customercode" class="form-control show-tick" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Customer Name:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("customer_name")%>" name="customername" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <%} %>
                            
                            <%if(resultset.getString("department").equals("Sales")&&resultset.getString("document_type").equals("Sales")){ %>
                               
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Invoice Date:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("invoice_date")%>" name="invoicedate" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Invoice Number:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("invoice_number")%>" name="invoicenumber" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Customer Code:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("customer_code")%>" name="customercode" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Customer Name:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("customer_name")%>" name="customername" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                             <%} %>
                                   <%if(resultset.getString("department").equals("Direct Tax") && resultset.getString("document_type").equalsIgnoreCase("Challen")){ %>
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Tax Type</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Challen Date</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div><div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Challen No.</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div><div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Period/AM</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType4")%>" name="documentType4" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                    
                                </div><div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">BSR Code</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType5")%>" name="documentType5" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                             <%}%>
                              <%if(resultset.getString("department").equals("Direct Tax") && resultset.getString("document_type").equalsIgnoreCase("Tax Audit Report")){ %>
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Financial Year</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Assessment Year</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div><div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Date</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div><div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Membership No.</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType4")%>" name="documentType4" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div><div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Firm Name/Reg No.</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType5")%>" name="documentType5" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div><div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">UDIN</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType6")%>" name="documentType6" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                             <%}%>
                             
                             <%if(resultset.getString("department").equals("Direct Tax") && resultset.getString("document_type").equalsIgnoreCase("Power of Attorney")){ %>
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Date</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">A4 / F4</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Authorization authority</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                             <%} %>
                            
                             <%if(resultset.getString("department").equals("Direct Tax") && resultset.getString("document_type").equalsIgnoreCase("Notice")){ %>
                             
                                   
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Financial Year</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Assessment Year</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Date</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Section</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType4")%>" name="documentType4" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">DIN</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType5")%>" name="documentType5" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">CIN</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType6")%>" name="documentType6" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                     
                             
                             <%} %>
                             <%if(resultset.getString("department").equals("Direct Tax") && resultset.getString("document_type").equalsIgnoreCase("Submission")){ %>
                               
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Financial Year</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                               <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Assessment Year</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                               <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Submission Date</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                               <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Order Reference / Notice Reference</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType4")%>" name="documentType4" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                             <%} %>
                             <%if(resultset.getString("department").equals("Direct Tax") && resultset.getString("document_type").equalsIgnoreCase("Assessment Order")){ %>
                             
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Financial Year</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Assessment Year</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div><div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Date</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div><div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Section</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType4")%>" name="documentType4" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div><div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Jurisdiction</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType5")%>" name="documentType5" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div><div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Document Indentification No.(DIN)</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType6")%>" name="documentType6" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                             <%} %>
                              <%if(resultset.getString("department").equals("Direct Tax") && resultset.getString("document_type").equalsIgnoreCase("Income Tax Return")){ %>
                             
                             
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Financial Year</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Assessment Year</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Date of Filling</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">ITR Form No/ACR.No</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType4")%>" name="documentType4" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                             <%} %>
                             
                             <%if(resultset.getString("department").equals("Direct Tax") && resultset.getString("document_type").equalsIgnoreCase("Engagement Letter")){ %>
                                  
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Date</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Period</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Authorization</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                              
                             <%} %>
                            
                            
                            <%if(resultset.getString("department").equals("Statutory Audit") && resultset.getString("document_type").equalsIgnoreCase("Confirmations")){ %>
                             
                               <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Confirmation Type</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Company / Bank Name</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Date</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                             <%} %>
                             
                             <%if(resultset.getString("department").equals("Statutory Audit") && resultset.getString("document_type").equalsIgnoreCase("Minutes")){ %>
                                  <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Period</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                  
                                  <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Meeting Type</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                  
                                  <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Meeting Date</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                             <%} %>
                             
                              <%if(resultset.getString("department").equals("Statutory Audit") && resultset.getString("document_type").equalsIgnoreCase("General")){ %>
                                
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Name</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Description</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Date</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                              
                              <%} %> 
                             
                             <%if(resultset.getString("department").equals("Statutory Audit") && resultset.getString("document_type").equalsIgnoreCase("Workpaper")){ %>
                              
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Audit Period</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Workpaper Name</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Description</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                              
                              
                              <%}%>
                             
                             <%if(resultset.getString("department").equals("Statutory Audit") && resultset.getString("document_type").equalsIgnoreCase("Financials")){ %>
                             
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Financial Year</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                               <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Signing Date</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">UDIN</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                             
                             <%} %>
                             
                            <%if(resultset.getString("department").equals("Statutory Audit") && resultset.getString("document_type").equalsIgnoreCase("Engegement Letter")){ %>
                             
                                  <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Date</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                               
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Period</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                               
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Authorization</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                             <%} %>
                            <%if(resultset.getString("department").equals("Indirect Tax") && resultset.getString("document_type").equalsIgnoreCase("Challen")){ %>
                             
                             
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Authorization</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Challen Date</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                               <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Challen No.</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Period / A4 /F4</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType4")%>" name="documentType4" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">BSR code</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType5")%>" name="documentType5" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                             <%} %>
                             
                             <%if(resultset.getString("department").equals("Indirect Tax") && resultset.getString("document_type").equalsIgnoreCase("GSTR-1 Returns")){ %>
                               <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Legal / Trade Name</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Month / Year</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">GSTN</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Authorization</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType4")%>" name="documentType4" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                               <%} %> 
                               <%if(resultset.getString("department").equals("Indirect Tax") && resultset.getString("document_type").equalsIgnoreCase("Invoice / Docs - Output")){ %>
                                       
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Doc / Invoice No.</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Date</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">GSTN</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Name of Party</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType4")%>" name="documentType4" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                             <%} %>
                             <%if(resultset.getString("department").equals("Indirect Tax") && resultset.getString("document_type").equalsIgnoreCase("GSTR-3B Returns")){ %>
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Legal / Trade Name</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Tax Period</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">GSTN</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Authorized Sign</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType4")%>" name="documentType4" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                             <%} %>
                             <%if(resultset.getString("department").equals("Indirect Tax") && resultset.getString("document_type").equalsIgnoreCase("Input Detail/Docs/Invoices")){ %>
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Invoice No.</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Date</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">GSTN</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Name of Party</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType4")%>" name="documentType4" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                             <%} %>
                               
                             <%if(resultset.getString("department").equals("Indirect Tax") && resultset.getString("document_type").equalsIgnoreCase("E-way Bill")){ %>
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">E-way Bill No.</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Date of Generation</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Name of Generation</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">NSN Code</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType4")%>" name="documentType4" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">GSTN of Supplier</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType5")%>" name="documentType5" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div><div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Vehicle No.</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType6")%>" name="documentType6" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                             <%} %>
                             
                             <%if(resultset.getString("department").equals("Indirect Tax") && resultset.getString("document_type").equalsIgnoreCase("Refund Forms RFD OS/01A")){ %>
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">GSTN of Supplier</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Serial Number</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Date of Issue</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Authorization</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType4")%>" name="documentType4" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                             <%} %>
                             
                             <%if(resultset.getString("department").equals("Indirect Tax") && resultset.getString("document_type").equalsIgnoreCase("Refund Forms RFD OS/01A")){ %>
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Legal/Trade Name</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Tax Period</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">GSTN</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Authorized Sign</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType4")%>" name="documentType4" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                             <%} %>
                             
                             
                             <%if(resultset.getString("department").equals("Indirect Tax") && resultset.getString("document_type").equalsIgnoreCase("Debit / Credit Note")){ %>
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">GSTN of Supplier</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType1")%>" name="documentType1" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Serial Number</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='number' value="<%=resultset.getString("documentType2")%>" name="documentType2" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Date of Issue</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="<%=resultset.getString("documentType3")%>" name="documentType3" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Authorization</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="<%=resultset.getString("documentType4")%>" name="documentType4" class="form-control show-tick" readonly>
                                       </div>
                                    </div>
                                </div>
                             <%} %>
                          
                              
                              <%
                                        }
                                     }
                                     catch(SQLException sqlexception)
                                     {
                                         sqlexception.printStackTrace();   
                                     }
                                     catch(Exception exception)
                                     {
                                       exception.printStackTrace();
                                     }
                                     
                             %>
                        <div class="form-group">
                          <div class="col-sm-12 table-responsive">
                             <table class="table table-hover" id="myTable">
                                <thead>
                                    <tr>
                                        <th>S.No.</th>
                                        <th>File Name</th>
                                        <th>File Type</th>
                                        <th>View Count</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%
                                      try(Connection  connect=DBConnection.openConnection(); PreparedStatement preparedStatement=connect.prepareStatement("SELECT * FROM `document_info` WHERE document_no =(select document_no from document_info where id='"+request.getParameter("id")+"') and file_no = (select file_no from document_info where id='"+request.getParameter("id")+"') and status='quality_approved'");)
                                      {
                                      	  
                                    	  ResultSet resultset=preparedStatement.executeQuery();
                                          int i=1;
                                      	  while(resultset.next())
                                          {
                                 %>
                                       <tr>
                                            <td><%=i%></td>
                                            <%   
                                                String filename=resultset.getString("file");
                                                File file = new File(filename); 
                                                String fileName=file.getName();
                                		        String file_name="";
                                		        for (int j=0; j<=fileName.length()-1; j++) {  
                                	            
                                		         if(fileName.charAt(j) == '?') { 
                                	            
                                	        		break;
                                	            
                                	        	 }
                                	             else
                                	             {
                                	            	 
                                	            	 file_name =file_name+fileName.charAt(j);
                                	             }
                                	       }  
                                             
		                                     %>
                                            <td><%=file_name%></td>
                                            <%if(resultset.getString("file").contains(".pdf")){%>
                                              <td><%="pdf"%></td>
                                            <%}else if(resultset.getString("file").contains(".jpg")){%>
                                               <td><%="jpg"%></td>
                                            <%}else if(resultset.getString("file").contains(".jpeg")){ %>
                                               <td><%="jpeg"%></td>
                                            <%}else if(resultset.getString("file").contains(".png")){ %>
                                               <td><%="png"%></td>
                                            <%}else if(resultset.getString("file").contains(".docx")){ %>
                                               <td><%="docx"%></td>
                                            <%}else if(resultset.getString("file").contains(".csv")){ %>
                                               <td><%="csv"%></td>
                                            <%} %>
                                            <td><%=resultset.getString("hit")%></td>
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
                               <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label"> </label>
                                    <div class="col-sm-10">
                               </div>
                               </div>
                                   <div class="form-group">
                               </div>
                           </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <%@include file="include/script.jsp"%>   
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