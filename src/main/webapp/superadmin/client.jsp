<%@page import="com.superadmin.connection.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet" %>
<%@include file="include/session.jsp"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>

<head>
       
       <%@include file="include/head.jsp"%>
       <link href="../css/dataTables.bootstrap.min.css" rel="stylesheet" />
       <script type="text/javascript">
       
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
    	        xmlhttp.open("POST" , "ajax_client.jsp?id="+str,true);
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
                <h2>
                    Client Details 
                </h2>
            </div>
            
           <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header  margin0">
                            
                            <div class="row">
                                <div class="">
                                    <h2 class="col-md-4 col-lg-4 col-xs-12 pull-left">
                                        <div class="m-t-10">
                                             Client Details 
                                        </div>
                                    </h2>
                                </div>
                            </div>
                        </div>
                         <div align="right">
                               <select name="users" onchange="showUser(this.value)">
                                     <option selected disabled value>Select a Company</option>
                                     <%
					                 	try(Connection  connect=DBConnection.openConnection();PreparedStatement preparedStatement=connect.prepareStatement("select * from customer_details where flag='0'");)
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
                                <table class="table table-hover" id="mytable" >
                                <thead>
                                    <tr>
                                        <th>Customer Code</th>
                                        <th>Company Name</th>
                                        <th>Softdoc ID</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Designation</th>
                                        <th>Activation Date</th>
                                    </tr>
                                </thead>
                                <tbody id="txtHint">
                          <%
                            String company_number="";
                            String company_name=""; 
                             try(Connection connection=DBConnection.openConnection(); PreparedStatement preparedStatement=connection.prepareStatement("select * from client_details where flag=0 order by id desc");)
                               {
                            	  ResultSet resultset=preparedStatement.executeQuery();
                                  int i = 1;
                                  while(resultset.next())
                                  {
                                	  try(Connection connect=DBConnection.openConnection(); PreparedStatement prepared=connect.prepareStatement("select * from customer_details where flag=0 and id='"+resultset.getString("customer_id")+"'");)
                                      {
                                   	     ResultSet result=prepared.executeQuery();
                                         if(result.next())
                                         {
                                        	 company_number=result.getString("customer_number");
                                        	 company_name=result.getString("company_name");
                                         }
                                      }
                                	  
                                	  
                              %>
                                   <tr>
                                        <td><%=company_number%></td>
                                        <td><%=company_name%></td>
                                        <td><%=resultset.getString("softdoc_id")%></td>
                                        <td><%=resultset.getString("employee_name")%></td>
                                        <td><%=resultset.getString("emp_email_id")%></td>
                                        <td><%=resultset.getString("designation")%></td>
                                        <td><%=resultset.getString("activation_date")%></td>
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
                             <div class="m-t-10" style="float:right;">
                                    <a href="download_client.jsp" role="button" class="btn btn-primary">Download</a>
                                    
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
        
    </section>

  <%@include file="include/script.jsp"%>
  <script src="../js/jquery.dataTables.min.js"></script>
       <script>
        $(document).ready(function() {
            $('#mytable').DataTable( {
                "searching":false,
                "lengthMenu":[25,50],
                "pageLength":25
            } );
        } );
        
    </script>
</body>
</html>
