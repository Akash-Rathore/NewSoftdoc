package com.customerclientController;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.customerclientModal.AddFile;
import com.customerclientModal.Briefcase;
import com.customerclientModal.BriefcaseJsonObject;
import com.customerclientModal.ComplainList;
import com.customerclientModal.FileNameJsonObject;
import com.customerclientModal.FileNumber;
import com.customerclientModal.FolderJsonObject;
import com.customerclientDAO.CustomerclientDAO;
import com.customerclientModal.UsercustomerClient;
import com.customerclientModal.ViewDocument;
import com.customerclientModal.ViewJsonObject;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.subadminindexing.email.IndexingCustomNumber;
import com.customerclientModal.IndexingUserupload;
import com.customerclientModal.Message;
import com.customerclientModal.RequestAccess;
import com.customerclientModal.RequestJsonObject;
import com.customerclientModal.UpdateFile;
import com.uploadfile.DeleteFile;
import com.uploadfile.IndexingUploading;
import com.uploadfile.UploadFile;
import com.customerclientModal.Comments;

public class ClientServletAction {

	CustomerclientDAO customeradminDAO;
	public ClientServletAction()
	{
		customeradminDAO=new CustomerclientDAO();
	}
	
	private static final SimpleDateFormat simpleDateFormate = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss");


	//=========================start customerclient logout====================================
	 public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
     {
   	    HttpSession session = request.getSession();
   	    if(session!=null){

   	    	new com.customeradmin.email.Logfile2().logfile((int)session.getAttribute("clientid") , (int)session.getAttribute("cust_id") , (String)session.getAttribute("clientemail") , "Logout" , "client");
    	    
   	    	session.removeAttribute("clientid");
	    	session.removeAttribute("clientname");
	    	session.removeAttribute("clientemail");
	    	  
	    	
         }
   	    response.sendRedirect("customer/index.jsp");
        
     }
	//=========================end customerclient logout====================================
		
	 
	 //=========================start customer_client updateprofile============================================
	 public void updateprofile(HttpServletRequest request, HttpServletResponse response) throws IOException
	 {     
		    Gson gson=new Gson();
		    JSONObject json=new JSONObject();
		    String message;
		    PrintWriter out=response.getWriter();   
		    //get email for session
	        HttpSession session = request.getSession();
	        String email=(String)session.getAttribute("clientemail");
	        int id=(int)session.getAttribute("clientid");
	        
	        
	        UsercustomerClient usercustomerClient=new UsercustomerClient(request.getParameter("username"),request.getParameter("password"),request.getParameter("name"),request.getParameter("designation"),request.getParameter("mobile"),email,request.getParameter("location"),id,request.getParameter("access_info"));
	        boolean check=customeradminDAO.updateprofile(usercustomerClient);
	          if(check)
		      {
		    	  //response.sendRedirect("profile.jsp"); 
	        	  json.put("status",true);
		 	      json.put("message","Update profile");
		     	  message=gson.toJson(json);
		     	  out.println(message);
		         
		      }
		      else
		      {
		    	  json.put("status" , false);
			 	  json.put("message" , "Some Thing is Wrong");
			      message=gson.toJson(json);
	              out.println(message);
		         // response.sendRedirect("profile.jsp");
		     }
      }
	 //=========================end customer_client updateprofile============================================
		
	 
	 
