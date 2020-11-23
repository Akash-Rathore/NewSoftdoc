package com.softdocquality.process;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.subadminquality.connection.QualityDBConnection;
import com.subadminquality.loginfile.QualityLogfile;

//@WebServlet(name = "/QualityLogin", urlPatterns = { "/qualitylogin" })
public class QualityLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public QualityLogin() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		Gson gson = new Gson();
		JSONObject json = new JSONObject();
		String message;
		PrintWriter out = response.getWriter();
		
		
		
		if (email.equals("") && password.equals("")) {
			json.put("status", false);
			json.put("message", "Please fill the Email and Password");
			message = gson.toJson(json);
			out.println(message);
		} else if (email == null && password.equals("")) {
			json.put("status", false);
			json.put("message", "Please fill the Email");
			message = gson.toJson(json);
			out.println(message);

		} else if (email != null && password.equals("")) {
			json.put("status", false);
			json.put("message", "Please fill the Password");
			message = gson.toJson(json);
			out.println(message);

		} else {

		
	
        try {
			Connection connection = QualityDBConnection.openConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(
					"SELECT * FROM `softdoc_staff` WHERE email='" + email + "' AND PASSWORD='" + password +"'AND `role`='quality' and flag='0'");
			ResultSet resultset = preparedStatement.executeQuery();
			if (resultset.next()) {
				HttpSession session = request.getSession();
				session.setAttribute("emailquality", email);
				session.setAttribute("qualityname", resultset.getString("name"));
				session.setAttribute("quality_id", resultset.getInt("id"));
				session.setAttribute("qualityrole", resultset.getString("role"));
			    QualityLogfile logfile=new QualityLogfile();
       	        logfile.logfile(email,"Subadmin Quality has been login",resultset.getInt("id"),resultset.getString("role"));
       	      
       	        json.put("status", true);
				json.put("message", "Login success");
				message = gson.toJson(json);
				out.println(message);

       	        
				//response.sendRedirect("dashboard.jsp");

			} else {
				//response.sendRedirect("index.jsp");
				json.put("status", false);
				json.put("message", "Check your account wrong Usename or Password");
				message = gson.toJson(json);
				out.println(message);

			   
			
			}

		} catch (SQLException sqlexception) {
			sqlexception.printStackTrace();
		} catch (Exception exception) {
			exception.printStackTrace();
		} 
      }

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
