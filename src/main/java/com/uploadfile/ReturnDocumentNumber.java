package com.uploadfile;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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


@WebServlet(name = "/ReturnDocumentNumber", urlPatterns = { "api/process/returndocumentnumber" })
@MultipartConfig
public class ReturnDocumentNumber extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 
    	
    	 int id=Integer.parseInt(request.getParameter("id"));
		 String return_no=request.getParameter("return_no");
		 String return_contact=request.getParameter("return_contact");
		 Part part = request.getPart("return_images");
		 String url=new IndexingUploading().uploadFile(part,"softdoc-262410.appspot.com");
    	 PrintWriter out=response.getWriter();
		 Gson gson = new Gson();
		 JSONObject json = new JSONObject();

		 try(Connection connection = StoreDBConnection.openConnection();
					PreparedStatement preparedStatement = connection.prepareStatement("update `scheduling` set return_to=?,return_contact=?,return_images=? , flag='0' where id='"+id+"'");) {

			     preparedStatement.setString(1, return_no);
			     preparedStatement.setString(2,return_contact);
			     preparedStatement.setString(3, url);
			     int check = preparedStatement.executeUpdate();
				 if(check>0) {
					
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

			} catch (SQLException sqlexception) {
				sqlexception.printStackTrace();
			} catch (Exception exception) {
				exception.printStackTrace();
			}
    	
    	
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
