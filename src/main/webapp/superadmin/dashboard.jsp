<%@include file="include/session.jsp"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>SUPER ADMIN | SOFTDOC</title>
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
                <a class="navbar-brand" href="index.jsp">SUPER ADMIN</a>
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
            <div class="block-header">
                <h2>Dashboard</h2>
            </div>
            <div class="row clearfix">
                <a href="profile.jsp">
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box bg-pink hover-expand-effect">
                        <div class="icon">
                            <i class="material-icons">public</i>
                        </div>
                        <div class="content">
                            <div class="text">My Profile</div>
                            <div class="number count-to" data-from="0" data-to="125" data-speed="15" data-fresh-interval="20"></div>
                        </div>
                    </div>
                </div>
                </a>
                <a href="customer.jsp">
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box bg-cyan hover-expand-effect">
                        <div class="icon">
                            <i class="material-icons">help</i>
                        </div>
                        <div class="content">
                             <%
                                    try(Connection connection=DBConnection.openConnection();PreparedStatement preparedStatement=connection.prepareStatement("SELECT count(id) as Number FROM customer_details");)
                                     {
                                             ResultSet resultset=preparedStatement.executeQuery();
                                             if(resultset.next())
                                              {
                                                               %>
                               <div class="text"><titles style="font-size:15px;">Customer Center</titles> &nbsp;&nbsp;&nbsp;<strong style="font-size:30px;"><%=resultset.getInt("Number")%></strong></div>
                               <div class="number count-to" data-from="0" data-to="257" data-speed="1000" data-fresh-interval="20"></div>
                                  
                           <%
                           	                    } 
                                       }
                                       catch(Exception e)
                                       {
                                             e.printStackTrace();	 
                                       }
                           %>
                        
                        
                        
                        </div>
                    </div>
                </div>
                </a>
                <a href="user.jsp">
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box bg-light-green hover-expand-effect">
                        <div class="icon">
                            <i class="material-icons">forum</i>
                        </div>
                           <%
                          	       try(Connection connection=DBConnection.openConnection();
                          	    	  	 PreparedStatement preparedStatement=connection.prepareStatement("SELECT count(id) as Number FROM `softdoc_staff` where role !='superadmin'");
                                           )
                                   {
                                             ResultSet resultset=preparedStatement.executeQuery();
                                             if(resultset.next())
                                             {
                          %>
                             <div class="content">
                               <div class="text">&nbsp;&nbsp;&nbsp;<titles style="font-size:15px;">Users Center</titles> &nbsp;&nbsp;&nbsp;<strong style="font-size:30px;"><%=resultset.getInt("Number")%></strong></div>
                               <div class="number count-to" data-from="0" data-to="243" data-speed="1000" data-fresh-interval="20"></div>
                            </div>
                             <%
                                     } 
                                             }
                                             catch(Exception e)
                                             {
                                                 e.printStackTrace();	 
                                             }
                                    %>
                       
                    </div>
                </div>
                </a>
                <a href="department.jsp">
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box bg-orange hover-expand-effect">
                        <div class="icon">
                            <i class="material-icons">person_add</i>
                        </div>
                        <div class="content">
                            <%
                        	  try( Connection connection=DBConnection.openConnection();
                        			  PreparedStatement preparedStatement=connection.prepareStatement("SELECT count(id) as Number FROM `deparment`");
                                      )
                                      {
                                                    	 ResultSet resultset=preparedStatement.executeQuery();
                                                         if(resultset.next())
                                                         {
                        %>
                         
                                         <div class="text">&nbsp;&nbsp;&nbsp;<titles style="font-size:15px;">Departments</titles> &nbsp;&nbsp;&nbsp;<strong style="font-size:30px;"><%=resultset.getInt("Number")%></strong></div>
                                         <div class="number count-to" data-from="0" data-to="1225" data-speed="1000" data-fresh-interval="20"></div>
                             <%
                             	} 
                                                                }
                                                               catch(Exception e)
                                                               {
                                                                  e.printStackTrace();	 
                                                               }
                             %>
                        
                       
                        
                        </div>
                    </div>
                </div>
               </a>
            </div>
            <div class="row clearfix">
               <a href="report.jsp">
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                 
                    <div class="info-box bg-orange hover-expand-effect">
                        <div class="icon">
                            <i class="material-icons">person_add</i>
                        </div>
                        <div class="content">
                            <div class="text">System Report</div>
                            
                            <div class="number count-to" data-from="0" data-to="1225" data-speed="1000" data-fresh-interval="20"></div>
                        </div>
                    </div>
                </div>
               </a>
              <%--  <a href="complaint.jsp">
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box bg-light-green hover-expand-effect">
                        <div class="icon">
                            <i class="material-icons">forum</i>
                        </div>
                         <%
                         	try(Connection connection=DBConnection.openConnection();
                         			PreparedStatement preparedStatement=connection.prepareStatement("SELECT count(id) as Number FROM `complain_list` where client_id is null");
                                    )
                            {
                                                     	  ResultSet resultset=preparedStatement.executeQuery();
                                                          if(resultset.next())
                                                          {
                         %>
                        
                         
                            <div class="text">&nbsp;&nbsp;&nbsp;<titles style="font-size:15px;">Complaint List</titles> &nbsp;&nbsp;&nbsp;<strong style="font-size:30px;"><%=resultset.getInt("Number")%></strong></div>
                            <div class="number count-to" data-from="0" data-to="243" data-speed="1000" data-fresh-interval="20"></div>
                             <%
                          } 
                                      }
                                                               catch(Exception e)
                                                               {
                                                                  e.printStackTrace();	 
                                                               }
                             %>
                        
                        
                        
                    </div>
                 </div>
                </a> --%>
               <a href="log.jsp">
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box bg-cyan hover-expand-effect">
                        <div class="icon">
                            <i class="material-icons">help</i>
                        </div>
                        <div class="content">
                            <div class="text">Log Reports</div>
                            <div class="number count-to" data-from="0" data-to="257" data-speed="1000" data-fresh-interval="20"></div>
                        </div>
                    </div>
                </div>
               </a>
            </div>
            <div class="row clearfix">
                
                <!-- Latest Social Trends -->
                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                    <div class="card">
                        <div class="body bg-cyan">
                            <div class="m-b--35 font-bold">ACTIVITY LOG</div>
                            <ul class="dashboard-stat-list">
                                <%
                               try{
                                    Connection  connect=DBConnection.openConnection();
                                    PreparedStatement preparedStatement=connect.prepareStatement("SELECT `logintime`, `action` FROM `logfile` ORDER BY id DESC LIMIT 5");
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
                            <center><a role="button" class="btn" class="font-bold" href="log.jsp" style="color:white">View More</i></a></center>
                        </div>
                    </div>
                </div>
                <!-- #END# Latest Social Trends -->
                <!-- Answered Tickets -->
                <!-- #END# Answered Tickets -->
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

    <!-- Custom Js -->
    <script src="../js/admin.js"></script>
    <script src="../js/pages/forms/basic-form-elements.js"></script>

    <!-- Demo Js -->
    <script src="../js/demo.js"></script>
    <script type="text/javascript">
     $(document).ready(function(){
        $("a[href*='" + customer.jsp + "']").addClass("active");
     }); 
    
    
    
    
    </script>
</body>

</html>
