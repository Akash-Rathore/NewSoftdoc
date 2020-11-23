package com.superadmin.process;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.superadmin.connection.DBConnection;
import com.superadmin.email.EmailClient;


public class SuperForgot extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SuperForgot() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		    String email=request.getParameter("email");
	        String role_status=request.getParameter("role_status");
	        String query="";
		    if(role_status.equals("superadmin"))
			 {
				 query="SELECT * FROM `softdoc_staff` WHERE email='" + email +"' and role='superadmin' and flag='0'";
			 }
			 else  if(role_status.equals("admin"))
			 {
			
				 query="SELECT * FROM `softdoc_staff` WHERE email='" + email+"' AND role='admin' and flag='0'";
			 
			 }
			 else  if(role_status.equals("store"))
			 {
				 query="SELECT * FROM `softdoc_staff` WHERE email='"+ email +"'  AND role='store' and flag='0'";
				 
			 }else  if(role_status.equals("indexing"))
			 {
				 
				query="SELECT * FROM `softdoc_staff` WHERE email='"+ email +"'  AND  `role`='indexing' and flag='0'"; 
				 
				 
			 }else  if(role_status.equals("quality"))
			 {
				 query="SELECT * FROM `softdoc_staff` WHERE email='"+ email +"' AND `role`='quality' and flag='0'";
			 }
	       
		    Gson gson = new Gson();
			JSONObject json = new JSONObject();
			String message;
			PrintWriter out = response.getWriter();
			try( Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection.prepareStatement(query);)
			{
				 
				 ResultSet resultset = preparedStatement.executeQuery();
			     if(resultset.next())
			     {
			    	    EmailClient emailClient=new EmailClient();
			    	            emailClient.email("Password recovery for your Softdoc Account",
			    	            		
			    	            		           "<br> Hello "+ resultset.getString("name")+",<br>"
								    				+"Please find below your password:"
								    			    +""+resultset.getString("password")+""
								    			    +"*It is highly recommended that you change your password immediately to protect your data and privacy.<br>"
								    			    +"Please do not share your password with anybody.* <br>"
								    			    + "Regards,<br>"
													+ "Team Softdoc <br><br>"
													+ "*This is a system generated email. Please do not reply to this email.* <br>" ,email);
					    				   		
			    	            		
			    	 
			    	    json.put("status", true);
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
