<%@include file="include/session.jsp"%>
<%@ page import= "java.util.Calendar" %>
<%@ page import= "java.util.Date" %>
<%@ page import= "java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
   <%@include file="include/head.jsp"%>        
    <!--Datatable  -->   
   <link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" rel="stylesheet"/> 
</head>
<body class="theme-light-blue">
    <div class="overlay"></div>
    <!-- Top Bar -->
    <nav class="navbar">
        <div class="container-fluid">
            <div class="navbar-header">
                <a href="javascript:void(0);" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false"></a>
                <a href="javascript:void(0);" class="bars"></a>
                <a class="navbar-brand" href="index.jsp">SUPER ADMIN</a>
            </div>
            <div class="collapse navbar-collapse" id="navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <!-- Notifications -->
                      <%@include file="include/notification.jsp"%>
                    <!-- #END# Notifications -->                    
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
                <h2>System Reports</h2>
            </div>
            <div class="row clearfix dashboardBlocks">
                <!-- Latest Social Trends -->
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="card">
                        <div class="body">
                            <div class="m-b-20 font-bold">Unbilled Report</div>
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover  dashboard-task-infos" id="myTable">
                                    <thead>
                                        <tr>
                                            <th>S.NO.</th>
                                            <th>Company Name</th>
                                            <th>Storage</th>
                                            <th>Total Documents</th>
                                            <th>Payment Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                              <%
                                 Date date = new Date();
                			     SimpleDateFormat simpleDateFormatM = new SimpleDateFormat("EEEE");
                			     simpleDateFormatM = new SimpleDateFormat("MMMM");
                			     SimpleDateFormat simpleDateFormatY = new SimpleDateFormat("EEEE");
                			     simpleDateFormatY = new SimpleDateFormat("YYYY");
                                 String currentdate=simpleDateFormatM.format(date).toUpperCase()+" , "+simpleDateFormatY.format(date).toUpperCase();
                                 try( Connection  connect=DBConnection.openConnection();PreparedStatement preparedStatement=connect.prepareStatement("SELECT document_info.payment_paid , document_info.id as did, count(DISTINCT(document_info.document_no)) as total_doc, customer_details.id as id, SUM(ROUND(size,2))AS size, billing_month, file_no, company_name, department, upload_date FROM customer_details, document_info WHERE document_info.company_id = customer_details.id AND document_info.billing_month = '"+currentdate+"' and document_info.payment_status='Unbilled' GROUP BY document_info.company_id, document_info.billing_month");
                                          )
                                 {
                                     ResultSet resultset=preparedStatement.executeQuery();
                                     int i=1;    
                                     while(resultset.next())
                                    {
                              %>
                                         <tr>
                                               <th><%=i%></th>
                                               <td><a href="storageunbilling.jsp?id=<%=resultset.getInt("did")%>"><%=resultset.getString("company_name")%></a></td>
                                               <td><%=resultset.getString("size")+" MB "%></td>
                                               <td><%=resultset.getInt("total_doc")%></td>
                                              <%if(resultset.getString("payment_paid").equals("Unpaid")){ %>
                                                  <td><span class="label bg-red">Unpaid</span></td>   
                                              <%}else{ %>     
                                                  <td><span class="label bg-green">paid</span></td>   
                                              <%} %>
                                        </tr>
                                          <%
                                            	i++;
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
                                    </tbody>          	
                                  </table>                              
                             </div>
                        </div>
                    </div>
                </div>
                   <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="card">
                        <div class="body">
                            <div class="font-bold m-b-20">Billed Report</div>
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover"  id="myTableone">
                                    <thead>
                                       <tr>
                                            <th>S.NO.</th>
                                            <th>Company Name</th>
                                            <th>Storage</th>
                                            <th>Total Documents </th>
                                            <th>Payment Status</th>
                                         </tr>
                                    </thead>
                                    <tbody>
                             <%
                                 try(Connection  connect=DBConnection.openConnection();PreparedStatement preparedStatement=connect.prepareStatement("SELECT document_info.payment_paid , document_info.id as did, count(DISTINCT(document_info.document_no)) as total_doc, customer_details.id as id,SUM(ROUND(size,2))AS size, billing_month, file_no, company_name, department, upload_date FROM customer_details, document_info WHERE document_info.company_id = customer_details.id AND (document_info.payment_status = 'billed' OR document_info.billing_month !='"+currentdate+"')  AND document_info.document_no is not null GROUP BY document_info.company_id, document_info.billing_month");)
                                 {
                                	 
                                         ResultSet resultset=preparedStatement.executeQuery();
                                         int i=1;    
                                         while(resultset.next())
                                        {
                                 %>
                                        <tr>
                                               <th><%=i%></th>
                                               <td><a href="storagebilling.jsp?id=<%=resultset.getInt("did")%>"><%=resultset.getString("company_name")%></a></td>
                                               <td><%=resultset.getString("size")+" MB "%></td>
                                               <td><%=resultset.getInt("total_doc")%></td>
                                               <%if(resultset.getString("payment_paid").equals("Unpaid")){ %>
                                                  <td><span class="label bg-red">Unpaid</span></td>   
                                               <%}else{ %>     
                                                  <td><span class="label bg-green">paid</span></td>   
                                               <%} %>
                                                
                                         </tr>
                                 <%
                                            	i++;
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
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.0/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.0/js/buttons.flash.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.0/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.0/js/buttons.print.min.js"></script>
    <script>
    $(document).ready(function() {
     $('#myTable').DataTable({
    	 "searching":false,
         "lengthMenu":[25,50],
         "pageLength":25
     });
    } );
     
    $(document).ready( function () {
         $('#myTableone').DataTable({
        	 "searching":false,
             "lengthMenu":[25,50],
             "pageLength":25
         });
    } );
   </script>  
</body>
</html>
