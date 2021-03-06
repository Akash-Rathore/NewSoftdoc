package com.softdocadmin.loginService;

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
import com.softdocadmin.email.Logfile;
import com.softdocadmin.connection.StoreDBConnection;

//@WebServlet("/LoginAdmin")
public class LoginAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginAdmin() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("username");
		String password = request.getParameter("password");

		Gson gson = new Gson();
		JSONObject json = new JSONObject();
		String message;
		PrintWriter out = response.getWriter();

		// variable declaration for multipaluse
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		
		
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
				connection = StoreDBConnection.openConnection();
				preparedStatement = connection.prepareStatement("SELECT * FROM `softdoc_staff` WHERE email='" + email
						+ "' AND PASSWORD='" + password + "' AND role='admin' and flag='0'");
				ResultSet resultset = preparedStatement.executeQuery();
				if (resultset.next()) {
					HttpSession session = request.getSession();
					session.setAttribute("Email", email);
					session.setAttribute("adminname", resultset.getString("name"));
					session.setAttribute("id", resultset.getInt("id"));
					new Logfile().logfile(email, "softdoc admin has been login", resultset.getInt("id"),
							resultset.getString("role"));

					json.put("status", true);
					json.put("message", "Login success");
					message = gson.toJson(json);
					out.println(message);

				} else {

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

		doGet(request, response);
	}

}
