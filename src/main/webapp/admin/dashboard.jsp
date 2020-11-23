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
                <a class="navbar-brand" href="index.jsp">SOFTDOC ADMIN</a>
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
          <aside id="leftsidebar" class="sidebar">
            <!-- User Info -->
            <div class="user-info">
                <div class="image">
             <%
                try(Connection  connect=StoreDBConnection.openConnection();  PreparedStatement preparedStatement=connect.prepareStatement("SELECT * FROM `softdoc_staff` WHERE `id`='"+(int)session.getAttribute("id")+"'");)
                {
                         ResultSet result=preparedStatement.executeQuery();
                         int i = 1;
                         if(result.next())
                         {
              %>
                           
                           <%if(result.getString("profile_photo") !=null){%>                        
                                  <img src="<%=result.getString("profile_photo")%>" width="48" height="48" alt="User" />
                             <%}else{%>
                                  <img src="../images/user.png" width="48" height="48" alt="User" />
                             <%}%>
                           
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
                </div>
                <div class="info-container">
                    <div class="name" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><%=(String)session.getAttribute("adminname")%></div>
                    <div class="email"><%=(String)session.getAttribute("Email")%></div>
                    <div class="btn-group user-helper-dropdown">
                        <i class="material-icons" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">keyboard_arrow_down</i>
                        <ul class="dropdown-menu pull-right">
                            <li><a href="profile.jsp"><i class="material-icons">person</i>Profile</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="../Process?action=logout"><i class="material-icons">input</i>Sign Out</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- #User Info -->
            <!-- Menu -->
            <div class="menu">
                <ul class="list" style="">
                    <li class="header">MAIN NAVIGATION</li>
                    
                    <li class="<% if(request.getRequestURI().equals("/admin/dashboard.jsp")) { out.print("active"); } %>">
                    
                        <a  href="dashboard.jsp">
                            <i class="material-icons">home</i>
                            <span>Home</span>
                        </a>
                    </li>
                    <li class="<% if(request.getRequestURI().equals("/admin/customer.jsp")) { out.print("active"); } %>">
                        <a href="customer.jsp">
                            <i class="material-icons">accessibility</i>
                            <span>Customer Center</span>
                        </a>
                    </li>
                    <li class="<% if(request.getRequestURI().equals("/admin/user.jsp")) { out.print("active"); } %>">
                        <a href="user.jsp">
                            <i class="material-icons">supervised_user_circle</i>
                            <span>User Center</span>
                        </a>
                    </li>
                    <li class="<% if(request.getRequestURI().equals("/admin/activity.jsp")){ out.print("active"); }%>">
                        <a href="activity.jsp">
                            <i class="material-icons">directions_walk</i>
                            <span>Activity</span>
                        </a>
                    </li>
                    <li class="<% if(request.getRequestURI().equals("/admin/cloud_usage.jsp")){ out.print("active"); }%>">
                        <a href="cloud_usage.jsp">
                            <i class="material-icons">cloud_circle</i>
                            <span>Cloud Report</span>
                        </a>
                    </li>
                    <li class="<% if(request.getRequestURI().equals("/admin/department.jsp")) { out.print("active"); } %>">
                        <a href="department.jsp">
                            <i class="material-icons">file_copy</i>
                            <span>Departments</span>
                        </a>
                    </li>
                    <li  class="<% if(request.getRequestURI().equals("/admin/report.jsp")) { out.print("active"); } %>">
                        <a href="report.jsp">
                            <i class="material-icons">policy</i>
                            <span>Billing Reports</span>
                        </a>
                    </li>
                    <li class="<% if(request.getRequestURI().equals("/admin/log.jsp")) { out.print("active"); } %>">
                        <a href="log.jsp">
                            <i class="material-icons">file_copy</i>
                            <span>Log Reports</span>
                        </a>
                    </li>
                  <%--   <li  class="<% if(request.getRequestURI().equals("/admin/complaint.jsp")) { out.print("active"); } %>">
                        <a href="complaint.jsp">
                            <i class="material-icons">settings_applications</i>
                            <span>Complaint</span>
                        </a>
                    </li> --%>
                    <!-- <li>
                        <a href="../Process?action=logout">
                             <i class="material-icons">lock</i>
                             <span>Logout</span>
                        </a>
                    </li> -->
                </ul>
            </div>
            <!-- #Menu -->
            <!-- Footer -->
            <div class="legal">
                <div class="copyright">
                    &copy; 2020 <a href="dashboard.jsp">SoftDoc</a>. All Right Reserved
                </div>
           </div>
            <!-- #Footer -->
        </aside>
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
                            <div class="text">My Profile</div>
                            <div class="number count-to" data-from="0" data-to="125" data-speed="15" data-fresh-interval="20"></div>
                        </div>
                    </div>
                  </a>  
                  </div>
               <a href="customer.jsp"> 
                  <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                     <div class="info-box bg-cyan hover-expand-effect">
                         <div class="icon">
                            <i class="material-icons">help</i>
                         </div>
                         <div class="content">
                         <%
                                    try(Connection connection=StoreDBConnection.openConnection();PreparedStatement preparedStatement=connection.prepareStatement("SELECT count(id) as Number FROM customer_details");)
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
                  </a> 
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                  <a href="user.jsp"> 
                      <div class="info-box bg-light-green hover-expand-effect">
                         <div class="icon">
                            <i class="material-icons">forum</i>
                         </div>
                          <%
                          	       try(Connection connection=StoreDBConnection.openConnection();
                          	    	  	 PreparedStatement preparedStatement=connection.prepareStatement("SELECT count(id) as Number FROM `softdoc_staff` where role !='superadmin' and role !='admin'");
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
                  </a>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                 <a href="report.jsp">   
                    <div class="info-box bg-orange hover-expand-effect">
                        <div class="icon">
                            <i class="material-icons">person_add</i>
                        </div>
                        <div class="content">
                             <div class="text">System Reports</div>
                             <div class="number count-to" data-from="0" data-to="1225" data-speed="1000" data-fresh-interval="20"></div>
                        </div>
                     </div>
                 </a>  
                </div>
            </div>
            <div class="row clearfix">
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                  <a href="department.jsp"> 
                    <div class="info-box bg-orange hover-expand-effect">
                        <div class="icon">
                            <i class="material-icons">person_add</i>
                        </div>
                        <div class="content">
                        <%
                        	  try( Connection connection=StoreDBConnection.openConnection();
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
                  </a>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                   <a href="cloud_usage.jsp">
                    <div class="info-box bg-cyan hover-expand-effect">
                         <div class="icon">
                            <i class="material-icons">help</i>
                         </div>
                         <div class="content">
                           <%
                           	       try(Connection connection=StoreDBConnection.openConnection();PreparedStatement preparedStatement=connection.prepareStatement("SELECT Sum(size) as size FROM `document_info` where STATUS='quality_approved'");)
                                   {
                                             ResultSet resultset=preparedStatement.executeQuery();
                                             if(resultset.next())
	                                         {
	                         %>
                               <div class="text">&nbsp;&nbsp;&nbsp;<titles style="font-size:15px;">Cloud Usage</titles> &nbsp;&nbsp;&nbsp;<strong style="font-size:30px;"><%=resultset.getInt("size")+"MB"%></strong></div>
                               <div class="number count-to" data-from="0" data-to="257" data-speed="1000" data-fresh-interval="20"></div>
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
                  </a>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
	               <a href="log.jsp">
	                <div class="info-box bg-pink hover-expand-effect">
	                        <div class="icon">
	                            <i class="material-icons">public</i>
	                        </div>
	                        <div class="content">
	                            <div class="text">Log Reports</div>
	                            <div class="number count-to" data-from="0" data-to="125" data-speed="15" data-fresh-interval="20"></div>
	                        </div>
	                  </div>
	                </a>
	              </div>   
            </div>
            <div class="row clearfix">
                <!-- Latest Social Trends -->
                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                    <div class="card">
                        <div class="body bg-cyan">
                            <div class="m-b--35 font-bold">ACTIVITY LOG</div>
                            <ul class="dashboard-stat-list">
                               
                              <%
                                          try(Connection  connect=StoreDBConnection.openConnection();PreparedStatement preparedStatement=connect.prepareStatement("SELECT `logintime`, `action` FROM `logfile` ORDER BY id DESC LIMIT 5");)
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
                            <center><a role="button" class="btn" class="font-bold" href="log.jsp" style="color:white">View More</i></a></center>
                        </div>
                    </div>
                </div>
            </div>
       
    </section>
     
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
