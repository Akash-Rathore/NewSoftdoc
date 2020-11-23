<%@include file="include/session.jsp" %>
<%@ page import="java.sql.Statement" %> 
<!DOCTYPE html>
<html>
<head>
      <%@include file="include/head.jsp"%>
            <!--Datatable -->
    <script>
     function showUser(str) {
      if (str == "") {
        document.getElementById("txtHint").innerHTML = "";
        return;
       } else {
        if (window.XMLHttpRequest) {
            xmlhttp = new XMLHttpRequest();
        } else {
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("txtHint").innerHTML = this.responseText;
            }
        };
        xmlhttp.open("POST" , "ajax_company.jsp?id="+str,true);
        xmlhttp.send();
    }
   }
   
    /*  function showDate(str) {
         if (str == "") {
           document.getElementById("txtHint2").innerHTML = "";
           return;
          } else {
           if (window.XMLHttpRequest) {
               xmlhttp = new XMLHttpRequest();
           } else {
               xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
           }
           xmlhttp.onreadystatechange = function() {
               if (this.readyState == 4 && this.status == 200) {
                   document.getElementById("txtHint2").innerHTML = this.responseText;
               }
           };
           xmlhttp.open("POST" , "ajax_company.jsp?id="+str,true);
           xmlhttp.send();
       }
      } */
     
     
   </script>      
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
                <h2>Store</h2>
            </div>
            <div class="row clearfix dashboardBlocks">
                <!-- Latest Social Trends -->
                <!-- #END# Latest Social Trends -->
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="card">
                        
                            <div class="header">
                            <h2>
                               Store
                            </h2>
                        </div>
                            <div align="right">
                               <select name="users" onchange="showUser(this.value)">
                                     <option selected disabled value>Select a Company</option>
                                     <%
					                 	try(Connection  connect=StoreDBConnection.openConnection();PreparedStatement preparedStatement=connect.prepareStatement("select * from customer_details");)
					                    {
					                          ResultSet resultset=preparedStatement.executeQuery();
					                          while(resultset.next())
					                          {
					                   %>  
                                               <option value="<%=resultset.getInt("id")%>"><%=resultset.getString("company_name")%></option>
                                      <%	   
		                                       }
		                                }
		                                catch(Exception exception)
		                                {
		                           	      exception.printStackTrace();
		                                }
                                    %> 
                                 </select>
                              </div>     
                        
                            <div class="body">
                              <div class="table-responsive">
                                <table class="table   table-striped table-hover" id="myTable">
                                    <thead>
                                        <tr>
                                             <th>S. No.</th>
                                             <th>Customer code</th>
                                             <th>Company Name</th>
                                             <th>File Count</th>
                                             <th>Pickup Date</th>
                                        </tr>
                                    </thead>
                                    <tbody id="txtHint">
                                  <%                   
                                           try( Connection  connection=StoreDBConnection.openConnection();
                                        		     Statement   statement=connection.createStatement();
                                        	       )
                                             { 
                                            	            ResultSet resultset=statement.executeQuery("SELECT  DATE_FORMAT(document_info.pickup_date ,'%d %b %Y') as pickup_date , count(file_no)as count , customer_number , company_name ,scheduling_id FROM document_info , customer_details  where  customer_details.id=document_info.company_id and document_info.status='store' group by document_info.company_id order by document_info.pickup_date desc");
		                                                    int i=1;
		                                                    while(resultset.next())
		                                                    {
		                          %>
		                                       <tr>
                                                      <td><%=i%></td>
                                                      <td><%=resultset.getString("customer_number")%></td>
                                                      <td><a href="storefile.jsp?id=<%=resultset.getString("scheduling_id")%>"><%=resultset.getString("company_name")%></a></td>
                                                      <td><%=resultset.getString("count")%></td>
                                                      <td><%=resultset.getString("pickup_date")%></td> 
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
            </div>
        </div>
    </section>
    <%@include file="include/script.jsp"%>
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