	  //complainlist
	  public void complainlist(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	  {
		  UploadFile uploadfile=new UploadFile();
	      String imageUrl =uploadfile.getImageUrl(request, response,"softdoc-262410.appspot.com");
		  Gson gson=new Gson();
	      JSONObject json=new JSONObject();
		  String message;
		  PrintWriter out=response.getWriter();   
	      HttpSession session=request.getSession();
 	      int id=(int)session.getAttribute("clientid");
 	      String email=(String)session.getAttribute("clientemail");
 	      int cust_id=(int)session.getAttribute("cust_id");
 	      
 	      String title=request.getParameter("title");
          String  description=request.getParameter("description");
 	      
          
          String documentnumberref=request.getParameter("documentnumberref");
 	      String category=request.getParameter("category");
 	      ComplainList complaintlist=new ComplainList(title,imageUrl,documentnumberref,description,id,category,email,cust_id);
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
	 
	  //============================start change password====================================================
	   public void changepassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	   {      
		      HttpSession session=request.getSession();
 	          String email=(String)session.getAttribute("clientemail");
 	          int  id=(int)session.getAttribute("clientid");
 	          Gson gson=new Gson();
 		      JSONObject json=new JSONObject();
 			  String message;
 			  PrintWriter out=response.getWriter();   
 			  UsercustomerClient usercustomerClient=new UsercustomerClient(request.getParameter("currentpassword"),request.getParameter("newpassword"),request.getParameter("confirmpassword"),email,id);
		      boolean check=customeradminDAO.changepassword(usercustomerClient);
		      if(check)
		      {
		    	     json.put("status",true);
		 	         json.put("message","Change Password");
		     	     message=gson.toJson(json);
		     	     out.println(message);
		      }
		      else
		      {
		    	     json.put("status" , false);
			 	     json.put("message" , "Not Change Password");
			         message=gson.toJson(json);
	                 out.println(message);
		      }
		      
		      
		}
	  //============================start change password====================================================


	   //============================start filteration of document====================================================
	   public void viewdocumentfilter(HttpServletRequest request, HttpServletResponse response) throws IOException
	   {
		   
             // Gson gson=new Gson();
		     // JSONObject json=new JSONObject();
			  String message;
			  boolean check=false;
			 // String JSONObject="";
			  PrintWriter out=response.getWriter();
			  
			  Date date = new Date();
			  String createdStart="";
			  String createdEnd=""; 
			  
			  if(request.getParameter("createdStart")==null || request.getParameter("createdStart").equals("")) {
				  createdStart="2000-01-01";
				  createdEnd=new SimpleDateFormat("yyyy-MM-dd").format(date);
			  }else {
				createdStart=request.getParameter("createdStart");
				createdEnd=request.getParameter("createdEnd");
			  }
			
			  
			  String department=request.getParameter("department");
			  String documenttype=request.getParameter("documenttype");
			
			 
			  
			 
			  
	          String employecode=request.getParameter("employecode");
	          String employename=request.getParameter("employename");
	          String joiningdate=request.getParameter("joiningdate");
	            
	          
	          String vendorcode="";
	          String vendorname="";
	          String invoicenumber="";
	          String invoicedate="";
	          String customercode="";
              String customername="";
              String invoicedateend="";
             
              String invoicedateendsec="";
              String documentType1;
	          String documentType2;
	          String documentType3;
	          String documentType4;
	          String documentType5;
	          String documentType6;
	       
              
              if(request.getParameter("documentType1") !=null)
	          {
	        	  documentType1=request.getParameter("documentType1");
	        	  
	          }
	          else
	          {
	        	  documentType1="";  
	          }
	         
	          if(request.getParameter("documentType2") !=null)
	          {
	        	  documentType2=request.getParameter("documentType2");
	        	  
	          }
	          else
	          {
	        	  documentType2="";  
	          }
	         
	          
	          if(request.getParameter("documentType3") !=null)
	          {
	        	  documentType3=request.getParameter("documentType3");
	        	  
	          }
	          else
	          {
	        	  documentType3="";  
	          }
	        
	       		          
	          if(request.getParameter("documentType4") !=null)
	          	{
	        	  documentType4=request.getParameter("documentType4");
	        	  
	          }
	          else
	          {
	        	  documentType4="";  
	          }
	          
	          
	          if(request.getParameter("documentType5") !=null)
	          {
	        	  documentType5=request.getParameter("documentType5");;
	        	  
	          }
	          else
	          {
	        	  documentType5="";  
	          }
	          
	          
	          if(request.getParameter("documentType6") !=null)
	          {
	        	  documentType6=request.getParameter("documentType6");
	        	  
	          }
	          else
	          {
	        	  documentType6="";  
	          }
		    
              
              
	          if((documenttype.equalsIgnoreCase("Vendor Registration")) || (!"".equals(request.getParameter("vendorcode")))  && (!"".equals(request.getParameter("vendorname"))))
	          {       	 
	        	   vendorcode=request.getParameter("vendorcode");
	        	   vendorname=request.getParameter("vendorname");     
	          }
	          
	          
	          
	          if((documenttype.equalsIgnoreCase("Purchase")) || (!"".equals(request.getParameter("vendorcodesec"))) && (!"".equals(request.getParameter("vendornamesec"))) && (!"".equals(request.getParameter("invoicedate")))&& (!"".equals(request.getParameter("invoicedateend"))) && (!"".equals(request.getParameter("invoicenumber"))))
	          {
	        	  vendorcode=request.getParameter("vendorcodesec");
	        	  vendorname=request.getParameter("vendornamesec");
	        	  invoicenumber=request.getParameter("invoicenumber");
	        	  
	        	  if(request.getParameter("invoicedate")==null || request.getParameter("invoicedate").equals("") ){
	        		  invoicedate="2000-01-01";
	        		  invoicedateend=new SimpleDateFormat("yyyy-MM-dd").format(date);
	        	  }else {
	        		  invoicedate= request.getParameter("invoicedate");
	        		  invoicedateend= request.getParameter("invoicedateend");
	        	  }
	          
	          
	          }
	          
	          if((documenttype.equalsIgnoreCase("Customer Registration")) || (!"".equals(request.getParameter("customername"))) && (!"".equals(request.getParameter("customercode"))))
	          {
	        	     customercode=request.getParameter("customercode");
	                 customername=request.getParameter("customername");
	          }
	          
	          if((documenttype.equalsIgnoreCase("Sales")) || (!"".equals(request.getParameter("customernamesec"))) && (!"".equals(request.getParameter("customercodesec"))) && (!"".equals(request.getParameter("invoicedatesec"))) && (!"".equals(request.getParameter("invoicenumbersec"))))
	          {
	        	     customercode=request.getParameter("customercodesec");
	                 customername=request.getParameter("customernamesec");
	                 invoicenumber=request.getParameter("invoicenumbersec");
	                 if(request.getParameter("invoicedatesec")==null || request.getParameter("invoicedatesec").equals("") ){
		        		  invoicedate="2000-01-01";
		        		  invoicedateend=new SimpleDateFormat("yyyy-MM-dd").format(date);
		        	  }else {
		        		  invoicedate=request.getParameter("invoicedatesec");
		        		  invoicedateend= request.getParameter("invoicedateendsec");
		        	  }
	               
	                
	         }
	         
	        
	          
	           HttpSession session=request.getSession();
 	           int id=(int)session.getAttribute("clientid");
 	           ViewDocument viewdocument=new ViewDocument(documenttype,employecode,employename,joiningdate,vendorcode,vendorname,invoicedate,customercode,customername,invoicenumber,id,department, invoicedateend , invoicedateendsec,documentType1,documentType2,documentType3,documentType4,documentType5,documentType6 , createdStart , createdEnd);
	           List<ViewDocument> list=customeradminDAO.viewdocumentfilter(viewdocument);
	           ViewJsonObject viewJsonObject=new ViewJsonObject(); 
	           viewJsonObject.setiTotalDisplayRecords(list.size());
	           viewJsonObject.setiTotalRecords(list.size());
	           viewJsonObject.setAaData(list);
		       Gson gson = new GsonBuilder().setPrettyPrinting().create();
		       String json2 = gson.toJson(viewJsonObject);
		       out.print(json2);	
	     	 
	   }
	 	  
	   
	   //============================start bookmark of document====================================================
	   public void bookmarkupdate(HttpServletRequest request, HttpServletResponse response) throws IOException {

		   
		   
		
			HttpSession session = request.getSession();
			String email = (String) session.getAttribute("clientemail");
			int id = (int) session.getAttribute("clientid");
			int document_info_id = Integer.parseInt(request.getParameter("document_info_id"));
			String clientname = (String)session.getAttribute("clientname");
			
			Gson gson = new Gson();
			JSONObject json = new JSONObject();
			String message;
			PrintWriter out = response.getWriter();
			
			ViewDocument viewDocument = new ViewDocument(id , email , clientname , document_info_id);
			boolean check = customeradminDAO.bookmarkupdate(viewDocument);
			
			if (check) {
				json.put("status", true);
				message = gson.toJson(json);
				out.println(message);
			}
			else
			{
				json.put("status", false);
				message = gson.toJson(json);
				out.println(message);
			}

		}

	   
	   
	   
	   public void folderbookmarkupdate(HttpServletRequest request, HttpServletResponse response) throws IOException {

		   
		    HttpSession session = request.getSession();
			String email = (String) session.getAttribute("clientemail");
			int id = (int) session.getAttribute("clientid");
			int document_info_id = Integer.parseInt(request.getParameter("document_info_id"));
			
			Gson gson = new Gson();
			JSONObject json = new JSONObject();
			String message;
			PrintWriter out = response.getWriter();
			ViewDocument viewDocument = new ViewDocument(id , email , document_info_id);
			boolean check = customeradminDAO.folderbookmarkupdate(viewDocument);
			if (check) {
				json.put("status", true);
				message = gson.toJson(json);
				out.println(message);
			}
			else
			{
				json.put("status", false);
				message = gson.toJson(json);
				out.println(message);
			}

		}
	   
	 //============================start hit document====================================================
	   public void clienthit(HttpServletRequest request, HttpServletResponse response) throws IOException {
			
		    int id = Integer.parseInt(request.getParameter("id"));
			String count = request.getParameter("count");
		 	Gson gson = new Gson();
			JSONObject json = new JSONObject();
			String message;
			PrintWriter out = response.getWriter();
			HttpSession session = request.getSession();
			String email = (String) session.getAttribute("clientemail");
			int clientid = (int) session.getAttribute("clientid");
			
			
			ViewDocument viewDocument = new ViewDocument(id, count , clientid , email);
			boolean check = customeradminDAO.clienthit(viewDocument);
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
	   //============================start hit document====================================================
		 
	   //============================start change pic====================================================
	   public void uploadphoto(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
		{
		
		     
		     Gson gson = new Gson();
			 JSONObject json = new JSONObject();
			 String message;
		 	 PrintWriter out = response.getWriter();
			 Part part = request.getPart("uploadprofile");
			 String indexingurl=new IndexingUploading().uploadFile(part,"softdoc-262410.appspot.com");
			 HttpSession session = request.getSession();
			 String email = (String) session.getAttribute("clientemail");
			 int id = (int) session.getAttribute("clientid");
			 UsercustomerClient usercustomerClient = new UsercustomerClient(id,email,indexingurl);
			 boolean check = customeradminDAO.uploadphoto(usercustomerClient);
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
	   //============================end change pic====================================================
       
	   public void removestar(HttpServletRequest request, HttpServletResponse response) throws IOException {

			boolean check=false;
			Gson gson = new Gson();
			JSONObject json = new JSONObject();
			String message;
			PrintWriter out = response.getWriter();
			HttpSession session = request.getSession();
			String email = (String) session.getAttribute("clientemail");
			int id = (int) session.getAttribute("clientid");
			String document_info_id = request.getParameter("document_info_id");
		    
			String array[]=document_info_id.split(":");
    	    for(int i=0;i<array.length;i++)
    	    {
    	    	 if(!"".equals(array[i])) {
    	    		 
    	    		 ViewDocument viewDocument = new ViewDocument(email , id , Integer.parseInt(array[i]));
    				 check = customeradminDAO.removestar(viewDocument);
    	    		 
    	    	 }
    	    	
    	    } 	 
	    	
			if (check) {
				
				json.put("status", true);
				message = gson.toJson(json);
				out.println(message);
			}
			else
			{
				json.put("status", false);
				message = gson.toJson(json);
				out.println(message);
			}

		}
	   
	   
	   public void addfile(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		    JSONObject json = new JSONObject();
		    Gson gson = new Gson();
			String message;
			PrintWriter out = response.getWriter();
			HttpSession session=request.getSession();
 	        int client_id=(int)session.getAttribute("clientid");
 	        String client_email = (String) session.getAttribute("clientemail");
 	        int company_id=(int)session.getAttribute("cust_id");
 	        String clientname = (String)session.getAttribute("clientname");
			String file_department = request.getParameter("file_department");
			String file_name = request.getParameter("file_name");
			String file_description = request.getParameter("file_description");
			String file_access_level="";
		    String file_user_name="";
		    boolean check=false;
		    
		    JSONArray array = new JSONArray();
			Enumeration paramNames = request.getParameterNames();
			 while(paramNames.hasMoreElements()) {
			
				 Object object=paramNames.nextElement();
				 String param=(String)object;
				 for(int i=0;i<=25;i++) {
				
					 JSONObject json2 = new JSONObject();
					 if(param.equalsIgnoreCase("file_access_level["+i+"]")) {
						 
						     json2.put("access_level", request.getParameter("file_access_level["+i+"]"));		
                             json2.put("client_id", request.getParameter("file_user_name["+i+"]"));				
     						 array.add(json2);	   
     				     
                         
					 }
				 
			  }
			
	      }
	
			 
			 
		 AddFile addFile=new AddFile(client_id , client_email , company_id , file_name , file_department , file_description, array.toJSONString() , file_user_name , clientname);
		 check = customeradminDAO.addfile(addFile);
			
			 if (check) {
				  
				  json.put("status", true); 
				  message = gson.toJson(json); 
				  out.println(message);
				 
			  }else {
				  
				  json.put("status", false);
				  message = gson.toJson(json);
				  out.println(message);
			  }
		

		}
	  
	   
	   
	   
	   
	   
	   
	   public void updateaddFile(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

			
			Gson gson = new Gson();
			JSONObject json = new JSONObject();
			String message;
			PrintWriter out = response.getWriter();
			HttpSession session=request.getSession();
	        int client_id=(int)session.getAttribute("clientid");
	        String client_email = (String) session.getAttribute("clientemail");
	        int company_id=(int)session.getAttribute("cust_id");
	        String clientname = (String)session.getAttribute("clientname");
			String file_name = request.getParameter("file_name");
			String file_description = request.getParameter("file_description");
			int document_info_id=Integer.parseInt(request.getParameter("document_info_id"));
			
			
			
			
			    boolean check=false;
			
			    String file_access_level="";
		        String file_user_name="";
		
		        
		        JSONArray array = new JSONArray();
				Enumeration paramNames = request.getParameterNames();
				 while(paramNames.hasMoreElements()) {
				
					 Object object=paramNames.nextElement();
					 String param=(String)object;
					 for(int i=0;i<=25;i++) {
					
						 JSONObject json2 = new JSONObject();
						 if(param.equalsIgnoreCase("file_access_level["+i+"]")) {
							 
							     json2.put("access_level", request.getParameter("file_access_level["+i+"]"));		
	                             json2.put("client_id", request.getParameter("file_user_name["+i+"]"));				
	     						 array.add(json2);	   
	     				     
	                         
						 }
					 
				  }
				
		      }
		
		        
		      AddFile addFile=new AddFile(file_name , file_description , array.toJSONString() , file_user_name , document_info_id, client_id ,clientname);
		      check = customeradminDAO.updateaddFile(addFile);
			
			 if (check) {	
				  
				  json.put("status", true); 
				  message = gson.toJson(json); 
				  out.println(message);
				 
			  }else {
				  
				  json.put("status", false);
				  message = gson.toJson(json);
				  out.println(message);
			  }
		

		}
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   //update document  start
		public void uploaddocument(HttpServletRequest request, HttpServletResponse response) throws IOException
		{
			 
			  boolean check=false;
			  Gson gson = new Gson();
			  JSONObject json = new JSONObject();
			  String message;
	          PrintWriter out = response.getWriter();
	 	      Timestamp timestamp = new Timestamp(System.currentTimeMillis());
	 	     
	 	      HttpSession session = request.getSession();
	  		  String email = (String) session.getAttribute("clientemail");
			  int id = (int) session.getAttribute("clientid");
		      int companyid=(int)session.getAttribute("cust_id");
		      String clientName=(String)session.getAttribute("clientname");
	          
		      String documentType1;
	          String documentType2;
	          String documentType3;
	          String documentType4;
	          String documentType5;
	          String documentType6;
	        
	          
	          String documenttype=request.getParameter("documenttype");
	          String document_info_id=request.getParameter("document_info_id");
			     
	          String employecode="";
	          String employename="";
	          String joiningdate="0001-01-01";
	          
	          String vendorcode="";
	          String vendorname="";
	          String invoicedate="0001-01-01";
	          String invoicenumber="";
	          String customercode="";
	          String customername="";
	          
	          if(request.getParameter("joiningdate") != null)
			  {
	      		 joiningdate=request.getParameter("joiningdate");;
			  }
	          if(request.getParameter("employecode") != null)
			  {
	        	  employecode=request.getParameter("employecode");
			  }
	          if(request.getParameter("employename") != null)
			  {
	        	  employename=request.getParameter("employename");
			  }
	          
	          
	         
	          
	         
	          if(request.getParameter("documentType1") !=null)
	          {
	        	  documentType1=request.getParameter("documentType1");
	        	  
	          }
	          else
	          {
	        	  documentType1="";  
	          }
	         
	          if(request.getParameter("documentType2") !=null)
	          {
	        	  documentType2=request.getParameter("documentType2");
	        	  
	          }
	          else
	          {
	        	  documentType2="";  
	          }
	         
	          
	          if(request.getParameter("documentType3") !=null)
	          {
	        	  documentType3=request.getParameter("documentType3");
	        	  
	          }
	          else
	          {
	        	  documentType3="";  
	          }
	        
	       		          
	          if(request.getParameter("documentType4") !=null)
	          	{
	        	  documentType4=request.getParameter("documentType4");
	        	  
	          }
	          else
	          {
	        	  documentType4="";  
	          }
	          
	          
	          if(request.getParameter("documentType5") !=null)
	          {
	        	  documentType5=request.getParameter("documentType5");;
	        	  
	          }
	          else
	          {
	        	  documentType5="";  
	          }
	          
	          
	          if(request.getParameter("documentType6") !=null)
	          {
	        	  documentType6=request.getParameter("documentType6");
	        	  
	          }
	          else
	          {
	        	  documentType6="";  
	          }
		      
	          
	          
	          
	          if(request.getParameter("company_code") !=null)
	          {
	        	  customercode=request.getParameter("company_code");
	        	  
	          }
	          else
	          {
	        	  customercode="";  
	          }
		      
	          
	          
	          
	          if((documenttype.equalsIgnoreCase("Purchase")) || (request.getParameter("vendorcodesec") != null) && (request.getParameter("vendornamesec") != null) && (request.getParameter("invoicedate") !=null)  && (request.getParameter("invoicedate") !=null))
	          {
	        	  vendorcode=request.getParameter("vendorcodesec");
	        	  vendorname=request.getParameter("vendornamesec");
	        	  if(request.getParameter("invoicedate") !=null)
	    		  {
	            	   invoicedate="0001-01-01";
	    			
	    		  }else {
	    			  invoicedate=request.getParameter("invoicedate");
	    		  }
	              invoicenumber=request.getParameter("invoicenumber");
	          }
	          
	      
	          
	          if((documenttype.equalsIgnoreCase("Vendor Registration")) || (request.getParameter("vendorcode") !=null)  && (request.getParameter("vendorname") !=null))
	          {       	 
	        	   vendorcode=request.getParameter("vendorcode");
	        	   vendorname=request.getParameter("vendorname");     
	        	   invoicedate="0001-01-01";
	        	   
	          }
	          
	         
	          if((documenttype.equalsIgnoreCase("Customer Registration")) || (request.getParameter("customername") !=null) && (request.getParameter("customercode") !=null))
	          {
	        	     customercode=request.getParameter("customercode");
	                 customername=request.getParameter("customername");
	                 invoicedate="0001-01-01";
	                
	          
	          }
	          
	          
	          if((documenttype.equalsIgnoreCase("Sales")) || (request.getParameter("customernamesec") !=null) && (request.getParameter("customercodesec") !=null) && (request.getParameter("invoicedatesec") !=null) && (request.getParameter("invoicenumbersec") !=null))
	          {
	        	     customercode=request.getParameter("customercodesec");
	                 customername=request.getParameter("customernamesec");
	                 if(request.getParameter("invoicedatesec") ==null)
	       		     {
	       		   	   invoicedate="0001-01-01";
	       		     }
	                 else
	                 {
	       		       invoicedate=request.getParameter("invoicedatesec");
	                 }
	                   invoicenumber=request.getParameter("invoicenumbersec");
	                   
	                  
	               
	           }
	          
	          
	      
	          
	          
	          IndexingUserupload userupload=null;
	        //  String filenumber=request.getParameter("fileno");
	          Random random= new Random();
	  		  int randomnumber=random.nextInt(1000000);
	  		  String randomnum = Integer.toString(randomnumber); 
	  	
	  		  
	          try { 
	           
	           int i=1;
	  		   for(Part part : request.getParts()) {
				 	 
	  			 String fileName = part.getSubmittedFileName();
	  			 if(fileName!=null) { 
	  			   
	  				if(part.getContentType().equals("application/vnd.android.package-archive")||part.getContentType().equals("text/plain")||part.getContentType().equals("text/calendar")||part.getContentType().equals("text/csv")||part.getContentType().equals("application/vnd.openxmlformats-officedocument.wordprocessingml.document")||part.getContentType().equals("image/vnd.microsoft.icon")||part.getContentType().equals("image/svg+xml")||part.getContentType().equals("application/vnd.ms-excel")||part.getContentType().equals("application/vnd.ms-powerpoint")||part.getContentType().equals("application/octet-stream")||part.getContentType().equals("application/x-zip-compressed")||part.getContentType().equals("application/pdf")||part.getContentType().equals("image/jpg")||part.getContentType().equals("image/png")||part.getContentType().equals("image/jpeg")||part.getContentType().equals("image/gif"))
		  			{
		  				
	  					double mb=(double)part.getSize();
	  					String  customnumber=new IndexingCustomNumber().asStrangeNumber(i);
	  					String indexingurl=new IndexingUploading().uploadDocument(part , "softdoc-262410.appspot.com" , simpleDateFormate.format(timestamp));
	  					userupload=new IndexingUserupload(companyid , indexingurl , mb/(1024*1024) , randomnum , customnumber,documenttype,employecode,employename,joiningdate,vendorcode,vendorname,invoicedate,customercode,customername,invoicenumber, i , id , email , clientName,documentType1,documentType2,documentType3,documentType4,documentType5,documentType6, Integer.parseInt(document_info_id));
	     	            check =customeradminDAO.uploaddocument(userupload);
	     	            i++; 
	  			    }
				  
	  		     } 
	  			  
			  }
	          
	          }
	  		   catch(Exception exception)
	  		   {
	  			 
	  			   exception.printStackTrace();
	  		   
	  		   }
	  
	  	
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
		
	   //update document  end
		   
		   public void trashfolder(HttpServletRequest request, HttpServletResponse response) throws IOException {
				
			    boolean check=false;
			    HttpSession session = request.getSession();
			    String email = (String) session.getAttribute("clientemail");
				int did=(int)session.getAttribute("clientid");
		        int id = Integer.parseInt(request.getParameter("document_info_id"));
		        String currentDate=request.getParameter("currentDate");
		        String clientName=(String)session.getAttribute("clientname");

		        
		        Gson gson = new Gson();
				JSONObject json = new JSONObject();
				String message;
				PrintWriter out = response.getWriter();
				IndexingUserupload indexingUserupload=new IndexingUserupload(id,email,did,currentDate,clientName);
				check = customeradminDAO.trashfolder(indexingUserupload);
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
	    
          
		  
		   
		   public void trashdocument(HttpServletRequest request, HttpServletResponse response) throws IOException {
				
			    boolean check=false;
			    HttpSession session = request.getSession();
			    String email = (String) session.getAttribute("clientemail");
				int did=(int)session.getAttribute("clientid");
		        int id = Integer.parseInt(request.getParameter("document_info_id"));
		        String currentDate=request.getParameter("currentDate");
		        String clientName=(String)session.getAttribute("clientname");
		        
		        Gson gson = new Gson();
				JSONObject json = new JSONObject();
				String message;
				PrintWriter out = response.getWriter();
				IndexingUserupload indexingUserupload=new IndexingUserupload(id,email,did,currentDate,clientName);
				check = customeradminDAO.trashdocument(indexingUserupload);
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
		   
		    public void cronjob(HttpServletRequest request, HttpServletResponse response) throws IOException {
				
			    boolean check=false;
			    HttpSession session = request.getSession();
			    String email = (String) session.getAttribute("clientemail");
				int id=(int)session.getAttribute("clientid");
		        String currentDate=request.getParameter("currentDate");
			    
		        Gson gson = new Gson();
				JSONObject json = new JSONObject();
				String message;
				PrintWriter out = response.getWriter();
				IndexingUserupload indexingUserupload=new IndexingUserupload(id,email,currentDate);
				check = customeradminDAO.cronjob(indexingUserupload);
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

		    
		    
		    public void   fileupdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
				
			    boolean check=false;
			    HttpSession session = request.getSession();
			    String email = (String) session.getAttribute("clientemail");
				int id=(int)session.getAttribute("clientid");
		        String fileName=request.getParameter("fileName");
			    String document_id=request.getParameter("document_id");
			    String fileDescription=request.getParameter("fileDescription");
			    
			    Gson gson = new Gson();
				JSONObject json = new JSONObject();
				String message;
				PrintWriter out = response.getWriter();
				UpdateFile updatefile=new UpdateFile(id, email , document_id , fileName , fileDescription);
				
				//IndexingUserupload indexingUserupload=new IndexingUserupload(id,email,currentDate);
				 check = customeradminDAO.fileupdate(updatefile);
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
		   
		   
		   
		   
		   
		   
	   
		   public void UndoDocument(HttpServletRequest request, HttpServletResponse response) throws IOException {
				
			    boolean check=false;
			    HttpSession session = request.getSession();
			    String email = (String) session.getAttribute("clientemail");
				int did=(int)session.getAttribute("clientid");
		        int id = Integer.parseInt(request.getParameter("document_info_id"));
			    
		        Gson gson = new Gson();
				JSONObject json = new JSONObject();
				String message;
				PrintWriter out = response.getWriter();
				IndexingUserupload indexingUserupload=new IndexingUserupload(id,did,email);
				check = customeradminDAO.UndoDocument(indexingUserupload);
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
	    	
		   
		   public void UndoFolder(HttpServletRequest request, HttpServletResponse response) throws IOException {
				
			    boolean check=false;
			    HttpSession session = request.getSession();
			    String email = (String) session.getAttribute("clientemail");
				int did=(int)session.getAttribute("clientid");
		        int id = Integer.parseInt(request.getParameter("document_info_id"));
			    
		        Gson gson = new Gson();
				JSONObject json = new JSONObject();
				String message;
				PrintWriter out = response.getWriter();
				IndexingUserupload indexingUserupload=new IndexingUserupload(id,did,email);
				check = customeradminDAO.UndoFolder(indexingUserupload);
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
		   
		   
		   
		   public void UndoFile(HttpServletRequest request, HttpServletResponse response) throws IOException {
				
			    boolean check=false;
			    HttpSession session = request.getSession();
			    String email = (String) session.getAttribute("clientemail");
				int did=(int)session.getAttribute("clientid");
		        int id = Integer.parseInt(request.getParameter("document_info_id"));
			    
		        Gson gson = new Gson();
				JSONObject json = new JSONObject();
				String message;
				PrintWriter out = response.getWriter();
				IndexingUserupload indexingUserupload=new IndexingUserupload(id,did,email);
				check = customeradminDAO.UndoFile(indexingUserupload);
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
		   
		 	  public void updatedocument(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
			  {

					      boolean check=false;
					      Gson gson = new Gson();
					      JSONObject json = new JSONObject();
					      String message;
					      PrintWriter out = response.getWriter();
	
				         Timestamp timestamp = new Timestamp(System.currentTimeMillis());
				    	 
					      String documentType1;
				          String documentType2;
				          String documentType3;
				          String documentType4;
				          String documentType5;
				          String documentType6;
				       	
				          
				          
				          if(request.getParameter("documentType1") !=null)
				          {
				        	  documentType1=request.getParameter("documentType1");
				        	  
				          }
				          else
				          {
				        	  documentType1="";  
				          }
				         
				          if(request.getParameter("documentType2") !=null)
				          {
				        	  documentType2=request.getParameter("documentType2");
				        	  
				          }
				          else
				          {
				        	  documentType2="";  
				          }
				         
				          
				          if(request.getParameter("documentType3") !=null)
				          {
				        	  documentType3=request.getParameter("documentType3");
				        	  
				          }
				          else
				          {
				        	  documentType3="";  
				          }
				          
				          
				          if(request.getParameter("documentType4") !=null)
				          	{
				        	  documentType4=request.getParameter("documentType4");
				        	  
				          }
				          else
				          {
				        	  documentType4="";  
				          }
				          
				          
				          if(request.getParameter("documentType5") !=null)
				          {
				        	  documentType5=request.getParameter("documentType5");;
				        	  
				          }
				          else
				          {
				        	  documentType5="";  
				          }
				          
				          
				          if(request.getParameter("documentType6") !=null)
				          {
				        	  documentType6=request.getParameter("documentType6");
				        	  
				          }
				          else
				          {
				        	  documentType6="";  
				          }   				   
					   String document_info_id = request.getParameter("document_info_id");
					   String attachment_no = request.getParameter("attachment_no");
			           
					   String customer_code=request.getParameter("customer_code");
				       String employecode=request.getParameter("employecode");
			           String employename=request.getParameter("employename");
			           String joiningdate=request.getParameter("joiningdate");
			           if(joiningdate==null||joiningdate.equals(""))
			           {

			             joiningdate="0001-01-01";

			           }
			           String vendorcode=request.getParameter("vendorcode");
			           String vendorname=request.getParameter("vendorname");
			           String invoicedate=request.getParameter("invoicedate");
			           if(invoicedate==null||invoicedate.equals(""))
			           {

			              invoicedate="0001-01-01";

			           }
			           String customercode=request.getParameter("customercode");
			           String customername=request.getParameter("customername");
			           String invoicenumber=request.getParameter("invoicenumber");
			           IndexingUserupload userupload=null;
			           HttpSession session = request.getSession();
			           String email = (String) session.getAttribute("clientemail");
			           int id=(int)session.getAttribute("clientid");
			           String clientName=(String)session.getAttribute("clientname");
				         
			           
			           int i=Integer.parseInt(attachment_no)+1;
			           if(request.getParameter("document_status").equalsIgnoreCase("add_attachment")) {  
			             try { 
				           for(Part part : request.getParts()) {
							  String fileName = part.getSubmittedFileName();
				  			  if(fileName!=null) { 
				  				  
				  				  
				  				 if(part.getContentType().equals("application/vnd.android.package-archive")||part.getContentType().equals("text/plain")||part.getContentType().equals("text/calendar")||part.getContentType().equals("text/csv")||part.getContentType().equals("application/vnd.openxmlformats-officedocument.wordprocessingml.document")||part.getContentType().equals("image/vnd.microsoft.icon")||part.getContentType().equals("image/svg+xml")||part.getContentType().equals("application/vnd.ms-excel")||part.getContentType().equals("application/vnd.ms-powerpoint")||part.getContentType().equals("application/octet-stream")||part.getContentType().equals("application/x-zip-compressed")||part.getContentType().equals("application/pdf")||part.getContentType().equals("image/jpg")||part.getContentType().equals("image/png")||part.getContentType().equals("image/jpeg")||part.getContentType().equals("image/gif"))
				  			    {
				  					double mb=(double)part.getSize();
				  					String  customnumber=new IndexingCustomNumber().asStrangeNumber(i);
				  					String indexingurl=new IndexingUploading().uploadDocument(part , "softdoc-262410.appspot.com" , simpleDateFormate.format(timestamp));
				  					userupload=new IndexingUserupload(employecode,employename,joiningdate,vendorcode,vendorname,invoicedate,customercode,customername,invoicenumber,email,id, Integer.parseInt(document_info_id) ,indexingurl , mb/(1024*1024),request.getParameter("document_status"),customnumber,clientName,documentType1,documentType2,documentType3,documentType4,documentType5,documentType6);
				  			        check = customeradminDAO.updatedocument(userupload);
				     		        i++;
				  			    }
						     } 
				  		  }
				        }
				  		catch(Exception exception)
				  	    {
				  			  exception.printStackTrace();
				  		}
			         }
			         else
			         {
			        	  userupload=new IndexingUserupload(employecode,employename,joiningdate,vendorcode,vendorname,invoicedate,customercode,customername,invoicenumber,email,id,request.getParameter("document_status"),Integer.parseInt(document_info_id),documentType1,documentType2,documentType3,documentType4,documentType5,documentType6);
			        	  check = customeradminDAO.updatedocument(userupload);  
			         }
			           
			           
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
			    
			  
			  public void deletedocument(HttpServletRequest request, HttpServletResponse response) throws IOException
			  {
				    boolean check=false;
				    Gson gson = new Gson();
					JSONObject json = new JSONObject();
					String message;
			        PrintWriter out = response.getWriter();
			        HttpSession session = request.getSession();
				    String email = (String) session.getAttribute("clientemail");
			        int did=(int)session.getAttribute("clientid");
                    
			        int id=Integer.parseInt(request.getParameter("id"));
			       
			        
			        String file=request.getParameter("file");
				    File fileDetails = new File(file);
                    String fileName=fileDetails.getName();
                    String file_name="";
                    
                    for (int j=0; j<=fileName.length()-1; j++) {  
                   
                    if(fileName.charAt(j) == '?'){
                         break;
                     }
                     else
                     {
                       file_name =file_name+fileName.charAt(j);
                     }
          
                    }
                    
			        IndexingUserupload userupload=new IndexingUserupload(id,did,email);
				    boolean deletefile=new DeleteFile().deletefile_name("softdoc-262410.appspot.com",file_name);
				    check =customeradminDAO.deletedocument(userupload); 
			
				    if(check){ 
					
				    json.put("status", true); // 
				    json.put("message", "success");
				    message =gson.toJson(json); 
				    out.println(message); 
				    
				   }
				    else 
				   { 
				    
				    json.put("status", false); //
				    json.put("message", "not success"); //
				    message = gson.toJson(json); 
				    out.println(message); 
				   
				   }
				 	    
			  }
		 
		
			  public void deleteAllDocument(HttpServletRequest request, HttpServletResponse response) throws IOException
			  {
				    boolean check=false;
				    Gson gson = new Gson();
					JSONObject json = new JSONObject();
					String message;
			        PrintWriter out = response.getWriter();
			        HttpSession session = request.getSession();
				    String email = (String) session.getAttribute("clientemail");
			        int did=(int)session.getAttribute("clientid");
                    int id=Integer.parseInt(request.getParameter("id"));
                    IndexingUserupload userupload=new IndexingUserupload(id,did,email);
				    check =customeradminDAO.deleteAllDocument(userupload); 
			
				    if(check){ 
					
				    json.put("status", true); // 
				    json.put("message", "success");
				    message =gson.toJson(json); 
				    out.println(message); 
				    
				   }
				    else 
				   { 
				    
				    json.put("status", false); //
				    json.put("message", "not success"); //
				    message = gson.toJson(json); 
				    out.println(message); 
				   
				   }
				 	    
			  }
		
		  
			  public void trashAllDocument(HttpServletRequest request, HttpServletResponse response) throws IOException
			  {
				    boolean check=false;
				    Gson gson = new Gson();
					JSONObject json = new JSONObject();
					String message;
			        PrintWriter out = response.getWriter();
			        HttpSession session = request.getSession();
				    String email = (String) session.getAttribute("clientemail");
			        int did=(int)session.getAttribute("clientid");
		            
			        String delete_folder[] = request.getParameterValues("delete_folder");
		    		for (int i = 0; i < delete_folder.length; i++) {
		    		
		    			IndexingUserupload userupload=new IndexingUserupload(Integer.parseInt(delete_folder[i]) , did , email);
					    check =customeradminDAO.deleteAllDocument(userupload); 
		    		
		    		
		    		}
		            
		            
		            if(check){ 
					
				    json.put("status", true); // 
				    message =gson.toJson(json); 
				    out.println(message); 
				    
				   }
				   else 
				   { 
				    
				    json.put("status", false); //
				    message = gson.toJson(json); 
				    out.println(message); 
				   
				   }
				 	    
			  }
		
			  
			   public void addfolder(HttpServletRequest request, HttpServletResponse response) throws IOException {

				    boolean check=false;
					Gson gson = new Gson();
					JSONObject json = new JSONObject();
					String message;
					PrintWriter out = response.getWriter();
					
					HttpSession session = request.getSession();
					
					String email = (String) session.getAttribute("clientemail");
					int id = (int) session.getAttribute("clientid");
					String folder_name = request.getParameter("folder_name");
					String clientname = (String)session.getAttribute("clientname");
					int company_id=(int)session.getAttribute("cust_id");
				    int document_info_id=Integer.parseInt(request.getParameter("document_info_id"));
					String file_access_level="";
				    String file_user_name="";
				    
				    
				    JSONArray array = new JSONArray();
					Enumeration paramNames = request.getParameterNames();
					 while(paramNames.hasMoreElements()) {
					
						 Object object=paramNames.nextElement();
						 String param=(String)object;
						 for(int i=0;i<=15;i++) {
						
							 JSONObject json2 = new JSONObject();
							 if(param.equalsIgnoreCase("file_access_level["+i+"]")) {
								 
								     json2.put("access_level", request.getParameter("file_access_level["+i+"]"));		
		                             json2.put("client_id", request.getParameter("file_user_name["+i+"]"));				
		     						 array.add(json2);	   
		     				     
		                         
							 }
						 
					  }
					
			      }
					
					
					
					FileNumber filenumber=new FileNumber(id, email , clientname , folder_name , company_id , file_user_name , array.toJSONString() , document_info_id);
		            check = customeradminDAO.addfolder(filenumber);
		            
		            if (check) {
						
						json.put("status", true);
						message = gson.toJson(json);
						out.println(message);
					}
					else
					{
						json.put("status", false);
						message = gson.toJson(json);
						out.println(message);
					}

				}
			   
			   
			   
			   public void  folderupdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
					
				   
				   
				    boolean check=false;
				    HttpSession session = request.getSession();
				    String email = (String) session.getAttribute("clientemail");
					int id=(int)session.getAttribute("clientid");
			        String foldername=request.getParameter("folder_name");
				    int document_info_id=Integer.parseInt(request.getParameter("document_info_id"));
					String file_access_level="";
				    String file_user_name="";
				
					
				    
				    JSONArray array = new JSONArray();
					Enumeration paramNames = request.getParameterNames();
					 while(paramNames.hasMoreElements()) {
					
						 Object object=paramNames.nextElement();
						 String param=(String)object;
						 for(int i=0;i<=15;i++) {
						
							 JSONObject json2 = new JSONObject();
							 if(param.equalsIgnoreCase("file_access_level["+i+"]")) {
								 
								     json2.put("access_level", request.getParameter("file_access_level["+i+"]"));		
		                             json2.put("client_id", request.getParameter("file_user_name["+i+"]"));				
		     						 array.add(json2);	   
		     				     
		                         
							 }
						 
					  }
					
			      }
					
				    Gson gson = new Gson();
					JSONObject json = new JSONObject();
					String message;
					PrintWriter out = response.getWriter();
					UpdateFile updatefile=new UpdateFile(email , document_info_id , foldername , array.toJSONString() , file_user_name);
					check = customeradminDAO.updateFolder(updatefile);
					
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

			  
			   public void folderupload(HttpServletRequest request, HttpServletResponse response) throws IOException
				{
					 
				      boolean check=false;
					  Gson gson = new Gson();
					  JSONObject json = new JSONObject();
					  String message;
			          PrintWriter out = response.getWriter();
			 	      Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			          
			 	      HttpSession session = request.getSession();
			  		  String email = (String) session.getAttribute("clientemail");
					  int id = (int) session.getAttribute("clientid");
				      int companyid=(int)session.getAttribute("cust_id");
				      String clientName=(String)session.getAttribute("clientname");
			          
				      String documentType1;
			          String documentType2;
			          String documentType3;
			          String documentType4;
			          String documentType5;
			          String documentType6;
			        
			          
			          String documenttype=request.getParameter("documenttype");
			          String document_info_id=request.getParameter("document_info_id");
					     
			          String employecode="";
			          String employename="";
			          String joiningdate="0001-01-01";
			          
			          String vendorcode="";
			          String vendorname="";
			          String invoicedate="0001-01-01";
			          String invoicenumber="";
			          String customercode="";
			          String customername="";
			          
			          if(request.getParameter("joiningdate") != null)
					  {
			      		 joiningdate=request.getParameter("joiningdate");;
					  }
			          if(request.getParameter("employecode") != null)
					  {
			        	  employecode=request.getParameter("employecode");
					  }
			          if(request.getParameter("employename") != null)
					  {
			        	  employename=request.getParameter("employename");
					  }
			          
			          
			         
			          
			         
			          if(request.getParameter("documentType1") !=null)
			          {
			        	  documentType1=request.getParameter("documentType1");
			        	  
			          }
			          else
			          {
			        	  documentType1="";  
			          }
			         
			          if(request.getParameter("documentType2") !=null)
			          {
			        	  documentType2=request.getParameter("documentType2");
			        	  
			          }
			          else
			          {
			        	  documentType2="";  
			          }
			         
			          
			          if(request.getParameter("documentType3") !=null)
			          {
			        	  documentType3=request.getParameter("documentType3");
			        	  
			          }
			          else
			          {
			        	  documentType3="";  
			          }
			        
			       		          
			          if(request.getParameter("documentType4") !=null)
			          	{
			        	  documentType4=request.getParameter("documentType4");
			        	  
			          }
			          else
			          {
			        	  documentType4="";  
			          }
			          
			          
			          if(request.getParameter("documentType5") !=null)
			          {
			        	  documentType5=request.getParameter("documentType5");;
			        	  
			          }
			          else
			          {
			        	  documentType5="";  
			          }
			          
			          
			          if(request.getParameter("documentType6") !=null)
			          {
			        	  documentType6=request.getParameter("documentType6");
			        	  
			          }
			          else
			          {
			        	  documentType6="";  
			          }
				      
			          
			          
			          
			          if(request.getParameter("company_code") !=null)
			          {
			        	  customercode=request.getParameter("company_code");
			          }
			          else
			          {
			        	  customercode="";  
			          }
				      
			          
			          
			          
			          
			          
			          
			          if((documenttype.equalsIgnoreCase("Purchase")) || (request.getParameter("vendorcodesec") != null) && (request.getParameter("vendornamesec") != null) && (request.getParameter("invoicedate") !=null)  && (request.getParameter("invoicedate") !=null))
			          {
			        	  vendorcode=request.getParameter("vendorcodesec");
			        	  vendorname=request.getParameter("vendornamesec");
			        	  if(request.getParameter("invoicedate") !=null)
			    		  {
			            	   invoicedate="0001-01-01";
			    			
			    		  }else {
			    			  invoicedate=request.getParameter("invoicedate");
			    		  }
			              invoicenumber=request.getParameter("invoicenumber");
			          }
			          
			      
			          
			          if((documenttype.equalsIgnoreCase("Vendor Registration")) || (request.getParameter("vendorcode") !=null)  && (request.getParameter("vendorname") !=null))
			          {       	 
			        	   vendorcode=request.getParameter("vendorcode");
			        	   vendorname=request.getParameter("vendorname");     
			        	   invoicedate="0001-01-01";
			        	   
			          }
			          
			         
			          if((documenttype.equalsIgnoreCase("Customer Registration")) || (request.getParameter("customername") !=null) && (request.getParameter("customercode") !=null))
			          {
			        	     customercode=request.getParameter("customercode");
			                 customername=request.getParameter("customername");
			                 invoicedate="0001-01-01";
			                
			          
			          }
			          
			          
			          if((documenttype.equalsIgnoreCase("Sales")) || (request.getParameter("customernamesec") !=null) && (request.getParameter("customercodesec") !=null) && (request.getParameter("invoicedatesec") !=null) && (request.getParameter("invoicenumbersec") !=null))
			          {
			        	     customercode=request.getParameter("customercodesec");
			                 customername=request.getParameter("customernamesec");
			                 if(request.getParameter("invoicedatesec") ==null)
			       		     {
			       		   	   invoicedate="0001-01-01";
			       		     }
			                 else
			                 {
			       		       invoicedate=request.getParameter("invoicedatesec");
			                 }
			                   invoicenumber=request.getParameter("invoicenumbersec");
			                   
			                  
			               
			           }
			          
			          IndexingUserupload userupload=null;
			        //  String filenumber=request.getParameter("fileno");
			          Random random= new Random();
			  		  int randomnumber=random.nextInt(1000000);
			  		  String randomnum = Integer.toString(randomnumber); 
			  	
			  		 
			  		  
			  		try { 
				           
				           int i=1;
				  		   for(Part part : request.getParts()) {
							 	 
				  			 String fileName = part.getSubmittedFileName();
				  			 if(fileName!=null) { 
				  			   
				  				if(part.getContentType().equals("application/vnd.android.package-archive")||part.getContentType().equals("text/plain")||part.getContentType().equals("text/calendar")||part.getContentType().equals("text/csv")||part.getContentType().equals("application/vnd.openxmlformats-officedocument.wordprocessingml.document")||part.getContentType().equals("image/vnd.microsoft.icon")||part.getContentType().equals("image/svg+xml")||part.getContentType().equals("application/vnd.ms-excel")||part.getContentType().equals("application/vnd.ms-powerpoint")||part.getContentType().equals("application/octet-stream")||part.getContentType().equals("application/x-zip-compressed")||part.getContentType().equals("application/pdf")||part.getContentType().equals("image/jpg")||part.getContentType().equals("image/png")||part.getContentType().equals("image/jpeg")||part.getContentType().equals("image/gif"))
					  			{
					  				
				  					double mb=(double)part.getSize();
				  					String  customnumber=new IndexingCustomNumber().asStrangeNumber(i);
				  					String indexingurl=new IndexingUploading().uploadDocument(part , "softdoc-262410.appspot.com" , simpleDateFormate.format(timestamp));
				  					userupload=new IndexingUserupload(companyid , indexingurl , mb/(1024*1024) , randomnum , customnumber,documenttype,employecode,employename,joiningdate,vendorcode,vendorname,invoicedate,customercode,customername,invoicenumber, i , id , email , clientName,documentType1,documentType2,documentType3,documentType4,documentType5,documentType6, Integer.parseInt(document_info_id));
				     	            check =customeradminDAO.folderupload(userupload);
				     	            i++; 
				  			    }
							  
				  		     } 
				  			  
						  }
				          
				          }
				  		  catch(Exception exception)
				  		  {
				  			 
				  			  exception.printStackTrace();
				  		   
				  		   }
			  		
			      //==========================================//==========================================================    
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
			 
			   
				  public void updatefolderdocument(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
				  {

						      boolean check=false;
						      Gson gson = new Gson();
						      JSONObject json = new JSONObject();
						      String message;
						      PrintWriter out = response.getWriter();
		
					         Timestamp timestamp = new Timestamp(System.currentTimeMillis());
					    	 
						      String documentType1;
					          String documentType2;
					          String documentType3;
					          String documentType4;
					          String documentType5;
					          String documentType6;
					       	
					          
					          
					          if(request.getParameter("documentType1") !=null)
					          {
					        	  documentType1=request.getParameter("documentType1");
					        	  
					          }
					          else
					          {
					        	  documentType1="";  
					          }
					         
					          if(request.getParameter("documentType2") !=null)
					          {
					        	  documentType2=request.getParameter("documentType2");
					        	  
					          }
					          else
					          {
					        	  documentType2="";  
					          }
					         
					          
					          if(request.getParameter("documentType3") !=null)
					          {
					        	  documentType3=request.getParameter("documentType3");
					        	  
					          }
					          else
					          {
					        	  documentType3="";  
					          }
					          
					          
					          if(request.getParameter("documentType4") !=null)
					          	{
					        	  documentType4=request.getParameter("documentType4");
					        	  
					          }
					          else
					          {
					        	  documentType4="";  
					          }
					          
					          
					          if(request.getParameter("documentType5") !=null)
					          {
					        	  documentType5=request.getParameter("documentType5");;
					        	  
					          }
					          else
					          {
					        	  documentType5="";  
					          }
					          
					          
					          if(request.getParameter("documentType6") !=null)
					          {
					        	  documentType6=request.getParameter("documentType6");
					        	  
					          }
					          else
					          {
					        	  documentType6="";  
					          }   		
					          
						   String document_info_id = request.getParameter("document_info_id");
						   String attachment_no = request.getParameter("attachment_no");
				           String customer_code=request.getParameter("customer_code");
					       String employecode=request.getParameter("employecode");
				           String employename=request.getParameter("employename");
				           String joiningdate=request.getParameter("joiningdate");
				           
				           if(joiningdate==null||joiningdate.equals(""))
				           {

				             joiningdate="0001-01-01";

				           }
				           String vendorcode=request.getParameter("vendorcode");
				           String vendorname=request.getParameter("vendorname");
				           String invoicedate=request.getParameter("invoicedate");
				           if(invoicedate==null||invoicedate.equals(""))
				           {

				              invoicedate="0001-01-01";

				           }
				           String customercode=request.getParameter("customercode");
				           String customername=request.getParameter("customername");
				           String invoicenumber=request.getParameter("invoicenumber");
				           IndexingUserupload userupload=null;
				           HttpSession session = request.getSession();
				           String email = (String) session.getAttribute("clientemail");
				           int id=(int)session.getAttribute("clientid");
				           String clientName=(String)session.getAttribute("clientname");
					         
				           
				           int i=Integer.parseInt(attachment_no)+1;
				           if(request.getParameter("document_status").equalsIgnoreCase("add_attachment")) {  
				             try { 
					           for(Part part : request.getParts()) {
								  String fileName = part.getSubmittedFileName();
					  			  if(fileName!=null) { 
					  				  
					  				  
					  				 if(part.getContentType().equals("application/vnd.android.package-archive")||part.getContentType().equals("text/plain")||part.getContentType().equals("text/calendar")||part.getContentType().equals("text/csv")||part.getContentType().equals("application/vnd.openxmlformats-officedocument.wordprocessingml.document")||part.getContentType().equals("image/vnd.microsoft.icon")||part.getContentType().equals("image/svg+xml")||part.getContentType().equals("application/vnd.ms-excel")||part.getContentType().equals("application/vnd.ms-powerpoint")||part.getContentType().equals("application/octet-stream")||part.getContentType().equals("application/x-zip-compressed")||part.getContentType().equals("application/pdf")||part.getContentType().equals("image/jpg")||part.getContentType().equals("image/png")||part.getContentType().equals("image/jpeg")||part.getContentType().equals("image/gif"))
					  			    {
					  					double mb=(double)part.getSize();
					  					String  customnumber=new IndexingCustomNumber().asStrangeNumber(i);
					  					String indexingurl=new IndexingUploading().uploadDocument(part , "softdoc-262410.appspot.com" , simpleDateFormate.format(timestamp));
					  					userupload=new IndexingUserupload(employecode,employename,joiningdate,vendorcode,vendorname,invoicedate,customercode,customername,invoicenumber,email,id, Integer.parseInt(document_info_id) ,indexingurl , mb/(1024*1024),request.getParameter("document_status"),customnumber,clientName,documentType1,documentType2,documentType3,documentType4,documentType5,documentType6);
					  			        check = customeradminDAO.updatefolderdocument(userupload);
					     		        i++;
					  			    }
							     } 
					  		  }
					        }
					  		catch(Exception exception)
					  	    {
					  			  exception.printStackTrace();
					  		}
				         }
				         else
				         {
				        	  userupload=new IndexingUserupload(employecode,employename,joiningdate,vendorcode,vendorname,invoicedate,customercode,customername,invoicenumber,email,id,request.getParameter("document_status"),Integer.parseInt(document_info_id),documentType1,documentType2,documentType3,documentType4,documentType5,documentType6);
				        	  check = customeradminDAO.updatefolderdocument(userupload);  
				         }
				           
				           
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
			   
			  
				  
				  
				  
				   public void fetchdepartment(HttpServletRequest request, HttpServletResponse response) throws IOException
				   {
					   
					   
					    
					   
			              Gson gson=new Gson();
					      JSONObject json=new JSONObject();
						  String message;
						  PrintWriter out=response.getWriter();   
		                  HttpSession session=request.getSession();
			 	          
		                  int id=(int)session.getAttribute("clientid");
			 	          String email = (String) session.getAttribute("clientemail");
			 	          int companyid=(int)session.getAttribute("cust_id");
			 	          
			 	          UsercustomerClient usercustomerClient=new UsercustomerClient(email , companyid , id);
			 	          String department=customeradminDAO.fetchdepartment(usercustomerClient);
			 	          List<UsercustomerClient> name=customeradminDAO.fetchName(usercustomerClient);
			 	          
				 	      GsonBuilder gsonBuilder = new GsonBuilder();
				          Gson gson2 = gsonBuilder.create();
				          json.put("name",gson2.toJson(name));
			 	          json.put("department",department);
				          message=gson.toJson(json);
				     	  out.println(message);
				     	 
				   }
				  
				   
					public void fetchFileName(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
					{
						
						  PrintWriter out=response.getWriter();   
		                  HttpSession session=request.getSession();
			 	          int id=(int)session.getAttribute("clientid");
			 	          String email = (String) session.getAttribute("clientemail");
			 	          int companyid=(int)session.getAttribute("cust_id");
			 	          String department =(String)session.getAttribute("client_department");
			 	          
			 	          AddFile addfile=new AddFile(id,email,companyid,department);
			 	          
			 	          List<AddFile> list=customeradminDAO.fetchFileName(addfile);
						  FileNameJsonObject fileNameJsonObject=new FileNameJsonObject(); 
			 	          fileNameJsonObject.setiTotalDisplayRecords(list.size());
			 	          fileNameJsonObject.setiTotalRecords(list.size());
			 	          fileNameJsonObject.setAaData(list);
				          Gson gson = new GsonBuilder().setPrettyPrinting().create();
				     	  String json2 = gson.toJson(fileNameJsonObject);
				     	  out.print(json2);	
					
					}
				  
				  
				  
					
					
					 public void deletefile(HttpServletRequest request, HttpServletResponse response) throws IOException {
							
						    boolean check=false;
						    HttpSession session = request.getSession();
						    String email = (String) session.getAttribute("clientemail");
							int did=(int)session.getAttribute("clientid");
					        int id = Integer.parseInt(request.getParameter("document_info_id"));
					        String clientName=(String)session.getAttribute("clientname");
						    String currentDate=request.getParameter("currentDate");
						   
					        
					        Gson gson = new Gson();
							JSONObject json = new JSONObject();
							String message;
							PrintWriter out = response.getWriter();
							IndexingUserupload indexingUserupload=new IndexingUserupload(id , email , did , currentDate , clientName);
							check = customeradminDAO.deletefile(indexingUserupload);
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
				  
				  
				  
				  
				  
				  
					 public void editAddFile(HttpServletRequest request, HttpServletResponse response) throws IOException {
							
						    PrintWriter out=response.getWriter();   
			                HttpSession session=request.getSession();
			                int id=(int)session.getAttribute("clientid");
				 	        String email = (String) session.getAttribute("clientemail");
				 	        int companyid=(int)session.getAttribute("cust_id");
				 	        UsercustomerClient usercustomerClient=new UsercustomerClient(email , companyid , id);
				 	        String department=customeradminDAO.fetchdepartment(usercustomerClient);
				 	        
				 	        //edit file details
				 	        int document_info_id = Integer.parseInt(request.getParameter("document_info_id"));
					        IndexingUserupload indexingUserupload=new IndexingUserupload(id,email,document_info_id);
					        List<IndexingUserupload> editfile = customeradminDAO.editAddFile(indexingUserupload);
					        List<UsercustomerClient> name=customeradminDAO.fetchName(usercustomerClient);
					        
					        Gson gson = new Gson();
							JSONObject json = new JSONObject();
							String message;
							GsonBuilder gsonBuilder = new GsonBuilder();
					        Gson gson2 = gsonBuilder.create();
					        
					        json.put("name" , gson2.toJson(name));
					        json.put("editfile" , gson2.toJson(editfile));
				 	        json.put("status", true);
							json.put("department",department);
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
				 	          int id=(int)session.getAttribute("clientid");
				 	          String email = (String) session.getAttribute("clientemail");
				 	          int companyid=(int)session.getAttribute("cust_id");
				 	          String search_box=request.getParameter("search_box");
				 	          UsercustomerClient usercustomerClient=new UsercustomerClient(email,companyid ,id,search_box);
							  List<UsercustomerClient> name=customeradminDAO.suggestionName(usercustomerClient);
				 	          GsonBuilder gsonBuilder = new GsonBuilder();
					          Gson gson2 = gsonBuilder.create();
					          json.put("name", name);
					          message=gson.toJson(json);
					          out.println(message);
					     	 
					   }	  
				  
				  
				  
				  
					  public void requestaccess(HttpServletRequest request, HttpServletResponse response) throws IOException {
							
						    boolean check=false;
						    HttpSession session = request.getSession();
						    String email = (String) session.getAttribute("clientemail");
							int client_id=(int)session.getAttribute("clientid");
					        int document_info_id= Integer.parseInt(request.getParameter("document_info_id"));
					        String access_level=request.getParameter("request_access");
					        RequestAccess requestAccess=new RequestAccess(client_id , document_info_id , access_level , email);
							check = customeradminDAO.requestaccess(requestAccess);
							Gson gson = new Gson();
							JSONObject json = new JSONObject();
							String message;
							PrintWriter out = response.getWriter();
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
				  
				  
				  
					  
					  public void fileDetails(HttpServletRequest request, HttpServletResponse response) throws IOException
					  {
						      Gson gson=new Gson();
						      JSONObject json=new JSONObject();
							  String message;
							  PrintWriter out=response.getWriter();   
			                  HttpSession session=request.getSession();
				 	          int id=(int)session.getAttribute("clientid");
				 	          String email = (String) session.getAttribute("clientemail");
				 	          int companyid=(int)session.getAttribute("cust_id");
				 	          int document_info_id=Integer.parseInt(request.getParameter("document_info_id"));
				 	          IndexingUserupload indexingUserupload=new IndexingUserupload(id , email , document_info_id);
							  List<IndexingUserupload> filedetals=customeradminDAO.fileDetails(indexingUserupload);
				 	          GsonBuilder gsonBuilder = new GsonBuilder();
					          Gson gson2 = gsonBuilder.create();
					          json.put("filedetals", filedetals);
					          message=gson.toJson(json);
					     	  out.println(message);
					     	 
					   }	  	  
					  
					  
					  
					  
					  
					  
					  
					  public void folderDocumentDetails(HttpServletRequest request, HttpServletResponse response) throws IOException
					  {
						      Gson gson=new Gson();
						      JSONObject json=new JSONObject();
							  String message;
							  PrintWriter out=response.getWriter();   
			                  HttpSession session=request.getSession();
				 	          int id=(int)session.getAttribute("clientid");
				 	          String email = (String) session.getAttribute("clientemail");
				 	          int companyid=(int)session.getAttribute("cust_id");
				 	          int document_info_id=Integer.parseInt(request.getParameter("document_info_id"));
				 	          IndexingUserupload indexingUserupload=new IndexingUserupload(id , email , document_info_id);
							  List<IndexingUserupload> filedetals=customeradminDAO.folderDocumentDetails(indexingUserupload);
				 	          GsonBuilder gsonBuilder = new GsonBuilder();
					          Gson gson2 = gsonBuilder.create();
					          json.put("filedetals", filedetals);
					          message=gson.toJson(json);
					     	  out.println(message);
					     	 
					   }	  	  
					  
					  
					  
					  
					  
					  public void folderDocumentNoDetails(HttpServletRequest request, HttpServletResponse response) throws IOException
					  {
						      Gson gson=new Gson();
						      JSONObject json=new JSONObject();
							  String message;
							  PrintWriter out=response.getWriter();   
			                  HttpSession session=request.getSession();
				 	          int id=(int)session.getAttribute("clientid");
				 	          String email = (String) session.getAttribute("clientemail");
				 	          int companyid=(int)session.getAttribute("cust_id");
				 	          int document_info_id=Integer.parseInt(request.getParameter("document_info_id"));
				 	          IndexingUserupload indexingUserupload=new IndexingUserupload(id , email , document_info_id);
							  List<IndexingUserupload> filedetals=customeradminDAO.folderDocumentNoDetails(indexingUserupload);
				 	          GsonBuilder gsonBuilder = new GsonBuilder();
					          Gson gson2 = gsonBuilder.create();
					          json.put("filedetals" , gson2.toJson(filedetals));
						 	  message=gson.toJson(json);
					          out.println(message);
					     	 
					   }
					  
					  
					    public void folderdetails(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
						{
							
							  PrintWriter out=response.getWriter();   
			                  HttpSession session=request.getSession();
				 	          int id=(int)session.getAttribute("clientid");
				 	          String email = (String) session.getAttribute("clientemail");
				 	          int companyid=(int)session.getAttribute("cust_id");
				 	          int document_info_id=Integer.parseInt(request.getParameter("document_info_id"));
				 	          IndexingUserupload indexingUserupload=new IndexingUserupload(id , email , document_info_id);
				 	          List<IndexingUserupload> list=customeradminDAO.folderdetails(indexingUserupload);
				 	          
				 	          FolderJsonObject folderJsonObject=new FolderJsonObject(); 
				 	          folderJsonObject.setiTotalDisplayRecords(list.size());
				 	          folderJsonObject.setiTotalRecords(list.size());
				 	          folderJsonObject.setAaData(list);
					          Gson gson = new GsonBuilder().setPrettyPrinting().create();
					     	  String json2 = gson.toJson(folderJsonObject);
					     	  out.print(json2);	
						
						}
					  
					  
					  
					  
                          public void singlefetchfolder(HttpServletRequest request, HttpServletResponse response) throws IOException {
							
						    PrintWriter out=response.getWriter();   
			                HttpSession session=request.getSession();
			                int id=(int)session.getAttribute("clientid");
				 	        String email = (String) session.getAttribute("clientemail");
				 	        int companyid=(int)session.getAttribute("cust_id");
				 	        UsercustomerClient usercustomerClient=new UsercustomerClient(email , companyid , id);
				 	        String department=customeradminDAO.fetchdepartment(usercustomerClient);
				 	        int document_info_id = Integer.parseInt(request.getParameter("document_info_id"));
					        IndexingUserupload indexingUserupload=new IndexingUserupload(id,email,document_info_id);
					        List<IndexingUserupload> editfoleder = customeradminDAO.singlefetchfolder(indexingUserupload);
						    Gson gson = new Gson();
							JSONObject json = new JSONObject();
							String message;
							GsonBuilder gsonBuilder = new GsonBuilder();
					        Gson gson2 = gsonBuilder.create();
					        json.put("editfoleder" , gson2.toJson(editfoleder));
				 	    	message = gson.toJson(json);
							out.println(message);
					
					 
					 }   
					 
                          
                          
                          public void singlefetchdocument(HttpServletRequest request, HttpServletResponse response) throws IOException {
  							
  						    PrintWriter out=response.getWriter();   
  			                HttpSession session=request.getSession();
  			                int id=(int)session.getAttribute("clientid");
  				 	        String email = (String) session.getAttribute("clientemail");
  				 	        int companyid=(int)session.getAttribute("cust_id");
  				 	        UsercustomerClient usercustomerClient=new UsercustomerClient(email , companyid , id);
  				 	        String department=customeradminDAO.fetchdepartment(usercustomerClient);
  				 	        int document_info_id = Integer.parseInt(request.getParameter("document_info_id"));
  					        IndexingUserupload indexingUserupload=new IndexingUserupload(id,email,document_info_id);
  					        List<IndexingUserupload> editfoleder = customeradminDAO.singlefetchdocument(indexingUserupload);
  						    Gson gson = new Gson();
  							JSONObject json = new JSONObject();
  							String message;
  							GsonBuilder gsonBuilder = new GsonBuilder();
  					        Gson gson2 = gsonBuilder.create();
  					        json.put("editfoleder" , gson2.toJson(editfoleder));
  				 	    	message = gson.toJson(json);
  							out.println(message);
  					
  					 
  					 }          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                        public void fetchdocumenttype(HttpServletRequest request, HttpServletResponse response) throws IOException {
  							
  						    PrintWriter out=response.getWriter();   
  			                HttpSession session=request.getSession();
  			                int id=(int)session.getAttribute("clientid");
  				 	        String email = (String) session.getAttribute("clientemail");
  				 	        int companyid=(int)session.getAttribute("cust_id");
  				 	        String industry = (String) session.getAttribute("client_industry");
  				 	        
  				 	        int document_info_id = Integer.parseInt(request.getParameter("document_info_id"));
  					        IndexingUserupload indexingUserupload=new IndexingUserupload(id,document_info_id,email,industry);
  					        List<IndexingUserupload> document_type = customeradminDAO.fetchdocumenttype(indexingUserupload);
  						    
  					        Gson gson = new Gson();
  							JSONObject json = new JSONObject();
  							String message;
  							GsonBuilder gsonBuilder = new GsonBuilder();
  					        Gson gson2 = gsonBuilder.create();
  					        json.put("document_type" , gson2.toJson(document_type));
  				 	    	message = gson.toJson(json);
  							out.println(message);
  					
  					 
  					 }       
					  
					  
					
                        
                        
                        public void folderDocumentType(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
						{
							
							  PrintWriter out=response.getWriter();   
			                  HttpSession session=request.getSession();
				 	          
			                  int id=(int)session.getAttribute("clientid");
				 	          String email = (String) session.getAttribute("clientemail");
				 	          int companyid=(int)session.getAttribute("cust_id");
				 	          int document_info_id=Integer.parseInt(request.getParameter("document_info_id"));
				 	          IndexingUserupload indexingUserupload=new IndexingUserupload(id , email , document_info_id);
				 	          List<IndexingUserupload> list=customeradminDAO.folderDocumentType(indexingUserupload);
				 	          FolderJsonObject folderJsonObject=new FolderJsonObject(); 
				 	          folderJsonObject.setiTotalDisplayRecords(list.size());
				 	          folderJsonObject.setiTotalRecords(list.size());
				 	          folderJsonObject.setAaData(list);
					          Gson gson = new GsonBuilder().setPrettyPrinting().create();
					     	  String json2 = gson.toJson(folderJsonObject);
					     	  out.print(json2);	
						
						}    
                        
                        
                        
                        
                        public void trashDocumenttype(HttpServletRequest request, HttpServletResponse response) throws IOException
          			    {
                        	
          				    boolean check=false;
          				    Gson gson = new Gson();
          					JSONObject json = new JSONObject();
          					String message;
          			        PrintWriter out = response.getWriter();
          			        HttpSession session = request.getSession();
          				    String email = (String) session.getAttribute("clientemail");
          			        int did=(int)session.getAttribute("clientid");
          		            
          			        String delete_folder[] = request.getParameterValues("delete_folder");
          		    		for (int i = 0; i < delete_folder.length; i++) {
          		    		
          		    			IndexingUserupload userupload=new IndexingUserupload(Integer.parseInt(delete_folder[i]) , did , email);
          					    check =customeradminDAO.trashDocumenttype(userupload); 
          		    		
          		    		
          		    		}
          		            
          		            
          		            if(check){ 
          					
          				    json.put("status", true); // 
          				    message =gson.toJson(json); 
          				    out.println(message); 
          				    
          				   }
          				   else 
          				   { 
          				    
          				    json.put("status", false); //
          				    message = gson.toJson(json); 
          				    out.println(message); 
          				   
          				   }
          				 	    
          			  }
          		
                     
             		   public void trashDocumentType(HttpServletRequest request, HttpServletResponse response) throws IOException {
           				
           			    boolean check=false;
           			    HttpSession session = request.getSession();
           			    String email = (String) session.getAttribute("clientemail");
           				int did=(int)session.getAttribute("clientid");
           		        int id = Integer.parseInt(request.getParameter("document_info_id"));
           		        String currentDate=request.getParameter("currentDate");
           			    
           		        
           		        Gson gson = new Gson();
           				JSONObject json = new JSONObject();
           				String message;
           				PrintWriter out = response.getWriter();
           				IndexingUserupload indexingUserupload=new IndexingUserupload(id,email,did,currentDate);
           				check = customeradminDAO.trashDocumentType(indexingUserupload);
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
               
             		   
             		   
               public void FileDocumentType(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
			   {
							
							  PrintWriter out=response.getWriter();   
			                  HttpSession session=request.getSession();
				 	          
			                  int id=(int)session.getAttribute("clientid");
				 	          String email = (String) session.getAttribute("clientemail");
				 	          int companyid=(int)session.getAttribute("cust_id");
				 	          int document_info_id=Integer.parseInt(request.getParameter("document_info_id"));
				 	          IndexingUserupload indexingUserupload=new IndexingUserupload(id , email , document_info_id);
				 	          List<IndexingUserupload> list=customeradminDAO.FileDocumentType(indexingUserupload);
				 	          FolderJsonObject folderJsonObject=new FolderJsonObject(); 
				 	          folderJsonObject.setiTotalDisplayRecords(list.size());
				 	          folderJsonObject.setiTotalRecords(list.size());
				 	          folderJsonObject.setAaData(list);
					          Gson gson = new GsonBuilder().setPrettyPrinting().create();
					     	  String json2 = gson.toJson(folderJsonObject);
					     	  out.print(json2);	
						
			   }    
                        
		
               public void DocumentIndexing(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
				{
					
            	   PrintWriter out=response.getWriter();   
		                HttpSession session=request.getSession();
		                int id=(int)session.getAttribute("clientid");
			 	        String email = (String) session.getAttribute("clientemail");
			 	        int companyid=(int)session.getAttribute("cust_id");
			 	        
			 	        int document_info_id = Integer.parseInt(request.getParameter("document_info_id"));
				        IndexingUserupload indexingUserupload=new IndexingUserupload(id,email,document_info_id);
				        List<IndexingUserupload> document_type = customeradminDAO.DocumentIndexing(indexingUserupload);
					    
				        Gson gson = new Gson();
						JSONObject json = new JSONObject();
						String message;
						GsonBuilder gsonBuilder = new GsonBuilder();
				        Gson gson2 = gsonBuilder.create();
				        json.put("doc_indexing_info" , gson2.toJson(document_type));
			 	    	message = gson.toJson(json);
			 	    	out.println(message);
				
				}    
               
				
               public void IndexingAttachment(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
			   {
							
							  PrintWriter out=response.getWriter();   
			                  HttpSession session=request.getSession();
				 	          int id=(int)session.getAttribute("clientid");
				 	          String email = (String) session.getAttribute("clientemail");
				 	          int companyid=(int)session.getAttribute("cust_id");
				 	          int document_info_id=Integer.parseInt(request.getParameter("document_info_id"));
				 	          IndexingUserupload indexingUserupload=new IndexingUserupload(id , email , document_info_id);
				 	          List<IndexingUserupload> list=customeradminDAO.IndexingAttachment(indexingUserupload);
				 	          FolderJsonObject folderJsonObject=new FolderJsonObject(); 
				 	          folderJsonObject.setiTotalDisplayRecords(list.size());
				 	          folderJsonObject.setiTotalRecords(list.size());
				 	          folderJsonObject.setAaData(list);
					          Gson gson = new GsonBuilder().setPrettyPrinting().create();
					     	  String json2 = gson.toJson(folderJsonObject);
					     	  out.print(json2);	
						
			   }
               
               
               
               public void folderAttachment(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
			   {
							
							  PrintWriter out=response.getWriter();   
			                  HttpSession session=request.getSession();
				 	          int id=(int)session.getAttribute("clientid");
				 	          String email = (String) session.getAttribute("clientemail");
				 	          int companyid=(int)session.getAttribute("cust_id");
				 	          int document_info_id=Integer.parseInt(request.getParameter("document_info_id"));
				 	          IndexingUserupload indexingUserupload=new IndexingUserupload(id , email , document_info_id);
				 	          List<IndexingUserupload> list=customeradminDAO.folderAttachment(indexingUserupload);
				 	          FolderJsonObject folderJsonObject=new FolderJsonObject(); 
				 	          folderJsonObject.setiTotalDisplayRecords(list.size());
				 	          folderJsonObject.setiTotalRecords(list.size());
				 	          folderJsonObject.setAaData(list);
					          Gson gson = new GsonBuilder().setPrettyPrinting().create();
					     	  String json2 = gson.toJson(folderJsonObject);
					     	  out.print(json2);	
						
			   }
               
               
               
               public void dashboradDocument(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
			   {
							
							  PrintWriter out=response.getWriter();   
			                  HttpSession session=request.getSession();
				 	          int id=(int)session.getAttribute("clientid");
				 	          String email = (String) session.getAttribute("clientemail");
				 	          int companyid=(int)session.getAttribute("cust_id");
				 	          IndexingUserupload indexingUserupload=new IndexingUserupload(email , id , companyid);
				 	          List<IndexingUserupload> list=customeradminDAO.dashboradDocument(indexingUserupload);
				 	          FolderJsonObject folderJsonObject=new FolderJsonObject(); 
				 	          folderJsonObject.setiTotalDisplayRecords(list.size());
				 	          folderJsonObject.setiTotalRecords(list.size());
				 	          folderJsonObject.setAaData(list);
					          Gson gson = new GsonBuilder().setPrettyPrinting().create();
					     	  String json2 = gson.toJson(folderJsonObject);
					     	  out.print(json2);	
						
			   }
               

               
                  public void documentDetails(HttpServletRequest request, HttpServletResponse response) throws IOException
				  {
					   
			              Gson gson=new Gson();
					      JSONObject json=new JSONObject();
						  String message;
						  PrintWriter out=response.getWriter();   
		                  HttpSession session=request.getSession();
			 	          int id=(int)session.getAttribute("clientid");
			 	          String email = (String) session.getAttribute("clientemail");
			 	          int companyid=(int)session.getAttribute("cust_id");
			 	          int document_info_id=Integer.parseInt(request.getParameter("document_info_id"));
			 	          IndexingUserupload indexingUserupload=new IndexingUserupload(id , email , document_info_id);
						  List<IndexingUserupload> documentdetals=customeradminDAO.documentDetails(indexingUserupload);
			 	          GsonBuilder gsonBuilder = new GsonBuilder();
				          Gson gson2 = gsonBuilder.create();
				          json.put("documentdetals", documentdetals);
				          message=gson.toJson(json);
				          out.println(message);
				     	 
				   }	  	  
               
                  
                  
                  
                  
					 public void trashallAttachment(HttpServletRequest request, HttpServletResponse response) throws IOException {
							
						    boolean check=false;
						    HttpSession session = request.getSession();
						    String email = (String) session.getAttribute("clientemail");
							int did=(int)session.getAttribute("clientid");
					        int id = Integer.parseInt(request.getParameter("document_info_id"));
					        String clientName=(String)session.getAttribute("clientname");
						    String currentDate=request.getParameter("currentDate");
						   
					        
					        Gson gson = new Gson();
							JSONObject json = new JSONObject();
							String message;
							PrintWriter out = response.getWriter();
							IndexingUserupload indexingUserupload=new IndexingUserupload(id , email , did , currentDate , clientName);
							check = customeradminDAO.trashallAttachment(indexingUserupload);
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
                  
                  
                  	    public void editIndexing(HttpServletRequest request, HttpServletResponse response) throws IOException
						{
							 
							  boolean check=false;
							  Gson gson = new Gson();
							  JSONObject json = new JSONObject();
							  String message;
					          PrintWriter out = response.getWriter();
					 	      Timestamp timestamp = new Timestamp(System.currentTimeMillis());
					          
					 	      HttpSession session = request.getSession();
					  		  String email = (String) session.getAttribute("clientemail");
							  int id = (int) session.getAttribute("clientid");
						      int companyid=(int)session.getAttribute("cust_id");
						      String clientName=(String)session.getAttribute("clientname");
					          
						      String documentType1;
					          String documentType2;
					          String documentType3;
					          String documentType4;
					          String documentType5;
					          String documentType6;
					        
					          
					          String documenttype=request.getParameter("documenttype");
					          String document_info_id=request.getParameter("document_info_id");
							  
					          String employecode="";
					          String employename="";
					          String joiningdate="0001-01-01";
					          
					          String vendorcode="";
					          String vendorname="";
					          String invoicedate="0001-01-01";
					          String invoicenumber="";
					          String customercode="";
					          String customername="";
					          
					          if(request.getParameter("joiningdate") != null)
							  {
					      		 joiningdate=request.getParameter("joiningdate");;
							  }
					          if(request.getParameter("employecode") != null)
							  {
					        	  employecode=request.getParameter("employecode");
							  }
					          if(request.getParameter("employename") != null)
							  {
					        	  employename=request.getParameter("employename");
							  }
					          
					          
					         
					          
					         
					          if(request.getParameter("documentType1") !=null)
					          {
					        	  documentType1=request.getParameter("documentType1");
					        	  
					          }
					          else
					          {
					        	  documentType1="";  
					          }
					         
					          if(request.getParameter("documentType2") !=null)
					          {
					        	  documentType2=request.getParameter("documentType2");
					        	  
					          }
					          else
					          {
					        	  documentType2="";  
					          }
					         
					          
					          if(request.getParameter("documentType3") !=null)
					          {
					        	  documentType3=request.getParameter("documentType3");
					        	  
					          }
					          else
					          {
					        	  documentType3="";  
					          }
					        
					       		          
					          if(request.getParameter("documentType4") !=null)
					          	{
					        	  documentType4=request.getParameter("documentType4");
					        	  
					          }
					          else
					          {
					        	  documentType4="";  
					          }
					          
					          
					          if(request.getParameter("documentType5") !=null)
					          {
					        	  documentType5=request.getParameter("documentType5");;
					        	  
					          }
					          else
					          {
					        	  documentType5="";  
					          }
					          
					          
					          if(request.getParameter("documentType6") !=null)
					          {
					        	  documentType6=request.getParameter("documentType6");
					        	  
					          }
					          else
					          {
					        	  documentType6="";  
					          }
						      
					       
					          
					          if(request.getParameter("company_code") !=null)
					          {
					        	  customercode=request.getParameter("company_code");
					          }
					          else
					          {
					        	  customercode="";  
					          }
						      
					          
					          
					          
					          
					          
					          
					          if((documenttype.equalsIgnoreCase("Purchase")) || (request.getParameter("vendorcodesec") != null) && (request.getParameter("vendornamesec") != null) && (request.getParameter("invoicedate") !=null)  && (request.getParameter("invoicedate") !=null))
					          {
					        	  vendorcode=request.getParameter("vendorcodesec");
					        	  vendorname=request.getParameter("vendornamesec");
					        	  if(request.getParameter("invoicedate") !=null)
					    		  {
					            	   invoicedate="0001-01-01";
					    			
					    		  }else {
					    			  invoicedate=request.getParameter("invoicedate");
					    		  }
					              invoicenumber=request.getParameter("invoicenumber");
					          }
					          
					      
					          
					          if((documenttype.equalsIgnoreCase("Vendor Registration")) || (request.getParameter("vendorcode") !=null)  && (request.getParameter("vendorname") !=null))
					          {       	 
					        	   vendorcode=request.getParameter("vendorcode");
					        	   vendorname=request.getParameter("vendorname");     
					        	   invoicedate="0001-01-01";
					        	   
					          }
					          
					         
					          if((documenttype.equalsIgnoreCase("Customer Registration")) || (request.getParameter("customername") !=null) && (request.getParameter("customercode") !=null))
					          {
					        	     customercode=request.getParameter("customercode");
					                 customername=request.getParameter("customername");
					                 invoicedate="0001-01-01";
					                
					          
					          }
					          
					          
					          if((documenttype.equalsIgnoreCase("Sales")) || (request.getParameter("customernamesec") !=null) && (request.getParameter("customercodesec") !=null) && (request.getParameter("invoicedatesec") !=null) && (request.getParameter("invoicenumbersec") !=null))
					          {
					        	     customercode=request.getParameter("customercodesec");
					                 customername=request.getParameter("customernamesec");
					                 if(request.getParameter("invoicedatesec") ==null)
					       		     {
					       		   	   invoicedate="0001-01-01";
					       		     }
					                 else
					                 {
					       		       invoicedate=request.getParameter("invoicedatesec");
					                 }
					                   invoicenumber=request.getParameter("invoicenumbersec");
					                   
					                  
					               
					           }
					          IndexingUserupload userupload=null;
					          Random random= new Random();
					  		  int randomnumber=random.nextInt(1000000);
					  		  String randomnum = Integer.toString(randomnumber); 
					  		  userupload=new IndexingUserupload(companyid , randomnum ,  documenttype , employecode , employename , joiningdate , vendorcode,vendorname,invoicedate,customercode,customername,invoicenumber, id , email , clientName,documentType1,documentType2,documentType3,documentType4,documentType5,documentType6, Integer.parseInt(document_info_id));
			     	          check =customeradminDAO.editIndexing(userupload);
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
					 
                  	    
                  	    
                  	    
                  	  public void editpermission(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

              			
              			Gson gson = new Gson();
              			JSONObject json = new JSONObject();
              			String message;
              			PrintWriter out = response.getWriter();
              			HttpSession session=request.getSession();
               	        int client_id=(int)session.getAttribute("clientid");
               	        String client_email = (String) session.getAttribute("clientemail");
               	        int company_id=(int)session.getAttribute("cust_id");
               	        String clientname = (String)session.getAttribute("clientname");
               	        String document_info_id = request.getParameter("document_info_id");
              			String file_access_level="";
              		    String file_user_name="";
              		    boolean check=false;
              			
              		    JSONArray array = new JSONArray();
    					Enumeration paramNames = request.getParameterNames();
    					 while(paramNames.hasMoreElements()) {
    					
    						 Object object=paramNames.nextElement();
    						 String param=(String)object;
    						 for(int i=0;i<=15;i++) {
    						
    							 JSONObject json2 = new JSONObject();
    							 if(param.equalsIgnoreCase("file_access_level["+i+"]")) {
    								 
    								     json2.put("access_level", request.getParameter("file_access_level["+i+"]"));		
    		                             json2.put("client_id", request.getParameter("file_user_name["+i+"]"));				
    		     						 array.add(json2);	   
    		     				     
    		                         
    							 }
    						 
    					  }
    					
    			      }
    					
    					 
    					 
              			 
              			 AddFile addFile=new AddFile(client_id , client_email , company_id , array.toJSONString() , file_user_name , clientname ,Integer.parseInt(document_info_id));
              			 check = customeradminDAO.editpermission(addFile);
              			
              			 if (check) {
              				  
              				  json.put("status", true); 
              				  message = gson.toJson(json); 
              				  out.println(message);
              				 
              			  }else {
              				  
              				  json.put("status", false);
              				  message = gson.toJson(json);
              				  out.println(message);
              			  }
              		

              		}

                  	    
                  	    
                
                  	  
                  	public void deleteSingleAttachment(HttpServletRequest request, HttpServletResponse response) throws IOException
      			  {
      				    boolean check=false;
      				    Gson gson = new Gson();
      					JSONObject json = new JSONObject();
      					String message;
      			        PrintWriter out = response.getWriter();
      			        HttpSession session = request.getSession();
      			        int client_id=(int)session.getAttribute("clientid");
             	        String client_email = (String) session.getAttribute("clientemail");
             	        int company_id=(int)session.getAttribute("cust_id");
             	        String clientname = (String)session.getAttribute("clientname");
             	        String document_info_id = request.getParameter("document_info_id");
             	        IndexingUserupload userupload=new IndexingUserupload(client_id , client_email , clientname, Integer.parseInt(document_info_id));
      				    check =customeradminDAO.deleteSingleAttachment(userupload); 
      				    if(check){ 
      					
      				    json.put("status", true); // 
      				    json.put("message", "success");
      				    message =gson.toJson(json); 
      				    out.println(message); 
      				    
      				   }
      				    else 
      				   { 
      				    
      				    json.put("status", false); //
      				    json.put("message", "not success"); //
      				    message = gson.toJson(json); 
      				    out.println(message); 
      				   
      				   }
      				 	    
      			  }	  
                  	  
                  	
                  	public void deletetrash(HttpServletRequest request, HttpServletResponse response) throws IOException
        			  {
        				    boolean check=false;
        				    Gson gson = new Gson();
        					JSONObject json = new JSONObject();
        					String message;
        			        PrintWriter out = response.getWriter();
        			        HttpSession session = request.getSession();
        			        int client_id=(int)session.getAttribute("clientid");
	               	        String client_email = (String) session.getAttribute("clientemail");
	               	        int company_id=(int)session.getAttribute("cust_id");
	               	        String clientname = (String)session.getAttribute("clientname");
	               	        String document_info_id = request.getParameter("document_info_id");
	               	        IndexingUserupload userupload=new IndexingUserupload(client_id , client_email , clientname, Integer.parseInt(document_info_id));
	        				check =customeradminDAO.deletetrash(userupload); 
        				    if(check){ 
        					
        				    json.put("status", true); // 
        				    json.put("message", "success");
        				    message =gson.toJson(json); 
        				    out.println(message); 
        				    
        				   }
        				    else 
        				   { 
        				    
        				    json.put("status", false); //
        				    json.put("message", "not success"); //
        				    message = gson.toJson(json); 
        				    out.println(message); 
        				   
        				   }
        				 	    
        			  }	  
                  	
                  	public void starDocument(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
					{
						
						  PrintWriter out=response.getWriter();   
		                  HttpSession session=request.getSession();
			 	          
		                  int id=(int)session.getAttribute("clientid");
			 	          String email = (String) session.getAttribute("clientemail");
			 	          int companyid=(int)session.getAttribute("cust_id");
			 	         String department =(String)session.getAttribute("client_department");
			 	          
			 	          IndexingUserupload indexingUserupload=new IndexingUserupload(email , id , companyid , department);
			 	          List<IndexingUserupload> list=customeradminDAO.starDocument(indexingUserupload);
			 	          FolderJsonObject folderJsonObject=new FolderJsonObject(); 
			 	          folderJsonObject.setiTotalDisplayRecords(list.size());
			 	          folderJsonObject.setiTotalRecords(list.size());
			 	          folderJsonObject.setAaData(list);
				          Gson gson = new GsonBuilder().setPrettyPrinting().create();
				     	  String json2 = gson.toJson(folderJsonObject);
				     	  out.print(json2);	
					
				}
				   
                  	
                  	
                  	public void starFolderDocument(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
					{
						
						  PrintWriter out=response.getWriter();   
		                  HttpSession session=request.getSession();
			 	          
		                  int id=(int)session.getAttribute("clientid");
			 	          String email = (String) session.getAttribute("clientemail");
			 	          int companyid=(int)session.getAttribute("cust_id");
			 	          IndexingUserupload indexingUserupload=new IndexingUserupload(email , id , companyid );
			 	          List<IndexingUserupload> list=customeradminDAO.starFolderDocument(indexingUserupload);
			 	          FolderJsonObject folderJsonObject=new FolderJsonObject(); 
			 	          folderJsonObject.setiTotalDisplayRecords(list.size());
			 	          folderJsonObject.setiTotalRecords(list.size());
			 	          folderJsonObject.setAaData(list);
				          Gson gson = new GsonBuilder().setPrettyPrinting().create();
				     	  String json2 = gson.toJson(folderJsonObject);
				     	  out.print(json2);	
					
				}
                  	
                  	
                  	public void trashDashboard(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
					{
						
						  PrintWriter out=response.getWriter();   
		                  HttpSession session=request.getSession();
			 	          int id=(int)session.getAttribute("clientid");
			 	          String email = (String) session.getAttribute("clientemail");
			 	          int companyid=(int)session.getAttribute("cust_id");
			 	          String department =(String)session.getAttribute("client_department");
			 	          
			 	          IndexingUserupload indexingUserupload=new IndexingUserupload(email , id , companyid ,department);
			 	          List<IndexingUserupload> list=customeradminDAO.trashDashboard(indexingUserupload);
			 	          FolderJsonObject folderJsonObject=new FolderJsonObject(); 
			 	          folderJsonObject.setiTotalDisplayRecords(list.size());
			 	          folderJsonObject.setiTotalRecords(list.size());
			 	          folderJsonObject.setAaData(list);
				          Gson gson = new GsonBuilder().setPrettyPrinting().create();
				     	  String json2 = gson.toJson(folderJsonObject);
				     	  out.print(json2);	
					
				  }
                  
                  
                  	
                	
                  	public void trashFile(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
					{
						
						  PrintWriter out=response.getWriter();   
		                  HttpSession session=request.getSession();
			 	          int id=(int)session.getAttribute("clientid");
			 	          String email = (String) session.getAttribute("clientemail");
			 	          int companyid=(int)session.getAttribute("cust_id");
			 	          String department =(String)session.getAttribute("client_department");
			 	          
			 	          IndexingUserupload indexingUserupload=new IndexingUserupload(email , id , companyid ,department);
			 	          List<IndexingUserupload> list=customeradminDAO.trashFile(indexingUserupload);
			 	          FolderJsonObject folderJsonObject=new FolderJsonObject(); 
			 	          folderJsonObject.setiTotalDisplayRecords(list.size());
			 	          folderJsonObject.setiTotalRecords(list.size());
			 	          folderJsonObject.setAaData(list);
				          Gson gson = new GsonBuilder().setPrettyPrinting().create();
				     	  String json2 = gson.toJson(folderJsonObject);
				     	  out.print(json2);	
					
				  }
                  
                  	
                  	public void trashDashboardDocument(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
					{
						
						  PrintWriter out=response.getWriter();   
		                  HttpSession session=request.getSession();
			 	          int id=(int)session.getAttribute("clientid");
			 	          String email = (String) session.getAttribute("clientemail");
			 	          int companyid=(int)session.getAttribute("cust_id");
			 	          String department =(String)session.getAttribute("client_department");
			 	          
			 	          IndexingUserupload indexingUserupload=new IndexingUserupload(email , id , companyid ,department);
			 	          List<IndexingUserupload> list=customeradminDAO.trashDashboardDocument(indexingUserupload);
			 	          FolderJsonObject folderJsonObject=new FolderJsonObject(); 
			 	          folderJsonObject.setiTotalDisplayRecords(list.size());
			 	          folderJsonObject.setiTotalRecords(list.size());
			 	          folderJsonObject.setAaData(list);
				          Gson gson = new GsonBuilder().setPrettyPrinting().create();
				     	  String json2 = gson.toJson(folderJsonObject);
				     	  out.print(json2);	
					
				}
                  	
                  	
                  	

      			  public void emptyTrash(HttpServletRequest request, HttpServletResponse response) throws IOException
      			  {
      				    
      				    boolean check=false;
      				    Gson gson = new Gson();
      					JSONObject json = new JSONObject();
      					String message;
      			        PrintWriter out = response.getWriter();
      			        HttpSession session = request.getSession();
      				    String email = (String) session.getAttribute("clientemail");
      			        int did=(int)session.getAttribute("clientid");
      			        String document_info_id = request.getParameter("document_info_id");
      		    	    
      			        System.out.println(document_info_id);
      			        
      		    	    String array[]=document_info_id.split(":");
      		    	    for(int i=0;i<array.length;i++)
      		    	    {
      		    	    	 if(!"".equals(array[i])) {
      		    	        	
           		    	    	IndexingUserupload userupload=new IndexingUserupload(Integer.parseInt(array[i]) , did , email);
           					    check =customeradminDAO.emptyTrash(userupload); 
      		    	    		 
      		    	        }
      		    	    }
      		    	  
      		            if(check){ 
      					
      				    json.put("status", true); 
      				    message =gson.toJson(json); 
      				    out.println(message); 
      				    
      				   }
      				   else 
      				   { 
      				    
      				    json.put("status", false); 
      				    message = gson.toJson(json); 
      				    out.println(message); 
      				   
      				   }
      				 	    
      			  }     	
                  	  
      			  
      			public void emptyTrashdocument(HttpServletRequest request, HttpServletResponse response) throws IOException
    			  {
    				    
    				    boolean check=false;
    				    Gson gson = new Gson();
    					JSONObject json = new JSONObject();
    					String message;
    			        PrintWriter out = response.getWriter();
    			        HttpSession session = request.getSession();
    				    String email = (String) session.getAttribute("clientemail");
    			        int did=(int)session.getAttribute("clientid");
    			        String document_info_id = request.getParameter("document_info_id");
    		    	    
    			        System.out.println(document_info_id);
    			        
    		    	    String array[]=document_info_id.split(":");
    		    	    for(int i=0;i<array.length;i++)
    		    	    {
    		    	    	 if(!"".equals(array[i])) {
    		    	        	
         		    	    	IndexingUserupload userupload=new IndexingUserupload(Integer.parseInt(array[i]) , did , email);
         					    check =customeradminDAO.emptyTrashdocument(userupload); 
    		    	    		 
    		    	        }
    		    	    }
    		    	  
    		            if(check){ 
    					
    				    json.put("status", true); 
    				    message =gson.toJson(json); 
    				    out.println(message); 
    				    
    				   }
    				   else 
    				   { 
    				    
    				    json.put("status", false); 
    				    message = gson.toJson(json); 
    				    out.println(message); 
    				   
    				   }
    				 	    
    			  }   
      			  
      			  
      		       public void briefcase(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    			   {
    							
    							  PrintWriter out=response.getWriter();   
    			                  HttpSession session=request.getSession();
    				 	          int id=(int)session.getAttribute("clientid");
    				 	          String email = (String) session.getAttribute("clientemail");
    				 	          int companyid=(int)session.getAttribute("cust_id");
    				 	          IndexingUserupload indexingUserupload=new IndexingUserupload(email , id , companyid);
    				 	          List<IndexingUserupload> list=customeradminDAO.briefcase(indexingUserupload);
    				 	          FolderJsonObject folderJsonObject=new FolderJsonObject(); 
    				 	          folderJsonObject.setiTotalDisplayRecords(list.size());
    				 	          folderJsonObject.setiTotalRecords(list.size());
    				 	          folderJsonObject.setAaData(list);
    					          Gson gson = new GsonBuilder().setPrettyPrinting().create();
    					     	  String json2 = gson.toJson(folderJsonObject);
    					     	  out.print(json2);	
    						
    			   }
      			  
      			  
      		       
      		       
      		       
      		     public void folderdelete(HttpServletRequest request, HttpServletResponse response) throws IOException
     			  {
     				    
     				    boolean check=false;
     				    Gson gson = new Gson();
     					JSONObject json = new JSONObject();
     					String message;
     			        PrintWriter out = response.getWriter();
     			        HttpSession session = request.getSession();
     				    String email = (String) session.getAttribute("clientemail");
     			        int did=(int)session.getAttribute("clientid");
     			        String document_info_id = request.getParameter("document_info_id");
     			        String folder_id = request.getParameter("folder_id");
     		    	    
     			        System.out.println(folder_id);
     			        System.out.println(document_info_id);
     			        
     			        
     			      String array[]=document_info_id.split(":");
     			      for(int i=0;i<array.length;i++)
  		    	      {
     			    	 if(!"".equals(array[i])){  
     			    	  
     			    	 if(!"document".equals(array[i])) {
    			     
     			    	    IndexingUserupload userupload=new IndexingUserupload(Integer.parseInt(array[i]) , did , email);
        				    check =customeradminDAO.documentdelete(userupload); 
   		
     			    		 
     			    		 
     			    	 }
     			    	
     			    	}
     			    	 
  		    	      } 
     			       
     			     
     			      String folder[]=folder_id.split(":");
    			      for(int i=0;i<folder.length;i++)
 		    	      {
    			    	 if(!"".equals(folder[i])){  
       			    	
    			    	 if(!"folder".equals(folder[i])) {
   			
    			    	    IndexingUserupload userupload=new IndexingUserupload(Integer.parseInt(folder[i]) , did , email);
        				    check =customeradminDAO.folderdelete(userupload); 
   		
    			    		 
    			    	 }
    			    	 
    			       }  
 		    	      
 		    	      } 
     			     
     		    	  
     		         if(check){ 
     					
     				    json.put("status", true); 
     				    message =gson.toJson(json); 
     				    out.println(message); 
     				    
     				   }
     				   else 
     				   { 
     				    
     				    json.put("status", false); 
     				    message = gson.toJson(json); 
     				    out.println(message); 
     				   
     				   }
     				 	    
     			  }     	
      			  
      			  
      			  
      			  
      			  
      		   public void folderAccess(HttpServletRequest request, HttpServletResponse response) throws IOException
  			  {
  				    
  				    boolean check=false;
  				    Gson gson = new Gson();
  					JSONObject json = new JSONObject();
  					String message;
  			        PrintWriter out = response.getWriter();
  			        HttpSession session = request.getSession();
  				    String email = (String) session.getAttribute("clientemail");
  			        int did=(int)session.getAttribute("clientid");
  			        String document_info_id = request.getParameter("document_info_id");
  		    	    
  			        IndexingUserupload userupload=new IndexingUserupload(Integer.parseInt(document_info_id) , did , email);
       			    String access_level =customeradminDAO.folderAccess(userupload); 
       			    
       			    json.put("access_level" , access_level);
  				    json.put("status", false); 
  				    message =gson.toJson(json); 
  				    out.println(message); 
  				   
  				 	    
  			  }     	
   			   
      			  
      		 public void dashboardRequestAccess(HttpServletRequest request, HttpServletResponse response) throws IOException
 			  {
 				    
 				    boolean check=false;
 				    Gson gson = new Gson();
 					JSONObject json = new JSONObject();
 					String message;
 			        PrintWriter out = response.getWriter();
 			        HttpSession session = request.getSession();
 				    String email = (String) session.getAttribute("clientemail");
 			        int did=(int)session.getAttribute("clientid");
 			        int companyid=(int)session.getAttribute("cust_id");
 		    	    IndexingUserupload userupload=new IndexingUserupload(did , companyid , email);
 			        List<IndexingUserupload>  requestAccess =customeradminDAO.dashboardRequestAccess(userupload); 
      			    json.put("requestAccess" , requestAccess);
 				    json.put("status", false); 
 				    message =gson.toJson(json); 
 				    out.println(message); 
 			  }      
             
      		  public void requestByYou(HttpServletRequest request, HttpServletResponse response) throws IOException
			  {
				    
				   
				    String message;
			        PrintWriter out = response.getWriter();
			        HttpSession session = request.getSession();
				    String email = (String) session.getAttribute("clientemail");
			        int did=(int)session.getAttribute("clientid");
			        int companyid=(int)session.getAttribute("cust_id");
		    	    IndexingUserupload userupload=new IndexingUserupload(did , companyid , email);
			        List<IndexingUserupload>  list =customeradminDAO.requestByYou(userupload); 
    			    
			        FolderJsonObject folderJsonObject=new FolderJsonObject(); 
		 	        folderJsonObject.setiTotalDisplayRecords(list.size());
		 	        folderJsonObject.setiTotalRecords(list.size());
		 	        folderJsonObject.setAaData(list);
			        Gson gson = new GsonBuilder().setPrettyPrinting().create();
			     	String json2 = gson.toJson(folderJsonObject);
			     	out.print(json2);	
			  } 
      		 
      		  
      		  
      		  
      		  
      		 public void editDocument(HttpServletRequest request, HttpServletResponse response) throws IOException {
					
				    PrintWriter out=response.getWriter();   
	                HttpSession session=request.getSession();
	                int id=(int)session.getAttribute("clientid");
		 	        String email = (String) session.getAttribute("clientemail");
		 	        int companyid=(int)session.getAttribute("cust_id");
		 	        UsercustomerClient usercustomerClient=new UsercustomerClient(email , companyid , id);
		 	        String department=customeradminDAO.fetchdepartment(usercustomerClient);
		 	        
		 	        //edit file details
		 	        int document_info_id = Integer.parseInt(request.getParameter("document_info_id"));
			        IndexingUserupload indexingUserupload=new IndexingUserupload(id,email,document_info_id);
			        List<IndexingUserupload> editfile = customeradminDAO.editDocument(indexingUserupload);
			        List<UsercustomerClient> name=customeradminDAO.fetchName(usercustomerClient);
			        
			        Gson gson = new Gson();
					JSONObject json = new JSONObject();
					String message;
					GsonBuilder gsonBuilder = new GsonBuilder();
			        Gson gson2 = gsonBuilder.create();
			        
			        json.put("name" , gson2.toJson(name));
			        json.put("editfile" , gson2.toJson(editfile));
		 	        json.put("status", true);
					json.put("department",department);
					message = gson.toJson(json);
					out.println(message);
			
			 
			 }
      		  
      		   public void Customerdepartment(HttpServletRequest request, HttpServletResponse response) throws IOException
			   {
				   
		              Gson gson=new Gson();
				      JSONObject json=new JSONObject();
					  String message;
					  PrintWriter out=response.getWriter();   
	                  HttpSession session=request.getSession();
		 	          int id=(int)session.getAttribute("clientid");
		 	          String email = (String) session.getAttribute("clientemail");
		 	          int companyid=(int)session.getAttribute("cust_id");
		 	          UsercustomerClient usercustomerClient=new UsercustomerClient(email , companyid , id);
		 	          String department=customeradminDAO.Customerdepartment(usercustomerClient);
		 	          GsonBuilder gsonBuilder = new GsonBuilder();
			          Gson gson2 = gsonBuilder.create();
			          json.put("department",department);
			          message=gson.toJson(json);
			     	  out.println(message);
			     	 
			   } 
      		   
      		 public void requestaccessDept(HttpServletRequest request, HttpServletResponse response) throws IOException {
					
				    boolean check=false;
				    HttpSession session = request.getSession();
				    String email = (String) session.getAttribute("clientemail");
					int client_id=(int)session.getAttribute("clientid");
			        
					JSONArray array = new JSONArray();
					Enumeration paramNames = request.getParameterNames();
					 while(paramNames.hasMoreElements()) {
						 Object object=paramNames.nextElement();
						 String param=(String)object;
						 for(int i=0;i<=25;i++) {
							 JSONObject json2 = new JSONObject();
							 if(param.equalsIgnoreCase("access_right_"+i+"")) {
								     json2.put("department", request.getParameter("department_"+i+""));		
		                             json2.put("access_level", request.getParameter("access_right_"+i+""));				
		     						 array.add(json2);
		     				 }
					  }
			      }
			        
					
			        
			        RequestAccess requestAccess=new RequestAccess(client_id  , array.toJSONString() , email);
		  		    check = customeradminDAO.requestaccessDept(requestAccess);
					Gson gson = new Gson();
					JSONObject json = new JSONObject();
					String message;
					PrintWriter out = response.getWriter();
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
      		 
      		 
      		
      		 
      		 
      		 
      		 
      		 
      		public void documentAttachmentUpload(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
		    {

					      boolean check=false;
					      Gson gson = new Gson();
					      JSONObject json = new JSONObject();
					      String message;
					      PrintWriter out = response.getWriter();
				          Timestamp timestamp = new Timestamp(System.currentTimeMillis());
				    	  
				        
				          String documentType1;
				          String documentType2;
				          String documentType3;
				          String documentType4;
				          String documentType5;
				          String documentType6;
				        
				          
				          String documenttype=request.getParameter("documenttype");
				          String document_info_id=request.getParameter("document_info_id");
				          
				          String employecode="";
				          String employename="";
				          String joiningdate="0001-01-01";
				          
				          String vendorcode="";
				          String vendorname="";
				          String invoicedate="0001-01-01";
				          String invoicenumber="";
				          String customercode="";
				          String customername="";
				          
				          if(request.getParameter("joiningdate") != null)
						  {
				      		 joiningdate=request.getParameter("joiningdate");;
						  }
				          if(request.getParameter("employecode") != null)
						  {
				        	  employecode=request.getParameter("employecode");
						  }
				          if(request.getParameter("employename") != null)
						  {
				        	  employename=request.getParameter("employename");
						  }
				          
				          
				         
				          
				         
				          if(request.getParameter("documentType1") !=null)
				          {
				        	  documentType1=request.getParameter("documentType1");
				        	  
				          }
				          else
				          {
				        	  documentType1="";  
				          }
				         
				          if(request.getParameter("documentType2") !=null)
				          {
				        	  documentType2=request.getParameter("documentType2");
				        	  
				          }
				          else
				          {
				        	  documentType2="";  
				          }
				         
				          
				          if(request.getParameter("documentType3") !=null)
				          {
				        	  documentType3=request.getParameter("documentType3");
				        	  
				          }
				          else
				          {
				        	  documentType3="";  
				          }
				        
				       		          
				          if(request.getParameter("documentType4") !=null)
				          	{
				        	  documentType4=request.getParameter("documentType4");
				        	  
				          }
				          else
				          {
				        	  documentType4="";  
				          }
				          
				          
				          if(request.getParameter("documentType5") !=null)
				          {
				        	  documentType5=request.getParameter("documentType5");;
				        	  
				          }
				          else
				          {
				        	  documentType5="";  
				          }
				          
				          
				          if(request.getParameter("documentType6") !=null)
				          {
				        	  documentType6=request.getParameter("documentType6");
				        	  
				          }
				          else
				          {
				        	  documentType6="";  
				          }
					      
				          
				          
				          
				          if(request.getParameter("company_code") !=null)
				          {
				        	  documentType6=request.getParameter("documentType6");
				        	  
				          }
				          else
				          {
				        	  documentType6="";  
				          }
					      
				          
				          
				          
				          
				          
				          
				          if((documenttype.equalsIgnoreCase("Purchase")) || (request.getParameter("vendorcodesec") != null) && (request.getParameter("vendornamesec") != null) && (request.getParameter("invoicedate") !=null)  && (request.getParameter("invoicedate") !=null))
				          {
				        	  vendorcode=request.getParameter("vendorcodesec");
				        	  vendorname=request.getParameter("vendornamesec");
				        	  if(request.getParameter("invoicedate") !=null)
				    		  {
				            	   invoicedate="0001-01-01";
				    			
				    		  }else {
				    			  invoicedate=request.getParameter("invoicedate");
				    		  }
				              invoicenumber=request.getParameter("invoicenumber");
				          }
				          
				      
				          
				          if((documenttype.equalsIgnoreCase("Vendor Registration")) || (request.getParameter("vendorcode") !=null)  && (request.getParameter("vendorname") !=null))
				          {       	 
				        	   vendorcode=request.getParameter("vendorcode");
				        	   vendorname=request.getParameter("vendorname");     
				        	   invoicedate="0001-01-01";
				        	   
				          }
				          
				         
				          if((documenttype.equalsIgnoreCase("Customer Registration")) || (request.getParameter("customername") !=null) && (request.getParameter("customercode") !=null))
				          {
				        	     customercode=request.getParameter("customercode");
				                 customername=request.getParameter("customername");
				                 invoicedate="0001-01-01";
				                
				          
				          }
				          
				          
				          if((documenttype.equalsIgnoreCase("Sales")) || (request.getParameter("customernamesec") !=null) && (request.getParameter("customercodesec") !=null) && (request.getParameter("invoicedatesec") !=null) && (request.getParameter("invoicenumbersec") !=null))
				          {
				        	     customercode=request.getParameter("customercodesec");
				                 customername=request.getParameter("customernamesec");
				                 if(request.getParameter("invoicedatesec") ==null)
				       		     {
				       		   	   invoicedate="0001-01-01";
				       		     }
				                 else
				                 {
				       		       invoicedate=request.getParameter("invoicedatesec");
				                 }
				                   invoicenumber=request.getParameter("invoicenumbersec");
				                   
				                  
				               
				           }  
				          
					    
			           IndexingUserupload userupload=null;
			           HttpSession session = request.getSession();
			           String email = (String) session.getAttribute("clientemail");
			           int id=(int)session.getAttribute("clientid");
			           String clientName=(String)session.getAttribute("clientname");
				         
			           
                       
			             
			             try { 
				           for(Part part : request.getParts()) {
							  String fileName = part.getSubmittedFileName();
				  			  
							  if(fileName!=null) { 
				  				  
				  				  
				  				 if(part.getContentType().equals("application/vnd.android.package-archive")||part.getContentType().equals("text/plain")||part.getContentType().equals("text/calendar")||part.getContentType().equals("text/csv")||part.getContentType().equals("application/vnd.openxmlformats-officedocument.wordprocessingml.document")||part.getContentType().equals("image/vnd.microsoft.icon")||part.getContentType().equals("image/svg+xml")||part.getContentType().equals("application/vnd.ms-excel")||part.getContentType().equals("application/vnd.ms-powerpoint")||part.getContentType().equals("application/octet-stream")||part.getContentType().equals("application/x-zip-compressed")||part.getContentType().equals("application/pdf")||part.getContentType().equals("image/jpg")||part.getContentType().equals("image/png")||part.getContentType().equals("image/jpeg")||part.getContentType().equals("image/gif"))
				  			    {
				  					double mb=(double)part.getSize();
				  					String indexingurl=new IndexingUploading().uploadDocument(part , "softdoc-262410.appspot.com" , simpleDateFormate.format(timestamp));
				  					userupload=new IndexingUserupload(employecode , employename , joiningdate , vendorcode , vendorname , invoicedate , customercode ,customername ,invoicenumber,email,id, Integer.parseInt(document_info_id) ,indexingurl , mb/(1024*1024), clientName , documentType1,documentType2,documentType3,documentType4,documentType5,documentType6);
				  			        check = customeradminDAO.updatedocument(userupload);
				     		      
				  			    }
						     } 
				  		  }
				        }
				  		catch(Exception exception)
				  	    {
				  			  exception.printStackTrace();
				  		}
			         
			       
			           
			           
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
			    
      		 
      		
      		public void Comments(HttpServletRequest request, HttpServletResponse response) throws IOException {
				
			    boolean check=false;
			    HttpSession session = request.getSession();
			    String email = (String) session.getAttribute("clientemail");
				int client_id=(int)session.getAttribute("clientid");
		        
				String document_info_id=request.getParameter("document_info_id");
		        String send=request.getParameter("send");
			    Comments comments=new Comments(client_id, email , Integer.parseInt(document_info_id),send);
		        check = customeradminDAO.Comments(comments);
		        List<Comments> fetchsend=customeradminDAO.fetchComments(comments);
		       
		        Gson gson = new Gson();
				JSONObject json = new JSONObject();
				String message;
				PrintWriter out = response.getWriter();
				if (check) {
					
					json.put("status", true);
					json.put("fetchsend" , fetchsend);
					message = gson.toJson(json);
					out.println(message);
				
				} else {
				
					json.put("status", false);
					message = gson.toJson(json);
					out.println(message);
				
				}

		}
      		 
      
      		
      		 public void fetchComments(HttpServletRequest request, HttpServletResponse response) throws IOException
			   {
				   
		              Gson gson=new Gson();
				      JSONObject json=new JSONObject();
					  String message;
					  PrintWriter out=response.getWriter();   
	                  HttpSession session=request.getSession();
		 	          int id=(int)session.getAttribute("clientid");
		 	          String email = (String) session.getAttribute("clientemail");
		 	          int companyid=(int)session.getAttribute("cust_id");
		 	          String document_info_id=request.getParameter("document_info_id");
		 	      
		 	            Comments comments=new Comments(id, email , Integer.parseInt(document_info_id));
				        List<Comments> fetchsend=customeradminDAO.fetchComments(comments);
		 	          
				      GsonBuilder gsonBuilder = new GsonBuilder();
			          Gson gson2 = gsonBuilder.create();
			          json.put("fetchsend" , fetchsend);
			          message=gson.toJson(json);
			          out.println(message);
			     	 
			   } 		
      		
      		
      		
      		 
            public void replycomments(HttpServletRequest request, HttpServletResponse response) throws IOException {
				
			    boolean check=false;
			    HttpSession session = request.getSession();
			    String email = (String) session.getAttribute("clientemail");
				int client_id=(int)session.getAttribute("clientid");
		        
				String comments_id=request.getParameter("comments_id");
		        String comment_reply=request.getParameter("comment_reply");
				Comments comments=new Comments(client_id, email , comment_reply ,Integer.parseInt(comments_id));
		        check = customeradminDAO.replycomments(comments);
		        List<Comments> replyComments=customeradminDAO.replyCommentsFetch(comments);
			 	
		        Gson gson = new Gson();
				JSONObject json = new JSONObject();
				String message;
				PrintWriter out = response.getWriter();
				if (check) {
					
				    json.put("reply", replyComments);
			        message=gson.toJson(json);
			        out.println(message);
					
				
				} else {
				
					json.put("status", false);
					message = gson.toJson(json);
					out.println(message);
				
				}

		}

      		
            public void folderDocumentAttachement(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
		    {

					      boolean check=false;
					      Gson gson = new Gson();
					      JSONObject json = new JSONObject();
					      String message;
					      PrintWriter out = response.getWriter();
				          Timestamp timestamp = new Timestamp(System.currentTimeMillis());
				    	  
				        
				          String documentType1;
				          String documentType2;
				          String documentType3;
				          String documentType4;
				          String documentType5;
				          String documentType6;
				        
				          
				          String documenttype=request.getParameter("documenttype");
				          String document_info_id=request.getParameter("document_info_id");
						  
				          
				          String employecode="";
				          String employename="";
				          String joiningdate="0001-01-01";
				          
				          String vendorcode="";
				          String vendorname="";
				          String invoicedate="0001-01-01";
				          String invoicenumber="";
				          String customercode="";
				          String customername="";
				          
				          if(request.getParameter("joiningdate") != null)
						  {
				      		 joiningdate=request.getParameter("joiningdate");;
						  }
				          if(request.getParameter("employecode") != null)
						  {
				        	  employecode=request.getParameter("employecode");
						  }
				          if(request.getParameter("employename") != null)
						  {
				        	  employename=request.getParameter("employename");
						  }
				          
				          
				         
				          
				         
				          if(request.getParameter("documentType1") !=null)
				          {
				        	  documentType1=request.getParameter("documentType1");
				        	  
				          }
				          else
				          {
				        	  documentType1="";  
				          }
				         
				          if(request.getParameter("documentType2") !=null)
				          {
				        	  documentType2=request.getParameter("documentType2");
				        	  
				          }
				          else
				          {
				        	  documentType2="";  
				          }
				         
				          
				          if(request.getParameter("documentType3") !=null)
				          {
				        	  documentType3=request.getParameter("documentType3");
				        	  
				          }
				          else
				          {
				        	  documentType3="";  
				          }
				        
				       		          
				          if(request.getParameter("documentType4") !=null)
				          	{
				        	  documentType4=request.getParameter("documentType4");
				        	  
				          }
				          else
				          {
				        	  documentType4="";  
				          }
				          
				          
				          if(request.getParameter("documentType5") !=null)
				          {
				        	  documentType5=request.getParameter("documentType5");;
				        	  
				          }
				          else
				          {
				        	  documentType5="";  
				          }
				          
				          
				          if(request.getParameter("documentType6") !=null)
				          {
				        	  documentType6=request.getParameter("documentType6");
				        	  
				          }
				          else
				          {
				        	  documentType6="";  
				          }
					      
				          
				          
				          
				          if(request.getParameter("company_code") !=null)
				          {
				        	  customercode=request.getParameter("company_code");
				        	  
				          }
				          else
				          {
				        	  customercode="";  
				          }
					      
				          
				          
				          
				          
				          
				          
				          if((documenttype.equalsIgnoreCase("Purchase")) || (request.getParameter("vendorcodesec") != null) && (request.getParameter("vendornamesec") != null) && (request.getParameter("invoicedate") !=null)  && (request.getParameter("invoicedate") !=null))
				          {
				        	  vendorcode=request.getParameter("vendorcodesec");
				        	  vendorname=request.getParameter("vendornamesec");
				        	  if(request.getParameter("invoicedate") !=null)
				    		  {
				            	   invoicedate="0001-01-01";
				    			
				    		  }else {
				    			  invoicedate=request.getParameter("invoicedate");
				    		  }
				              invoicenumber=request.getParameter("invoicenumber");
				          }
				          
				      
				          
				          if((documenttype.equalsIgnoreCase("Vendor Registration")) || (request.getParameter("vendorcode") !=null)  && (request.getParameter("vendorname") !=null))
				          {       	 
				        	   vendorcode=request.getParameter("vendorcode");
				        	   vendorname=request.getParameter("vendorname");     
				        	   invoicedate="0001-01-01";
				        	   
				          }
				          
				         
				          if((documenttype.equalsIgnoreCase("Customer Registration")) || (request.getParameter("customername") !=null) && (request.getParameter("customercode") !=null))
				          {
				        	     customercode=request.getParameter("customercode");
				                 customername=request.getParameter("customername");
				                 invoicedate="0001-01-01";
				                
				          
				          }
				          
				          
				          if((documenttype.equalsIgnoreCase("Sales")) || (request.getParameter("customernamesec") !=null) && (request.getParameter("customercodesec") !=null) && (request.getParameter("invoicedatesec") !=null) && (request.getParameter("invoicenumbersec") !=null))
				          {
				        	     customercode=request.getParameter("customercodesec");
				                 customername=request.getParameter("customernamesec");
				                 if(request.getParameter("invoicedatesec") ==null)
				       		     {
				       		   	   invoicedate="0001-01-01";
				       		     }
				                 else
				                 {
				       		       invoicedate=request.getParameter("invoicedatesec");
				                 }
				                   invoicenumber=request.getParameter("invoicenumbersec");
				                   
				                  
				               
				           }  
				          
					    
			           IndexingUserupload userupload=null;
			           HttpSession session = request.getSession();
			           String email = (String) session.getAttribute("clientemail");
			           int id=(int)session.getAttribute("clientid");
			           String clientName=(String)session.getAttribute("clientname");
				         
			           
                       
			             
			             try { 
				           for(Part part : request.getParts()) {
							  String fileName = part.getSubmittedFileName();
				  			  
							  if(fileName!=null) { 
				  				  
				  				  
				  				 if(part.getContentType().equals("application/vnd.android.package-archive")||part.getContentType().equals("text/plain")||part.getContentType().equals("text/calendar")||part.getContentType().equals("text/csv")||part.getContentType().equals("application/vnd.openxmlformats-officedocument.wordprocessingml.document")||part.getContentType().equals("image/vnd.microsoft.icon")||part.getContentType().equals("image/svg+xml")||part.getContentType().equals("application/vnd.ms-excel")||part.getContentType().equals("application/vnd.ms-powerpoint")||part.getContentType().equals("application/octet-stream")||part.getContentType().equals("application/x-zip-compressed")||part.getContentType().equals("application/pdf")||part.getContentType().equals("image/jpg")||part.getContentType().equals("image/png")||part.getContentType().equals("image/jpeg")||part.getContentType().equals("image/gif"))
				  			    {
				  					double mb=(double)part.getSize();
				  					String indexingurl=new IndexingUploading().uploadDocument(part , "softdoc-262410.appspot.com" , simpleDateFormate.format(timestamp));
				  					userupload=new IndexingUserupload(employecode , employename , joiningdate , vendorcode , vendorname , invoicedate , customercode ,customername ,invoicenumber,email,id, Integer.parseInt(document_info_id) ,indexingurl , mb/(1024*1024), clientName , documentType1,documentType2,documentType3,documentType4,documentType5,documentType6);
				  			        check = customeradminDAO.folderDocumentAttachement(userupload);
				     		      
				  			    }
						     } 
				  		  }
				        }
				  		catch(Exception exception)
				  	    {
				  			  exception.printStackTrace();
				  		}
			         
			       
			           
			           
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
			       
 		 
            
            
            
            
            
            
            public void accessRequestedYou(HttpServletRequest request, HttpServletResponse response) throws IOException {
				
			    boolean check=false;
			    HttpSession session = request.getSession();
			    String email = (String) session.getAttribute("clientemail");
				int client_id=(int)session.getAttribute("clientid");
		        
				String request_id=request.getParameter("request_id");
				
				
				RequestAccess requestAccess=new RequestAccess(Integer.parseInt(request_id) , client_id ,email);  
		        List<RequestAccess> accessRequestedYou=customeradminDAO.accessRequestedYou(requestAccess);
			    
		        Gson gson = new Gson();
				JSONObject json = new JSONObject();
				String message;
				PrintWriter out = response.getWriter();
				json.put("accessRequestedYou", accessRequestedYou);
			    message=gson.toJson(json);
			    out.println(message);

		}
            
          
         public void requestByFrom(HttpServletRequest request, HttpServletResponse response) throws IOException {
				
			    boolean check=false;
			    HttpSession session = request.getSession();
			    String email = (String) session.getAttribute("clientemail");
				int client_id=(int)session.getAttribute("clientid");
		        RequestAccess requestAccess=new RequestAccess(client_id ,email);  
		        List<RequestAccess> list=customeradminDAO.requestByFrom(requestAccess);
			    
		        PrintWriter out = response.getWriter();
			    RequestJsonObject RequestJsonObject=new RequestJsonObject(); 
		        RequestJsonObject.setiTotalDisplayRecords(list.size());
		        RequestJsonObject.setiTotalRecords(list.size());
		        RequestJsonObject.setAaData(list);
		        Gson gson = new GsonBuilder().setPrettyPrinting().create();
		     	String json2 = gson.toJson(RequestJsonObject);
		     	out.print(json2);
				

		}
            
            
         
         public void requestByFromFileAccept(HttpServletRequest request, HttpServletResponse response) throws IOException {
				
			    boolean check=false;
			    HttpSession session = request.getSession();
			    String email = (String) session.getAttribute("clientemail");
				int client_id=(int)session.getAttribute("clientid");
		 		String document_info_id=request.getParameter("document_info_id");
				
				RequestAccess requestAccess=new RequestAccess(Integer.parseInt(document_info_id) , email , client_id);  
		        List<RequestAccess> requestByFromFileAccept=customeradminDAO.requestByFromFileAccept(requestAccess);
			    
		        Gson gson = new Gson();
				JSONObject json = new JSONObject();
				String message;
				PrintWriter out = response.getWriter();
				json.put("requestByFromFileAccept" , requestByFromFileAccept);
			    message=gson.toJson(json);
			    out.println(message);

		 }  
            
		 
            public void updateRemarksRequestAccess(HttpServletRequest request, HttpServletResponse response) throws IOException {
				
			    boolean check=false;
			    HttpSession session = request.getSession();
			    
			    String email = (String) session.getAttribute("clientemail");
				int client_id=(int)session.getAttribute("clientid");
		 		String status=request.getParameter("status");
		 		String request_access_id=request.getParameter("request_access_id");
		 		String reject_remarks=request.getParameter("reject_remarks");

		 		RequestAccess requestAccess=new RequestAccess(client_id  ,  email  ,  Integer.parseInt(request_access_id)  , reject_remarks , status);  
		        check = customeradminDAO.updateRemarksRequestAccess(requestAccess);
			    
		        Gson gson = new Gson();
				JSONObject json = new JSONObject();
				String message;
				PrintWriter out = response.getWriter();
				json.put("status", true);
	  			message = gson.toJson(json);
	  			out.println(message);

		 }  
         
            

            public void briefcaseaddfolder(HttpServletRequest request, HttpServletResponse response) throws IOException {

			    
            	boolean check=false;
				Gson gson = new Gson();
				JSONObject json = new JSONObject();
				String message;
				PrintWriter out = response.getWriter();
				HttpSession session = request.getSession();
				
				String email = (String) session.getAttribute("clientemail");
				int id = (int) session.getAttribute("clientid");
				String clientname = (String)session.getAttribute("clientname");
				int company_id=(int)session.getAttribute("cust_id");
			    String folder_name = request.getParameter("folder_name");
				
			    
			    FileNumber filenumber=new FileNumber(id, email , clientname , folder_name , company_id);
	            check = customeradminDAO.addfolder(filenumber);
	            
	            if (check) {
					
					json.put("status", true);
					message = gson.toJson(json);
					out.println(message);
				}
				else
				{
					json.put("status", false);
					message = gson.toJson(json);
					out.println(message);
				}

			}  
            
            
            
            public void uploadBriefcase(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    		{
    		
            	Timestamp timestamp = new Timestamp(System.currentTimeMillis());
   	 	    
    		     
    		     Gson gson = new Gson();
    			 JSONObject json = new JSONObject();
    			 String message;
    		 	 PrintWriter out = response.getWriter();
    			 boolean check=false;
    		 	 
    		 	 HttpSession session = request.getSession();
    			 String email = (String) session.getAttribute("clientemail");
    			 int id = (int) session.getAttribute("clientid");
    			 
    			 Part part = request.getPart("upload_briefcase");
    			 double mb=(double)part.getSize();
    			 String indexingurl=new IndexingUploading().uploadDocument(part,"softdoc-262410.appspot.com" , simpleDateFormate.format(timestamp));
    			 
    			 Briefcase briefcase = new Briefcase(id , email ,  indexingurl , mb/(1024*1024));
    			 check = customeradminDAO.uploadBriefcase(briefcase);
    			 
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
         
            
            
           
           public void fetchuploadBriefcase(HttpServletRequest request, HttpServletResponse response) throws IOException {
				
			    boolean check=false;
			    HttpSession session = request.getSession();
			    String email = (String) session.getAttribute("clientemail");
				int client_id=(int)session.getAttribute("clientid");
				Briefcase briefcase = new Briefcase(client_id,email);
		        List<Briefcase> list=customeradminDAO.fetchuploadBriefcase(briefcase);
			    PrintWriter out = response.getWriter();
		        BriefcaseJsonObject briefcaseJsonObject=new BriefcaseJsonObject(); 
		        briefcaseJsonObject.setiTotalDisplayRecords(list.size());
		        briefcaseJsonObject.setiTotalRecords(list.size());
		        briefcaseJsonObject.setAaData(list);
		        Gson gson = new GsonBuilder().setPrettyPrinting().create();
		     	String json2 = gson.toJson(briefcaseJsonObject);
		     	out.print(json2);
				
		  }
         
           
           public void ClientsNames(HttpServletRequest request, HttpServletResponse response) throws IOException
		   {
			  
        	      Gson gson=new Gson();
			      JSONObject json=new JSONObject();
				  String message;
				  PrintWriter out=response.getWriter();   
                  HttpSession session=request.getSession();
	 	          
                  int id=(int)session.getAttribute("clientid");
	 	          String email = (String) session.getAttribute("clientemail");
	 	          int companyid=(int)session.getAttribute("cust_id");
	 	         
	 	          
	 	          UsercustomerClient usercustomerClient=new UsercustomerClient(email , companyid , id);
	 	          List<UsercustomerClient> name=customeradminDAO.fetchName(usercustomerClient);
	 	          
		 	      GsonBuilder gsonBuilder = new GsonBuilder();
		          Gson gson2 = gsonBuilder.create();
		          json.put("name",gson2.toJson(name));
	 	          message=gson.toJson(json);
		     	  out.println(message);
		     	 
		   }  
           

           
           
       	public void client_message(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
			
       		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
       		
		    boolean check=false;
		    HttpSession session = request.getSession();
		    String email = (String) session.getAttribute("clientemail");
			int client_id=(int)session.getAttribute("clientid");
	        String new_message=request.getParameter("new_message");
	        String send_id=request.getParameter("send_id");
	        String group_chat_id=request.getParameter("group_chat_id");
	        int companyid=(int)session.getAttribute("cust_id");
	         
	        String indexingurl="";
	        if(request.getPart("chat_attachement") !=null) {
	           Part part = request.getPart("chat_attachement");
	           indexingurl=new IndexingUploading().uploadDocument(part,"softdoc-262410.appspot.com" , simpleDateFormate.format(timestamp));
	        }
	            
	            Message client_message=new Message(client_id , new_message , Integer.parseInt(send_id) , indexingurl , companyid);
		        
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
           
    
       	
    public void client_chat_details(HttpServletRequest request, HttpServletResponse response) throws IOException {
			
		    HttpSession session = request.getSession();
		    String email = (String) session.getAttribute("clientemail");
			int client_id=(int)session.getAttribute("clientid");
	        String client_chat_id=request.getParameter("client_id");
	        int companyid=(int)session.getAttribute("cust_id");
	        
	        Gson gson = new Gson();
	    	JSONObject json = new JSONObject();
	    	String message;
	    	PrintWriter out = response.getWriter();
	    	
	    	
	        
	        if(!client_chat_id.equals("")) {
	        
	        	Message client_message=new Message(client_id , Integer.parseInt(client_chat_id),companyid);
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
      
    
    
    
      public void upload_file_briefcase(HttpServletRequest request, HttpServletResponse response) throws IOException
	  {
		    
		    boolean check=false;
		    Gson gson = new Gson();
			JSONObject json = new JSONObject();
			String message;
	        PrintWriter out = response.getWriter();
	        HttpSession session = request.getSession();
		    String email = (String) session.getAttribute("clientemail");
	        int id=(int)session.getAttribute("clientid");
	        String document_info_id = request.getParameter("document_info_id");
   	        
	        String array[]=document_info_id.split(":");
   	       for(int i=0;i<array.length;i++)
   	      {
   	    	 if(!"".equals(array[i])) {
   	        	
   	    		 Briefcase briefcase = new Briefcase( Integer.parseInt(array[i]) , email , id);
	    	     check =customeradminDAO.upload_file_briefcase(briefcase); 
   	        }
   	      }
   	  
           if(check){ 
			
		    json.put("status", true); 
		    message =gson.toJson(json); 
		    out.println(message); 
		    
		   }
		   else 
		   { 
		    
		    json.put("status", false); 
		    message = gson.toJson(json); 
		    out.println(message); 
		   
		   }
		 	    
	  }
           
       
     
     
      public void briefcaseSize(HttpServletRequest request, HttpServletResponse response) throws IOException
	  {
		    boolean check=false;
		    Gson gson = new Gson();
			JSONObject json = new JSONObject();
			String message;
	        PrintWriter out = response.getWriter();
	        HttpSession session = request.getSession();
		    String email = (String) session.getAttribute("clientemail");
	        int id=(int)session.getAttribute("clientid");
	        Briefcase briefcase = new Briefcase(id , email);
	        double size =customeradminDAO.BriefcaseSize(briefcase); 
   	        json.put("size", size); 
		    message =gson.toJson(json); 
		    out.println(message); 
		 	    
	  }
     
      
      
      
      public void notification(HttpServletRequest request, HttpServletResponse response) throws IOException {
			
		    HttpSession session = request.getSession();
		    String email = (String) session.getAttribute("clientemail");
			int client_id=(int)session.getAttribute("clientid");
	        int companyid=(int)session.getAttribute("cust_id");
	        Gson gson = new Gson();
	    	JSONObject json = new JSONObject();
	    	String message;
	    	PrintWriter out = response.getWriter();
	    	Message client_message=new Message(client_id , email , companyid);
	        List<Message> notification = customeradminDAO.notification(client_message);
	        json.put("notification" , notification);
			message = gson.toJson(json);
			out.println(message);
	        
	}  	
 
           
           
}
