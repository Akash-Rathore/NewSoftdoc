<%@include file="include/session.jsp" %>
<!DOCTYPE html>
<html>
<head>
   <%@include file="include/head.jsp"%>
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
                <h2>
                    Documents Status
                </h2>
            </div>
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                Add Documents 
                            </h2>
                        </div>
                        <div class="body">
                             <%
                             	String file_no = request.getParameter("id");
                                                      
                                                          
                                                            try{
                                                              
                             							 Connection  connect=IndexingDBConnection.openConnection();
                             							 PreparedStatement preparedStatement=connect.prepareStatement("SELECT count(document_info.id) as no_of_doc, sum(size) as size, file_no, company_name, department, upload_date FROM customer_details, document_info WHERE document_info.company_id = customer_details.id AND file_no = '"+file_no+"' GROUP BY document_info.file_no");
                                                                  ResultSet resultset=preparedStatement.executeQuery();
                                                                  
                                                                 while(resultset.next())
                                                                 {
                             %>  
                            
                                   <div class="row">
                                       <div class="col-md-2">Department :-</div>
                                       <div class="col-md-9"><%=resultset.getString("department")%></div>
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
                            
                            <!-- <div class="row">
                                <div class="col-md-2">Document Type</div>
                                <div class="col-md-4">HR</div>
                            </div> -->
                            
                            <div class="table-responsive">
                                <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Documents . </th>
                                    </tr>
                                </thead>
                                <tbody>
                                           
                             <%
                                                                        	try{
                                                                                                         
                                                                        							 Connection  connect=IndexingDBConnection.openConnection();
                                                                        							 PreparedStatement preparedStatement=connect.prepareStatement("SELECT * FROM `document_info` WHERE file_no = '"+file_no+"'");
                                                                                                             ResultSet resultset=preparedStatement.executeQuery();
                                                                                                             
                                                                                                            while(resultset.next())
                                                                                                            {
                                                                        %>
                                     <tr>
                                           <td><%=resultset.getInt("file_no")%></td>
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
                                    
                                    
                                    
                                  <!--   
                                  <tr>
                                        <td>000002</td>
                                    </tr>
                                    <tr>
                                        <td>000003</td>
                                    </tr>
                                    <tr>
                                        <td>000004</td>
                                  </tr>
                                 -->
                                  </tbody>
                                </table>
                            </div> 
                            
                            <div class="row">
                                <div class="col-md-2">Reason</div>
                                <div class="col-md-4">Page Shortage</div>
                            </div>
                            
                            <div class="row">
                                <center>
                                    <a href="#" role="button" id="addmore" class="btn btn-success">+ Upload File</a>
                                   
                                   <!--  <a href="#" role="button" class="btn btn-success">Save</a> -->
                                   <!-- <button id="addmore" class="btn btn-primary btn-sm addmore" type="button"><i class="fa fa-plus-circle" aria-hidden="true"></i> Add More Document </button>
				                    -->
                                </center>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

   <%@include file="include/script.jsp"%>          
    
    
</body>

</html>
