<%@include file="include/session.jsp" %>
<%@page import="com.subadminquality.connection.QualityDBConnection"%> 
<%@page import="java.sql.Statement"%> 

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
                <a class="navbar-brand" href="index.jsp">SOFTDOC SUBADMIN 	QUALLITY</a>
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
                    Attachment
                </h2>
            </div>
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                Attachment
                            </h2>
                           
                        </div>
                        <div class="body mrgnbtm">
                            <form  method="post" class="form-horizontal"  enctype="multipart/form-data">
                                         <%
                                         	try(Connection connect=QualityDBConnection.openConnection();Statement statment=connect.createStatement();)
                                            {
                                                    ResultSet resultset=statment.executeQuery("SELECT * FROM document_info, customer_details WHERE document_info.company_id = customer_details.id AND file_no ='"+request.getParameter("id")+"'");
                                                     if(resultset.next()){
                                         %> 
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Company Name</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                        
                                                <input type='text' value="<%=resultset.getString("company_name")%>" name="companyname" class="form-control show-tick" readonly="readonly">
                                               
                                       </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Department</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                                  <select class="form-control show-tick" name="departmentname" id="department" onchange="showdocument(this.value)">
                                          <%
                                         	try(Connection connection=QualityDBConnection.openConnection();Statement state=connect.createStatement();)
                                            {
                                                     ResultSet result=state.executeQuery("SELECT * FROM `document_info` WHERE document_no ='"+request.getParameter("id1")+"'");
                                                     if(resultset.next()){
                                         %> 
                                                        <option value="<%=resultset.getString("department")%>"><%=resultset.getString("department")%></option>                                                  
                                              <%  
                                                   
                                                     } 
                                            }
                                              %>
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
                                        	<option value="Employee OutBoarding">Employee OutBoarding</option>
                                        </select>
                                        </div>
                                    </div>
                                </div> 
                                 <div class="form-group" id="sales&marketing" style="display:none">
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
                                
                                <div class="form-group" id="human1" style="display:none">
                                    <label for="NameSurname" class="col-sm-2 control-label">Employee Code</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="" name="employecode" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group" id="human2" style="display:none">
                                    <label for="NameSurname" class="col-sm-2 control-label">Employee Name</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="" name="employename" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group" id="human3" style="display:none">
                                    <label for="NameSurname" class="col-sm-2 control-label">Date Of Joining</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="" name="joiningdate" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                
                                
                                <!-- start Vendor -->
                                <div class="form-group" id="vendor" style="display:none">
                                    <label for="NameSurname" class="col-sm-2 control-label">Vendor Code</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="" name="vendorcode" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group" id="vendor1" style="display:none">
                                    <label for="NameSurname" class="col-sm-2 control-label">Vendor Name</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="" name="vendorname" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <!-- end vendor  -->
                                
                                <!-- purchase vendor -->
                                 <div class="form-group" id="purchase1" style="display:none">
                                    <label for="NameSurname" class="col-sm-2 control-label">Invoice Date:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="" name="invoicedate" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group" id="purchase2" style="display:none">
                                    <label for="NameSurname" class="col-sm-2 control-label">Invoice Number:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="" name="invoicenumber" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                 <div class="form-group" id="purchase3" style="display:none">
                                    <label for="NameSurname" class="col-sm-2 control-label">Vendor Code:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="" name="vendorcode" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                 <div class="form-group" id="purchase4" style="display:none">
                                    <label for="NameSurname" class="col-sm-2 control-label">Vendor Name:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="" name="vendorname" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <!-- purchase vendor -->
                                <!-- start Sales & Marketing  -->
                                
                                <div class="form-group" id="customer5" style="display:none">
                                    <label for="NameSurname" class="col-sm-2 control-label">Customer Code:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="" name="customercode" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group" id="customer6" style="display:none">
                                    <label for="NameSurname" class="col-sm-2 control-label">Customer Name:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="" name="customername" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group" id="sales5" style="display:none">
                                    <label for="NameSurname" class="col-sm-2 control-label">Invoice Date:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='date' value="" name="invoicedate" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group" id="sales6" style="display:none">
                                    <label for="NameSurname" class="col-sm-2 control-label">Invoice Number:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="" name="invoicenumber" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group" id="sales7" style="display:none">
                                    <label for="NameSurname" class="col-sm-2 control-label">Customer Code:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="" name="customercode" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group" id="sales8" style="display:none">
                                    <label for="NameSurname" class="col-sm-2 control-label">Customer Name:</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type='text' value="" name="customername" class="form-control show-tick">
                                       </div>
                                    </div>
                                </div>
                                <!-- end Sales & Marketing -->
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
                          <label for="NameSurname" class="col-sm-2 control-label">Attachments</label>
                          <div class="col-sm-8 table-responsive">
                                 <table class="table table-bordered table-hover" id="documentuploading">
                                  <thead>
                                     <!--  <tr>
                                          <th width="5%"><input id="check_all" type="checkbox"/></th>
                                          <th>Document Upload</th> 
                                      </tr> -->
                                  </thead>
                                  <tbody>
                                  </tbody>
                                </table>
                          </div>
                           <div class="col-sm-2">
                            </div>    
                         </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label"> </label>
                                    <div class="col-sm-10">
                                </div>
                                </div>
                                 <div class="form-group">
                                    <div class="col-sm-12">
                                        
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
   <script>
 var i=$('table#documentuploading tr').length;
 
 $("#addmore").on('click',function(){
  html = '<tr>';
  html+= '<td><input class="case" type="checkbox" id="checkmark"/></td>'; 
  html+= '<td><input type="file" name="multidocument['+i+']"></td>';
  html+= '</tr>';
  $('table#documentuploading').append(html);
  i++;
});
//to check all checkboxes
$(document).on('change','#check_all',function(){
    $('input[class=case]:checkbox').prop("checked", $(this).is(':checked'));
});
//deletes the selected table rows
$("#delete").on('click', function() {
     $('.case:checkbox:checked').parents("tr").remove();
     $('#check_all').prop("checked", false);
     calculateTotal();
});

function showdocument() {
  var x = document.getElementById("department").value;
  
  if(x == 'Purchase') {
	  document.getElementById("purchase").style.display='block';
	  document.getElementById("human").style.display='none';
	  document.getElementById("sales").style.display='none';
	  document.getElementById("human1").style.display='none';
	  document.getElementById("human2").style.display='none';
	  document.getElementById("human3").style.display='none';
  }else if(x == 'Hr') {
	  document.getElementById("human").style.display='block';
	  document.getElementById("human1").style.display='block';
	  document.getElementById("human2").style.display='block';
	  document.getElementById("human3").style.display='block';
	  document.getElementById("purchase").style.display='none';
	  document.getElementById("sales").style.display='none';
  }else if(x == 'Sales') {
	  document.getElementById("sales").style.display='block';
	  document.getElementById("human").style.display='none';
	  document.getElementById("purchase").style.display='none';
	  document.getElementById("human1").style.display='none';
	  document.getElementById("human2").style.display='none';
	  document.getElementById("human3").style.display='none';
  }
  
}


function showform(data){
	
	if(data == 'Vendor Registration') {
		document.getElementById("vendor").style.display='block';
		document.getElementById("vendor1").style.display='block';
		document.getElementById("purchase1").style.display='none';
		document.getElementById("purchase2").style.display='none';
		document.getElementById("purchase3").style.display='none';
		document.getElementById("purchase4").style.display='none';
	}
	else if(data == 'Purchase') {
		document.getElementById("purchase1").style.display='block';
		document.getElementById("purchase2").style.display='block';
		document.getElementById("purchase3").style.display='block';
		document.getElementById("purchase4").style.display='block';
		document.getElementById("vendor").style.display='none';
		document.getElementById("vendor1").style.display='none';
	}

}
function salesmarketing(datas){
	
	if(datas == 'Customer Registration') {
		
		document.getElementById("customer5").style.display='block';
		document.getElementById("customer6").style.display='block';
		document.getElementById("sales5").style.display='none';
		document.getElementById("sales6").style.display='none';
		document.getElementById("sales7").style.display='none';
		document.getElementById("sales8").style.display='none';
		
	}
	else if(datas =='Sales')
    {
		document.getElementById("sales5").style.display='block';
		document.getElementById("sales6").style.display='block';
		document.getElementById("sales7").style.display='block';
		document.getElementById("sales8").style.display='block';
		document.getElementById("customer5").style.display='none';
		document.getElementById("customer6").style.display='none';
		
		
	}
}
</script>
</body>
</html>




