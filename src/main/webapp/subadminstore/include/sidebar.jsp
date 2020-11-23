<%@page import="com.subadminstore.connection.StoreDBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet" %>
 
              
        <aside id="leftsidebar" class="sidebar">
            <!-- User Info -->
            <div class="user-info">
                <div class="image">
                           <%
                try(Connection  connect=StoreDBConnection.openConnection();  PreparedStatement preparedStatement=connect.prepareStatement("SELECT * FROM `softdoc_staff` WHERE `id`='"+(int)session.getAttribute("store_id")+"'");)
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
                    <div class="name" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><%=(String)session.getAttribute("storename")%></div>
                    <div class="email"><%=(String)session.getAttribute("storeemail")%></div>
                    <div class="btn-group user-helper-dropdown">
                        <i class="material-icons" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">keyboard_arrow_down</i>
                        <ul class="dropdown-menu pull-right">
                            <li><a href="profile.jsp"><i class="material-icons">person</i>Profile</a></li>
                            
                            <li role="separator" class="divider"></li>
                            <li><a href="../storeprocess?action=storelogout"><i class="material-icons">input</i>Sign Out</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- #User Info -->
            <!-- Menu -->
            <div class="menu">
                <ul class="list">
                    <li class="header">MAIN NAVIGATION</li>
                    <li class="<% if(request.getRequestURI().equals("/subadminstore/dashboard.jsp")) { out.print("active"); } %>">
                        <a href="dashboard.jsp">
                            <i class="material-icons">home</i>
                            <span>Home</span>
                        </a>
                    </li>
                    <li class="<% if(request.getRequestURI().equals("/subadminstore/scheduling.jsp")) { out.print("active"); } %>">
                        <a href="scheduling.jsp">
                            <i class="material-icons">accessibility</i>
                            <span>Scheduling</span>
                        </a>
                    </li>
                    <li class="<% if(request.getRequestURI().equals("/subadminstore/store.jsp")) { out.print("active"); } %>">
                        <a href="store.jsp">
                            <i class="material-icons">store</i>
                            <span>Store</span>
                        </a>
                    </li>
                    <li class="<% if(request.getRequestURI().equals("/subadminstore/pickedup.jsp")) { out.print("active"); } %>">
                        <a href="pickedup.jsp">
                            <i class="material-icons">directions_car</i>
                            <span>History</span>
                        </a>
                    </li>
                    <li class="<% if(request.getRequestURI().equals("/subadminstore/reporting.jsp")) { out.print("active"); } %>">
                       <a href="reporting.jsp">
                            <i class="material-icons">file_copy</i>
                            <span>Report</span>
                        </a>
                    </li>
                    <li class="<% if(request.getRequestURI().equals("/subadminstore/help.jsp")) { out.print("active"); } %>">
                        <a href="help.jsp">
                            <i class="material-icons">policy</i>
                            <span>Help Center</span>
                        </a>
                    </li>
                    <!-- <li>
                        <a href="../storeprocess?action=storelogout">
                            <i class="material-icons">lock</i>
                            <span>Logout</span>
                        </a>
                    </li>
                     -->
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