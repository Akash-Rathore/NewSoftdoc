package com.customerclient.process;

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
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.customerclient.connection.DBConnection;


//@WebServlet(name = "/ClientForgot", urlPatterns = { "/clientforgot" })
public class ClientForgot extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ClientForgot() {
        super();
        //TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		    String email=request.getParameter("email");
		    Gson gson = new Gson();
			JSONObject json = new JSONObject();
			String message;
			PrintWriter out = response.getWriter();
		   
		 
			try{
				 
				 Connection connection = DBConnection.openConnection();
				 PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM  `client_details` WHERE `emp_email_id`='"+email+"'");
				 ResultSet resultset = preparedStatement.executeQuery();
			     if(resultset.next())
			     {
			    	    
			    		 new com.customerclient.email.EmailClient().email("Password recovery for your Softdoc Account",
			    				 
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
