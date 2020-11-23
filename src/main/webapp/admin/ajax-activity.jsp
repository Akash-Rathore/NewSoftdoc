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
                                               	try(Connection connection=StoreDBConnection.openConnection();PreparedStatement preparedStatement=connection.prepareStatement("SELECT customeradmincode , file_no , customer_details.company_name AS company_name , department ,  DATE_FORMAT(scheduling.pickup_date , '%d %b %Y') AS pickup_date , document_info.status AS STATUS FROM document_info , scheduling , customer_details WHERE document_info.company_id='"+request.getParameter("id")+"' AND document_info.company_id=scheduling.company_id AND scheduling.return_date IS NOT NULL AND document_info.document_no IS NOT NULL GROUP BY document_info.file_no ORDER BY document_info.upload_date DESC");)
                                                                                      {
                                                                                   	    ResultSet resultset=preparedStatement.executeQuery();
                                                                                           while(resultset.next())
                                                                                           {
                                               %>
                                      <tr>  
                                          <td><%=resultset.getString("customeradmincode")%></td>
                                          <td><%=resultset.getString("company_name")%></td>
                                          <td><%=resultset.getString("file_no")%></td>
                                          <td><%=resultset.getString("document_info.department")%></td>
                                          <td><%=resultset.getString("pickup_date")%></td>
                                          <% if(resultset.getString("status").equals("store")){ %>
                                               <td><%="STORE"%></td>
                                          <% }else if(resultset.getString("status").equals("indexing")){ %>
                                               <td><%="STORE-->INDEXING"%></td> 
                                           <%}else if(resultset.getString("status").equals("quality")){ %> 
                                               <td><%="STORE-->INDEXING --> QUALITY"%></td> 
                                           <%}else if(resultset.getString("status").equals("quality_return")){ %> 
                                                 <td><%="STORE-->INDEXING --> QUALITY "%></td> 
                                            <%}else if(resultset.getString("status").equals("return_quality")){ %> 
                                                 <td><%="STORE-->INDEXING --> QUALITY "%></td> 
                                            <%}else if(resultset.getString("status").equals("quality_approved")){ %> 
                                                <td><%="STORE-->INDEXING --> QUALITY-->READY TO RETURN"%></td> 
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