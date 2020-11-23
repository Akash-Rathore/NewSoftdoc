<%@page import="com.customerclient.connection.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet" %>
<%@include file="include/session.jsp"%>
<%@ page import="java.io.File" %>
<!DOCTYPE html>
<html>
<head>
   <%@include file="include/head.jsp"%>
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
    
       .fa{
            font-size:18px !important;
            color: yellow;
       }  
       
       .loader{
     
       display:none;
      
      }
    
    
   </style>

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
                <a class="image" href="index.jsp"><img src="../images/logo5.png" class="logoClient" alt="User" /></a>
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
            <%@include file="include/sidebar.jsp"%>
        <!-- #END# Left Sidebar -->
        
    </section>

    <section class="content">
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header  margin0">
                            <br/>
                           <div class="row">
                                  <div class="col pull-right align-items-end">
                                         <a href="folderupload.jsp?id=<%=request.getParameter("id")%>" class="btn btn-primary">+ Add Document</a>
                                  </div>
                            </div>
                        
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-hover" id="mytable">
                                <thead>
                                    <tr>
                                       <th>Document No.</th>
                                       <th>Document Type</th>
                                       <th>Created By</th>
                                       <th>Created On</th>
                                       <th>Size</th>
                                       <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                           
                                       <%
                            try(Connection connection=DBConnection.openConnection();PreparedStatement  preparedStatement=connection.prepareStatement("select id , document_type , document_no , DATE_FORMAT( upload_date ,'%d %b %Y') AS upload_date , ROUND(SUM(size),2) as size , client_name from document_info where file_no=(select file_no from document_info where id='"+request.getParameter("id")+"') and folder_name=(select folder_name from document_info where id='"+request.getParameter("id")+"') and trash='0' and folder_status='folder' and document_no is not null group by document_no");)
                           {
                               ResultSet resultset=preparedStatement.executeQuery();
                               while(resultset.next())
                               {
                         %>
                                   <tr>
                                        <td><a href="myattachment.jsp?id=<%=resultset.getString("id")%>"><%=resultset.getString("document_no")%></a>
                                        <td><%=resultset.getString("document_type")%></td>
                                        <td><%=resultset.getString("client_name")%></td>
                                        <td><%=resultset.getString("upload_date")%></td>
                                        <td><%=resultset.getString("size")+"  "+"MB"%> </td>
                                        <td>
                                            <a href="editfolder.jsp?id=<%=resultset.getString("id")%>"  class="btn"  title="edit"><i class="material-icons">edit</i></a>
                                            <a  role="button"  class="btn"  title="star document" onclick="myFunction(<%=resultset.getInt("id")%>)" ><i class="material-icons">star_rate</i></a>
                                            <a class='btn delete'  role="button"  data-id='<%=resultset.getInt("id")%>' title="delete document"><i class="material-icons">delete</i></a>
                                        </td>
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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script>
        $(document).ready(function() {
            $('#mytable').DataTable( {
                "searching":false,
                "lengthMenu":[25,50],
                "pageLength":25
           
            } );
        } );
        $(document).ready(function() {
            $('#mytablefolder').DataTable( {
                "searching":false,
                "lengthMenu":[25,50],
                "pageLength":25
           
            } );
        } );
        
        
        
           

     
       $(document).on('click','.delete',function(){
        	   
        	var today = new Date();
            var dd = String(today.getDate()).padStart(2, '0');
            var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
            var yyyy = today.getFullYear();
            today = yyyy + '-' + mm + '-' + dd ;
        	
        	var id=$(this).data('id');
        	let element = $(this);
        	Swal.fire({
        		title: 'Are you sure?',
                text: "Deleted documented will be available in Trash for 30 days before being permanently deleted",
                icon: 'warning',
                showCancelButton: true,
                cancelButtonText: 'No',
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes'
        		}).then((result) => {
        		  if (result.value) {
        	 	   
        				$.ajax({
              	            url: "../clientprocess?action=trashdocument",
              	            type: "post",
              	            dataType:"json",
              	            data:{"document_info_id":$(this).data('id'),"currentDate":today},
              	            beforeSend:function(){
        	    	        	
        		    	        $(element).hide();
        		    	    
        	    	        },
              	            success: function(data)
              	            {
              	            	
              	               if(data.status)
              	               {
              	            	
              	            	  $(element).hide();
         	     	    		  Swal.fire({
        	     	    			  position:'center',
        	     	    			  icon: 'success',
        	     	    			  title: 'Success Trash',
        	     	    			  timer: 2000
        	     	    			})
        	     	    			
        	     	    		 $(element).parents('tr').remove();
        	     	    			
              	               }
              	               else
              	               {
              	            	  Swal.fire({
        	     	    			  position: 'top-end',
        	     	    			  icon: 'warning',
        	     	    			  title: 'Something is wrong',
        	     	    			  timer: 2000
        	     	    			})   
        	     	    			
        	     	    			//$('.delete').show();
        	    	    			$(element).hide();
        	    	    			
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
    
        
        function myFunction(id) {
            
       
       	 var star="welcome to the future";
       	 $.ajax({
      	            url: "../clientprocess?action=clientbookmarkupdate",
      	            type: "post",
      	            dataType:"json",
      	            data:{"id":id,"star":star},
      	            success: function(data)
      	            {
      	            	
      	               if(data.status)
      	               {
      	            	  Swal.fire({
        	    			  position: 'center',
        	    			  icon: 'success',
        	    			  title: 'Star Success',
        	    			  timer: 2000
        	    			})
        	    		   
      	               }
      	               else
      	               {
      	            	  Swal.fire({
        	    			  position: 'top-end',
        	    			  icon: 'warning',
        	    			  title: 'Something is wrong',
        	    			  timer: 2000
        	    			})   
      	               }
      	              
      	             
      	           },
      	  	    error:function(e)
      	  	    {
      	  	    	console.log("error in pages");
      	  	    }
      	     }); 
      	  
      	  } 
        
        

        
   </script>
 </body>
</html>
