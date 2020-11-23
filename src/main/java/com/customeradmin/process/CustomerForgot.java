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

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.customeradmin.connection.DBConnection;
import com.customeradmin.email.EmailClient;


//@WebServlet("/Forgotpassword")
//@WebServlet(name = "/CustomerForgot", urlPatterns = { "/customerforgot" })
public class CustomerForgot extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public CustomerForgot() {
        super();
        //TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		    String email=request.getParameter("email");
		    Gson gson = new Gson();
			JSONObject json = new JSONObject();
			String message;
			PrintWriter out = response.getWriter();

			String role_status=request.getParameter("role_status");
		   	String query="";
			
			 if(role_status.equals("admin"))
			 {
				 query="SELECT * FROM `customer_details` WHERE company_per_email='"+email+"' AND  flag='0'";
			 }
			 else  if(role_status.equals("client"))
			 {
			
				 query="SELECT * FROM `client_details` WHERE `emp_email_id`='"+email+"' AND  flag='0'";
			 
			 }
			
			try{
				 
				 Connection connection = DBConnection.openConnection();
				 PreparedStatement preparedStatement = connection.prepareStatement(query);
				 ResultSet resultset = preparedStatement.executeQuery();
			     if(resultset.next())
			     {
			    	 
			    	 
			    	 
			    	 if(role_status.equals("admin")) {   
			    		 new EmailClient().email("Password recovery for your Softdoc Account",
			    				"<br> Hello "+ resultset.getString("company_per_name")+",<br>"
			    				+"Please find below your password:<br>"
			    			    +""+resultset.getString("password")+"<br>"
			    			    +"*It is highly recommended that you change your password immediately to protect your data and privacy.<br>"
			    			    +"Please do not share your password with anybody.* <br>"
			    			    + "Regards,<br>"
								+ "Team Softdoc <br><br>"
								+ "*This is a system generated email. Please do not reply to this email.* <br>" 
								,email);

			    	 
			    	    json.put("status", true);
						json.put("message", "forgot password Successfull send your email");
						message = gson.toJson(json);
						out.println(message);
			    	 }else if(role_status.equals("client")){
			    		 
			    		 
                           new EmailClient().email("Password recovery for your Softdoc Account",
			    				 
			    				 "<br> Hello "+ resultset.getString("employee_name")+",<br>"
						    				+"Please find below your password:<br>"
						    			    +""+resultset.getString("password")+"<br>"
						    			    +"*It is highly recommended that you change your password immediately to protect your data and privacy.<br>"
						    			    +"Please do not share your password with anybody.* <br>"
						    			    + "Regards,<br>"
											+ "Team Softdoc <br><br>"
											+ "*This is a system generated email. Please do not reply to this email.* <br>" ,email);

			    	 
			    	    json.put("status", true);
						json.put("message", "forgot password Successfull send your email");
						message = gson.toJson(json);
						out.println(message);
			    		 
			    		 
			    	 }
	
			     }
				 else
			     {
					   json.put("status", false);
					   json.put("message", "Something is Wrong");
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
