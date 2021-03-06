<%@page import="com.softdocindexing.connection.IndexingDBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet" %>
                    <li class="dropdown">
                        <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button">
                            <i class="material-icons">notifications</i>
                            <span class="label-count">5</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="header">NOTIFICATIONS</li>
                              <%
                                     	try(Connection  connect=IndexingDBConnection.openConnection(); PreparedStatement preparedStatement=connect.prepareStatement("SELECT `logintime`, `action` FROM `logfile` where user_id='"+(int) session.getAttribute("index_id")+"' and role='"+(String)session.getAttribute("index_role")+"' ORDER BY id DESC LIMIT 5");
                                                  )
                                         {
                                            ResultSet result=preparedStatement.executeQuery();
                                            while(result.next())
                                            {
                                                          %>
                                <ul class="menu">
                                    <li>
                                        <a href="javascript:void(0);">
                                            <div class="icon-circle bg-light-green">
                                                <i class="material-icons">person_add</i>
                                            </div>
                                            <div class="menu-info">
                                                <h4><%=result.getString("action")%></h4>
                                                <p>
                                                    <i class="material-icons">access_time</i><%=result.getTimestamp("logintime")%>
                                                </p>
                                            </div>
                                        </a>
                                    </li>
                               </ul>
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
                            <li class="footer">
                                <a href="reporting.jsp">View All Notifications</a>
                            </li>
                        </ul>
                    </li>
                  