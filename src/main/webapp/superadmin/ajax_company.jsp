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
					                             ResultSet resultset=statement.executeQuery("SELECT sum(size) as size ,company_id,file_no, company_name, department, upload_date FROM customer_details, document_info WHERE document_info.company_id = '"+request.getParameter("id")+"' GROUP BY document_info.file_no");
					                             while(resultset.next())
					                             {
                               
					                               	try(Connection  connection=IndexingDBConnection.openConnection();Statement stat=connect.createStatement();)
								                    {
								                             ResultSet result=stat.executeQuery("SELECT COUNT(DISTINCT document_no)as count FROM document_info WHERE file_no='"+resultset.getString("file_no")+"'");
								                             while(result.next())
								                             {
								                            	 count=result.getString("count");
								                             }
								                    }
                               %>      
                                        <tr>
                                            <td><a href="documents.jsp?id=<%=resultset.getString("file_no")%>"><%=resultset.getString("file_no")%></a></td>
                                            <td><a href="company.jsp?id=<%=resultset.getString("company_id")%>"><%=resultset.getString("company_name")%></a></td>
                                            <td><a href="department.jsp?id=<%=resultset.getString("company_id")%>&dept=<%=resultset.getString("department")%>"><%=resultset.getString("department")%></a></td>
                                            <td><%=resultset.getString("size")+" MB "%></td>
                                        <%
                                     	    final String OLD_FORMAT = "yyyy-MM-dd hh:mm:ss";
                             			    final String NEW_FORMAT = "dd MMM yyyy";
                             			    SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
                                            Date d = sdf.parse(resultset.getString("upload_date"));
                             			    sdf.applyPattern(NEW_FORMAT);
                             			    String upload_date = sdf.format(d);
                                        %>
                                          <td><%=upload_date%></td>
                                          <td><%=count%></td>
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