 <%@include file="include/session.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.softdocindexing.connection.IndexingDBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body> 

<script>
	alert('hello');
</script>

<%
	int customer_id = Integer.parseInt(request.getParameter("customer_id"));
%>

   
         <select class="form-control" name="departmentname">
            <option value selected disabled >Select An option</option>
             <%
             	try{
                    	    	  
                    	    	
                    	  
                               Connection connect=IndexingDBConnection.openConnection();
                               PreparedStatement preparedStat=connect.prepareStatement("SELECT * FROM `customer_details` where `id`='"+customer_id+"'");
                               ResultSet resultset=preparedStat.executeQuery();
                               if(resultset.next()){
                             	  
                             	  String deptinfo =resultset.getString("depart_info");
                                   String array[]=deptinfo.split(",");
                                   for(int i=0;i<=array.length;i++)
                                   {
             %>   	
             
                        <option value="<%=array[i]%>"><%=array[i]%></option>
                      
             <%
                } }
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
   
<!-- </body>
</html> -->