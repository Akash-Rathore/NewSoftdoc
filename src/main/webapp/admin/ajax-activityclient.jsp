<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.softdocadmin.connection.StoreDBConnection"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
                  
                               <%
                                               	try(Connection connection=StoreDBConnection.openConnection();PreparedStatement preparedStatement=connection.prepareStatement("SELECT customer_number , file_no , customer_details.company_name AS company_name , department ,  DATE_FORMAT(upload_date , '%d %b %Y') AS pickup_date , document_info.status AS STATUS FROM document_info , customer_details WHERE document_info.company_id='"+request.getParameter("id")+"' and document_info.company_id=customer_details.id  and client_id !='0' AND document_no IS NOT NULL GROUP BY document_info.file_no ORDER BY document_info.upload_date DESC");)
                                               {
                                            	    ResultSet resultset=preparedStatement.executeQuery();
                                                    while(resultset.next())
                                                    {
                               %>
                                   <tr>  
                                          <td><%=resultset.getString("customer_number")%></td>
                                          <td><%=resultset.getString("company_name")%></td>
                                          <td><%=resultset.getString("file_no")%></td>
                                          <td><%=resultset.getString("department")%></td>
                                          <td><%=resultset.getString("pickup_date")%></td>
                                          <% if(resultset.getString("status").equals("quality_approved")){ %> 
                                                <td><%="Active"%></td> 
                                          <%}else{%>
                                                <td></td>
                                          <%} %>        
                                  </tr>
                       
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