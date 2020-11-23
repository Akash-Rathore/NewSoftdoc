<%@include file="include/session.jsp" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date" %>   
<%@ page import="java.sql.Statement" %>    
<!DOCTYPE html>
<html>
<head>
    <%@include file="include/head.jsp"%>  
    <link href="../css/dataTables.bootstrap.min.css" rel="stylesheet" />
           
   <!--Datatable  -->   
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
                              <div class="table-responsive">
                                <table class="table table-hover" id="myTable">
                                <thead>
                                    <tr>
                                        <th>Customer Code</th>       
                                        <th>Company Name</th>
                                        <th>File No. </th>
                                        <th>Department</th>
                                        <th>Created Date</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody id="txtHint">
                              <%
                                        String count="";
					                 	try(Connection  connect=DBConnection.openConnection();Statement statement=connect.createStatement();)
					                    {
					                             ResultSet resultset=statement.executeQuery("SELECT company_id , document_info.id as id , file_no , client_id ,company_name, department, upload_date , customer_number,status FROM customer_details, document_info WHERE document_info.company_id = customer_details.id and document_no is not null GROUP BY document_info.file_no");
					                             while(resultset.next())
					                             {
                               
					                  	    final String OLD_FORMAT = "yyyy-MM-dd hh:mm:ss";
                             			    final String NEW_FORMAT = "dd MMM yyyy";
                             			    SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
                                            Date d = sdf.parse(resultset.getString("upload_date"));
                             			    sdf.applyPattern(NEW_FORMAT);
                             			    String upload_date = sdf.format(d);
                                        %>
                               
                                        <tr>
                                            
                                            <td><a href="document.jsp?id=<%=resultset.getString("id")%>"><%=resultset.getString("customer_number")%></a></td>
                                            <td><%=resultset.getString("company_name")%></td>
                                            <td><%=resultset.getString("file_no")%></td>
                                            <td><%=resultset.getString("department")%></td>
                                            <td><%=upload_date%></td>
                                            
                                            <%if(resultset.getInt("client_id")!=0){ %>
                                            
                                            <td>Active</td>
                                            
                                            <%}else { %>
                                            
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
                                           <%}%>
                                         
                                         <%}%>
                                           <td>
                                               <a class='delete' role="button" data-id='<%=resultset.getString("file_no")%>' title="Delete file"><i class="material-icons">delete</i></a>
                                           </td>   
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
    <script src="../js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script>
    $(document).ready( function () {
	    $('#myTable').DataTable({
	    	  "searching":true,
              "lengthMenu":[25,50],
              "pageLength":25
	    });
    } );
  </script>
  <script>
  $(document).on('click','.delete',function(){
	  
	  var id=$(this).data('id');      
	  let element = $(this);
		    Swal.fire({
            title: 'Are you sure?',
            text: "You will not be able to revert this action",
            icon: 'warning',
            showCancelButton: true,
            cancelButtonText: 'No',
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes'
            }).then((result) => {
           if (result.value) {
         	  
         	  $.ajax({
       	        url:"../superprocess?action=filenumberdelete&id="+id,
       	        type:"POST",
       	        dataType:"json",
       	        success:function(data,textStatus,jqXHR)
       	        {
       	      	   if(data.status)
       	      	   {
       	      		   console.log(data);
       	      
       	      		   if(data.status){
	          	      			Swal.fire({
	          	      			     position: 'center',
	          	      		         icon: 'success',
	          	      		         title: 'Delete File Successfully',
	          	      		         timer: 3500
	          	      		    });
	          	      	       $(element).parents('tr').remove();
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
</body>

</html>
