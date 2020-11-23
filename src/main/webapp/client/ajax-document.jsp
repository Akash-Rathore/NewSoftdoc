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
                                String deptinfo =(String)session.getAttribute("client_department");
                                String array[]=deptinfo.split(",");
                                for(int i=0;i<array.length;i++)
                                {
                                	
                                
                                
                                        try(Connection  connection=DBConnection.openConnection(); PreparedStatement preparedStatement=connection.prepareStatement("SELECT id , document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM document_info WHERE company_id='"+session.getAttribute("cust_id")+"' AND  upload_date BETWEEN '"+request.getParameter("start")+"' and '"+request.getParameter("end")+"' and status='quality_approved' and department='"+array[i]+"' and document_no is not null group by document_no");)
                                        { 
                                        	int k=1;
                                            ResultSet resultset=preparedStatement.executeQuery();
                                            while(resultset.next())
                                            {
                                            	
                                       %>
                                     
                                        <tr>
                                           <td><%=k%></td>
                                           <td><a  href="attachment.jsp?id=<%=resultset.getString("id")%>"><%=resultset.getString("document_no")%></a></td>
                                           <td><%=resultset.getString("upload_date")%></td>
                                           <td><%=resultset.getString("sum")%> MB</td>
                                           <td><button type="button" class="btn btn-primary"  onclick="myFunction(this.value , <%=resultset.getString("id")%>)" value="<%=resultset.getString("document_no")%>"><i class="fa fa-star" aria-hidden="true"></i></i></button></td>
                                        </tr>
                                        <%
                                            	
                                            	k++;
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
                                        
                                } 
                                        %>
       
       
        
        
</body>
</html>