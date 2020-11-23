package com.subadminindexingController;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Enumeration;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.json.simple.JSONObject;

import com.customerclientModal.ViewDocument;
import com.google.gson.Gson;

import com.subadminindexing.email.IndexingCustomNumber;
import com.subadminindexingDAO.IndexingSubadminStoreDAO;
import com.subadminindexingModal.IndexingUserProfile;
import com.subadminindexingModal.IndexingUserupload;
import com.subadminqualityModal.QualityUserProfile;
import com.subadminstoreModal.UserProfileStore;
import com.uploadfile.DeleteFile;
import com.uploadfile.IndexingUploading;
import com.uploadfile.UploadFile;
import com.subadminindexing.loginfile.IndexingFileExtension;

public class IndexingControllerAction {

	IndexingSubadminStoreDAO subadminstoreDAO;

	public IndexingControllerAction() {
		subadminstoreDAO = new IndexingSubadminStoreDAO();
	}

    private static final SimpleDateFormat simpleDateFormate = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss");



	//================================start logout subadmin indexing==================================
	public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session != null) {

			  session.removeAttribute("emailindexing");
	   	      session.removeAttribute("indexingname");
	   	      session.removeAttribute("index_id");
	   	      session.removeAttribute("index_role");
		}
		response.sendRedirect("index.jsp");

	}
	//================================end logout subadmin indexing==================================

	//================================start update profile subadmin indexing==================================
	public void updateprofile(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		Gson gson = new Gson();
		JSONObject json = new JSONObject();
		String message;

		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("emailindexing");
		int id=(int)session.getAttribute("index_id");
		IndexingUserProfile userprofile = new IndexingUserProfile(request.getParameter("username"), request.getParameter("password"),
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
			json.put("message", "not successfully");
			message = gson.toJson(json);
			out.println(message);

		}

	}
	//================================end update profile subadmin indexing==================================
	
	//================================start upload document==================================
	public void uploaddocument(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		 

		  
		
          Timestamp timestamp = new Timestamp(System.currentTimeMillis());
 		  
          boolean check=false;
		  Gson gson = new Gson();
		  JSONObject json = new JSONObject();
		  String message;
          PrintWriter out = response.getWriter();
          int companyid=Integer.parseInt(request.getParameter("customerid"));
          String departmentname=request.getParameter("departmentname");
          String company_code=request.getParameter("company_code");
          
          String documenttype=request.getParameter("documenttype");
          String employecode=request.getParameter("employecode");
          String employename=request.getParameter("employename");
          String joiningdate=request.getParameter("joiningdate");
          
          
          
          //new update
        /*String taxType="";
          String challenDate="";
          String challenNo="";
          String periodam="";
          String bsrcode="";
          
          
          String financialyear="";
          String assessmentyear="";
          String datareport="";
          String membershipno="";
          String udin="";
        */ 
          
          String documentType1=request.getParameter("documentType1");
          String documentType2=request.getParameter("documentType2");
          String documentType3=request.getParameter("documentType3");
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
          
		  
          if(joiningdate.equals(""))
		  {
      		 joiningdate="0001-01-01";
		  }
          
          String vendorcode="";
          String vendorname="";
          String invoicedate="";
          String invoicenumber="";
          String customercode="";
          String customername="";
          
          
          if((documenttype.equalsIgnoreCase("Purchase")) || (!"".equals(request.getParameter("vendorcodesec"))) && (!"".equals(request.getParameter("vendornamesec"))) && (!"".equals(request.getParameter("invoicedate")))  && (!"".equals(request.getParameter("invoicedate"))))
          {
        	  vendorcode=request.getParameter("vendorcodesec");
        	  vendorname=request.getParameter("vendornamesec");
        	  if(request.getParameter("invoicedate").equals(""))
    		  {
            	   invoicedate="0001-01-01";
    			
    		  }else {
    			  invoicedate=request.getParameter("invoicedate");
    		  }
              invoicenumber=request.getParameter("invoicenumber");
          }
          
      
          
          if((documenttype.equalsIgnoreCase("Vendor Registration")) || (!"".equals(request.getParameter("vendorcode")))  && (!"".equals(request.getParameter("vendorname"))))
          {       	 
        	   System.out.println(documenttype);
        	   vendorcode=request.getParameter("vendorcode");
        	   vendorname=request.getParameter("vendorname");     
        	   invoicedate="0001-01-01";
          }
          
         
          if((documenttype.equalsIgnoreCase("Customer Registration")) || (!"".equals(request.getParameter("customername"))) && (!"".equals(request.getParameter("customercode"))))
          {
        	     
        	     customercode=request.getParameter("customercode");
                 customername=request.getParameter("customername");
                 invoicedate="0001-01-01";
          }
          
          
          if((documenttype.equalsIgnoreCase("Sales")) || (!"".equals(request.getParameter("customernamesec"))) && (!"".equals(request.getParameter("customercodesec"))) && (!"".equals(request.getParameter("invoicedatesec"))) && (!"".equals(request.getParameter("invoicenumbersec"))))
          {
        	     
        	     System.out.println(documenttype);


        	     
        	     customercode=request.getParameter("customercodesec");
        	     customername=request.getParameter("customernamesec");
                 
        	     System.out.println(customercode);
        	     System.out.println(customername);
        	     
        	     
        	     customername=request.getParameter("customernamesec");
                 if(request.getParameter("invoicedatesec").equals(""))
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
          String concatination="";
          String newfilepath="";
          String size="";
          String filenumber=request.getParameter("fileno");
          //file_number 
          Random random= new Random();
  		  int randomnumber=random.nextInt(1000000);
  		  String randomnum = Integer.toString(randomnumber); 
  		  HttpSession session = request.getSession();
  		  String email = (String) session.getAttribute("emailindexing");
  		  int id=(int)session.getAttribute("index_id");
  		 
          try { 
           
           int i=1;
  		   for(Part part : request.getParts()) {
			 	 
  			 //String name = part.getName();
  			 String fileName = part.getSubmittedFileName();
  			 if(fileName!=null) { 
  			   
  				if(part.getContentType().equals("application/vnd.android.package-archive")||part.getContentType().equals("text/plain")||part.getContentType().equals("text/calendar")||part.getContentType().equals("text/csv")||part.getContentType().equals("application/vnd.openxmlformats-officedocument.wordprocessingml.document")||part.getContentType().equals("image/vnd.microsoft.icon")||part.getContentType().equals("image/svg+xml")||part.getContentType().equals("application/vnd.ms-excel")||part.getContentType().equals("application/vnd.ms-powerpoint")||part.getContentType().equals("application/octet-stream")||part.getContentType().equals("application/x-zip-compressed")||part.getContentType().equals("application/pdf")||part.getContentType().equals("image/jpg")||part.getContentType().equals("image/png")||part.getContentType().equals("image/jpeg")||part.getContentType().equals("image/gif"))
	  			{
  					double mb=(double)part.getSize();
  					String  customnumber=new IndexingCustomNumber().asStrangeNumber(i);
  				    String indexingurl=new IndexingUploading().uploadDocument(part , "softdoc-262410.appspot.com" , simpleDateFormate.format(timestamp));
  				    userupload=new IndexingUserupload(companyid,departmentname,indexingurl,mb/(1024*1024),randomnum,customnumber,documenttype,employecode,employename,joiningdate,vendorcode,vendorname,invoicedate,customercode,customername,invoicenumber,filenumber,i,email,id,documentType1,documentType2,documentType3,documentType4,documentType5,documentType6);
     	            check = subadminstoreDAO.uploaddocument(userupload);
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
	//================================end upload document==================================
	
	
	 
	//================================start update quality status==================================
	  public void updatequality(HttpServletRequest request, HttpServletResponse response) throws IOException
	  {
		    boolean check;
		    Gson gson = new Gson();
			JSONObject json = new JSONObject();
			String message;
	        PrintWriter out = response.getWriter();
		    String file_no=request.getParameter("id");
		    HttpSession session = request.getSession();
		    String email = (String) session.getAttribute("emailindexing");
		    int id=(int)session.getAttribute("index_id");
		    IndexingUserupload userupload=new IndexingUserupload(file_no,email,id);
		    check = subadminstoreDAO.updatequality(userupload);
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
     //================================end update quality status==================================

	  
	  public void editdocument(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	  {
		     
		    Gson gson = new Gson();
			JSONObject json = new JSONObject();
			String message;
	        PrintWriter out = response.getWriter();
		     boolean check;  
			 int id=Integer.parseInt(request.getParameter("id"));
			 Part filePart = request.getPart("editupload");
			 String indexingurl=new IndexingUploading().uploadFile(filePart,"softdoc-262410.appspot.com");
			 double  mb=(double)(filePart.getSize()/(1024*1024));
			 IndexingUserupload userupload=new IndexingUserupload(id,indexingurl,mb);
		     check = subadminstoreDAO.editdocument(userupload);
		     if(check)
		     {
				  response.sendRedirect("subadminindexing/quality_return.jsp");
		    	/*json.put("status", true);
	  			  json.put("message", "success");
	  			  message = gson.toJson(json);
	  			  out.println(message);*/
		     
		     }
			 else
		     {
				response.sendRedirect("subadminindexing/quality_return.jsp");
				 
	        	 /*
	        	  json.put("status", false);
	  			  json.put("message", "not success");
	  			  message = gson.toJson(json);
	  			  out.println(message);*/
	         
		     }			
		     
	  }
	  
	  
	 //================================start update indexing status==================================
	  public void updateindexing(HttpServletRequest request, HttpServletResponse response) throws IOException
	  {
		    boolean check;
		  
		    Gson gson = new Gson();
			JSONObject json = new JSONObject();
			String message;
	        PrintWriter out = response.getWriter();
	        //====================//====================
	        String remark=request.getParameter("remark");
	        String document_no=request.getParameter("id");
	        String file_no=request.getParameter("file_no");
	        
	        HttpSession session = request.getSession();
		    String email = (String) session.getAttribute("emailindexing");
		    int id=(int)session.getAttribute("index_id");
		    
	        
	        IndexingUserupload userupload=new IndexingUserupload(file_no,document_no,remark,email,id);
		    check = subadminstoreDAO.updateindexing(userupload);
		    
		    
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
	  //================================end update indexing status==================================
		
	  
	 //===================================start update indexing document==========================================
	  public void updateindexingdoc(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	  {
		     
		    Gson gson = new Gson();
			JSONObject json = new JSONObject();
			String message;
	        
			PrintWriter out = response.getWriter();
		    boolean check;  
			int id=Integer.parseInt(request.getParameter("id"));
			Part filePart = request.getPart("upload");
			String filename=filePart.getSubmittedFileName();
		/*	
			File file=new File(filename);
			File newfile =new File("https://storage.googleapis.com/softdoc-262410.appspot.com/rathore.pdf");
			if(file.renameTo(newfile)){
				System.out.println("Rename succesful");
			}else{
				System.out.println("Rename failed");
			}
		*/	
			String indexingurl=new IndexingUploading().uploadFile(filePart,"softdoc-262410.appspot.com");
			double  mb=(double)(filePart.getSize()/(1024*1024));
			IndexingUserupload userupload=new IndexingUserupload(id,indexingurl,mb);
		    check = subadminstoreDAO.updateindexingdoc(userupload);
		    if(check)
		     {
				  response.sendRedirect("subadminindexing/indexing.jsp");
		    	/*json.put("status", true);
	  			  json.put("message", "success");
	  			  message = gson.toJson(json);
	  			  out.println(message);*/
		     
		     }
			 else
		     {
				response.sendRedirect("subadminindexing/indexing.jsp");
				 /*
	        	  json.put("status", false);
	  			  json.put("message", "not success");
	  			  message = gson.toJson(json);
	  			  out.println(message);
	  			  */
	         
		     }			
		     
	  }
	 
     //===================================end update indexing document==========================================
	  
     //===================================start delete indexing document==========================================
	  public void indexuploaddelete(HttpServletRequest request, HttpServletResponse response) throws IOException
	  {
		    boolean check=false;
		    Gson gson = new Gson();
			JSONObject json = new JSONObject();
			String message;
	        PrintWriter out = response.getWriter();
	        int id=Integer.parseInt(request.getParameter("id"));
		    String file_no=request.getParameter("file_no");
		    String file=request.getParameter("file");
		    HttpSession session = request.getSession();
		    String email = (String) session.getAttribute("emailindexing");
		    int did=(int)session.getAttribute("index_id");
		   
		    IndexingUserupload userupload=new IndexingUserupload(id,email,did);
		    
		    boolean deletefile=new DeleteFile().deletefile_name("softdoc-262410.appspot.com",file);
		   
		    check =subadminstoreDAO.indexuploaddelete(userupload); 
	
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
	//===================================end delete indexing document==========================================
		 
     //=============================start change password indexing===============================================	
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
			
			IndexingUserProfile indexingUserProfile = new IndexingUserProfile(currentpassword,confirmpassword, (String) session.getAttribute("emailindexing"),(int) session.getAttribute("index_id"));
			boolean check = subadminstoreDAO.changepassword(indexingUserProfile);
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
	  //=============================end change password indexing===============================================	
		
	  
	//=================start upload profile pic==========================================
	  public void uploadphoto(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
		{
			 Gson gson = new Gson();
			 JSONObject json = new JSONObject();
			 String message;
		 	 PrintWriter out = response.getWriter();
			 Part part = request.getPart("uploadprofile");
			 String indexingurl=new IndexingUploading().uploadFile(part,"softdoc-262410.appspot.com");
		     HttpSession session = request.getSession();
			 String email = (String) session.getAttribute("emailindexing");
			 int id = (int) session.getAttribute("index_id");
			 IndexingUserProfile indexingUserProfile = new IndexingUserProfile(id,email,indexingurl);
			 boolean check = subadminstoreDAO.uploadphoto(indexingUserProfile);
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
	  //=================end upload profile pic==========================================
		
	   
	 //=================start update document ==========================================
	  public void updatedocument(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	  {

			   boolean check=false;
			   Gson gson = new Gson();
			   JSONObject json = new JSONObject();
			   String message;
			   PrintWriter out = response.getWriter();
	      
			   Timestamp timestamp = new Timestamp(System.currentTimeMillis());

			   
			   
			      String documentType1=request.getParameter("documentType1");
		          String documentType2=request.getParameter("documentType2");
		          String documentType3=request.getParameter("documentType3");
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
	           String email = (String) session.getAttribute("emailindexing");
	           int id=(int)session.getAttribute("index_id");
	           
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
		  					userupload=new IndexingUserupload(employecode,employename,joiningdate,vendorcode,vendorname,invoicedate,customercode,customername,invoicenumber,email,id, Integer.parseInt(document_info_id) ,indexingurl , mb/(1024*1024),request.getParameter("document_status"),customnumber,documentType1,documentType2,documentType3,documentType4,documentType5,documentType6);
		  			        check = subadminstoreDAO.updatedocument(userupload);
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
	        	  check = subadminstoreDAO.updatedocument(userupload);  
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
	    //=================end update document ==========================================
		 
	  
	    //=================start add attachment ==========================================
	    public void addattachment(HttpServletRequest request, HttpServletResponse response) throws IOException
		{
			 
			  boolean check=false;
			  Gson gson = new Gson();
			  JSONObject json = new JSONObject();
			  String message;
	          PrintWriter out = response.getWriter();
	          int companyid=Integer.parseInt(request.getParameter("customerid"));
	          String document_no=request.getParameter("document_no");
	          String departmentname=request.getParameter("departmentname");
	          String documenttype=request.getParameter("documenttype");
	          String company_code=request.getParameter("company_code");
	          
	          String employecode=request.getParameter("employecode");
	          String employename=request.getParameter("employename");
	          String joiningdate=request.getParameter("joiningdate");
	          if(joiningdate.equals(""))
			  {
				
	      		 joiningdate="0001-01-01";
				
			  }
	          String vendorcode=request.getParameter("vendorcode");
	          String vendorname=request.getParameter("vendorname");
	          String invoicedate=request.getParameter("invoicedate");
	          if(invoicedate.equals(""))
			  {
				
	        	  invoicedate="0001-01-01";
				
			  }
	          String customercode=request.getParameter("customercode");
	          String customername=request.getParameter("customername");
	          String invoicenumber=request.getParameter("invoicenumber");
	          IndexingUserupload userupload=null;
	          String concatination="";
	          String newfilepath="";
	          String size="";
	          String filenumber=request.getParameter("fileno");
	          //file_number 
	          Random random= new Random();
	  		  int randomnumber=random.nextInt(1000000);
	  		  String randomnum = Integer.toString(randomnumber); 
	  		  HttpSession session = request.getSession();
	  		  String email = (String) session.getAttribute("emailindexing");
	  		  int id=(int)session.getAttribute("index_id");
	  		  int attachment=Integer.parseInt(request.getParameter("attachment"));
		      
	  		  //attachment_no ===================
	  		  int i=attachment+1;
	  		  try { 
	           for(Part part : request.getParts()) {
				 //String name = part.getName();
	  			 String fileName = part.getSubmittedFileName();
	  			 if(fileName!=null) { 
	  				 
	  				if(part.getContentType().equals("application/vnd.android.package-archive")||part.getContentType().equals("text/plain")||part.getContentType().equals("text/calendar")||part.getContentType().equals("text/csv")||part.getContentType().equals("application/vnd.openxmlformats-officedocument.wordprocessingml.document")||part.getContentType().equals("image/vnd.microsoft.icon")||part.getContentType().equals("image/svg+xml")||part.getContentType().equals("application/vnd.ms-excel")||part.getContentType().equals("application/vnd.ms-powerpoint")||part.getContentType().equals("application/octet-stream")||part.getContentType().equals("application/x-zip-compressed")||part.getContentType().equals("application/pdf")||part.getContentType().equals("image/jpg")||part.getContentType().equals("image/png")||part.getContentType().equals("image/jpeg")||part.getContentType().equals("image/gif"))
		  			{
	  					double mb=(double)part.getSize();
	  					String  customnumber=new IndexingCustomNumber().asStrangeNumber(i);
	  					String indexingurl=new IndexingUploading().uploadDocument(part , "softdoc-262410.appspot.com" , company_code);
	  					userupload=new IndexingUserupload(companyid,departmentname,indexingurl,mb/(1024*1024),randomnum,customnumber,documenttype,employecode,employename,joiningdate,vendorcode,vendorname,invoicedate,customercode,customername,invoicenumber,filenumber,i,email,id,document_no);
	     	            check = subadminstoreDAO.addattachment(userupload);
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
	   //=================end add attachment ==========================================
		  
	    
	    
	  //=================start hit attachment ==========================================
	   public void attachmenthit(HttpServletRequest request, HttpServletResponse response) throws IOException {
			
		    boolean check=false;
		    HttpSession session = request.getSession();
		    String email = (String) session.getAttribute("emailindexing");
		    int did=(int)session.getAttribute("index_id");
		    
		    int id = Integer.parseInt(request.getParameter("id"));
		    Gson gson = new Gson();
			JSONObject json = new JSONObject();
			String message;
			PrintWriter out = response.getWriter();
			IndexingUserupload indexingUserupload=new IndexingUserupload(id,email,did);
			check = subadminstoreDAO.attachmenthit(indexingUserupload);
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
	  //=================end hit attachment ==========================================
		  
	  
	    //=================start update quality document ==========================================
	    public void updatedocumentquality(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
		{
			 
			  boolean check=false;
			  Gson gson = new Gson();
			  JSONObject json = new JSONObject();
			  String message;
	          PrintWriter out = response.getWriter();
	          String update_id=request.getParameter("update_id");
	          int companyid=Integer.parseInt(request.getParameter("customerid"));
	          String company_code=request.getParameter("company_code");
	          String departmentname=request.getParameter("departmentname");
	          String documenttype=request.getParameter("documenttype");
	          String employecode=request.getParameter("employecode");
	          String employename=request.getParameter("employename");
	          String joiningdate=request.getParameter("joiningdate");
	          if(joiningdate.equals(""))
			  {
				
	      		 joiningdate="0001-01-01";
				
			  }
	          String vendorcode=request.getParameter("vendorcode");
	          String vendorname=request.getParameter("vendorname");
	          String invoicedate=request.getParameter("invoicedate");
	          if(invoicedate.equals(""))
			  {
				
	        	  invoicedate="0001-01-01";
				
			  }
	          String customercode=request.getParameter("customercode");
	          String customername=request.getParameter("customername");
	          String invoicenumber=request.getParameter("invoicenumber");
	          IndexingUserupload userupload=null;
	          String concatination="";
	          String newfilepath="";
	          String size="";
	          String filenumber=request.getParameter("fileno");
	          //file_number 
	          Random random= new Random();
	  		  int randomnumber=random.nextInt(1000000);
	  		  String randomnum = Integer.toString(randomnumber); 
	  		  HttpSession session = request.getSession();
	  		  String email = (String) session.getAttribute("emailindexing");
	  		  int id=(int)session.getAttribute("index_id");
	  		  Part part = request.getPart("update_file");
	  		  int i=1;
	  		  double mb=(double)part.getSize();
	  		  String  customnumber=new IndexingCustomNumber().asStrangeNumber(i);
	  	      String indexingurl=new IndexingUploading().uploadDocument(part , "softdoc-262410.appspot.com" , company_code);
			  userupload=new IndexingUserupload(companyid,departmentname,indexingurl,mb/(1024*1024),randomnum,customnumber,documenttype,employecode,employename,joiningdate,vendorcode,vendorname,invoicedate,customercode,customername,invoicenumber,filenumber,i,email,id,update_id);
	     	  check = subadminstoreDAO.updatedocumentquality(userupload);
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
	    //=================end update quality document ==========================================
		   
	   
		   public void deleteDocument(HttpServletRequest request, HttpServletResponse response) throws IOException {
				
			    boolean check=false;
			    HttpSession session = request.getSession();
			    String email = (String) session.getAttribute("emailindexing");
			    int did=(int)session.getAttribute("index_id");
			    int id = Integer.parseInt(request.getParameter("document_info_id"));
			    System.out.println(id);
			   
			    Gson gson = new Gson();
				JSONObject json = new JSONObject();
				String message;
				PrintWriter out = response.getWriter();
				IndexingUserupload indexingUserupload=new IndexingUserupload(id,email,did);
				check = subadminstoreDAO.deleteDocument(indexingUserupload);
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
	    
	    
	  
}
