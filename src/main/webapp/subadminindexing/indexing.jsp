<%@include file="include/session.jsp" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date" %>   
<%@ page import="java.sql.Statement" %>
<%@ page import="java.math.RoundingMode"%>
<%@ page import="java.text.DecimalFormat"%>
    
<!DOCTYPE html>
<html>
<head>
    <%@include file="include/head.jsp"%>
               <!-- Datatable -->
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
        xmlhttp.open("POST" , "ajax_company.jsp?id="+str,true);
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
                <a class="navbar-brand" href="index.jsp">SOFTDOC SUBADMIN INDEXING</a>
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
                    Indexing
                </h2>
            </div>
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                               File Number
                            </h2>
                        </div>
                        <div class="body">
                             <div align="right">
                               <select name="users" onchange="showUser(this.value)">
                                     <option selected disabled value>Select a Company</option>
                                     <%
					                 	try(Connection  connect=IndexingDBConnection.openConnection();PreparedStatement preparedStatement=connect.prepareStatement("select * from customer_details where flag='0'");)
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
                            <div class="table-responsive">
                                <table class="table table-hover" id="myTable">
                                <thead>
                                    <tr>
                                        <th>File No. </th>
                                        <th width="15%">Company Name</th>
                                        <th>Department</th>
                                        <th>Size</th>
                                        <th>Created Date</th>
                                        <th>Document Count</th>
                                    </tr>
                                </thead>
                                <tbody id="txtHint">
                              <%
                                        String count="";
                                        DecimalFormat df = new DecimalFormat("0.00");
                                     	try(Connection  connect=IndexingDBConnection.openConnection();Statement statement=connect.createStatement();)
					                    {
					                             ResultSet resultset=statement.executeQuery("SELECT  SUM(size) AS size , company_id , file_no , company_name, department, DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date ,document_info.id as id FROM customer_details, document_info WHERE document_info.company_id = customer_details.id AND document_info.status = 'indexing'  GROUP BY document_info.file_no ORDER BY document_info.company_id DESC");
					                             while(resultset.next())
					                             {
                               
					                                         Statement stat=connect.createStatement();
								                             ResultSet result=stat.executeQuery("SELECT COUNT(DISTINCT document_no)as count FROM document_info WHERE file_no='"+resultset.getString("file_no")+"' AND status='indexing'");
								                             if(result.next())
								                             {
								                            	 count=result.getString("count");
								                             }
								                    
                               %>      
                                        <tr>
                                            <td><a href="documents.jsp?id=<%=resultset.getString("id")%>"><%=resultset.getString("file_no")%></a></td>
                                            <td><%=resultset.getString("company_name")%></td>
                                            <td><%=resultset.getString("department")%></a></td>
                                            <%if(resultset.getString("size")==null){%>
                                                <td>0 MB</td>
                                             <%}else{ %>
                                                <td><%=df.format(resultset.getDouble("size")) +" MB "%></td>
                                             <%} %>
                                          <td><%=resultset.getString("upload_date")%></td>
                                          <td><%=count%></td>
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
  </script>
</body>

</html>