<%@include file="include/session.jsp" %>
<%@page import="java.io.File" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date" %>    
<%@ page import="java.sql.Statement" %>      
<!DOCTYPE html>
<html>
<head>
   
    <%@include file="include/head.jsp"%>   
               <!-- Datatable -->
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
                    Documents
                </h2>
            </div>
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                          <%
                                try(Connection  connect=IndexingDBConnection.openConnection();PreparedStatement preparedStatement=connect.prepareStatement("select * from customer_details where id='"+request.getParameter("id")+"'");)
                                {
                                	                                      
                                	ResultSet result=preparedStatement.executeQuery();
                                    if(result.next())
                                    {
                       %>
                            <h2>
                               Documents <%=result.getString("company_name")%>
                            </h2>
                         <%
                                      	}
                                 }
                                 catch(Exception exception)
                                 {
                               	  exception.printStackTrace();
                                 }
                                     %> 
                        </div>
                        <div class="body">
                          <div class="row">
                            <div class="table-responsive">
                            <table class="table table-hover" id="myTable">
                                <thead>
                                    <tr>
                                         <th>File No. </th>
                                         <th>Department</th>
                                         <th>Document Type</th>
                                         <th>Time</th>
                                         <th>Count</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                              String id = request.getParameter("id");
                                              String count="";
                                              try(Connection  connect=IndexingDBConnection.openConnection();PreparedStatement preparedStatement=connect.prepareStatement("SELECT * FROM `document_info` WHERE company_id = '"+id+"' and document_no is not null and status='indexing' group by file_no");)
                                              {
                                                                                                   
                                                  	  ResultSet resultset=preparedStatement.executeQuery();
                                                        while(resultset.next())
                                                        {
                                                        	
                                                        	
                                                           	try(Connection  connection=IndexingDBConnection.openConnection();Statement stat=connect.createStatement();)
        								                    {
        								                             ResultSet result=stat.executeQuery("SELECT COUNT(DISTINCT document_no)as count FROM document_info WHERE file_no='"+resultset.getString("file_no")+"'");
        								                             while(result.next())
        								                             {
        								                            	 count=result.getString("count");
        								                             }
        								                    }
                                  %>
                                     <tr>
                                           <td><a href="documents.jsp?id=<%=resultset.getString("file_no")%>"><%=resultset.getString("document_no")%></a></td>
                                           <td><%=resultset.getString("department")%></td>
                                           <td><%=resultset.getString("document_type")%></td>
                                       <%
                                     	   final String OLD_FORMAT = "yyyy-MM-dd hh:mm:ss";
                             			   final String NEW_FORMAT = "dd MMM yyyy";
                             			   SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
                                           Date d = sdf.parse(resultset.getString("upload_date"));
                             			   sdf.applyPattern(NEW_FORMAT);
                             			   String upload_date = sdf.format(d);
                                        %>
                                          <td><%=upload_date%></td>
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
     
     Swal.fire({
    	  title: 'Are you sure?',
    	  text: "You won't be able to revert this!",
    	  icon: 'warning',
    	  showCancelButton: true,
    	  confirmButtonColor: '#2DC297',
    	  cancelButtonColor: '#d33',
    	  confirmButtonText: 'Do you sure to send to Quality Team'
    	}).then((result) => {
    	  if (result.value) {
    		  $.ajax({
    	            url:"../indexingprocess?action=indexingupdatequality&id="+id,
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
    	   	    			   timer: 3500
    	   	    			})
    	   	    			
    	   	    		     	
    	   	    		  setTimeout(function() {
    	   	    	       window.location.href = "indexing.jsp"
    	   	    	      }, 3500);
    	   	    			
    	   	    	    
    	   	    			
    	   	    	  }
    	  	    	  else 
    	  	    	  {
    	  	    		   Swal.fire({
    	  	    			  icon:'error',
    	  	    			  title:'Some thing is wrong',
    	  	    			  text:"wrong",
    	  	    			  timer:3000
    	  	    			}) 
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
