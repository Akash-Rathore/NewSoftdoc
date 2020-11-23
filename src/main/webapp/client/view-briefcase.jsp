<%@include file="include/session.jsp" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%> 
<%@ page import="com.customerclient.connection.DBConnection"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
    <head>
       <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
       <title>CUSTOMER CLIENT</title>
       <!-- Favicon-->
       <link rel="icon" href="../images/favicon.png" type="image/x-icon">

       <!-- Google Fonts -->
       <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
       <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">

       <!-- Bootstrap Core Css -->
       <link href="../plugins/bootstrap/css/bootstrap.css" rel="stylesheet">
       
       <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"/>
       <link rel="stylesheet" href="include/style.css" />
       
    </head>
  <body>
    <div class="top-bar">
       <%--<a href="attachment.jsp?id=<%=request.getParameter("id")%>" class="btn button1" style="border-radius:50% !important">
            <i class="fas fa-arrow-circle-left"></i> Back
        </a> --%>
        <button class="btn" style="width:120px;border:1px solid #6c757d;color: #f8fcff;background: #6c757d;" id="prev-page">
           <i class="fas fa-arrow-circle-left"></i> Prev Page
        </button>
      <button class="btn" style="width:120px;border:1px solid #6c757d;color: #f8fcff;background: #6c757d;" id="next-page">
        Next Page <i class="fas fa-arrow-circle-right"></i>
      </button>
      <span class="page-info">
        Page <span id="page-num"></span> of <span id="page-count"></span>
      </span>
    </div>
       
                            <%
                                
                                       try(Connection  connect=DBConnection.openConnection(); PreparedStatement preparedStatement=connect.prepareStatement("SELECT attachment FROM briefcase WHERE id ='"+request.getParameter("url")+"'");)
                                      {
                                      	 ResultSet resultset=preparedStatement.executeQuery();
                                          if(resultset.next())
                                          {
                                        	  
                            %>
       
                                               <input type="hidden" id="url" value="<%=resultset.getString("attachment")%>">
    
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
                     <center><canvas id="pdf-render"></canvas></center>
         
    
    
    <script src="https://mozilla.github.io/pdf.js/build/pdf.js"></script>
    <script src="include/main.js"></script>
    <%@include file="include/script.jsp"%>
  </body>
</html>
