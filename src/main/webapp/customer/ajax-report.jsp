<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.customeradmin.connection.DBConnection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet"%>       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
        
        
          
                                <% 
                                        try(Connection  connection=DBConnection.openConnection(); PreparedStatement preparedStatement=connection.prepareStatement("SELECT * FROM logfile, client_details WHERE logfile.user_id = client_details.customer_id AND logfile.role='customeradmin' AND logfile.user_id = '"+(int)session.getAttribute("customer_id")+"' AND  logfile.logintime BETWEEN '"+request.getParameter("start")+"' and '"+request.getParameter("end")+"' ORDER BY client_details.id DESC");)
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