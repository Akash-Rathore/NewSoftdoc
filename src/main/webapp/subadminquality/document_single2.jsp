<%@include file="include/session.jsp"%>

<!DOCTYPE html>
<html>
<head>
       
      <%@include file="include/head.jsp"%>
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
                <a class="navbar-brand" href="index.jsp">SOFTDOC SUBADMIN QUALITY</a>
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
             <%@include file="include/sidebar.jsp" %>
        <!-- #END# Left Sidebar -->
    </section>

    <section class="content">
        <div class="container-fluid">
            <div class="block-header">
                <h2>
                    Documents Status
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
                            <div class="table-responsive">
                                <table class="table table-hover" id="myTable">
                                <thead>
                                    <tr>
                                        <th>Document No. </th>
                                        <th>Department</th>
                                        <th>Document Type</th>
                                        <th>Attachment Count</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                  <%
          	                              String file_no="";
                                          try(Connection  connect=QualityDBConnection.openConnection();
                                        		  PreparedStatement preparedStatement=connect.prepareStatement("SELECT  id , count(attachment_no)as count,file_no,document_no,department,document_type FROM `document_info` WHERE file_no = (select file_no from document_info where id='"+request.getParameter("id")+"') and status='quality'  AND document_info.document_no !='null' group by document_no");
                                                     )
                                          {
                                          	                                      
                                          	   ResultSet resultset=preparedStatement.executeQuery();
                                               while(resultset.next())
                                               {
                                            	   
                                            	   file_no=resultset.getString("file_no");
                                  %>
                                        <tr>
                                             <td><a href="attachment.jsp?id=<%=resultset.getString("id")%>"><%=resultset.getString("document_no")%></a></td>
                                             <td><%=resultset.getString("department")%></td>
                                             <td><%=resultset.getString("document_type")%>
                                             <td><%=resultset.getString("count")%></td>
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

  


<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Question</h4>
        </div>
        <div class="modal-body">
          
          
          <form action="process?action=qualityquestion" method="post" id="user" class="form-horizontal">
          
          		<div class="form-group">
                     <label for="NameSurname" class="col-sm-8 control-label"></label>
                 <br>
                 <div class="form-group" style="margin-bottom:10px;">
                     <label for="NameSurname" class="col-sm-8 control-label">
                     	Are all pages in the bunch scanned?
                     </label>
                     <div class="col-md-4">
                             <select name="questone">
    							 <option value="yes">Yes</option>
    							 <option value="no">No</option>
    						 </select>	
  							
                     </div>
                    
                 </div>	
                 <br>
                 <div class="form-group" style="margin-bottom:10px;">
                     <label for="NameSurname" class="col-sm-8 control-label">
                     	Are all images readable at 100% zoom?
                     </label>
                     <div class="col-sm-4">
                             <select name="questtwo">
    							 <option value="yes">Yes</option>
    							 <option value="no">No</option>
    						 </select>
    						 <input type="hidden" name="file_no"  value="<%=request.getParameter("id")%>">
    						 
                     </div>
                   
                 </div>	
                 <br>
                 <div class="form-group" style="margin-bottom:10px;">
                     <label for="NameSurname" class="col-sm-8 control-label">
                     	If no. which page/pages are not clear & required to be re-scanned?
                     </label>
                     <div class="col-sm-4">
                         
                            <input type="text" name="questthree" value="">
    					 
                     </div>
                 </div>	
                 <br>
                 <div class="form-group" style="margin-bottom:10px;">
                     <label for="NameSurname" class="col-sm-8 control-label">
                     	Are all available indexing fields filled?
                     </label>
                     <div class="col-sm-4">
                           <select name="questfour">
    							 <option value="yes">Yes</option>
    							 <option value="no">No</option>
    					 </select>
                     </div>
                 </div>	
                 <br>
                 <div class="form-group" style="margin-bottom:10px;">
                     <label for="NameSurname" class="col-sm-8 control-label">
                     	Are there any spelling/typing errors?
                     </label>
                    <div class="col-sm-4">
                           <select name="questfive">
    							 <option value="yes">Yes</option>
    							 <option value="no">No</option>
    					 </select>
                     </div>
                 </div>	
                 <br>
                 <div class="form-group" style="margin-bottom:10px;">
                     <label for="NameSurname" class="col-sm-8 control-label">
                     	Specify index field
                     </label>
                     <div class="col-sm-4">
                          <input type="text" name="questsix" value="">
                     </div>
                 </div>	
                 <br>
                 <div class="form-group" style="margin-bottom:10px;">
                     <label for="NameSurname" class="col-sm-8 control-label">
                     	Is the file attached correct and pertains to indexed fields?
                     </label>
                     <div class="col-sm-4">
                           <select name="questseven">
    							 <option value="yes">Yes</option>
    							 <option value="no">No</option>
    					 </select>
                     </div>
                 </div>	
                 <div class="col-md-12">
                 	<center><input type="submit" class="btn btn-success" id="btnSubmit" ></center> 
                 </div>
                 
           </form>
          
          
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  
    <%@include file="include/script.jsp"%>
   <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function() {
          $('#myTable').DataTable( {
              "searching":false,
              "lengthMenu":[25,50],
              "pageLength":25
          } );
        });
   </script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
  <script type="text/javascript">
 

	  $('#user').submit(function(e){
		     e.preventDefault();
		   
		      $.ajax({
		    	       url:"../process?action=qualityquestion",
		    	       type:"POST",
		    	       dataType:"json",
		    	       data:$("#user").serialize(),
		    	       success:function(data,textStatus,jqXHR)
		    	       {
		    	    	  console.log(data);
		     	    	  if(data.status)
		    	          {
		     	    	   
		     	    		Swal.fire({
		     	    			  position: 'top-end',
		     	    			  icon: 'success',
		     	    			  title: 'Success',
		     	    			  showConfirmButton: false,
		     	    			  timer: 3500
		     	    			})
		     	    	   document.getElementById("user").reset();	
		     	    			
		     	    	        
		     	    	  }
		    	    	  else 
		    	    	  {
		    	    		   Swal.fire({
		    	    			  icon:'error',
		    	    			  title:'Not insert profile',
		    	    			  text:"wrong",
		    	    			  footer:'',
		    	    			  timer:3000
		    	    			}) 
		    	    	  }    
		    	      },
		    	    error:function(e)
		    	    {
		    	    	console.log("error in pages");
		    	    	  Swal.fire({
	    	    			  icon:'error',
	    	    			  title:'Something is Wrong',
	    	    			  text:"wrong",
	    	    			  footer:'',
	    	    			  timer:3000
	    	    			})
		    	    }
		       
		      });
	  });  	    
 </script>
     
 
 </body>

</html>