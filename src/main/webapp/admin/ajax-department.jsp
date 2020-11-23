<%@ page import="com.softdocadmin.connection.StoreDBConnection"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
   <title>Insert title here</title>
</head>
<body>
      
     
                                    <%
                                          try(Connection connection=StoreDBConnection.openConnection();PreparedStatement preparedStatement=connection.prepareStatement("SELECT * FROM `deparment` where `industry`='"+request.getParameter("id")+"'");)
                                          {
                                           	       ResultSet resultset=preparedStatement.executeQuery();
                                                   while(resultset.next())
                                                   {
                                               %>
                                                <div class="col-md-3">
		                                           <label class="container"><%=resultset.getString("department") %>
		                                               <input type="checkbox" name="vardepartment" value="<%=resultset.getString("department")%>">
		                                               <span class="checkmark"></span>
		                                           </label>
		                                        </div>
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
        </body>
</html>