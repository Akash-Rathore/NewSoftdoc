<%@include file="include/session.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="include/head.jsp"%>       
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
 -webkit-appearance: none;
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
</style>
<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
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
                    Document Upload
                </h2>
            </div>
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                Document Upload
                            </h2>
                           
                        </div>
                        <div class="body mrgnbtm">
                            <form action="process?action=uploaddocument" id="fileUploadForm" method="post" class="form-horizontal"  enctype="multipart/form-data">
                                         <%
                                         	try(Connection connect=IndexingDBConnection.openConnection(); PreparedStatement preparedStat=connect.prepareStatement("SELECT * FROM document_info, customer_details WHERE document_info.company_id = customer_details.id AND file_no =(select file_no from document_info where id='"+request.getParameter("id")+"')");)
                                            {
                                                     ResultSet resultset=preparedStat.executeQuery();
                                                     if(resultset.next()){
                                         %> 
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Company Name</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                        
                                                <input type='text' value="<%=resultset.getString("company_name")%>" name="companyname" class="form-control show-tick" readonly="readonly">
                                                <input type="hidden"  name="customerid" value="<%=resultset.getString("customer_details.id")%>"> 
                                                <input type="hidden"  name="fileno" value="<%=resultset.getString("file_no")%>">
                                                <input type="hidden"  name="company_code" value="<%=resultset.getString("customer_number")%>">
                                       </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Department</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                                  <select class="form-control show-tick" name="departmentname" id="department" onchange="showdocument(this.value)" readonly="readonly">
                                                     <option selected disabled value>SELECT A Department TYPE</option>
                                                     <option value="<%=resultset.getString("document_info.department")%>"><%=resultset.getString("document_info.department")%></option>                                                  
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
                                  <div class="form-group" id="directtax" style="display:none">
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
                                
                                <div class="form-group" id="statutoryaudit" style="display:none">
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
                                
                                <div class="form-group" id="indirecttax" style="display:none">
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
                                <div class="form-group" id="human" style="display:none">
                                    <label for="NameSurname" class="col-sm-2 control-label">Document Type</label>
                                    <div class="col-sm-10">
                                       <div class="form-line">
                                        <select class="form-control" name="documenttype">
                                        	<option value="Employee OutBoarding">Employee OutBoarding</option>
                                        </select>
                                        </div>
                                    </div>
                                </div> 
                               <div id="humandiv" style="display:none"> 
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Employee Code</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="" name="employecode" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Employee Name</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="" name="employename" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Date Of Joining</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="" name="joiningdate" class="form-control show-tick">
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
                                             <input type='text' value="" name="vendorcode" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Vendor Name</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="" name="vendorname" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                              </div>  
                                <!-- end vendor  -->
                                
                              <!-- purchase vendor -->
                              <div id="purchasediv" style="display:none">   
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Invoice Date:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="" name="invoicedate" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Invoice Number:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="" name="invoicenumber" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Vendor Code</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="" name="vendorcodesec" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Vendor Name</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="" name="vendornamesec" class="form-control show-tick">
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
                                             <input type='text' value="" name="customercode" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Customer Name:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="" name="customername" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                              </div>
                              <div id="salesdiv" style="display:none">   
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Invoice Date:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="" name="invoicedatesec" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Invoice Number:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="" name="invoicenumbersec" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Customer Code:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="" name="customercodesec" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Customer Name:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="" name="customernamesec" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                              </div>  
                                <!-- end Sales & Marketing -->
                                    <div id="challeninner">
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
                          <label for="NameSurname" class="col-sm-2 control-label">Attachment Upload</label>
                          <div class="col-sm-8 table-responsive">
                              <table class="table table-bordered table-hover"  id="documentuploading">
                               <thead>
                                 <!--  <tr>
                                       <td width="5%"><input id="check_all" type="input"/></td>
                                        
                                  </tr>  -->
                               </thead>
                               <tbody>
                                   
                               </tbody>
                              </table>
                          </div>
                           <div class="col-sm-2">
                               <button id="addmore" class="btn btn-primary btn-sm addmore" type="button"> Add Attachment </button>
                            </div>    
                         </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label"> </label>
                                    <div class="col-sm-10">
                                </div>
                                </div>
                                 <div class="form-group">
                                    <div class="col-sm-12">
                                        <center>
                                           <input type="submit" id="btnSubmit" class="btn btn-primary"   value="Submit">
                                            <div class="loader">
                                                     <img src="../images/loader.gif"  alt="" style="width: 50px;height:50px;">
                                            </div>
                                        </center>
                                           
                                    </div>
                                </div>
                           </form>
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
    $(document).ready(function () {

    	$("#btnSubmit").click(function (event) {
        	
        	event.preventDefault();
            var form = $('#fileUploadForm')[0];
            // Create an FormData object 
            var data = new FormData(form);
            $.ajax({
                type: "POST",
                enctype: 'multipart/form-data',
                url: "../indexingprocess?action=indexinguploaddocument",
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
                 if(result.status)
                   {
                     Swal.fire({
                      position: 'center',
                      icon: 'success',
                      title: 'Document Created',
                      timer: 3500
                    })   
                    $('.loader').hide();
                
                    document.getElementById("fileUploadForm").reset();
                    
                   /*  
                     var location_id = window.location.href;
 	    		     var res = location_id.split("=");
 	    		     var  doc = res[1];
                     setTimeout(function(){
	     	    		 window.location.href="documents.jsp?id="+doc;
	     	         })	
                   */  
                  
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

    });
   </script>
    
 <script>
 var i=$('table#documentuploading tr').length;
 
 $("#addmore").on('click',function(){
  html = '<tr>';
  html+= '<td><input class="case" type="checkbox" id="checkmark"/></td>'; 
  html+= '<td><input type="file" name="multidocument['+i+']" id="multidocument_'+i+'" ></td>';
  html+= '<td><button class="delete-appended-row btn btn-danger" type="button">Remove Attachment</button></td>';
  html+= '</tr>';
  $('table#documentuploading').append(html);
  i++;
});
  //===============//=========================================
	$(document).on('click','.delete-appended-row',function(){
		 $(this).parent().parent().remove();
	});
 //==============//============================================	
	

function showdocument() {
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
	  
  }else if(x == 'Hr') {
	
	  document.getElementById("purchase").style.display='none';
	  document.getElementById("sales").style.display='none'; 
	  document.getElementById("human").style.display='block';
	  document.getElementById("humandiv").style.display='block';
	  document.getElementById("purchasediv").style.display='none';
	  document.getElementById("salesdiv").style.display='none';
	  document.getElementById("customerdiv").style.display='none';
	  document.getElementById("vendordiv").style.display='none';
		  
  }else if(x == 'Sales') {
	  document.getElementById("purchase").style.display='none';
	  document.getElementById("sales").style.display='block'; 
	  document.getElementById("human").style.display='none';
	  document.getElementById("humandiv").style.display='none';
	  document.getElementById("purchasediv").style.display='none';
	  document.getElementById("salesdiv").style.display='none';
	  document.getElementById("customerdiv").style.display='none';
	  document.getElementById("vendordiv").style.display='none';
  }else if(x == 'Direct Tax'){
	  
	  document.getElementById("directtax").style.display='block';
	  document.getElementById("purchase").style.display='none';
	  document.getElementById("sales").style.display='none'; 
	  document.getElementById("human").style.display='none';
	  document.getElementById("humandiv").style.display='none';
	  document.getElementById("purchasediv").style.display='none';
	  document.getElementById("salesdiv").style.display='none';
	  document.getElementById("customerdiv").style.display='none';
	  document.getElementById("vendordiv").style.display='none';
  
	  
	  
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
      
  }
  
}


function showform(data){
	
	if(data == 'Vendor Registration') {
		document.getElementById("customerdiv").style.display='none';
		document.getElementById("salesdiv").style.display='none';
		document.getElementById("humandiv").style.display='none';
		document.getElementById("purchasediv").style.display='none';
		document.getElementById("vendordiv").style.display='block';
	}
	else if(data == 'Purchase') {
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
	
    }else if(dataindirect=='Debit / Credit Note')
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
</body>
</html>