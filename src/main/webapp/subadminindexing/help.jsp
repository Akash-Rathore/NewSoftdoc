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
                    Help & Support
                </h2>
            </div>
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                Support
                            </h2>
                            
                        </div>
                        <div class="body mrgnbtm">
                            <p>
                                For any Query
                                   <%
                            	try(Connection  connect=IndexingDBConnection.openConnection();
                            			  PreparedStatement preparedStatement=connect.prepareStatement("SELECT `mobile`, `email` FROM  `support`");
                                        )
                                {
                                                                 ResultSet resultset=preparedStatement.executeQuery();
                                                              
                                                                if(resultset.next())
                                                                {
                            %>
                         
                                
                                     <h5>
                                        Call us-   <%=resultset.getString("mobile")%>
                                     </h5>
                                     <h5>
                                      Mail us-     <%=resultset.getString("email")%>
                                    </h5>
                                   
                                
                         
                         
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
                           
                               
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <div class="row">
                                <h2 class="col-md-4 col-lg-4 col-xs-12 pull-left">
                                    <div class="m-t-10">
                                        FAQs
                                    </div>
                                </h2>
                            </div>
                        </div>
                        <%
                        	try( Connection  connection=IndexingDBConnection.openConnection();
                        			PreparedStatement preparedStat=connection.prepareStatement("SELECT `title`, `description` FROM `faq`");
                                    )
                            {
                                                           ResultSet result=preparedStat.executeQuery();
                                                            while(result.next())
                                                            {
                        %>
                                      <div class="header">
                                      	<div class="row">
                                      		<button type="button" style="margin-left:15px;" class="btn btn-info" data-toggle="collapse" data-target="#demo">Ques</button>
                                      		<strong><%=result.getString("title")%></strong>
                                      	</div>
                                          
                                          <div id="demo" style="margin-top:10px">
                                              <%=result.getString("description")%> 
                                          </div>
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
                    </div>
                </div>
            </div>
        </div>
    </section>
     <%@include file="include/script.jsp"%>
    </body>
</html>
