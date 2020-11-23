package com.superadminController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.superadminDAO.SuperDAO;
import com.superadminModal.ComplainList;
import com.superadminModal.FileNumber;
import com.superadminModal.UserProfile;
import com.uploadfile.IndexingUploading;

public class SuperControllerAction {

	SuperDAO subadminstoreDAO;

	public SuperControllerAction() {
		subadminstoreDAO = new SuperDAO();
	}
	//===========================start logout superadmin ==================================================
	public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session != null) {
			  session.removeAttribute("superemail");
	   	      session.removeAttribute("supername");
	   	      session.removeAttribute("super_id");
	   	      session.removeAttribute("role");
		}
		response.sendRedirect("index.jsp");
	}
   //===========================end logout superadmin ==================================================


	//===========================start update superadmin profile==================================================
	public void updateprofile(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		Gson gson = new Gson();
		JSONObject json = new JSONObject();
		String message;

		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("superemail");
		UserProfile userprofile = new UserProfile(request.getParameter("username"), request.getParameter("password"),
				request.getParameter("name"), request.getParameter("designation"),
				Long.parseLong(request.getParameter("mobile")), email, request.getParameter("location"),
				(int) session.getAttribute("super_id"));
		int check = subadminstoreDAO.updateprofile(userprofile);
		if (check > 0) {

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

	//===========================end update superadmin profile==================================================

	

	//===========================start Extra for future purpose==================================================
 	public void complainlistupdate(HttpServletRequest request, HttpServletResponse response) throws IOException {

		HttpSession session = request.getSession();
		ComplainList complaintlist = new ComplainList(Integer.parseInt(request.getParameter("id")),
				request.getParameter("status"), (String) session.getAttribute("superemail"),
				(int) session.getAttribute("super_id"));
		boolean check = subadminstoreDAO.complainlistupdate(complaintlist);
		// gson library
		Gson gson = new Gson();
		JSONObject json = new JSONObject();
		String message;
		PrintWriter out = response.getWriter();
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
 	
	public void  complainlistremark(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		   Gson gson = new Gson();
		   JSONObject json = new JSONObject();
	  	   String message;
           PrintWriter out = response.getWriter();
		   
           HttpSession session = request.getSession();
		   ComplainList complaintlist = new ComplainList(request.getParameter("remark"),Integer.parseInt(request.getParameter("id")),(String) session.getAttribute("superemail"),(int) session.getAttribute("super_id"));
		   boolean check = subadminstoreDAO.complainlistremark(complaintlist);
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

	//===========================end Extra for future purpose==================================================


	//===========================start change password==================================================
 	public void superpassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
	    Gson gson = new Gson();
	    JSONObject json = new JSONObject();
	    String message;
	    PrintWriter out = response.getWriter();
	    String currentpassword= request.getParameter("currentpassword");
		String newpassword= request.getParameter("newpassword");
		String confirmpassword= request.getParameter("confirmpassword");
		UserProfile userprofile = new UserProfile(currentpassword,confirmpassword, (String) session.getAttribute("superemail"),
				(int) session.getAttribute("super_id"));
		boolean check = subadminstoreDAO.superpassword(userprofile);
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
	//===========================end change password==================================================


	//===========================end update profile pic==================================================
	public void uploadphoto(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		 Gson gson = new Gson();
		 JSONObject json = new JSONObject();
		 String message;
	 	 PrintWriter out = response.getWriter();
		 Part part = request.getPart("uploadprofile");
		 String indexingurl=new IndexingUploading().uploadFile(part,"softdoc-262410.appspot.com");
	     HttpSession session = request.getSession();
		 String email = (String) session.getAttribute("superemail");
		 int id = (int) session.getAttribute("super_id");
		 UserProfile userprofile = new UserProfile(id,email,indexingurl);
		 boolean check = subadminstoreDAO.uploadphoto(userprofile);
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

	//===========================end update profile pic==================================================


	//===========================start delete file number from document_info table==================================================
	public void fileNumberDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Gson gson = new Gson();
		JSONObject json = new JSONObject();
		String message;
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String file_number=request.getParameter("id");
		String email=(String) session.getAttribute("superemail");
		int id=(int)session.getAttribute("super_id");
	    FileNumber filenumber=new FileNumber(file_number,email,id);
		boolean check = subadminstoreDAO.fileNumberDelete(filenumber);
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
	//===========================start delete file number from document_info table==================================================

	
	

}
