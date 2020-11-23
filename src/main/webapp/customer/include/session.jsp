
 <%   
           response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");  
           response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
           response.setDateHeader("Expires", 0);
           String email=(String)session.getAttribute("customeremail");
         //  String  id1=(String)request.getAttribute("id");
           if(email==null)
           {
        	   response.sendRedirect("index.jsp");
           }
%>
