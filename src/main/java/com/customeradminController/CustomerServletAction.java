package com.customeradminController;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.customeradminDAO.CustomeradminDAO;
import com.customeradminModal.ClientJsonObject;
import com.customeradminModal.Cloud;
import com.customeradminModal.CloudJsonObject;
import com.customeradminModal.CustomerComplainList;
import com.customeradminModal.Userclientdetail;
import com.customeradminModal.Usercustomer;
import com.customerclientModal.Message;
import com.customerclientModal.RequestAccess;
import com.customerclientModal.UsercustomerClient;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.uploadfile.IndexingUploading;
import com.uploadfile.UploadFile;

public class CustomerServletAction {

	CustomeradminDAO customeradminDAO;
	public CustomerServletAction()
	{
		customeradminDAO=new CustomeradminDAO();
	}
	private static final SimpleDateFormat simpleDateFormate = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss");

    //customeradmin logout
	 public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
     {
   	    HttpSession session = request.getSession();
   	    if(session!=null){

            session.removeAttribute("customeremail");
   	    	session.removeAttribute("customer_id");
   	    	session.removeAttribute("customername");
           
         }
   	     response.sendRedirect("./index.jsp");
        
     }
	 
	 //customeradmin updateprofile
	
	 //start customer-admin update profile
	 public void updateprofile(HttpServletRequest request, HttpServletResponse response) throws IOException
	 {     
		    
		    Gson gson=new Gson();
		    JSONObject json=new JSONObject();
		    String message;
		    PrintWriter out=response.getWriter();   
		    //get email for session
	        HttpSession session = request.getSession();
	        String email=(String)session.getAttribute("customeremail");
	        int id=(int)session.getAttribute("customer_id");
	        Usercustomer usercustomer=new Usercustomer(request.getParameter("username"),request.getParameter("password"),request.getParameter("name"),request.getParameter("designation"),Long.parseLong(request.getParameter("mobile")),email,request.getParameter("location"),id);
	        boolean check=customeradminDAO.updateprofile(usercustomer);
	        if(check)
		      {
		    	  json.put("status",true);
		 	      json.put("message","Update profile");
		     	  message=gson.toJson(json);
		     	  out.println(message);
		      }
		      else
		      {
		    	  json.put("status" , false);
			 	  json.put("message" , "Profile not update");
			      message=gson.toJson(json);
	              out.println(message);
		      }
	        
	        
      }
	  
