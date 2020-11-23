<%@page import="com.softdocindexing.connection.IndexingDBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date" %>  
<%@ page import="java.sql.Statement" %>      
 <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

                <%
                  
                                String company_code="";
                                String company_name=""; 
                                 try(Connection  connect=IndexingDBConnection.openConnection();Statement statement=connect.createStatement();)
					                    {
					                             ResultSet resultset=statement.executeQuery("select * from client_details where customer_id='"+request.getParameter("id")+"' and flag=0");
					                             while(resultset.next())
					                             {
                               
					                               	try(Connection  connection=IndexingDBConnection.openConnection();Statement stat=connect.createStatement();)
								                    {
								                             ResultSet result=stat.executeQuery("select * from customer_details where flag=0 and id='"+resultset.getString("customer_id")+"'");
								                             if(result.next())
								                             {
								                            	 company_code=result.getString("customeradmincode");
					                                        	 company_name=result.getString("company_name");
					                                        
								                             }
								                    }
                               %>      
                                     <tr>
                                        <td><%=company_code%></td>
                                        <td><%=company_name%></td>
                                        <td><%=resultset.getString("softdoc_id")%></td>
                                        <td><%=resultset.getString("employee_name")%></td>
                                        <td><%=resultset.getString("emp_email_id")%></td>
                                        <td><%=resultset.getString("designation")%></td>
                                        <td><%=resultset.getString("activation_date")%></td>
                                    </tr>
                                     	
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

</body>
</html>