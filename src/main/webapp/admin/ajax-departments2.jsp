<%@ page import="com.softdocadmin.connection.StoreDBConnection"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <html>
  <head>
     <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
     <title>Insert title here</title>
  </head>
   <body>
      
     
                                        <%
                                               	int company_id =Integer.parseInt(request.getParameter("company_id"));
                                               try(Connection connection=StoreDBConnection.openConnection();Statement statement = connection.createStatement();)
                                               {
                                            	    ResultSet resultsettwo=statement.executeQuery("SELECT * FROM `customer_details` where `id`='"+company_id+"'");
                                            	    String []array=new String[20]; 
                                            	    if(resultsettwo.next()){
                                                        String deptinfo =resultsettwo.getString("depart_info");
                                                        array=deptinfo.split(",");                                          
                                           	        }
                                                    List<String> list = Arrays.asList(array);
                                            	    ResultSet resultset=statement.executeQuery("SELECT `department` FROM `deparment` where `industry`='"+request.getParameter("id")+"'");
                                                    int i = 1;
                                                    while(resultset.next())
                                                    {
                                                    	String departments = resultset.getString("department");
                                                    	if(list.contains(departments)){
                                           %>		
                                            	<div class="col-md-3">
		                                           <label class="container"><%=resultset.getString("department") %>
		                                               <input type="checkbox" name="vardepartment" value="<%=resultset.getString("department")%>" checked>
		                                               <span class="checkmark"></span>
		                                           </label>
		                                        
		                                        </div>
                                                <%   
                                                   }else { 
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