	//end customer-admin update profile
	 
	 
	//start customer-admin create client_detail
	 public void clientdetail(HttpServletRequest request, HttpServletResponse response) throws IOException
	  {
		 
		        String selectdeparment= "";
		        JSONArray array = new JSONArray();
				Enumeration paramNames = request.getParameterNames();
				 while(paramNames.hasMoreElements()) {
				
					 Object object=paramNames.nextElement();
					 String param=(String)object;
					 for(int i=0;i<=30;i++) {
					
						 JSONObject json2 = new JSONObject();
						 if(param.equalsIgnoreCase("access_right_"+i+"")) {
							
							 String access_leve_departmemnt=request.getParameter("access_right_"+i+"");
							 String array_access_level[]=access_leve_departmemnt.split(":");
							 json2.put("department" , array_access_level[0]);				
						     json2.put("access_level" , array_access_level[1]);		
		     			     array.add(json2);	   
	     				 
						 }
					 
				  }
				
		      }
		     
		     
		    boolean check =false;
		    Gson gson=new Gson();
		    JSONObject json=new JSONObject();
			String message;
			PrintWriter out=response.getWriter();
			HttpSession session=request.getSession();
		    int customer_id=(int)session.getAttribute("customer_id"); 
		    String email=(String) session.getAttribute("customeremail");
		    String customer_name=(String) session.getAttribute("customername");
		    String customer_industry=(String) session.getAttribute("customer_industry");
		  
		   
		    
		   Userclientdetail userclientdetail=new Userclientdetail(request.getParameter("softdocnum"),request.getParameter("empid"),request.getParameter("name"),request.getParameter("email"),request.getParameter("joindate"),request.getParameter("activitiondate"),request.getParameter("department"),request.getParameter("designation"),request.getParameter("location"),array.toJSONString(),customer_id,email,customer_name,customer_industry); 
           check=customeradminDAO.clientdetail(userclientdetail);
            
            if(check)
            {
            	 json.put("status",true);
   	             json.put("message","Successfully");
       	         message=gson.toJson(json);
       	         out.println(message);
  		    }
            else
            {
            	 json.put("status",false);
  	             json.put("message","Client details not success");
      	         message=gson.toJson(json);
      	         out.println(message);
 		    }
      }
	
	
	//start customer-admin create client_detail
	  public void clientdetaildelete(HttpServletRequest request, HttpServletResponse response) throws IOException
      {
		    HttpSession session=request.getSession();
		    int customer_id=(int)session.getAttribute("customer_id"); 
		    String email=(String) session.getAttribute("customeremail");
		    
		    Gson gson = new Gson();
			JSONObject json = new JSONObject();
			String message;
			PrintWriter out = response.getWriter();
            Userclientdetail userclientdetail=new Userclientdetail(Integer.parseInt(request.getParameter("id")),(String) session.getAttribute("customeremail"),(int)session.getAttribute("customer_id"));
            boolean check=customeradminDAO.clientdetaildelete(userclientdetail);  
            if(check)
            {
            	json.put("status", true);
    			json.put("message", "success");
    			message = gson.toJson(json);
    			out.println(message);
            }
            else
            {
            	// response.sendRedirect("user.jsp");
            	json.put("status", false);
    			json.put("message", "not success");
    			message = gson.toJson(json);
    			out.println(message);
            }
      }
	//end customer-admin create client_detail
		
	  
	 //start customer-admin update client_detail
	  public void clientdetailupdate(HttpServletRequest request, HttpServletResponse response) throws IOException
	  {
		     
		     String selectdeparment= "";
		     Enumeration paramNames = request.getParameterNames();
		     JSONArray array = new JSONArray();
			 while(paramNames.hasMoreElements()) {
			
				 Object object=paramNames.nextElement();
				 String param=(String)object;
				 for(int i=0;i<=25;i++) {
				
					 JSONObject json2 = new JSONObject();
					 if(param.equalsIgnoreCase("access_right_"+i+"")) {
						
						 String access_leve_departmemnt=request.getParameter("access_right_"+i+"");
						 String array_access_level[]=access_leve_departmemnt.split(":");
						 json2.put("department" , array_access_level[0]);				
					     json2.put("access_level" , array_access_level[1]);		
	     			     array.add(json2);	   
     				 }
				 
			  }
			
	        }
	        
			 
			 
			boolean check=false;
			Gson gson = new Gson();
	        JSONObject json = new JSONObject();
	        String message;
	     	PrintWriter out = response.getWriter();
		    HttpSession session=request.getSession();
			Userclientdetail userclientdetail=new Userclientdetail(Integer.parseInt(request.getParameter("id")),request.getParameter("softdocnum"),request.getParameter("empid"),request.getParameter("name"),request.getParameter("email"),request.getParameter("joindate"),request.getParameter("activitiondate"),request.getParameter("department"),request.getParameter("designation"),request.getParameter("location"),array.toJSONString(),(String) session.getAttribute("customeremail"),(int)session.getAttribute("customer_id")); 
		    check=customeradminDAO.clientdetailupdate(userclientdetail);
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
	//end customer-admin update client_detail
		 
	  
	  
	  public void complainlist(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	  {
		 
		  UploadFile uploadfile=new UploadFile();
	      String imageUrl =uploadfile.getImageUrl(request, response,"softdoc-262410.appspot.com");
		 
	      Gson gson=new Gson();
	      JSONObject json=new JSONObject();
		  String message;
		  PrintWriter out=response.getWriter();   
	      HttpSession session=request.getSession();
  	      int id=(int)session.getAttribute("customer_id");
  	      String title=request.getParameter("title");
          String  description=request.getParameter("description");
  	      String documentnumberref=request.getParameter("documentnumberref");
  	      String category=request.getParameter("category");
  	      CustomerComplainList complaintlist=new CustomerComplainList(title,imageUrl,documentnumberref,description,id,category);
	      boolean check=customeradminDAO.complainlist(complaintlist);
	      if(check)
	      {
	    	  json.put("status",true);
	 	      json.put("message","Complain is raised");
	     	  message=gson.toJson(json);
	     	  out.println(message);
	      }
	      else
	      {
	    	  json.put("status" , false);
		 	  json.put("message" , "Complain is not raised ");
		      message=gson.toJson(json);
              out.println(message);
	      }
	   }
	  //start customer-admin change password
	   public void changepassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	   {      
		      HttpSession session=request.getSession();
 	          String email=(String)session.getAttribute("customeremail");
 	          int id=(int)session.getAttribute("customer_id");
 	          Gson gson = new Gson();
 		      JSONObject json = new JSONObject();
 		      String message;
 		      PrintWriter out = response.getWriter();
 	          Usercustomer usercustomer=new Usercustomer(request.getParameter("currentpassword"),request.getParameter("newpassword"),request.getParameter("confirmpassword"),email,id);
		      boolean check=customeradminDAO.changepassword(usercustomer);
		      if(check)
		      {
		    	    json.put("status", true);
				    json.put("message", "Successfully");
				    message = gson.toJson(json);
				    out.println(message);
			  }
		      else
		      {
		    	    json.put("status", false);
					json.put("message", "Something is wrong");
					message = gson.toJson(json);
					out.println(message);
		      }
		      
		}
	  //start customer-admin change password
	   
	  //start customer-admin complainupdate
	   public void complainupdate(HttpServletRequest request, HttpServletResponse response) throws IOException {

			HttpSession session = request.getSession();
			CustomerComplainList customercomplainlist=new CustomerComplainList((int) session.getAttribute("customer_id"),request.getParameter("status"), (String) session.getAttribute("customeremail"),request.getParameter("id"));  
			boolean check = customeradminDAO.complainupdate(customercomplainlist);
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
	   //end customer-admin complainupdate
	   
	   //start customer-admin complain Remark
	 	public void  complainremark(HttpServletRequest request, HttpServletResponse response) throws IOException
		{
			   Gson gson = new Gson();
			   JSONObject json = new JSONObject();
		  	   String message;
	           PrintWriter out = response.getWriter();
			   HttpSession session = request.getSession();
			  
			   
			  CustomerComplainList customercomplainlist=new CustomerComplainList(request.getParameter("remark"),Integer.parseInt(request.getParameter("id")),(String) session.getAttribute("customeremail"),(int) session.getAttribute("customer_id"));
		       boolean check = customeradminDAO.complainremark(customercomplainlist); 
		       if (check) {
		    
		    	   json.put("status", true); 
			       json.put("message", "Successfully");
			       message =gson.toJson(json); 
			       out.println(message);
			   } 
		       else
		       {
		  
		         json.put("status", false);
		         json.put("message", "Something is wrong"); 
		         message= gson.toJson(json);
		         out.println(message);
		  
		        }
		  }
	 	//end customer-admin complain Remark
	 	
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
			 String email = (String) session.getAttribute("customeremail");
			 int id = (int) session.getAttribute("customer_id");
			 Usercustomer usercustomer = new Usercustomer(id,email,indexingurl);
			 boolean check = customeradminDAO.uploadphoto(usercustomer);
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
      
		public void clienRecord(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
		{
			
		 	 PrintWriter out = response.getWriter();
		 	 HttpSession session = request.getSession();
			 String email = (String) session.getAttribute("customeremail");
			 int customer_id = (int) session.getAttribute("customer_id");
			 Userclientdetail userclientdetail=new Userclientdetail(email , customer_id);
	         List<Userclientdetail> list=customeradminDAO.clienRecord(userclientdetail);
	         ClientJsonObject clientJsonObject=new ClientJsonObject(); 
	         clientJsonObject.setiTotalDisplayRecords(list.size());
	         clientJsonObject.setiTotalRecords(list.size());
	         clientJsonObject.setAaData(list);
	         Gson gson = new GsonBuilder().setPrettyPrinting().create();
	     	 String json2 = gson.toJson(clientJsonObject);
	     	 out.print(json2);
		
		}
		
		public void editclient(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
		{
			
		 	 PrintWriter out = response.getWriter();
		 	 HttpSession session = request.getSession();
			 String email = (String) session.getAttribute("customeremail");
			 int customer_id = (int) session.getAttribute("customer_id");
			 int client_id=Integer.parseInt(request.getParameter("id"));
			 Userclientdetail userclientdetail=new Userclientdetail(email , customer_id , client_id);
	         List<Userclientdetail> list=customeradminDAO.editclient(userclientdetail);
	         request.setAttribute("editClientDetails", list);
	         RequestDispatcher requestDispatcher = request.getRequestDispatcher("/customer/create_clients.jsp");
	         requestDispatcher.forward(request, response);
	         
		
		}
		
		
		public void viewclient(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
		{
			
		 	 PrintWriter out = response.getWriter();
		 	 HttpSession session = request.getSession();
			 String email = (String) session.getAttribute("customeremail");
			 int customer_id = (int) session.getAttribute("customer_id");
			 int client_id=Integer.parseInt(request.getParameter("id"));
			 Userclientdetail userclientdetail=new Userclientdetail(email , customer_id , client_id);
	         List<Userclientdetail> list=customeradminDAO.viewclient(userclientdetail);
	         request.setAttribute("viewClientDetails", list);
	         RequestDispatcher requestDispatcher = request.getRequestDispatcher("/customer/view_create_clients.jsp");
	         requestDispatcher.forward(request, response);
	    
		}
		
		public void cloudRecord(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
		{
			
		 	 PrintWriter out = response.getWriter();
		 	 HttpSession session = request.getSession();
			 String email = (String) session.getAttribute("customeremail");
			 int customer_id = (int) session.getAttribute("customer_id");
			 String cloudate="";
			 
			 if(request.getParameter("cloudate")!=null){
	                 cloudate=request.getParameter("cloudate");
			 }
			 
			 Cloud cloud1=new Cloud(email, customer_id , cloudate);
			 List<Cloud> list=customeradminDAO.cloudRecord(cloud1);
	         CloudJsonObject cloudJsonObject=new CloudJsonObject(); 
	         cloudJsonObject.setiTotalDisplayRecords(list.size());
	         cloudJsonObject.setiTotalRecords(list.size());
	         cloudJsonObject.setAaData(list);
	         Gson gson = new GsonBuilder().setPrettyPrinting().create();
	     	 String json2 = gson.toJson(cloudJsonObject);
	     	 out.print(json2);
		
		}
		
		public void trackingRecord(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
		{
			
		 	 PrintWriter out = response.getWriter();
		 	 HttpSession session = request.getSession();
			 String email = (String) session.getAttribute("customeremail");
			 int customer_id = (int) session.getAttribute("customer_id");
			 Cloud cloud1=new Cloud(email, customer_id);
			 List<Cloud> list=customeradminDAO.trackingRecord(cloud1);
			 CloudJsonObject cloudJsonObject=new CloudJsonObject(); 
	         cloudJsonObject.setiTotalDisplayRecords(list.size());
	         cloudJsonObject.setiTotalRecords(list.size());
	         cloudJsonObject.setAaData(list);
	         Gson gson = new GsonBuilder().setPrettyPrinting().create();
	     	 String json2 = gson.toJson(cloudJsonObject);
	     	 out.print(json2);
		
		}
         
		
		
		public void profileRecord(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
		{
			 HttpSession session = request.getSession();
			 String email = (String) session.getAttribute("customeremail");
			 int customer_id = (int) session.getAttribute("customer_id");
			 Usercustomer usercustomer=new Usercustomer(customer_id,email);
			 List<Usercustomer> list=customeradminDAO.profileRecord(usercustomer);
		     request.setAttribute("profileRecord", list);
	         RequestDispatcher requestDispatcher = request.getRequestDispatcher("/customer/profile.jsp");
	         requestDispatcher.forward(request, response);
	  
		}

		
		public void profileCompleteDetails(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
		{
			 HttpSession session = request.getSession();
			 String email = (String) session.getAttribute("customeremail");
			 int customer_id = (int) session.getAttribute("customer_id");
			 Usercustomer usercustomer=new Usercustomer(customer_id , email);
			 List<Usercustomer> list=customeradminDAO.profileCompleteDetails(usercustomer);
		     request.setAttribute("profileCompleteDetails", list);
	         RequestDispatcher requestDispatcher = request.getRequestDispatcher("/customer/viewcustomer.jsp");
	         requestDispatcher.forward(request, response);
	  
		}
		
		
		public void DashboardDetails(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
		{
			
			  Gson gson=new Gson();
			  JSONObject json=new JSONObject();
		      String message;
		      String JSONObject="";
			  PrintWriter out=response.getWriter();   
					
			 HttpSession session = request.getSession();
			 String email = (String) session.getAttribute("customeremail");
			 int customer_id = (int) session.getAttribute("customer_id");
			 Usercustomer usercustomer=new Usercustomer(customer_id , email);
			 List<Usercustomer> list=customeradminDAO.DashboardDetails(usercustomer);
			
			 GsonBuilder gsonBuilder = new GsonBuilder();
	         Gson gson2 = gsonBuilder.create();
	         JSONObject = gson2.toJson(list);
	         json.put("data",JSONObject);
	         message=gson.toJson(json);
	         out.println(message);
	   	
		}
		
		

         public void dashboardRequestAccessDepartment(HttpServletRequest request, HttpServletResponse response) throws IOException {
				
			    HttpSession session = request.getSession();
			 	String email = (String) session.getAttribute("customeremail");
				int customer_id = (int) session.getAttribute("customer_id");
				
				Usercustomer usercustomer=new Usercustomer(customer_id , email);
				List<Usercustomer> list = customeradminDAO.dashboardRequestAccessDepartment(usercustomer);
			    
				Gson gson = new Gson();
				JSONObject json = new JSONObject();
				String message;
				PrintWriter out = response.getWriter();
				json.put("requestDepartment" , list);
	  			message = gson.toJson(json);
	  			out.println(message);

		 }  
		
         
         public void DashboardDepartmentAccess(HttpServletRequest request, HttpServletResponse response) throws IOException {
				
			    HttpSession session = request.getSession();
			 	String email = (String) session.getAttribute("customeremail");
				int customer_id = (int) session.getAttribute("customer_id");
			
				
				String request_access_id=request.getParameter("request_access_id");
				Usercustomer usercustomer=new Usercustomer(customer_id , Integer.parseInt(request_access_id) , email);
				List<Usercustomer> list = customeradminDAO.DashboardDepartmentAccess(usercustomer);
			    
				Gson gson = new Gson();
				JSONObject json = new JSONObject();
				String message;
				PrintWriter out = response.getWriter();
				json.put("DashboardDepartmentAccess" , list);
	  			message = gson.toJson(json);
	  			out.println(message);

		 }  
		
         
         public void AcceptAndRejectDepartment(HttpServletRequest request, HttpServletResponse response) throws IOException {
				
			    HttpSession session = request.getSession();
			 	String email = (String) session.getAttribute("customeremail");
				int customer_id = (int) session.getAttribute("customer_id");
			
				
				String request_access_id=request.getParameter("request_access_id");
				String status=request.getParameter("status");
                String reject_remarks=request.getParameter("reject_remarks");
				
                Usercustomer usercustomer=new Usercustomer(customer_id , Integer.parseInt(request_access_id) , email , status, reject_remarks);
			    boolean check = customeradminDAO.AcceptAndRejectDepartment(usercustomer);
			    
				Gson gson = new Gson();
				JSONObject json = new JSONObject();
				String message;
				PrintWriter out = response.getWriter();
				json.put("status" , check);
	  			message = gson.toJson(json);
	  			out.println(message);

		 } 
         
         
         public void ClientsNames(HttpServletRequest request, HttpServletResponse response) throws IOException
		   {
			  
      	      Gson gson=new Gson();
			  JSONObject json=new JSONObject();
			  String message;
			  PrintWriter out=response.getWriter();   
              HttpSession session=request.getSession();
	 	       
              String email = (String) session.getAttribute("customeremail");
			  int customer_id = (int) session.getAttribute("customer_id");
			
	 	       
			  Usercustomer usercustomer=new Usercustomer(customer_id , email);
			  List<Usercustomer> name=customeradminDAO.fetchName(usercustomer);
	 	          
	 	      GsonBuilder gsonBuilder = new GsonBuilder();
	          Gson gson2 = gsonBuilder.create();
	          json.put("name",gson2.toJson(name));
 	          message=gson.toJson(json);
	     	  out.println(message);
	     	 
		   }  
          
         
         
         
         public void client_chat_details(HttpServletRequest request, HttpServletResponse response) throws IOException {
 			
 		    HttpSession session = request.getSession();
 		    
 		    String email = (String) session.getAttribute("customeremail");
			int customer_id = (int) session.getAttribute("customer_id");
			String client_chat_id=request.getParameter("client_id");
 	        
 	        Gson gson = new Gson();
 	    	JSONObject json = new JSONObject();
 	    	String message;
 	    	PrintWriter out = response.getWriter();
 	        
 	        if(!client_chat_id.equals("")) {
 	        
 	        	Message client_message=new Message(customer_id , Integer.parseInt(client_chat_id) , email);
                List<Message> list = customeradminDAO.single_client_details(client_message);
 		        List<Message> fetch_send_message=customeradminDAO.fetchClientMessage(client_message);
 		        json.put("status", true);
 			 	json.put("fetch_send_message" , fetch_send_message);
 		     	json.put("single_client_details" , list);
 				message = gson.toJson(json);
 				out.println(message);
 		        
 	       
 	        	
 	        }else {
 	        
 	        	json.put("status", false);
 				message = gson.toJson(json);
 				out.println(message);
 				
 	        }
 	 
 	 }  	
         
         
         public void client_message(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
 			
        		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        		
 		    boolean check=false;
 		    HttpSession session = request.getSession();
 		    String email = (String) session.getAttribute("customeremail");
 			int customer_id = (int) session.getAttribute("customer_id");
 				
 		    
 			String new_message=request.getParameter("new_message");
 	        String send_id=request.getParameter("send_id");
 	        String group_chat_id=request.getParameter("group_chat_id");
 	        String indexingurl="";
 	        if(request.getPart("chat_attachement") !=null) {
 	           Part part = request.getPart("chat_attachement");
 	           indexingurl=new IndexingUploading().uploadDocument(part,"softdoc-262410.appspot.com" , simpleDateFormate.format(timestamp));
 	        }
 	           
 	            Message client_message=new Message(new_message , customer_id , Integer.parseInt(send_id),indexingurl);
 	     	    check = customeradminDAO.client_message(client_message);
 	            List<Message> fetch_send_message=customeradminDAO.fetchClientMessage(client_message);
 		        Gson gson = new Gson();
 				JSONObject json = new JSONObject();
 				String message;
 				PrintWriter out = response.getWriter();
 				json.put("status", true);
 			 	json.put("fetch_send_message" , fetch_send_message);
 				message = gson.toJson(json);
 				out.println(message);
 
 	}     
         
         public void suggestionName(HttpServletRequest request, HttpServletResponse response) throws IOException
		   {
			   
	              Gson gson=new Gson();
			      JSONObject json=new JSONObject();
				  String message;
				  PrintWriter out=response.getWriter();   
                  HttpSession session=request.getSession();
	 	    
                  String email = (String) session.getAttribute("customeremail");
       		  	  int customer_id = (int) session.getAttribute("customer_id");
       		      String search_box=request.getParameter("search_box");
       		      
	 	          Usercustomer usercustomerClient=new Usercustomer(email , customer_id , search_box);
	 	          List<Usercustomer> name=customeradminDAO.suggestionName(usercustomerClient);
	 	          GsonBuilder gsonBuilder = new GsonBuilder();
		          Gson gson2 = gsonBuilder.create();
		          json.put("name", name);
		          message=gson.toJson(json);
		          out.println(message);
		     	 
		   }	      
       
         
         
}
