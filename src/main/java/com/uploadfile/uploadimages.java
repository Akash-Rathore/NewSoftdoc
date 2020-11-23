package com.uploadfile;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.json.simple.JSONObject;
import com.google.gson.Gson;
import com.softdocadmin.connection.StoreDBConnection;

@WebServlet(name = "/uploadimages", urlPatterns = { "api/process/uploadimages" })
@MultipartConfig
public class uploadimages extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		 PrintWriter out=response.getWriter();
		 Gson gson = new Gson();
		 JSONObject json = new JSONObject();
 		 Part part = request.getPart("file");
		 int id=Integer.parseInt(request.getParameter("id"));
		 String url=new IndexingUploading().uploadFile(part,"softdoc-262410.appspot.com");
		 try (Connection connection1 = StoreDBConnection.openConnection();Statement statement1 = connection1.createStatement();) {
	    	      int check1 = statement1.executeUpdate("update `client_details` set imageupload='"+url+"' where id='"+id+"'");
				  if(check1>0)
				 {
						 json.put("file",url);
						 json.put("code","200");
						 json.put("message","success");
						 String	message = gson.toJson(json);
						 out.write(message);
				 }
				 else
				 {
					    json.put("code","400");
					    json.put("message","something went wrong");
					    String	message = gson.toJson(json);
					    out.write(message);
		 	 
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
