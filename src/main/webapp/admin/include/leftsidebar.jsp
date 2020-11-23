<%@page import="com.softdocadmin.connection.StoreDBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet" %>
 
<aside id="leftsidebar" class="sidebar">
            <!-- User Info -->
            <div class="user-info">
                <div class="image">
                <%
                try(Connection  connect=StoreDBConnection.openConnection();  PreparedStatement preparedStatement=connect.prepareStatement("SELECT * FROM `softdoc_staff` WHERE `id`='"+(int)session.getAttribute("id")+"'");)
                {
                         ResultSet result=preparedStatement.executeQuery();
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
                            <span>Cloud Usage</span>
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
                   <!--  <li>
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
        
