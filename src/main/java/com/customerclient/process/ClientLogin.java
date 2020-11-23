package com.customerclient.process;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.net.InetAddress; 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.customerclient.connection.DBConnection;
import com.google.gson.Gson;
//@WebServlet(name="/ClientLogin",urlPatterns={"/clientlogin"})
public class ClientLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public ClientLogin() {
           
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       String email = request.getParameter("email");	
	   	   String password = request.getParameter("password");
	   	   
		   Gson gson = new Gson();
		   JSONObject json = new JSONObject();
		   String message;
		   PrintWriter out = response.getWriter();
	   	   
	   	   
	   	if(email.equals("")&&password.equals(""))
	   	   {
	   		    response.sendRedirect("client/index.jsp");
	   	   }
	   	   else 
	   	   {
	   	   
	   		   
	   	   
	   	     try
	   	        {
	   	      	  Connection connection=DBConnection.openConnection();     
	   	      	  PreparedStatement   preparedStatement = connection.prepareStatement("SELECT * FROM `client_details` WHERE `emp_email_id`='"+email+"' AND  `password`='"+password+"' and flag='0'");
	   		      ResultSet resultset=preparedStatement.executeQuery();
	              if(resultset.next())
	              {
	          	        HttpSession session=request.getSession();
	          	        session.setAttribute("clientemail",email);
	          	        session.setAttribute("clientname", resultset.getString("employee_name"));
	          	        session.setAttribute("clientid",resultset.getInt("id"));
	          	        session.setAttribute("cust_id",resultset.getInt("customer_id"));
	          	        session.setAttribute("client_department" , resultset.getString("department"));
	          	        
	          	        new com.customeradmin.email.Logfile2().logfile(resultset.getInt("id") , resultset.getInt("customer_id") , email , "Login" , "client");
	            	       
	          	        json.put("status", true);
					    json.put("message", "Login success");
					    json.put("department", resultset.getString("department"));
				   	    message = gson.toJson(json);
					    out.println(message);
	          	        
	          	       
	          	        
	              }
	              else
	              {    
	            	 
	            	    json.put("status",false);
	      	            json.put("message","Check your account wrong Usename or Password");
	      	            message=gson.toJson(json);
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
	  }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

	}

 
