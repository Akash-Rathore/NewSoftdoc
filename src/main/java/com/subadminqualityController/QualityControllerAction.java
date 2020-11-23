package com.subadminqualityController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.subadminindexingModal.IndexingUserProfile;
import com.subadminqualityDAO.QualitySubadminStoreDAO;
import com.subadminqualityModal.Quality;
import com.subadminqualityModal.QualityUserProfile;
import com.subadminstoreModal.UserProfileStore;
import com.superadminModal.UserProfile;
import com.uploadfile.IndexingUploading;

public class QualityControllerAction {

	QualitySubadminStoreDAO subadminstoreDAO;

	public QualityControllerAction() {
		subadminstoreDAO = new QualitySubadminStoreDAO();
	}

	//===================================start logout subadmin quality==========================================================
	public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session != null) {
			  session.removeAttribute("emailquality");
	   	      session.removeAttribute("qualityname");
	   	      session.removeAttribute("quality_id");
	   	      session.removeAttribute("qualityrole");
		}
		response.sendRedirect("index.jsp");

	}

  //===================================end logout subadmin quality==========================================================


	//===================================start update profile  subadmin quality==========================================================
	public void updateprofile(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		Gson gson = new Gson();
		JSONObject json = new JSONObject();
		String message;

		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("emailquality");
		int id = (int)session.getAttribute("quality_id");
		QualityUserProfile userprofile = new QualityUserProfile(request.getParameter("username"), request.getParameter("password"),
				request.getParameter("name"), request.getParameter("designation"),
				Long.parseLong(request.getParameter("mobile")), email, request.getParameter("location"),id);
		int check = subadminstoreDAO.updateprofile(userprofile);
		if (check > 0) {
			// request.getRequestDispatcher("/help.jsp").forward(request, response);

			json.put("status", true);
			json.put("message", "successfully");
			message = gson.toJson(json);
			out.println(message);

		} else {

			json.put("status", false);
			json.put("message", "Check your account wrong Usename or Password");
			message = gson.toJson(json);
			out.println(message);

		}

	}
   //===================================end update profile  subadmin quality==========================================================


	

	//===================================start quality question==========================================================

	public void qualityquestion(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		
	

		Gson gson = new Gson();
		JSONObject json = new JSONObject();
		String message;
		PrintWriter out = response.getWriter();
		String questone=request.getParameter("allavailable");
	    String questtwo=request.getParameter("spellingerror");
		String questthree=request.getParameter("correctdocument");
		String remarks=request.getParameter("remarks");
		String document_no=request.getParameter("document_no");
		
	
		/*String questfour=request.getParameter("questfour");
		String questfive=request.getParameter("questfive");
		String questsix=request.getParameter("questsix");
		String questseven=request.getParameter("questseven");
		*/
		
		if(questone.equalsIgnoreCase("yes")&&questtwo.equalsIgnoreCase("yes")&&questthree.equalsIgnoreCase("yes"))
		{
				
			 Quality quality=new Quality(request.getParameter("file_no"),document_no,questone,questtwo , questthree, "quality_approved",remarks);  
		     boolean check=subadminstoreDAO.qualityquestion(quality);  
		      if(check)
		     {
		    	    json.put("status", true);
					json.put("message", "Document Live for Customer");
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
		else
	    {
			
			 Quality quality=new Quality(request.getParameter("file_no"),document_no,questone,questtwo,questthree,"quality_return",remarks);
		     boolean check=subadminstoreDAO.qualityquestion(quality);  
		     if(check)
		     {
		    	    json.put("status", true);
					json.put("message", "Document returned to Indexing");
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
		
	}
	//===================================end quality question==========================================================

	
	
	//===================start change password subadmin quality===========================
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
			QualityUserProfile qualityUserProfile  = new QualityUserProfile(currentpassword,confirmpassword, (String) session.getAttribute("emailquality"),(int) session.getAttribute("quality_id"));
			boolean check = subadminstoreDAO.changepassword(qualityUserProfile);
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
	   //===================end change password subadmin quality===========================
		
	  
	  //==================start change  update pic=================================================================
	  public void uploadphoto(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
		{
			 Gson gson = new Gson();
			 JSONObject json = new JSONObject();
			 String message;
		 	 PrintWriter out = response.getWriter();
			 Part part = request.getPart("uploadprofile");
			 String indexingurl=new IndexingUploading().uploadFile(part,"softdoc-262410.appspot.com");
		     HttpSession session = request.getSession();
			 String email = (String) session.getAttribute("emailquality");
			 int id = (int) session.getAttribute("quality_id");
			 QualityUserProfile qualityUserProfile = new QualityUserProfile(id,email,indexingurl);
			 boolean check = subadminstoreDAO.uploadphoto(qualityUserProfile);
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
	  //==================end change  update pic=================================================================
	  
		
	  
	  
}
