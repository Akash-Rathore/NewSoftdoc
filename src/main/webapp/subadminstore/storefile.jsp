<%@include file="include/session.jsp" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date" %> 
<%@ page import="java.sql.Statement" %> 
<!DOCTYPE html>
<html>
<head>
      <%@include file="include/head.jsp"%>
            <!--Datatable -->
      <link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" rel="stylesheet"/><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
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
                <a class="navbar-brand" href="index.jsp">SOFTDOC SUBADMIN STORE</a>
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
         <%@include file="include/sidebar.jsp" %>
      <!-- #END# Left Sidebar -->
    </section>
    <section class="content">
        <div class="container-fluid">
            <div class="block-header">
                <h2>Store Files</h2>
            </div>
            <div class="row clearfix dashboardBlocks">
                <!-- Latest Social Trends -->
                <!-- #END# Latest Social Trends -->
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="card">
                        <div class="body bg-body">
                            <div class="font-bold m-b-20">Store Files</div>
                            <div class="table-responsive">
                                <table class="table   table-striped table-hover" id="myTable">
                                    <thead>
                                        <tr>
                                             <th>S No.</th>
                                             <th>Pickup Form No.</th>
                                             <th>File No.</th>
                                             <th>Department</th>
                                             <th>Pickup Date</th>
                                             <th>Send Indexing Team</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                  <%                   
                                           try( Connection  connection=StoreDBConnection.openConnection();
                                        		     Statement   statement=connection.createStatement();
                                        	       )
                                             { 
                                            	            ResultSet resultset=statement.executeQuery("SELECT  df.scheduling_id as did , df.id AS id , df.file_no , df.department , DATE_FORMAT(df.pickup_date ,'%d %b %Y') AS pickup_date  FROM document_info AS df , scheduling AS sd WHERE df.company_id = sd.company_id AND df.company_id=(select company_id from scheduling where id='"+request.getParameter("id")+"') AND df.status='store' GROUP BY df.file_no  ORDER BY df.upload_date DESC");
		                                                    int i=1;
		                                                    while(resultset.next())
		                                                    {
		                          %>
		                                       <tr>
                                                      <td><%=i%></td>
                                                      <td><%=String.format("%06d",resultset.getInt("did"))%></td>
                                                      <td><a href="storepickedup.jsp?id=<%=resultset.getString("id")%>"><%=resultset.getString("file_no")%></a></td>
                                                      <td><%=resultset.getString("department")%></td>
                                                      <td><%=resultset.getString("pickup_date")%></td>
                                                      <td><button type="button" class="btn delete" data-id="<%=resultset.getString("file_no")%>" ><i class="fa fa-file"></i></button></td>
                                              </tr>
                                 <%
                                                     i++;
		                                                    }
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
   <script type="text/javascript">
     $(document).on('click','.delete',function(){
      let element = $(this);
		    Swal.fire({
               title: 'Are you sure?',
               text: 'You will not be able to revert this action',
               icon: 'warning',
               showCancelButton: true,
               cancelButtonText: 'No',
               confirmButtonColor: '#3085d6',
               cancelButtonColor: '#d33',
               confirmButtonText: 'Yes'
               }).then((result) => {
              if (result.value) {
            	  $.ajax({
          	        url:"../storeprocess?action=sendindexing",
          	        type:"POST",
          	        dataType:"json",
          	        data:{ file_no:$(this).data('id')},
          	        success:function(data,textStatus,jqXHR)
          	        {
          	      	   if(data.status)
          	      	   {
          	      		   if(data.status){
	          	      			Swal.fire({
	          	      			     position: 'center',
	          	      		         icon: 'success',
	          	      		         title: 'Send to Indexing Team Success',
	          	      		         timer: 3500
	          	      		    });
	          	      	       $(element).parents('tr').remove();
	          	      	      // delete_data('#customer-table');
	      	              	}
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
  function delete_data(table){
     $(`${table} tbody tr`).each(function(a,b) {
	    console.log(a);
	    console.log(b);
     });
 }
 </script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.0/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.0/js/buttons.flash.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.0/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.0/js/buttons.print.min.js"></script>
    <script>
     $(document).ready( function () {
    	   $('#myTable').DataTable( {
               dom: 'Bfrtip',
               buttons: [
                   'copy', 'csv', 'excel', 'pdf', 'print'
               ],
               "searching":false,
               "lengthMenu":[25,50],
               "pageLength":25
           } );
     } );
 
   </script>
 
    
</body>

</html>