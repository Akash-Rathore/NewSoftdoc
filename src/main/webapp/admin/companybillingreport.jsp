<%@include file="include/session.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title> SOFTDOC ADMIN|SOFTDOC</title>
    <!-- Favicon-->
    <link rel="icon" href="../images/favicon.png" type="image/x-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <!-- Bootstrap Core Css -->
    <link href="../plugins/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Waves Effect Css -->
    <link href="../plugins/node-waves/waves.css" rel="stylesheet" />

    <!-- Animation Css -->
    <link href="../plugins/animate-css/animate.css" rel="stylesheet" />

    <!-- Bootstrap Select Css -->
    <link href="../plugins/bootstrap-select/css/bootstrap-select.css" rel="stylesheet" />

    <!-- Custom Css -->
    <link href="../css/style.css" rel="stylesheet">

    <!-- AdminBSB Themes. You can choose a theme from css/themes instead of get all themes -->
    <link href="../css/themes/all-themes.css" rel="stylesheet" />
    <script>
       function showUser(str) {
    	   
          if (str == "") {
              document.getElementById("txtHint").innerHTML = "";
            return;
        } else {
          if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
         } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
         }
         xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("txtHint").innerHTML = this.responseText;
            }
        };
         xmlhttp.open("GET","ajax_billingmonth.jsp?billing_month="+str,true);
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
                        <%@include file="include/notification.jsp" %>
                    <!-- #END# Notifications -->                    
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
                    Company billing Report
                </h2>
            </div>
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">	
                        	<div class="col-md-8">
	                            <h2>
	                                Company billing Report
	                            </h2>
                            </div>
                             <br><br>
                            <div class="col-md-3">
	                          	<select class="form-control" onchange="showUser(this.value)">
	                       		<option selected disabled value>Select An Month</option>
	                       		
	                       		<%
	                       			                       			try(Connection connection=StoreDBConnection.openConnection();PreparedStatement preparedStatement = connection.prepareStatement("SELECT DISTINCT(`billing_month`) FROM `document_info`");)
	                       		                                     {
	                       			                       			                            	    ResultSet resultset=preparedStatement.executeQuery();
	                       			                       			                                    int i = 1;
	                       			                       			                                    while(resultset.next())
	                       			                       			                                    {
	                       			                       		%>
	                                     <option value="<%=resultset.getString("billing_month")%>"><%=resultset.getString("billing_month")%></option>
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
	                       			
	                       			
	                       		</select>  
                       		</div>
                            
                           
                        </div>
                       	
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>File No. </th>
                                        <th width="15%">Company Name</th>
                                        <th>Department</th>
                                        <th>Size</th>
                                        <th>Status</th>
                                        <th>Month</th>
                                        <th width="15%">Created Date</th>
                                    	<th>Upload Bill</th>
                                    </tr>
                                </thead>
                                <tbody>
                              
                         
                              
                              
                              <%
                                             int did = Integer.parseInt(request.getParameter("id"));
                                                                                                                                                                              
                                                       try(Connection  connect=StoreDBConnection.openConnection();PreparedStatement preparedStatement=connect.prepareStatement("SELECT d.*,c.company_name FROM document_info as d, customer_details as c WHERE d.billing_month = (SELECT billing_month FROM document_info WHERE id = '"+ did+"') GROUP BY d.file_no");)
                                                       {
                                                             ResultSet resultset=preparedStatement.executeQuery();
                                                             while(resultset.next())
                                                             {
                             %>
                                    <tr>
                                          <td><a href="filedocument.jsp?id=<%=resultset.getInt("file_no")%>"><%=resultset.getInt("file_no")%></a></td>
                                          <td><%=resultset.getString("company_name")%></td>
                                          <td><%=resultset.getString("department")%></td>
                                          <td><%=resultset.getFloat("size")+" MB "%></td>
                                          <td><%=resultset.getString("status")%></td>
                                          <td><%=resultset.getString("billing_month")%></td> 
                                          <td><%=resultset.getTimestamp("upload_date")%></td>
                                          <th style="width:350px;"><form>
                                          		<div class="row">
                                          		  <form action="../Process?action=uploadbill" method="post">
                                          			     <div class="col-md-8"> <input type="file" name="billing_report"/></div>
                                          			          <input type="hidden" id="companyid" name="companyid" value="<%=resultset.getInt("company_id")%>"> 
                                          			          <input type="hidden" id="billingmonth" name="billingmonth" value="<%=resultset.getString("billing_month")%>"> 
                                        			     <div class="col-md-2"><button type="submit"  class="btn btn-primary"><span class="glyphicon glyphicon-arrow-right"></span></button></div>                                        			                                        			
                                        		  </form>
                                        		</div>
                                          	</form>
                                          </th>
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
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Jquery Core Js -->
    <script src="../plugins/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core Js -->
    <script src="../plugins/bootstrap/js/bootstrap.js"></script>

    <!-- Select Plugin Js -->
    <script src="../plugins/bootstrap-select/js/bootstrap-select.js"></script>

    <!-- Slimscroll Plugin Js -->
    <script src="../plugins/jquery-slimscroll/jquery.slimscroll.js"></script>

    <!-- Waves Effect Plugin Js -->
    <script src="../plugins/node-waves/waves.js"></script>

    <!-- Custom Js -->
    <script src="../js/admin.js"></script>

    <!-- Demo Js -->
    <script src="../js/demo.js"></script>
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

</body>

</html>
