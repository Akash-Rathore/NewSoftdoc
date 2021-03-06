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
                <a class="navbar-brand" href="index.jsp">SOFTDOC SUBADMIN QUALITY</a>
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
                                       try(Connection  connect=QualityDBConnection.openConnection();PreparedStatement preparedStatement=connect.prepareStatement("SELECT questionone , remarks, questiontwo, questionthree, count(attachment_no)as count,customer_name,customer_code,invoice_date,date_of_joining,employee_code,employee_name,invoice_number,vendor_name,vendor_code,document_type,document_no,sum(size) as size, file_no, company_name, department, upload_date FROM customer_details, document_info WHERE document_info.company_id = customer_details.id AND document_info.id = '"+request.getParameter("id")+"' and  history_indexing='history_indexing' GROUP BY document_info.file_no");)
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
                               </div>
                             <%}%>
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
                                    </tr>
                                </thead>
                                <tbody>
                             <%
                                                 try(Connection  connect=QualityDBConnection.openConnection();PreparedStatement preparedStatement=connect.prepareStatement("SELECT * FROM `document_info` WHERE  document_no = '"+document_no+"' and file_no='"+file_no+"' and history_quality='history_quality' ");)
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
