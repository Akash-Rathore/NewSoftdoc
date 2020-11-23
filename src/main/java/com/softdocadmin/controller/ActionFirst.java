package com.softdocadmin.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.json.simple.JSONObject;
import com.google.gson.Gson;
import com.softdocadmin.DAO.ProfileDAO;
import com.softdocadmin.modal.ComplainList;
import com.softdocadmin.modal.LocationCustomer;
import com.softdocadmin.modal.Uploadingbill;
import com.softdocadmin.modal.UserProfile;
import com.softdocadmin.modal.Usercustomer;
import com.uploadfile.CustomerUploadfilegst;
import com.uploadfile.CustomerUploadfileother;
import com.uploadfile.CustomerUploadfilepan;
import com.uploadfile.CustomerUploadfilequestion;
import com.uploadfile.CustomerUploadfilesigned;
import com.uploadfile.CustomerUploadfiletan;
import com.uploadfile.IndexingUploading;
public class ActionFirst {

	ProfileDAO profileDAO;

	public ActionFirst() {
		profileDAO = new ProfileDAO();
	}

	
	//============================start logout pages====================================================
	public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session != null) {

			  session.removeAttribute("Email");
	   	      session.removeAttribute("adminname");
	   	      session.removeAttribute("id");
	   		
		}
		response.sendRedirect("index.jsp");

	}
	//============================end logout pages====================================================

	
	//============================start update profile====================================================
	public void updateprofile(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		Gson gson = new Gson();
		JSONObject json = new JSONObject();
		String message;
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("Email");
		int id = (int) session.getAttribute("id");
		UserProfile userprofile = new UserProfile(request.getParameter("username"), request.getParameter("password"),
				request.getParameter("name"), request.getParameter("designation"),
				Long.parseLong(request.getParameter("mobile")), email, request.getParameter("location"), id);
		int check = profileDAO.updateprofile(userprofile);

		if (check > 0) {

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

	}
   //============================end update profile====================================================
	

	 //============================start customer admin create====================================================
      public void customer(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
	
    	String bucket_name="softdoc-262410.appspot.com";
		String filegst=new CustomerUploadfilegst().getImageUrl(request, response,bucket_name);
		String fileother=new CustomerUploadfileother().getImageUrl(request, response,bucket_name);
		String filepan=new CustomerUploadfilepan().getImageUrl(request, response,bucket_name);
		String question=new CustomerUploadfilequestion().getImageUrl(request, response,bucket_name);
		String filesigned=new CustomerUploadfilesigned().getImageUrl(request, response,bucket_name);
		String filetan=new CustomerUploadfiletan().getImageUrl(request, response,bucket_name);
	    
		Gson gson = new Gson();
		JSONObject json = new JSONObject();
		String message;
		PrintWriter out = response.getWriter();

		String deparment = "";
		
		String a[] = request.getParameterValues("vardepartment");
		for (int i = 0; i < a.length; i++) {
			deparment += a[i] + ",";
		}

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("Email");
		int id = (int) session.getAttribute("id");
		 //customeradmincode
		 String clientnumber = String.format ("%04d",id);  
         String companyname =request.getParameter("companyname");
 	     String company="";
 	      for (int j = 0; j <= 3; j++) {
 	    	   company += companyname.charAt(j);
 		  }
 	    String customeradmincode=company.toUpperCase()+"CA"+clientnumber;
		
 	    String serviceType =request.getParameter("serviceType");
 	    String storageDataIntegerupdate;
 	    
 	    if(request.getParameter("storageData").equals(""))
 	    {
 	    	storageDataIntegerupdate="";
 	    }
 	    else
 	    {
 	    	  int storageDataInteger=Integer.parseInt(request.getParameter("storageData"))*1000;
 	    	  storageDataIntegerupdate= Integer.toString(storageDataInteger);       	
 	    }
 	    
 	    String noOfUsers =request.getParameter("noOfUsers");
 	    String planStarDate =request.getParameter("planStarDate");
 	    String planEndDate =request.getParameter("planEndDate");
 	    
 	    if(serviceType.equals("Annual")) {
 	    	planEndDate ="";
 	    }
 	    
 	    
 	    
 	    
 	    Usercustomer usercustomer = new Usercustomer(request.getParameter("customernum"),
				request.getParameter("companyname"), request.getParameter("billingaddressone"),
				request.getParameter("billingaddresstwo"), request.getParameter("billingcity"),
				request.getParameter("billingstate"), Integer.parseInt(request.getParameter("billingpincode")),
				request.getParameter("compan"), request.getParameter("gstin"),request.getParameter("tan"),
				request.getParameter("type"), request.getParameter("industry"), request.getParameter("compername"),
				request.getParameter("comperdesignation"), request.getParameter("comperemail"),
				Long.parseLong(request.getParameter("mobile")), deparment,
				Integer.parseInt(request.getParameter("quality")), request.getParameter("color"),filegst, filepan,filetan, filesigned,question, fileother, id, email,request.getParameter("pan_text"),serviceType
				,storageDataIntegerupdate,noOfUsers,planStarDate,planEndDate);
         
		int insercustomer = profileDAO.customerinsert(usercustomer);
		if (insercustomer>0) {

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
   //============================start customer admin create====================================================


    //============================start delete customer admin====================================================
	public void customerdelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Gson gson = new Gson();
		JSONObject json = new JSONObject();
		String message;
		PrintWriter out = response.getWriter();

		int id = Integer.parseInt(request.getParameter("id"));

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("Email");
		int idsession = (int) session.getAttribute("id");

		Usercustomer usercustomer = new Usercustomer(Integer.parseInt(request.getParameter("id")), idsession, email);
		boolean check = profileDAO.customerdelete(usercustomer);
		if (check) {
			// request.getRequestDispatcher("/customer.jsp").forward(request, response);

			json.put("status", true);
			json.put("message", "success");
			message = gson.toJson(json);
			out.println(message);

		} else {
			// request.getRequestDispatcher("/customer.jsp").forward(request, response);
			json.put("status", false);
			json.put("message", "not success");
			message = gson.toJson(json);
			out.println(message);

		}
	}
    //============================start delete customer admin====================================================

	
	

    //============================start update customer admin====================================================
	public void customerupdate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Part filePart = req.getPart("filegst");
		//String indexingurl=new IndexingUploading().uploadFile(part,"softdoc-262410.appspot.com");
		//String fileName = part.getSubmittedFileName();
		Gson gson = new Gson();
		JSONObject json = new JSONObject();
		String message;
		PrintWriter out = response.getWriter();

		
		
		String bucket_name="softdoc-262410.appspot.com";
		
		String  filegst=new CustomerUploadfilegst().getImageUrl(request, response,bucket_name);
	  	String fileother=new CustomerUploadfileother().getImageUrl(request, response,bucket_name);
		String filepan=new CustomerUploadfilepan().getImageUrl(request, response,bucket_name);
		String question=new CustomerUploadfilequestion().getImageUrl(request, response,bucket_name);
		String filesigned=new CustomerUploadfilesigned().getImageUrl(request, response,bucket_name);
		String filetan=new CustomerUploadfiletan().getImageUrl(request, response,bucket_name);
	   
		int id = Integer.parseInt(request.getParameter("id"));
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("Email");
		int idsession = (int) session.getAttribute("id");
		String deparment = "";
		String a[] = request.getParameterValues("vardepartment");
		for (int i = 0; i < a.length; i++) {
			deparment += a[i] + ",";
		}
		
		String serviceType =request.getParameter("serviceType");
 	    int storageDataInteger=Integer.parseInt(request.getParameter("storageData"))*1000;
	    String noOfUsers =request.getParameter("noOfUsers");
 	    String planStarDate =request.getParameter("planStarDate");
 	    String planEndDate =request.getParameter("planEndDate");
 	    
 	    if(serviceType.equals("Annual")) {
	    	planEndDate ="";
	    }
 	    
 	    int quality=0;
 	    
 	    if(request.getParameter("quality")==null)
 	    {
 	       quality=0;
 	     }else {
 	    	quality=Integer.parseInt(request.getParameter("quality"));
 	     }
 	    
 	    
		Usercustomer usercustomer = new Usercustomer(Integer.parseInt(request.getParameter("id")),
				request.getParameter("customernum"), request.getParameter("companyname"),
				request.getParameter("billingaddressone"), request.getParameter("billingaddresstwo"),
				request.getParameter("billingcity"), request.getParameter("billingstate"),
				Integer.parseInt(request.getParameter("billingpincode")), request.getParameter("compan"),
				request.getParameter("gstin"), request.getParameter("tan"), request.getParameter("type"),
				request.getParameter("industry"), request.getParameter("compername"),
				request.getParameter("comperdesignation"), request.getParameter("comperemail"),
				Long.parseLong(request.getParameter("mobile")), deparment,
				quality, request.getParameter("color"),
				filegst, filepan,filetan, filesigned,question, fileother, idsession, email,request.getParameter("pan_text"), serviceType , Integer.toString(storageDataInteger) , noOfUsers , planStarDate , planEndDate);
		boolean check = profileDAO.customerupdate(usercustomer);
		if (check) {
			//request.getRequestDispatcher("/customer.jsp").forward(request, response);
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
    //============================start update customer admin====================================================
	
	
	//============================start subadmin store , indexing , quality ====================================================
	public void subadmine(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String softdocnum = request.getParameter("softdocnum");
		String empid = request.getParameter("empid");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		Long mobile = Long.parseLong(request.getParameter("mobile"));
		String joindate=request.getParameter("joindate");
		if(joindate.equals(""))
		{
			
			joindate="0001-01-01";
			
		}
		String activitiondate = request.getParameter("activitiondate");
	    String designation = request.getParameter("designation");
		String department = request.getParameter("department");
		String role = request.getParameter("role");

		HttpSession session = request.getSession();
		String emailsession = (String) session.getAttribute("Email");
		int idsession = (int) session.getAttribute("id");
		String admin_name = (String) session.getAttribute("adminname");
		
		// gson and json library
		Gson gson = new Gson();
		JSONObject json = new JSONObject();
		String message;
		PrintWriter out = response.getWriter();
		UserProfile userprofile = new UserProfile(request.getParameter("softdocnum"), request.getParameter("empid"),
				request.getParameter("name"), request.getParameter("email"),
				Long.parseLong(request.getParameter("mobile")),joindate,
				request.getParameter("activitiondate"), request.getParameter("designation"),
				request.getParameter("department"), request.getParameter("role"), idsession, emailsession, admin_name);
		boolean check = profileDAO.subadmine(userprofile);
		if (check) {

			json.put("status", true);
			json.put("message", "Sucessfully");
			message = gson.toJson(json);
			out.println(message);
		} else {
			json.put("status", false);
			json.put("message", "Something is Wrong");
			message = gson.toJson(json);
			out.println(message);
		}
	}
	//============================end subadmin store , indexing , quality ====================================================
	
	
	//============================ start change password softdoc admin ====================================================
	public void changepassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Gson gson = new Gson();
		JSONObject json = new JSONObject();
		String message;
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		UserProfile userprofile = new UserProfile(request.getParameter("currentpassword"), request.getParameter("newpassword"),
				request.getParameter("confirmpassword"), (String) session.getAttribute("Email"),
				(int) session.getAttribute("id"));
		boolean check = profileDAO.changepassword(userprofile);
		if (check) {
		
			json.put("status", true);
			json.put("message", "Sucessfully");
			message = gson.toJson(json);
			out.println(message);

		} else {
		
			json.put("status", false);
			json.put("message", "Something is Wrong");
			message = gson.toJson(json);
			out.println(message);
		}

	}
	//============================ end change password softdoc admin ====================================================
	
	//============================ start subadmin delete ====================================================
	public void subadmindelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Gson gson = new Gson();
		JSONObject json = new JSONObject();
		String message;
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		UserProfile userprofile = new UserProfile(Integer.parseInt(request.getParameter("id")),
				(String) session.getAttribute("Email"), (int) session.getAttribute("id"));
		boolean check = profileDAO.subadmindelete(userprofile);
		if (check) {

			json.put("status", true);
			json.put("message", "success");
			message = gson.toJson(json);
			out.println(message);

		} else {
			
			// request.getRequestDispatcher("user.jsp").forward(request, response);
			json.put("status", false);
			json.put("message", "Something is Wrong");
			message = gson.toJson(json);
			out.println(message);
		}

	}
	//============================ end subadmin delete ====================================================
	
	
	//============================update  subadmin store , quality , indexing ====================================================
	public void subadminupdate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Gson gson = new Gson();
		JSONObject json = new JSONObject();
		String message;
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		UserProfile userprofile = new UserProfile(Integer.parseInt(request.getParameter("id")),
				request.getParameter("softdocnum"), request.getParameter("empid"), request.getParameter("name"),
				request.getParameter("email"), Long.parseLong(request.getParameter("mobile")),
				request.getParameter("joindate"), request.getParameter("activitiondate"),
				request.getParameter("designation"), request.getParameter("department"), request.getParameter("role"),
				(String) session.getAttribute("Email"), (int) session.getAttribute("id"));
		boolean check = profileDAO.subadminupdate(userprofile);
		if (check) {
              
			json.put("status", true);
			json.put("message", "success");
			message = gson.toJson(json);
			out.println(message);
		} else {
			json.put("status", false);
			json.put("message", "Something is Wrong");
			message = gson.toJson(json);
			out.println(message);
		}

	}
	//============================update  subadmin store , quality , indexing ====================================================

	//============================start Customer location ====================================================
	public void customerlocation(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// gson library
		Gson gson = new Gson();
		JSONObject json = new JSONObject();
		String message;
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
		String addresslineone = request.getParameter("addresslineone");
		String addresslinetwo = request.getParameter("addresslinetwo");
		String city = request.getParameter("city");
		int pincode = Integer.parseInt(request.getParameter("pincode"));
		String date = request.getParameter("date");
		String frequency = request.getParameter("pickupfrequency");
		String name = request.getParameter("locpersonname");
		String mobile = request.getParameter("locpersonmobile");
		String email = request.getParameter("locpersonemail");
		String designation = request.getParameter("locpersiondesignation");
		LocationCustomer location = new LocationCustomer(request.getParameter("addresslineone"),
				request.getParameter("addresslinetwo"), request.getParameter("city"),
				Integer.parseInt(request.getParameter("pincode")), request.getParameter("date"),
				Integer.parseInt(request.getParameter("pickupfrequency")), request.getParameter("locpersonname"),
				request.getParameter("locpersonmobile"), request.getParameter("locpersonemail"),
				request.getParameter("locpersiondesignation"), request.getParameter("company_name"),
				(String) session.getAttribute("Email"), (int) session.getAttribute("id"),Integer.parseInt(request.getParameter("company_id")));
		boolean check = profileDAO.customerlocation(location);
		if (check) {
			// request.getRequestDispatcher("/add_location.jsp").forward(request, response);
			json.put("status", true);
			json.put("message", "Successfully");
			message = gson.toJson(json);
			out.println(message);
		} else {
			json.put("status", false);
			json.put("message", "Something is Wrong");
			message = gson.toJson(json);
			out.println(message);
		}
	}
	//============================end Customer location ====================================================

	//============================start Extra for complain ====================================================
	public void complainlist(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String department = request.getParameter("department");
		// System.out.println(department);
		String situation = request.getParameter("situation");
		String areaofissue = request.getParameter("areaofissue");
		String description = request.getParameter("description");

		// gson library
		Gson gson = new Gson();
		JSONObject json = new JSONObject();
		String message;
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
		int id = (int) session.getAttribute("id");
		ComplainList complaintlist = new ComplainList(request.getParameter("department"),
				request.getParameter("situation"), request.getParameter("areaofissue"),
				request.getParameter("description"), id, (String) session.getAttribute("Email"));
		boolean check = profileDAO.complainlist(complaintlist);
		if (check) {
			// request.getRequestDispatcher("/complaint.jsp").forward(request, response);
			json.put("status", true);
			json.put("message", "Successfully");
			message = gson.toJson(json);
			out.println(message);
		} else {
			json.put("status", false);
			json.put("message", "Some Thing is Wrong");
			message = gson.toJson(json);
			out.println(message);

		}

	}
	
	
	public void complainlistupdate(HttpServletRequest request, HttpServletResponse response) throws IOException {

		HttpSession session = request.getSession();
		ComplainList complaintlist = new ComplainList(request.getParameter("id"),
				request.getParameter("status"), (String) session.getAttribute("Email"),
				(int) session.getAttribute("id"));
		boolean check = profileDAO.complainlistupdate(complaintlist);
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
		   ComplainList complaintlist = new ComplainList(request.getParameter("remark"),Integer.parseInt(request.getParameter("id")),(String) session.getAttribute("Email"),(int) session.getAttribute("id"));
		   boolean check = profileDAO.complainlistremark(complaintlist);
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
	

   //============================end Extra for complain ====================================================
		
	
	//============================start upload billing  ====================================================
	public void uploadbill(HttpServletRequest mrequest, HttpServletResponse response) throws IOException, ServletException
	{
		
		
		 Gson gson = new Gson();
		 JSONObject json = new JSONObject();
		 String message;
	 	 PrintWriter out = response.getWriter();
		 String uploadbilling=mrequest.getParameter("billingmonth");
		 int companyid=Integer.parseInt(mrequest.getParameter("companyid"));
		 Part part = mrequest.getPart("billing_report");
		 String indexingurl=new IndexingUploading().uploadFile(part,"softdoc-262410.appspot.com");
		 Uploadingbill uploadingbill=new Uploadingbill(uploadbilling,companyid,indexingurl);
		 boolean check = profileDAO.uploadbill(uploadingbill);
		 if(check)
		  {
			 //   json.put("status", true);
			//	json.put("message", "Successfully");
				//message = gson.toJson(json);
				//out.println(message);
			 response.sendRedirect("admin/report.jsp");
	  
		  }
		  else
		  {
			 	//json.put("status", false);
				//json.put("message", "Something is wrong");
			//	message = gson.toJson(json);
				//out.println(message);

			  response.sendRedirect("admin/report.jsp");
				  
		  }
		  
	}
	//============================END upload billing  ====================================================

	//===================START PAYMENT STATUS=========================================
	public void paymentstatus(HttpServletRequest request, HttpServletResponse response) throws IOException {

		HttpSession session = request.getSession();
		Uploadingbill uploadingbill = new Uploadingbill(Integer.parseInt(request.getParameter("id")),request.getParameter("paymentstatus"),request.getParameter("billing_month"),(String) session.getAttribute("Email"),
				(int) session.getAttribute("id"));
		
		boolean check = profileDAO.paymentstatus(uploadingbill);
		// gson library
		Gson gson = new Gson();
		JSONObject json = new JSONObject();
		String message;
		PrintWriter out = response.getWriter();
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
	//===================END PAYMENT STATUS=========================================

	
	//===================Upload photo start=========================================
	public void uploadphoto(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		
		
		 Gson gson = new Gson();
		 JSONObject json = new JSONObject();
		 String message;
	 	 PrintWriter out = response.getWriter();
		 Part part = request.getPart("uploadprofile");
		 String indexingurl=new IndexingUploading().uploadFile(part,"softdoc-262410.appspot.com");
	     HttpSession session = request.getSession();
		 String email = (String) session.getAttribute("Email");
		 int id = (int) session.getAttribute("id");
		 UserProfile userprofile = new UserProfile(id,email,indexingurl);
		 boolean check = profileDAO.uploadphoto(userprofile);
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
	
	
	//===================Upload photo end===========================================
	
	//=========================START DELETE customer location==============================
	public void deleteLocation(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		boolean check=false;
		Gson gson = new Gson();
		JSONObject json = new JSONObject();
		String message;
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		int id=Integer.parseInt(request.getParameter("id"));
		String email=(String) session.getAttribute("Email");
		int sessionid=(int)session.getAttribute("id");
		LocationCustomer locationCustomer = new LocationCustomer(id,email,sessionid);
	    check = profileDAO.deleteLocation(locationCustomer);
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

	//=========================END DELETE customer location==============================

	
	//=========================START UPDATE customer location==============================
	public void updatelocation(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// gson library
		Gson gson = new Gson();
		JSONObject json = new JSONObject();
		String message;
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		LocationCustomer customerlocation = new LocationCustomer(Integer.parseInt(request.getParameter("id")),request.getParameter("addresslineone"),
				request.getParameter("addresslinetwo"), request.getParameter("city"),
				Integer.parseInt(request.getParameter("pincode")), request.getParameter("date"),
				Integer.parseInt(request.getParameter("pickupfrequency")), request.getParameter("locpersonname"),
				request.getParameter("locpersonmobile"), request.getParameter("locpersonemail"),
				request.getParameter("locpersiondesignation"), request.getParameter("company_name"),
				(String) session.getAttribute("Email"), (int) session.getAttribute("id"));
		boolean check = profileDAO.updatelocation(customerlocation);
		if (check) {
			json.put("status", true);
			message = gson.toJson(json);
			out.println(message);
		} else {
			json.put("status", false);
			message = gson.toJson(json);
			out.println(message);
		}
	}
	//=========================START UPDATE customer location==============================

}
