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
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.softdocadmin.email.Logfile;
import com.subadminindexing.loginfile.IndexingLogfile;
import com.subadminquality.loginfile.QualityLogfile;
import com.subadminstore.loginfile.StoreLogfile;
import com.superadmin.connection.DBConnection;
import com.superadmin.loginfile.SuperLogfile;

//@WebServlet(name = "/LoginService", urlPatterns = { "/superlogin" })
public class SuperLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SuperLogin() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 
		
		 String email = request.getParameter("email");
		 String password = request.getParameter("password");
         String role_status=request.getParameter("role_status");
		 String query="";
         if(role_status.equals("superadmin"))
		 {
			 query="SELECT * FROM `softdoc_staff` WHERE email='" + email +"' AND PASSWORD='"+ password + "' and role='superadmin' and flag='0'";
		 }
		 else  if(role_status.equals("admin"))
		 {
		
			 query="SELECT * FROM `softdoc_staff` WHERE email='" + email+"' AND PASSWORD='" + password + "' AND role='admin' and flag='0'";
		 
		 }
		 else  if(role_status.equals("store"))
		 {
			 query="SELECT * FROM `softdoc_staff` WHERE email='"+ email +"' AND PASSWORD='"+ password +"' AND role='store' and flag='0'";
			 
		 }else  if(role_status.equals("indexing"))
		 {
			 
			query="SELECT * FROM `softdoc_staff` WHERE email='"+ email +"' AND PASSWORD='" + password +"'and `role`='indexing' and flag='0'"; 
			 
			 
		 }else  if(role_status.equals("quality"))
		 {
			 query="SELECT * FROM `softdoc_staff` WHERE email='"+ email +"' AND PASSWORD='" + password +"'AND `role`='quality' and flag='0'";
		 }
        
        
        
        
		Gson gson = new Gson();
		JSONObject json = new JSONObject();
		String message;
		PrintWriter out = response.getWriter();
		try(Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection.prepareStatement(query);) 
		{
				ResultSet resultset = preparedStatement.executeQuery();
				
				
				if(resultset.next()) {
				  
				  if(role_status.equals("superadmin")) {
				
					HttpSession session = request.getSession();
					session.setAttribute("superemail", email);
					session.setAttribute("supername", resultset.getString("name"));
					session.setAttribute("super_id", resultset.getInt("id"));
					session.setAttribute("role", resultset.getString("role"));
					new SuperLogfile().logfile(email, "superadmin  has been login", resultset.getInt("id"),
							resultset.getString("role"));

					json.put("status", true);
					json.put("role",resultset.getString("role"));
					message = gson.toJson(json);
					out.println(message);

				 }else if(role_status.equals("admin")) {
				
                    HttpSession session = request.getSession();
					session.setAttribute("Email", email);
					session.setAttribute("adminname", resultset.getString("name"));
					session.setAttribute("id", resultset.getInt("id"));
					new Logfile().logfile(email, "softdoc admin has been login", resultset.getInt("id"),
							resultset.getString("role"));

					json.put("status", true);
					json.put("role",resultset.getString("role"));
					message = gson.toJson(json);
					out.println(message);
					 
					

				}else if(role_status.equals("store")) {
				

					HttpSession session = request.getSession();
					session.setAttribute("storeemail", email);
					session.setAttribute("storename", resultset.getString("name"));
					session.setAttribute("store_id", resultset.getInt("id"));
					session.setAttribute("storerole", resultset.getString("role"));
					new StoreLogfile().logfile(email, "Subadmin Store has been login", resultset.getInt("id"),
							resultset.getString("role"));

					json.put("status", true);
					json.put("role",resultset.getString("role"));
					json.put("message", "Login success");
					message = gson.toJson(json);
					out.println(message);
					 
					

				}else if(role_status.equals("indexing")) {
				
					HttpSession session = request.getSession();
					session.setAttribute("emailindexing", email);
					session.setAttribute("indexingname", resultset.getString("name"));
					session.setAttribute("index_id", resultset.getInt("id"));
					session.setAttribute("index_role", resultset.getString("role"));
				    new IndexingLogfile().logfile(email,"Subadmin Indexing has been login",resultset.getInt("id"),resultset.getString("role"));

				    json.put("status", true);
					json.put("role",resultset.getString("role"));
					message = gson.toJson(json);
					out.println(message);


				}else if(role_status.equals("quality")) {
				
                   
					HttpSession session = request.getSession();
					session.setAttribute("emailquality", email);
					session.setAttribute("qualityname", resultset.getString("name"));
					session.setAttribute("quality_id", resultset.getInt("id"));
					session.setAttribute("qualityrole", resultset.getString("role"));
				    QualityLogfile logfile=new QualityLogfile();
	       	        logfile.logfile(email,"Subadmin Quality has been login",resultset.getInt("id"),resultset.getString("role"));
	       	      
	       	        json.put("status", true);
	       	 	    json.put("role",resultset.getString("role"));
					message = gson.toJson(json);
					out.println(message);

				 }
			  
			   } else {

					json.put("status", false);
					message = gson.toJson(json);
					out.println(message);

				 }		  

			} catch (SQLException sqlexception) {
				sqlexception.printStackTrace();
			} catch (Exception exception) {
				exception.printStackTrace();
			}
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
