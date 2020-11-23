<%@include file="include/session.jsp"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.math.RoundingMode"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import= "java.util.Calendar" %>
<%@ page import= "java.sql.Statement" %>


<!DOCTYPE html>
<html>
<head>
    <%@include file="include/head.jsp"%>
    <!--Datatable-->
    <link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" rel="stylesheet"/>
    <style>
    
      .red_color{
       
           background-color: red;
            text-color:white;
      }
    
      .green_color{
       
           background-color: green;
           text-color:white;
       
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
           <%@include file="include/leftsidebar.jsp" %> 
        <!-- #END# Left Sidebar -->
    </section>
    <section class="content">
        <div class="container-fluid">
            <div class="block-header">
                <h2>
                    Company Monthly Report
                </h2>
            </div>
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">	
                        	<div class="col-md-8">
	                            <h2>
	                                Company Monthly Report
	                            </h2>
                            </div>
                             <br><br>
                            <div class="col-md-3">
	                          	
                       		</div>
                            
                           
                        </div>
                       	
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-hover" id="myTable">
                                <thead>
                                    <tr>
                                        <th>S.No.</th>
                                        <th>Company Name</th>
                                        <th>Month</th>
                                        <th>Current Storage</th>
                                        <th>Invoice</th>
                                    	<th>Payment Status</th>
                                    	
                                    </tr>
                                </thead>
                                <tbody>
                           <%
                           
                               int did = Integer.parseInt(request.getParameter("id"));
                               Double  total_sum=0.0;
                               DecimalFormat df = new DecimalFormat("0.00");
                               Date date1 = new Date();
                  			   SimpleDateFormat simpleDateFormatM = new SimpleDateFormat("EEEE");
                  			   simpleDateFormatM = new SimpleDateFormat("MMMM");
                  			   SimpleDateFormat simpleDateFormatY = new SimpleDateFormat("EEEE");
                  			   simpleDateFormatY = new SimpleDateFormat("YYYY");
                         	   String currentdate=simpleDateFormatM.format(date1).toUpperCase()+" , "+simpleDateFormatY.format(date1).toUpperCase();
                               try( Connection  connect=StoreDBConnection.openConnection();
                            		   PreparedStatement preparedStatement=connect.prepareStatement("SELECT d.id, d.payment_paid , d.payment_status,d.bill_report ,sum(d.size) as size, d.company_id, d.id as id,d.billing_month, d.upload_date, d.status ,c.company_name FROM document_info as d, customer_details as c WHERE c.id = d.company_id AND d.company_id = (SELECT company_id FROM document_info WHERE id = '"+did+"') and d.status ='quality_approved' and d.document_no is not null  and d.billing_month =(select billing_month from document_info where id='"+request.getParameter("id")+"') GROUP BY d.billing_month");
                                         )
                               {
                            	   
                            	     int i=1;
                                     ResultSet resultset=preparedStatement.executeQuery();
                                     while(resultset.next())
                                  {
                               %>
                                    <tr>                                        
                                         
                                          <td><%=i%></td>
                                          <td><%=resultset.getString("company_name")%></td>
                                          <td><a href="monthlybilling.jsp?id=<%=resultset.getInt("id")%>"><%=resultset.getString("billing_month")%></a></td> 
                                          <td><%= df.format(resultset.getDouble("size")) +" MB "%></td>
                                          <td style="width:350px;">
                                          		<div class="row">
                                          		<%
                                          		  
                                          		    String path=resultset.getString("bill_report"); 
                                          		 
                                          		%>
                                          	   <% if(path == null) { %> 
                                          			
                                          		 	<form action="../Process?action=uploadbill" method="post"  enctype="multipart/form-data">
                                          			     <div class="col-md-8"> 
                                          			          <input type="file" name="billing_report" accept="application/pdf" required/>
                                          			          <input type="hidden"  name="companyid" value="<%=resultset.getInt("company_id")%>"> 
                                          			          <input type="hidden"  name="billingmonth" value="<%=resultset.getString("billing_month")%>"> </div>
                                        			     <div class="col-md-2"><button type="submit"  class="btn btn-primary btnSubmit"><span class="glyphicon glyphicon-arrow-right"></span></button></div>                                        			                                        			
                                        		    </form> 
                                          			
                                          			
                                          		 <% }else { %>
                                          			    <a href="<%=resultset.getString("bill_report")%>" target="_blank"> View Bill</a>
                                          		<% } %> 
                                             	</div>
                                            </td>
                                              <td width="12%">
	                                             <select class="form-control paymentstatus"  data-id="<%=resultset.getInt("company_id")%>" data-billing_month="<%=resultset.getString("billing_month")%>">
	                                             <% 
                                                    if(!"Unpaid".equals(resultset.getString("payment_paid"))){
                                                 %> 
                                                      <option class="label bg-green !important" value="Paid">Paid</option>
                                                      <option class="label bg-red" value="Unpaid">Unpaid</option>
                                                 <%}else if(!"Paid".equals(resultset.getString("payment_paid"))){ %>
                                                       <option class="label bg-red !important" value="Unpaid">Unpaid</option>
                                                       <option class="label bg-green" value="Paid">Paid</option>
                                                 <% } %>
	                                           </select>
	                                          </td>
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
    </section>
  <%@include file="include/script.jsp"%>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
  <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
  <script type="text/javascript">
    $(".paymentstatus").on('change', function(){    
   	
       var data={ paymentstatus:$(this).val() ,id:$(this).data('id'),billing_month:$(this).data('billing_month') }
   	   console.log(data);
   	   $.ajax({
	            url: "../Process?action=paymentstatus",
	            dataType:"json",
	            type: "post",
	            data:data,
	            success: function(data)
	            {
	              
	             if(data.status){
	            	 
	            	Swal.fire({
	 	    			  position: 'top-end',
	 	    			  icon: 'success',
	 	    			  title: 'Success',
	 	    			  showConfirmButton: false,
	 	    			  timer: 2500
	 	    			})
	             }
	             else
	             {
	            	 Swal.fire({
		    			  icon:'error',
		    			  title:'Something went wrong',
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
