<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="include/session.jsp"%>    
<%@page import="com.subadminquality.connection.QualityDBConnection"%>    
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
       
         
         
                                <%
                                                         	try(Connection  connection=QualityDBConnection.openConnection(); PreparedStatement preparedStatement=connection.prepareStatement("SELECT * FROM `logfile` where user_id='"+(int) session.getAttribute("quality_id")+"' and role='"+(String)session.getAttribute("qualityrole")+"' and logintime BETWEEN '"+request.getParameter("start")+"' and '"+request.getParameter("end")+"' ORDER BY id DESC");)
                                                                                                 {
                                                                                                     ResultSet resultset=preparedStatement.executeQuery();
                                                                                                     int i = 1;
                                                                                                     while(resultset.next())
                                                                                                     {
                                                         %>
                                     
                                        <tr>
                                           <td><%=i %></td>
                                           <td><%=resultset.getString("loginid")%></td>
                                           <td><%=resultset.getString("ip")%></td>
                                           <td><%=resultset.getTimestamp("logintime")%></td>
                                           <td><%=resultset.getString("action")%></td>
                                        </tr>
                                        <%
                                            	
                                            	i++;
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
       
       
       
</body>
</html>