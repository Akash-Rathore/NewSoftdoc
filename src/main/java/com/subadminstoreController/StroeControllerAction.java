package com.subadminstoreController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.subadminstore.loginfile.StoreLogfile;
import com.subadminstoreDAO.SubadminStoreDAO;
import com.subadminstoreModal.StoreFile;
import com.subadminstoreModal.UserProfileStore;
import com.superadminModal.UserProfile;
import com.uploadfile.IndexingUploading;

public class StroeControllerAction {

	SubadminStoreDAO subadminstoreDAO;

	public StroeControllerAction() {
		subadminstoreDAO = new SubadminStoreDAO();
	}

	//========================================= start subadmin store===============================================
	public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session != null) {

			//session.invalidate();
			//session = null;
			    session.removeAttribute("storeemail");
	   	    	session.removeAttribute("storename");
	   	    	session.removeAttribute("store_id");
	   	    	session.removeAttribute("storerole");
		}
		response.sendRedirect("index.jsp");

	}
	//========================================= end subadmin store===============================================v
	

	//========================================= start subadmin profile===============================================v
	public void updateprofile(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		Gson gson = new Gson();
		JSONObject json = new JSONObject();
		String message;

		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("storeemail");
		int id = (int) session.getAttribute("store_id");
		UserProfileStore userprofile = new UserProfileStore(request.getParameter("username"), request.getParameter("password"),
				request.getParameter("name"), request.getParameter("designation"),
				Long.parseLong(request.getParameter("mobile")), email, request.getParameter("location"), id);
		int check = subadminstoreDAO.updateprofile(userprofile);
		if (check > 0) {
			new StoreLogfile().logfile(email, "Subadmin Store update profile", id,"store");
			json.put("status", true);
			json.put("message", "successfully");
			message = gson.toJson(json);
			out.println(message);
		} else {
			json.put("status", false);
			json.put("message", "not update profile");
			message = gson.toJson(json);
			out.println(message);

		}

	}

	//========================================= end subadmin profile===============================================v

	

	//========================================= start change password===============================================v
	public void changepassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
	    Gson gson = new Gson();
	    JSONObject json = new JSONObject();
	    String message;
	    PrintWriter out = response.getWriter();
	    String currentpassword= request.getParameter("currentpassword");
		String newpassword= request.getParameter("newpassword");
		String confirmpassword= request.getParameter("confirmpassword");
		UserProfileStore userProfileStore = new UserProfileStore(currentpassword,confirmpassword, (String) session.getAttribute("storeemail"),(int) session.getAttribute("store_id"));
		boolean check = subadminstoreDAO.changepassword(userProfileStore);
		if (check) {
			    json.put("status", true);
			    json.put("message", "Successfully");
			    message = gson.toJson(json);
			    out.println(message);
		 } else {
		        json.put("status", false);
				json.put("message", "Something is wrong");
				message = gson.toJson(json);
				out.println(message);
		 }

	}
	//========================================= end change password===============================================v

	
	
	//==========================start profile pic =============================
	public void uploadphoto(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		
		
		 Gson gson = new Gson();
		 JSONObject json = new JSONObject();
		 String message;
	 	 PrintWriter out = response.getWriter();
		 Part part = request.getPart("uploadprofile");
		 String indexingurl=new IndexingUploading().uploadFile(part,"softdoc-262410.appspot.com");
	     HttpSession session = request.getSession();
		 String email = (String) session.getAttribute("storeemail");
		 int id = (int) session.getAttribute("store_id");
		 UserProfileStore UserProfileStore = new UserProfileStore(id,email,indexingurl);
		 boolean check = subadminstoreDAO.uploadphoto(UserProfileStore);
		 if (check) {
				json.put("status", true);
				json.put("message", "success");
				message = gson.toJson(json);
				out.println(message);
			} else {
				json.put("status", false);
				json.put("message", "not success");
				message = gson.toJson(json);
				out.println(message);
			}
	  }

	//==========================end profile pic =============================
	
	
	//==========================start change status of store =============================
	 public void sendindexing(HttpServletRequest request, HttpServletResponse response) throws IOException
	  {
		    boolean check;
		  
		    Gson gson = new Gson();
			JSONObject json = new JSONObject();
			String message;
	        PrintWriter out = response.getWriter();
	        String file_no=request.getParameter("file_no");
	        HttpSession session = request.getSession();
			String email = (String) session.getAttribute("storeemail");
			int id = (int) session.getAttribute("store_id");
	        StoreFile storefile=new StoreFile(id,email,file_no);
	        check = subadminstoreDAO.sendindexing(storefile);
		    
			if(check)
	          {
	        	    
	        	  json.put("status", true);
	  			  json.put("message", "success");
	  			  message = gson.toJson(json);
	  			  out.println(message);
	          
	          }
	          else
	          {
	        	  
	        	  json.put("status", false);
	  			  json.put("message", "not success");
	  			  message = gson.toJson(json);
	  			  out.println(message);
	          
	          }
	  }
	 //==========================end change status of store =============================
		
	
	

}
