package com.customeradmin.process;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;
import com.customeradmin.connection.DBConnection;
import com.google.gson.Gson;

//@WebServlet(name="/CustomerLogin",urlPatterns={"/customerlogin"})
public class CustomerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public CustomerLogin() {
           
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      
    	
    	   String email = request.getParameter("email");	
	   	   String password = request.getParameter("password");
	   	   String role_status=request.getParameter("role_status");
	   	   
	   	    String query="";
	   	   
	   	     if(role_status.equals("admin"))
			 {
				 query="SELECT `id`,`company_per_name`,`company_per_email`,`password` , depart_info , industry FROM `customer_details` where company_per_email='"+email+"' and password='"+password+"' and flag='0'";
			 }
			 else  if(role_status.equals("client"))
			 {
			
				 query="SELECT * FROM `client_details` WHERE `emp_email_id`='"+email+"' AND  `password`='"+password+"' and flag='0'";
			 
			 }
	   	   
	   	   
	      Gson gson = new Gson();
		  JSONObject json = new JSONObject();
		  String message;
		  PrintWriter out = response.getWriter();
	   	   
	   	   
	   	     try
	   	        {
	   	      	  Connection connection=DBConnection.openConnection();     
	   	      	  PreparedStatement   preparedStatement = connection.prepareStatement(query);
	   		      ResultSet resultset=preparedStatement.executeQuery();
	   		      if(resultset.next())
	              {
	          	       HttpSession session=request.getSession();
	          	       
	          	       if(role_status.equals("admin")) {
	          	    	   
	          	    	
	          	    	   session.setAttribute("customeremail",email);
		          	       session.setAttribute("customername", resultset.getString("company_per_name"));
		          	       session.setAttribute("customer_id",resultset.getInt("id"));
		          	       session.setAttribute("depart_info", resultset.getString("depart_info"));
		          	       session.setAttribute("customer_industry", resultset.getString("industry"));
		        
		          	      
		          	       new com.customeradmin.email.Logfile().logfile(email, "Login", resultset.getInt("id"), "customeradmin");
		          	       json.put("status", true);
		          	       json.put("role" , "admin");
						   json.put("message", "Login success");
					   	   message = gson.toJson(json);
						   out.println(message);
						   
	          	    	   
	          	       }else if(role_status.equals("client")) {
	          	    	   
	          	    	    session.setAttribute("clientemail",email);
		          	        session.setAttribute("clientname", resultset.getString("employee_name"));
		          	        session.setAttribute("clientid",resultset.getInt("id"));
		          	        session.setAttribute("cust_id",resultset.getInt("customer_id"));
		          	        session.setAttribute("client_department" , resultset.getString("department"));
		          	        session.setAttribute("client_industry", resultset.getString("industry"));
		          	        
		          	        new com.customeradmin.email.Logfile2().logfile(resultset.getInt("id") , resultset.getInt("customer_id") , email , "Login" , "client");
		            	       
		          	        json.put("status", true);
						    json.put("message", "Login success");
						    json.put("department", resultset.getString("department"));
						    json.put("role" , "client");
					   	    message = gson.toJson(json);
						    out.println(message);
	          	    	   
	          	       }
	          	       else
	 	               {    
		            		json.put("status", false);
							message = gson.toJson(json);
							out.println(message);
		    	       }
	          	       
	          	      
					   
	          	  }
	              else
	              {    
	            		json.put("status", false);
						message = gson.toJson(json);
						out.println(message);
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

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

	}

 
