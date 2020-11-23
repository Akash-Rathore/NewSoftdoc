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
                                        String count="";
					                 	try(Connection  connect=IndexingDBConnection.openConnection();Statement statement=connect.createStatement();)
					                    {
					                             ResultSet resultset=statement.executeQuery("SELECT * FROM document_info,customer_details where customer_details.id=document_info.company_id and document_info.status='store' and document_info.company_id='"+request.getParameter("id")+"'");
					                             int i=1;
					                             while(resultset.next())
					                             {
                               
					                               
                               %>      
                                             <tr>
                                                      <td><%=i%></td>
                                                      <th><%=resultset.getString("document_info.file_no")%></th>
                                                      <td><a href="storefile.jsp?id=<%=resultset.getString("document_info.company_id")%>"><%=resultset.getString("customer_details.company_name")%></a></td>
                                                      <td><%=resultset.getString("document_info.status")%></td>
                                               <%
                                                    final String OLD_FORMAT = "yyyy-MM-dd";
                                       			    final String NEW_FORMAT = "dd MMM yyyy";
                                       			    SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
                                                    Date d = sdf.parse(resultset.getString("document_info.pickup_date"));
                                       			    sdf.applyPattern(NEW_FORMAT);
                                       			    String pickup_date = sdf.format(d);
                                               %>
                                                      <td><%=pickup_date%></td> 
                                              </tr>
                               <%	   
                                           i++;
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