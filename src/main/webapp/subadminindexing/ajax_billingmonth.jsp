<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.softdocindexing.connection.IndexingDBConnection"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
       <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
       <title>Insert title here</title>
 </head>
  <body>
    <%
    	String billing_month= request.getParameter("billing_month");
    %>
     
     
     
       	<select class="form-control" onchange="showUser(this.value)">
	                       		     
	                       		     <option selected disabled value>Select An Month</option>
	                       		
	                       		<%
	                       			        try{
                      			                            	     Connection connection=IndexingDBConnection.openConnection();
                      			                            	     PreparedStatement preparedStatement = connection.prepareStatement("SELECT document_info.id as did, customer_details.id as id, sum(size) as size, billing_month, file_no, company_name, department, upload_date FROM customer_details, document_info WHERE document_info.company_id = customer_details.id AND document_info.billing_month = '"+billing_month+"'  GROUP BY document_info.company_id, document_info.billing_month");
                      			                                     ResultSet resultset=preparedStatement.executeQuery();
                      			                                     int i = 1;
                      			                                     while(resultset.next())
                      			                                    {
                      		 %>
	                                        <option value="<%=resultset.getString("billing_month")%>"><%=resultset.getString("billing_month")%></option>
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
	                       			
	                       			
	         </select>  
     </body>
</html>