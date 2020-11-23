<%@include file="include/session.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>Sub Admin| SoftDoc</title>
    <!-- Favicon-->
    <link rel="icon" href="../images/favicon.png" type="image/x-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">

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
                <h2>Dashboard</h2>
            </div>
            <div class="row clearfix">
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                 <a href="profile.jsp"> 
                    <div class="info-box bg-pink hover-expand-effect">
                        <div class="icon">
                            <i class="material-icons">public</i>
                        </div>
                        <div class="content">
                           <div class="text">My profile</div>
                           <div class="number count-to" data-from="0" data-to="125" data-speed="15" data-fresh-interval="20"></div>
                        </div>
                    </div>
                  </a> 
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                 <a href="indexing.jsp">
                    <div class="info-box bg-cyan hover-expand-effect">
                        <div class="icon">
                            <i class="material-icons">help</i>
                        </div>
                        <div class="content">
                       <%
                                       	try( Connection  connect=IndexingDBConnection.openConnection();
                                       			PreparedStatement preparedStatement=connect.prepareStatement("SELECT COUNT(DISTINCT document_no)as count FROM document_info where status='indexing'");
                                                )
                                        {
                                                ResultSet result=preparedStatement.executeQuery();
                                                result.next();
                        %>
                                       <div class="text">&nbsp;&nbsp;&nbsp;<titles style="font-size:15px;">Indexing</titles> &nbsp;&nbsp;&nbsp;<strong style="font-size:30px;"><%=result.getString("count")%></strong></div>
                            
                       <%	   
                                    
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
                  
                   
                  
                            <div class="number count-to" data-from="0" data-to="257" data-speed="1000" data-fresh-interval="20"></div>
                        </div>
                    </div>
                  </a> 
                 </div>
                 <a href="quality_return.jsp">
                   <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box bg-light-green hover-expand-effect">
                        <div class="icon">
                            <i class="material-icons">forum</i>
                        </div>
                        <div class="content">
                        <%
                                       	try( Connection  connect=IndexingDBConnection.openConnection();
                                       			PreparedStatement preparedStatement=connect.prepareStatement("SELECT COUNT(DISTINCT document_no)as count FROM document_info where status='quality_return'");
                                                )
                                        {
                                                ResultSet result=preparedStatement.executeQuery();
                                                result.next();
                        %>
                                              
                                             <div class="text"><titles style="font-size:15px;">Quality Return</titles> &nbsp;<strong style="font-size:30px;"><%=result.getString("count")%></strong></div>
                        
                      <% 
                  
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
                        
                        <div class="number count-to" data-from="0" data-to="243" data-speed="1000" data-fresh-interval="20"></div>
                        </div>
                    </div>
                  </a>  
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                  <a href="reporting.jsp">
                    <div class="info-box bg-orange hover-expand-effect">
                        <div class="icon">
                            <i class="material-icons">person_add</i>
                        </div>
                        <div class="content">
                            <div class="text">Reports</div>
                            
                            <div class="number count-to" data-from="0" data-to="1225" data-speed="1000" data-fresh-interval="20"></div>
                        </div>
                    </div>
                   </a> 
                </div>
            </div>
                <!-- Latest Social Trends -->
                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                    <div class="card">
                        <div class="body bg-cyan">
                            <div class="m-b--35 font-bold">ACTIVITY LOG</div>
                            <ul class="dashboard-stat-list">
                                       <%
                                       	try( Connection  connect=IndexingDBConnection.openConnection();
                                       			PreparedStatement preparedStatement=connect.prepareStatement("SELECT * FROM `logfile` where user_id='"+(int) session.getAttribute("index_id")+"' and role='"+(String)session.getAttribute("index_role")+"' ORDER BY logintime DESC LIMIT 5");
                                                )
                                        {
                                                ResultSet result=preparedStatement.executeQuery();
                                                int i = 1;
                                                while(result.next())
                                                {
                                       %>
                               
                                <li>
                                    <%=result.getString("action")%>
                                    <span class="pull-right">
                                        <i class="material-icons">trending_up</i>
                                    </span>
                                </li>
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
                      
                            
                            </ul>
                             <center><a role="button" class="btn" class="font-bold" href="reporting.jsp" style="color:white">View More</i></a></center>
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
  
 </body>

</html>
