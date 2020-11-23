<%@include file="include/session.jsp" %>
<%@page import="java.io.File" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date" %>    
<!DOCTYPE html>
<html>
<head>
    <%@include file="include/head.jsp"%>   
               <!-- Datatable -->
    <link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
    
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
                <h2>
                    Documents 
                </h2>
            </div>
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                               Documents 
                            </h2>
                        </div>
                        <div class="body">
                            <div class="row">
                        <%
                                try(Connection  connect=IndexingDBConnection.openConnection();PreparedStatement preparedStatement=connect.prepareStatement("SELECT count(DISTINCT document_no) as no_of_doc, sum(size) as size, file_no , company_name , company_id , department , upload_date , document_info.id as id  FROM customer_details, document_info WHERE document_info.company_id = customer_details.id AND file_no =(select file_no from document_info where id='"+request.getParameter("id")+"') AND document_info.status='indexing' GROUP BY document_info.file_no");)
                                {
                                	                                      
                                	ResultSet resultset=preparedStatement.executeQuery();
                                    if(resultset.next())
                                    {
                        %>
                        
                                <div class="col-md-2">Company Name:-</div>
                                <div class="col-md-2"><%=resultset.getString("company_name")%></div>
                                <div class="col-md-3"></div>
                                <div class="col-md-2"></div> 
                             </div>
                              <div class="row">
                                 <div class="col-md-2">File No.:-</div>
                                 <div class="col-md-2"><%=resultset.getString("file_no")%></div>
                             </div>
                             <div class="row">
                                <div class="col-md-2">Department:-</div>
                                <div class="col-md-2"><%=resultset.getString("department")%></div>
                              </div>
                              <div class="row">
                                <div class="col-md-2">Document Counter:-</div>
                                <input type="hidden" id="count" value="<%=resultset.getInt("no_of_doc")%>">
                                <div class="col-md-3"><%=resultset.getInt("no_of_doc")%></div>
                                <div class="col-md-5"></div>
                              	<div class="col-md-2"><a href="documentupload.jsp?id=<%=resultset.getString("id")%>" role="button" class="btn btn-success">+ Add Document</a></div>
                              </div>
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
                            
                            <div class="table-responsive">
                                <table class="table table-hover" id="myTable">
                                <thead>
                                     <tr>
                                         <th>Document No. </th>
                                         <th>Document Type</th>
                                         <th>Time</th>
                                         <th>Attachment Count</th>
                                         <th>Delete Document</th>
                                     </tr>
                                </thead>
                                <tbody>
                                
                                      <%
                                        String file_no="";
            	                            try(Connection  connect=IndexingDBConnection.openConnection();PreparedStatement preparedStatement=connect.prepareStatement("SELECT id , file_no ,count(attachment_no)as count , hit , document_no , department , document_type , DATE_FORMAT( upload_date ,'%d %b %Y') AS upload_date  FROM `document_info` WHERE file_no = (select file_no from document_info where id='"+request.getParameter("id")+"') and status='indexing' and document_no !='null' group by document_no");)
                                            {
                                                  ResultSet resultset=preparedStatement.executeQuery();
                                                  while(resultset.next())
                                                  {
                                                	  file_no=resultset.getString("file_no");
                                     %>
                                     <tr>
                                           <td><a data-id="<%=resultset.getString("file_no")%>" href="viewdocument.jsp?id=<%=resultset.getString("id")%>"><%=resultset.getString("document_no")%></a></td>
                                           <td><%=resultset.getString("document_type")%></td>
                                           <td><%=resultset.getString("upload_date")%></td>
                                           <td><%=resultset.getString("count")%></td> 
                                           <td>
                                           
                                              <button type="button" class="btn btn-primary delete-document"  data-id="<%=resultset.getString("id")%>" >Delete Document</button>
                                             
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
                            <div class="row">
                                <center>
                                     
                                       <button type="button" class="btn btn-success" id="btnclick" data-id="<%=file_no%>">Send to Quality Team</button>
                                   
                                </center>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    
   
    <%@include file="include/script.jsp"%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script> 
    <script src="include/custom-script.js"></script>  
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script type="text/javascript">
   
     $("#btnclick").click(function(){    
  
     let id=$(this).data('id'); 
     var count=$('#count').val();
     if(count==0)
     {
    	error('Please upload document');
	    return false;	
     }
  
     Swal.fire({
    	  title: 'Are you sure?',
    	  text: 'You will not be able to revert this action',
    	  icon: 'warning',
    	  showCancelButton: true,
    	  cancelButtonText: ' No ',
    	  confirmButtonColor: '#2DC297',
    	  cancelButtonColor: '#d33',
    	  confirmButtonText: 'Yes'
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
    	   	    			   title: 'File Sent to Quality Team',
    	   	    			   timer: 3500
    	   	    			})
    	   	    		  setTimeout(function() {
    	   	    	       window.location.href = "indexing.jsp";
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
     
    
     
     $(document).on('click', '.delete-document', function (e) {
         e.preventDefault();
           
         Swal.fire({
        	  title: 'Are you sure?',
        	  text: "You will not be able to revert this Action",
        	  icon: 'warning',
        	  showCancelButton: true,
        	  cancelButtonText: 'No',
        	  confirmButtonColor: '#3085d6',
        	  cancelButtonColor: '#d33',
        	  confirmButtonText: 'Yes'
        	}).then((result) => {
        	  if (result.value) {

        	      var data={"document_info_id":$(this).data('id')};
        	      let element=$(this);
        	      $.ajax({
        	     	   
        	    	   url:"../indexingprocess?action=deletedocument",
        	    	    dataType:"json",
        	            type: "post",
        	            data:data ,
        	            success: function(data)
        	            {
        	              if(data.status)
        	  	          {
        	   	            	Swal.fire({
        	   	    			   position:'center',
        	   	    			   icon: 'success',
        	   	    			   title: 'Deleted Document',
        	   	    			   timer: 3500
        	   	    			})
        	   	    		  
        	   	    		   $(element).parents('tr').remove();
        	   	    			
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