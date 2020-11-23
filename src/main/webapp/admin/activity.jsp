<%@include file="include/session.jsp"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date" %> 
<%@ page import="java.sql.Statement" %> 
<!DOCTYPE html>
<html>
<head>
    <%@include file="include/head.jsp"%>
    <link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" rel="stylesheet"/> 
       
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
    	        xmlhttp.open("POST" , "ajax-activity.jsp?id="+str,true);
    	        xmlhttp.send();
    	    }
    	  }
           
           function showUserTwo(str) {
     	      if (str == "") {
     	        document.getElementById("txtHintTwo").innerHTML = "";
     	        return;
     	       } else {
     	        if (window.XMLHttpRequest) {
     	            xmlhttp = new XMLHttpRequest();
     	        } else {
     	            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
     	        }
     	        xmlhttp.onreadystatechange = function() {
     	            if (this.readyState == 4 && this.status == 200) {
     	                document.getElementById("txtHintTwo").innerHTML = this.responseText;
     	            }
     	        };
     	        xmlhttp.open("POST" , "ajax-activityclient.jsp?id="+str,true);
     	        xmlhttp.send();
     	    }
     	   } 
    	</script>
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
                    Current Activity
                </h2>
            </div>
            <div class="row clearfix">
                <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <div class="row">
                                <div class="col-md-12">
                                    <h2 class="col-md-7 p-l-0 p-t-10">Current Activity</h2>
                                </div>
                            </div>
                        </div>
                        <div align="right">
                               <select name="users" onchange="showUser(this.value)">
                                     <option selected disabled value>Select a Company</option>
                                     <%
					                 	try(Connection  connect=StoreDBConnection.openConnection();PreparedStatement preparedStatement=connect.prepareStatement("select company_name , id from customer_details where flag='0'");)
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
                                <table class="table table-hover table-striped m-b-0" id="myTable">
                                    <thead>
                                        <tr>
                                           
                                            <th>Customer Code</th>
                                            <th>Customer Name</th>
                                            <th>File No.</th>
                                            <th>Department</th>
                                            <th>Pickup Date</th>
                                            <th>Tracking</th>
                                        </tr>
                                    </thead>
                                    <tbody id="txtHint">
                         <%                 
                           try(Connection  connection=StoreDBConnection.openConnection(); Statement  statement=connection.createStatement();)
                           {
                                ResultSet resultset=statement.executeQuery("SELECT customer_number , file_no , customer_details.company_name AS company_name , department ,  DATE_FORMAT(scheduling.pickup_date , '%d %b %Y') AS pickup_date , document_info.status AS STATUS FROM document_info , scheduling , customer_details WHERE document_info.company_id=customer_details.id AND document_info.company_id=scheduling.company_id AND scheduling.return_date IS NOT NULL AND document_info.document_no IS NOT NULL GROUP BY document_info.file_no ORDER BY document_info.upload_date DESC");
                                while(resultset.next())
                                {
                                	
                            %>
                                   <tr>  
                                          <td><%=resultset.getString("customer_number")%></td>
                                          <td><%=resultset.getString("company_name")%></td>
                                          <td><%=resultset.getString("file_no")%></td>
                                          <td><%=resultset.getString("document_info.department")%></td>
                                          <td><%=resultset.getString("pickup_date")%></td>
                                          <% if(resultset.getString("status").equals("store")){ %>
                                               <td><%="STORE"%></td>
                                          <% }else if(resultset.getString("status").equals("indexing")){ %>
                                               <td><%="STORE-->INDEXING"%></td> 
                                           <%}else if(resultset.getString("status").equals("quality")){ %> 
                                               <td><%="STORE-->INDEXING --> QUALITY"%></td> 
                                           <%}else if(resultset.getString("status").equals("quality_return")){ %> 
                                                 <td><%="STORE-->INDEXING --> QUALITY "%></td> 
                                            <%}else if(resultset.getString("status").equals("return_quality")){ %> 
                                                 <td><%="STORE-->INDEXING --> QUALITY "%></td> 
                                            <%}else if(resultset.getString("status").equals("quality_approved")){ %> 
                                                <td><%="STORE-->INDEXING --> QUALITY-->READY TO RETURN"%></td> 
                                          <%}else{%>
                                                <td></td>
                                          <%} %>        
                                  </tr>
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
                                 </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row clearfix">
                <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <div class="row">
                                <div class="col-md-12">
                                    <h2 class="col-md-7 p-l-0 p-t-10">Client Activity</h2>
                                </div>
                            </div>
                        </div>
                        <div align="right">
                               <select name="users" onchange="showUserTwo(this.value)">
                                     <option selected disabled value>Select a Company</option>
                                     <%
					                 	try(Connection  connect=StoreDBConnection.openConnection();PreparedStatement preparedStatement=connect.prepareStatement("select company_name , id from customer_details where flag='0'");)
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
                                <table class="table table-hover table-striped m-b-0" id="myTableTwo">
                                    <thead>
                                        <tr>
                                           
                                            <th>Customer Code</th>
                                            <th>Customer Name</th>
                                            <th>File No.</th>
                                            <th>Department</th>
                                            <th>Pickup Date</th>
                                            <th>Tracking</th>
                                        </tr>
                                    </thead>
                                    <tbody id="txtHintTwo">
                         <%                 
                           try(Connection  connection=StoreDBConnection.openConnection(); Statement  statement=connection.createStatement();)
                           {
                                ResultSet resultset=statement.executeQuery("SELECT customer_number , file_no , customer_details.company_name AS company_name , department ,  DATE_FORMAT(upload_date , '%d %b %Y') AS pickup_date , document_info.status AS STATUS FROM document_info , customer_details WHERE document_info.company_id=customer_details.id  and client_id !='0' AND document_no IS NOT NULL GROUP BY document_info.file_no ORDER BY document_info.upload_date DESC");
                                while(resultset.next())
                                {
                                	
                            %>
                                   <tr>  
                                          <td><%=resultset.getString("customer_number")%></td>
                                          <td><%=resultset.getString("company_name")%></td>
                                          <td><%=resultset.getString("file_no")%></td>
                                          <td><%=resultset.getString("department")%></td>
                                          <td><%=resultset.getString("pickup_date")%></td>
                                          <% if(resultset.getString("status").equals("quality_approved")){ %> 
                                                <td><%="Active"%></td> 
                                          <%}else{%>
                                                <td></td>
                                          <%} %>        
                                  </tr>
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
   <script>
     $(document).ready( function () {
          $('#myTable').DataTable({
        	    "searching":false,
                "lengthMenu":[25,50],
                "pageLength":25
          });
     } );
    
     $(document).ready( function () {
         $('#myTableTwo').DataTable({
       	    "searching":false,
               "lengthMenu":[25,50],
               "pageLength":25
         });
    } );

   </script>   
</body>
</html>
