package com.customerclientDAO;



import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.customerclientModal.AddFile;
import com.customerclientModal.Briefcase;
import com.customerclientModal.ComplainList;
import com.customerclientModal.FileNumber;
import com.customerclient.connection.DBConnection;
import com.customerclientModal.UsercustomerClient;
import com.customerclientModal.ViewDocument;
import com.google.appengine.repackaged.com.google.protobuf.Empty;
import com.subadminindexing.loginfile.IndexingLogfile;
import com.uploadfile.DeleteFile;
import com.customerclientModal.IndexingUserupload;
import com.customerclientModal.Message;
import com.customerclientModal.RequestAccess;
import com.customerclientModal.UpdateFile;
import com.customerclientModal.Comments;


public class CustomerclientDAO {
	
	
	 
    
    
	
	 public boolean updateprofile(UsercustomerClient usercustomerClient)
	 {
		 boolean check=false;
		 String email=usercustomerClient.getEmail();
		 int id=usercustomerClient.getId();
	     try(Connection connection=DBConnection.openConnection();PreparedStatement preparedStatement = connection.prepareStatement("UPDATE `client_details` SET `employee_name` = ? , `designation` = ?, `location` = ? , `mobile` = ? , `access_info` = ? WHERE `id` ='"+id+"'");)
	     {
	    	     
	               preparedStatement.setString(1, usercustomerClient.getName());
		           preparedStatement.setString(2, usercustomerClient.getDesignation());
		           preparedStatement.setString(3, usercustomerClient.getLocation());
		           preparedStatement.setString(4, usercustomerClient.getMobile());
		           preparedStatement.setString(5, usercustomerClient.getAccess_info());
		           
		           check = preparedStatement.executeUpdate()>0;
		         //logfile 
				      if(check)
		 	 	      {
				    	  new com.customerclient.email.LogfileClient().logfile(email, "customerclient has been updateprofile",id, "client");
		          	      
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
		 return check;
	 }
	 
	 
	 
	  //complainlist
	  public boolean complainlist(ComplainList complaintlist)
	  {
		    boolean check=false;
		    int rand_integer = ThreadLocalRandom.current().nextInt(100000);
		    String customerid="COM"+rand_integer;
		    try(Connection connection=DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO `complain_list` (`customer_id`, `complain_id`, `attachment`, `title`, `area_of_issue`, `documentnumberref`,`category`,`client_id`,`date`) VALUES (? , ?, ?, ?, ?, ?,?,?,?)");)
		    {
		    	
					      preparedStatement.setInt(1, complaintlist.getCustomer_id());
					      preparedStatement.setString(2, customerid);
					      preparedStatement.setString(3, complaintlist.getAttachment());
					      preparedStatement.setString(4, complaintlist.getTitle());
					      preparedStatement.setString(5, complaintlist.getDescription());
					      preparedStatement.setString(6, complaintlist.getDocumentnumberref());
					      preparedStatement.setString(7, complaintlist.getCategory());
					      preparedStatement.setInt(8, complaintlist.getId());
					      Timestamp timestamp = new Timestamp(System.currentTimeMillis());
						  preparedStatement.setTimestamp(9, timestamp);
						 
						  check = preparedStatement.executeUpdate()>0;
				          
				      //logfile 
				      if(check)
		 	 	      {
				    	   new com.customerclient.email.LogfileClient().logfile(complaintlist.getEmail(), "customerclient complaint",complaintlist.getId(), "client");
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
		    
		    return check;
	   }
	  
	  //changepassword
	  public boolean changepassword(UsercustomerClient usercustomerClient)
	  {       
		  
		  
		  boolean check = false;
			try (Connection connection=DBConnection.openConnection(); Statement  statement = connection
					.createStatement();) {
				ResultSet resultset = statement.executeQuery("SELECT `password` FROM `client_details` WHERE `id`='"+usercustomerClient.getId()+"'");
				if (resultset.next()) {
				
				    String password = resultset.getString("password");
					if (password.equals(usercustomerClient.getPassword())) {
					   String confirm = usercustomerClient.getConfirm();
					    try (Connection connect=DBConnection.openConnection();PreparedStatement preparedStatement = connect
								.prepareStatement("UPDATE `client_details` SET `password` = '"+confirm+"' WHERE `id`='"+usercustomerClient.getId()+"'");) {
							check = preparedStatement.executeUpdate() > 0;
							if (check) {
								  
							   new com.customerclient.email.LogfileClient().logfile(usercustomerClient.getEmail(), "customerclient complaint",usercustomerClient.getId(), "client");
					 	 	      
							}
							
							return check;
						}
					}
			   }

			} catch (SQLException sqlexception) {
				sqlexception.printStackTrace();
			} catch (Exception exception) {
				exception.printStackTrace();
			}
	     
			return check;
		  
	    }	
	
	    public List<ViewDocument> viewdocumentfilter( ViewDocument viewdocument)
	    {   
	    	
	    	  int id=viewdocument.getId();

	    	  String department=viewdocument.getDepartment();
	    	  String customercode=viewdocument.getCustomercode();
	    	  String customername=viewdocument.getCustomername();
	    	  String documentype=viewdocument.getDocumenttype();
	    	  String employecode=viewdocument.getEmployecode();
	    	  String employename=viewdocument.getEmployee_name();
	    	  if(employename==null)
	    	  {
	    		  employename="";  
	    	  }
	    	  String dateofjoining=viewdocument.getJoiningdate();
	    	  String invoice_date=viewdocument.getInvoicedate();
	    	  String invoice_number=viewdocument.getInvoicenumber();
	    	  String vendor_code=viewdocument.getVendorcode();
	    	  String vendor_name=viewdocument.getVendorname();
	    	  String invoice_dateend=viewdocument.getInvoicedateend();
	    	  String invoice_dateendsec=viewdocument.getInvoicedateendsec(); 
	    	  String createdStart=viewdocument.getCreatedStart();
	    	  String createdEnd=viewdocument.getCreatedEnd();
	    	  List<ViewDocument> list=new ArrayList<ViewDocument>();
	    	 
	    	  System.out.println(createdStart+"=============="+createdEnd);
	    	  
	    	  String department_array[]=department.split(":");
	    	  if(department_array.length>0) {
	    		  department=department_array[0];
	    	  }
	    	  
		      System.out.println(department+"==============>"+documentype);
			    
	    	  
	    	  String query="";
	    	  if(department.equalsIgnoreCase("Hr") && documentype.equalsIgnoreCase("Employee OutBoarding"))
	    	  {
	    		   query="SELECT document_info.id , document_info.department as department , file_no , file_name , document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date  FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND client_details.id ='"+viewdocument.getId()+"'  AND  document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND  upper(document_info.employee_code) LIKE '%"+employecode+"%' AND  upper(document_info.employee_name) LIKE '%"+employename+"%' AND upper(document_info.date_of_joining) LIKE '%"+dateofjoining+"%'  AND status='quality_approved' AND document_info.upload_date between  '"+createdStart+"' AND '"+createdEnd+"' group by document_info.document_no";
	    	  }
	    	  else if(department.equalsIgnoreCase("Purchase") && documentype.equalsIgnoreCase("Purchase"))
	    	  {
	    		  query="SELECT document_info.id , document_info.department as department , file_no , file_name , document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND client_details.id ='"+viewdocument.getId()+"'  AND  document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%'  AND upper(document_info.invoice_number) LIKE '%"+invoice_number+"%' AND upper(document_info.vendor_code) LIKE '%"+vendor_code+"%' AND  upper(document_info.vendor_name) LIKE '%"+vendor_name+"%' AND status='quality_approved' AND  document_info.invoice_date between  '"+invoice_date+"' and '"+invoice_dateend+"' AND document_info.upload_date between  '"+createdStart+"' AND '"+createdEnd+"' group by document_info.document_no";
	    	  
	    	  }
	    	  else if(department.equalsIgnoreCase("Purchase") && documentype.equalsIgnoreCase("Vendor Registration"))
	    	  {
	    		  query="SELECT document_info.id , document_info.department as department , file_no , file_name , document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND client_details.id ='"+viewdocument.getId()+"'  AND  document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND  upper(document_info.vendor_code) LIKE '%"+vendor_code+"%' AND  upper(document_info.vendor_name) LIKE '%"+vendor_name+"%' AND status='quality_approved' AND document_info.upload_date between  '"+createdStart+"' AND '"+createdEnd+"' group by document_info.document_no";
	    	  }
	    	 else if(department.equalsIgnoreCase("Sales") && documentype.equalsIgnoreCase("Customer Registration"))
	    	  {
	    		    query="SELECT document_info.id , document_info.department as department , file_no , file_name , document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND client_details.id ='"+viewdocument.getId()+"'  AND document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND upper(document_info.customer_code) LIKE '%"+customercode+"%' AND  upper(document_info.customer_name) LIKE '%"+customername+"%' AND status='quality_approved' AND document_info.upload_date between  '"+createdStart+"' AND '"+createdEnd+"' group by document_info.document_no";
	    	  }
	    	  else if(department.equalsIgnoreCase("Sales") && documentype.equalsIgnoreCase("Sales"))
	    	  {
	    		    query="SELECT document_info.id , document_info.department as department , file_no , file_name , document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND client_details.id ='"+viewdocument.getId()+"'  AND document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND upper(document_info.customer_code) LIKE '%"+customercode+"%' AND  upper(document_info.customer_name) LIKE '%"+customername+"%' AND upper(document_info.invoice_number) LIKE '%"+invoice_number+"%' AND status='quality_approved'  AND  document_info.invoice_date between '"+invoice_date+"' AND '"+invoice_dateend+"' AND document_info.upload_date between  '"+createdStart+"' AND '"+createdEnd+"' group by document_info.document_no";
	    	  }
	    	  else if(department.equalsIgnoreCase("Direct Tax") && documentype.equalsIgnoreCase("Challen"))
	    	  {
	    		    query="SELECT document_info.id , document_info.department as department , file_no , file_name , document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND document_info.department='"+department+"' AND document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%'  AND client_details.id ='"+viewdocument.getId()+"' AND document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%'  AND document_info.documentType1 LIKE '%"+viewdocument.getDocumentType1()+"%' AND upper(document_info.documentType2) LIKE '%"+viewdocument.getDocumentType2()+"%' AND  upper(document_info.documentType3) LIKE '%"+viewdocument.getDocumentType3()+"%' AND upper(document_info.documentType4) LIKE '%"+viewdocument.getDocumentType4()+"%' AND upper(document_info.documentType5) LIKE '%"+viewdocument.getDocumentType5()+"%' AND status='quality_approved' AND document_info.upload_date between  '"+createdStart+"' AND '"+createdEnd+"'  group by document_info.document_no";
	    	  }
	    	  else if(department.equalsIgnoreCase("Direct Tax") && documentype.equalsIgnoreCase("Tax Audit Report"))
	    	  {
	    		    query="SELECT document_info.id , document_info.department as department , file_no , file_name , document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND document_info.department='"+department+"' AND document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%'  AND  client_details.id ='"+viewdocument.getId()+"'  AND document_info.documentType1 LIKE '%"+viewdocument.getDocumentType1()+"%' AND upper(document_info.documentType2) LIKE '%"+viewdocument.getDocumentType2()+"%' AND  upper(document_info.documentType3) LIKE '%"+viewdocument.getDocumentType3()+"%' AND upper(document_info.documentType4) LIKE '%"+viewdocument.getDocumentType4()+"%' AND upper(document_info.documentType5) LIKE '%"+viewdocument.getDocumentType5()+"%' AND status='quality_approved' AND document_info.upload_date between  '"+createdStart+"' AND '"+createdEnd+"'  group by document_info.document_no";
	    	  } 
	    	  else if(department.equalsIgnoreCase("Direct Tax") && documentype.equalsIgnoreCase("Power of Attorney"))
	    	  {
	    		    query="SELECT document_info.id , document_info.department as department , file_no , file_name , document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND document_info.department='"+department+"' AND  document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND client_details.id ='"+viewdocument.getId()+"'  AND document_info.documentType1 LIKE '%"+viewdocument.getDocumentType1()+"%' AND upper(document_info.documentType2) LIKE '%"+viewdocument.getDocumentType2()+"%' AND  upper(document_info.documentType3) LIKE '%"+viewdocument.getDocumentType3()+"%' AND status='quality_approved'  group by document_info.document_no";
	    	  }
	    	  else if(department.equalsIgnoreCase("Direct Tax") && documentype.equalsIgnoreCase("Notice"))
	    	  {
	    		    query="SELECT document_info.id , document_info.department as department , file_no , file_name ,document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND document_info.department='"+department+"' AND document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND client_details.id ='"+viewdocument.getId()+"'  AND document_info.documentType1 LIKE '%"+viewdocument.getDocumentType1()+"%' AND upper(document_info.documentType2) LIKE '%"+viewdocument.getDocumentType2()+"%' AND  upper(document_info.documentType3) LIKE '%"+viewdocument.getDocumentType3()+"%' AND upper(document_info.documentType4) LIKE '%"+viewdocument.getDocumentType4()+"%' AND upper(document_info.documentType5) LIKE '%"+viewdocument.getDocumentType5()+"%' AND upper(document_info.documentType6) LIKE '%"+viewdocument.getDocumentType6()+"%' AND status='quality_approved' AND document_info.upload_date between '"+createdStart+"' AND '"+createdEnd+"'  group by document_info.document_no";
	    	  }
	    	  else if(department.equalsIgnoreCase("Direct Tax") && documentype.equalsIgnoreCase("Submission"))
	    	  {
	    		    query="SELECT document_info.id ,document_info.department as department , file_no , file_name , document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND document_info.department='"+department+"' AND document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND client_details.id ='"+viewdocument.getId()+"'  AND document_info.documentType1 LIKE '%"+viewdocument.getDocumentType1()+"%' AND upper(document_info.documentType2) LIKE '%"+viewdocument.getDocumentType2()+"%' AND  upper(document_info.documentType3) LIKE '%"+viewdocument.getDocumentType3()+"%' AND upper(document_info.documentType4) LIKE '%"+viewdocument.getDocumentType4()+"%'  AND status='quality_approved' AND document_info.upload_date between '"+createdStart+"' AND '"+createdEnd+"'   group by document_info.document_no";
	    	  }
	    	  else if(department.equalsIgnoreCase("Direct Tax") && documentype.equalsIgnoreCase("Assessment Order"))
	    	  {
	    		   query="SELECT document_info.id , document_info.department as department , file_no , file_name ,document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND document_info.department='"+department+"' AND document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND client_details.id ='"+viewdocument.getId()+"'  AND document_info.documentType1 LIKE '%"+viewdocument.getDocumentType1()+"%' AND upper(document_info.documentType2) LIKE '%"+viewdocument.getDocumentType2()+"%' AND  upper(document_info.documentType3) LIKE '%"+viewdocument.getDocumentType3()+"%' AND upper(document_info.documentType4) LIKE '%"+viewdocument.getDocumentType4()+"%' AND upper(document_info.documentType5) LIKE '%"+viewdocument.getDocumentType5()+"%' AND upper(document_info.documentType6) LIKE '%"+viewdocument.getDocumentType6()+"%' AND status='quality_approved' AND document_info.upload_date between '"+createdStart+"' AND '"+createdEnd+"'  group by document_info.document_no";
	    	  }
	    	  else if(department.equalsIgnoreCase("Direct Tax") && documentype.equalsIgnoreCase("Income Tax Return"))
	    	  {
	    		   query="SELECT document_info.id , document_info.department as department , file_no , file_name ,  document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND document_info.department='"+department+"' AND document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND client_details.id ='"+viewdocument.getId()+"'  AND document_info.documentType1 LIKE '%"+viewdocument.getDocumentType1()+"%' AND upper(document_info.documentType2) LIKE '%"+viewdocument.getDocumentType2()+"%' AND  upper(document_info.documentType3) LIKE '%"+viewdocument.getDocumentType3()+"%' AND upper(document_info.documentType4) LIKE '%"+viewdocument.getDocumentType4()+"%'  AND status='quality_approved' AND document_info.upload_date between '"+createdStart+"' AND '"+createdEnd+"'  group by document_info.document_no";
	    	  }
	    	  else if(department.equalsIgnoreCase("Direct Tax") && documentype.equalsIgnoreCase("Engagement Letter"))
	    	  {
	    		   query="SELECT document_info.id , document_info.department as department , file_no , file_name , document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND document_info.department='"+department+"' AND document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND client_details.id ='"+viewdocument.getId()+"'  AND document_info.documentType1 LIKE '%"+viewdocument.getDocumentType1()+"%' AND upper(document_info.documentType2) LIKE '%"+viewdocument.getDocumentType2()+"%' AND  upper(document_info.documentType3) LIKE '%"+viewdocument.getDocumentType3()+"%' AND status='quality_approved' AND document_info.upload_date between '"+createdStart+"' AND '"+createdEnd+"'  group by document_info.document_no";
	    	  }
	    	  else if(department.equalsIgnoreCase("Statutory Audit") && documentype.equalsIgnoreCase("Confirmations"))
	    	  {
	    		   query="SELECT document_info.id , document_info.department as department , file_no , file_name , document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND document_info.department='"+department+"' AND document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND client_details.id ='"+viewdocument.getId()+"'  AND document_info.documentType1 LIKE '%"+viewdocument.getDocumentType1()+"%' AND upper(document_info.documentType2) LIKE '%"+viewdocument.getDocumentType2()+"%' AND  upper(document_info.documentType3) LIKE '%"+viewdocument.getDocumentType3()+"%' AND status='quality_approved' AND document_info.upload_date between '"+createdStart+"' AND '"+createdEnd+"'  group by document_info.document_no";
	    	  }
	    	  else if(department.equalsIgnoreCase("Statutory Audit") && documentype.equalsIgnoreCase("Minutes"))
	    	  {
	    		   query="SELECT document_info.id , document_info.department as department , file_no , file_name , document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND document_info.department='"+department+"' AND document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND client_details.id ='"+viewdocument.getId()+"'  AND document_info.documentType1 LIKE '%"+viewdocument.getDocumentType1()+"%' AND upper(document_info.documentType2) LIKE '%"+viewdocument.getDocumentType2()+"%' AND  upper(document_info.documentType3) LIKE '%"+viewdocument.getDocumentType3()+"%' AND status='quality_approved'  AND document_info.upload_date between '"+createdStart+"' AND '"+createdEnd+"' group by document_info.document_no";
	    	  }
	    	  else if(department.equalsIgnoreCase("Statutory Audit") && documentype.equalsIgnoreCase("General"))
	    	  {
	    		   query="SELECT document_info.id , document_info.department as department , file_no , file_name , document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND document_info.department='"+department+"' AND document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND client_details.id ='"+viewdocument.getId()+"'  AND document_info.documentType1 LIKE '%"+viewdocument.getDocumentType1()+"%' AND upper(document_info.documentType2) LIKE '%"+viewdocument.getDocumentType2()+"%' AND  upper(document_info.documentType3) LIKE '%"+viewdocument.getDocumentType3()+"%' AND status='quality_approved' AND document_info.upload_date between '"+createdStart+"' AND '"+createdEnd+"'  group by document_info.document_no";
	    	  }
	    	  else if(department.equalsIgnoreCase("Statutory Audit") && documentype.equalsIgnoreCase("Workpaper"))
	    	  {
	    		   query="SELECT document_info.id , document_info.department as department , file_no , file_name , document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND document_info.department='"+department+"' AND document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND client_details.id ='"+viewdocument.getId()+"'  AND document_info.documentType1 LIKE '%"+viewdocument.getDocumentType1()+"%' AND upper(document_info.documentType2) LIKE '%"+viewdocument.getDocumentType2()+"%' AND  upper(document_info.documentType3) LIKE '%"+viewdocument.getDocumentType3()+"%' AND status='quality_approved' AND document_info.upload_date between '"+createdStart+"' AND '"+createdEnd+"' group by document_info.document_no";
	    	  }
	    	  else if(department.equalsIgnoreCase("Statutory Audit") && documentype.equalsIgnoreCase("Financials"))
	    	  {
	    		   query="SELECT document_info.id , document_info.department as department , file_no , file_name ,document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND document_info.department='"+department+"' AND document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND client_details.id ='"+viewdocument.getId()+"'  AND document_info.documentType1 LIKE '%"+viewdocument.getDocumentType1()+"%' AND upper(document_info.documentType2) LIKE '%"+viewdocument.getDocumentType2()+"%' AND  upper(document_info.documentType3) LIKE '%"+viewdocument.getDocumentType3()+"%' AND status='quality_approved' AND document_info.upload_date between '"+createdStart+"' AND '"+createdEnd+"'  group by document_info.document_no";
	    	  }
	    	  else if(department.equalsIgnoreCase("Statutory Audit") && documentype.equalsIgnoreCase("Engegement Letter"))
	    	  {
	    		   query="SELECT document_info.id ,document_info.department as department , file_no , file_name , document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND document_info.department='"+department+"' AND document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND client_details.id ='"+viewdocument.getId()+"'  AND document_info.documentType1 LIKE '%"+viewdocument.getDocumentType1()+"%' AND upper(document_info.documentType2) LIKE '%"+viewdocument.getDocumentType2()+"%' AND  upper(document_info.documentType3) LIKE '%"+viewdocument.getDocumentType3()+"%' AND status='quality_approved' AND document_info.upload_date between '"+createdStart+"' AND '"+createdEnd+"' group by document_info.document_no";
	    	  }
	    	  else if(department.equalsIgnoreCase("Indirect Tax") && documentype.equalsIgnoreCase("Challen"))
	    	  {
	    		    query="SELECT document_info.id , document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id  AND document_info.department='"+department+"' AND document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND  client_details.id ='"+viewdocument.getId()+"'  AND document_info.documentType1 LIKE '%"+viewdocument.getDocumentType1()+"%' AND upper(document_info.documentType2) LIKE '%"+viewdocument.getDocumentType2()+"%' AND  upper(document_info.documentType3) LIKE '%"+viewdocument.getDocumentType3()+"%' AND upper(document_info.documentType4) LIKE '%"+viewdocument.getDocumentType4()+"%' AND upper(document_info.documentType5) LIKE '%"+viewdocument.getDocumentType5()+"%' AND status='quality_approved' AND document_info.upload_date between '"+createdStart+"' AND '"+createdEnd+"' group by document_info.document_no";
	    	  }
	    	  else if(department.equalsIgnoreCase("Indirect Tax") && documentype.equalsIgnoreCase("GSTR-1 Returns"))
	    	  {
	    		    query="SELECT document_info.id ,document_info.department as department , file_no , file_name , document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND document_info.department='"+department+"' AND document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND  client_details.id ='"+viewdocument.getId()+"'  AND document_info.documentType1 LIKE '%"+viewdocument.getDocumentType1()+"%' AND upper(document_info.documentType2) LIKE '%"+viewdocument.getDocumentType2()+"%' AND  upper(document_info.documentType3) LIKE '%"+viewdocument.getDocumentType3()+"%' AND status='quality_approved' AND document_info.upload_date between '"+createdStart+"' AND '"+createdEnd+"'  group by document_info.document_no";
	    	  }
	    	  else if(department.equalsIgnoreCase("Indirect Tax") && documentype.equalsIgnoreCase("Invoice / Docs - Output"))
	    	  {
	    		    query="SELECT document_info.id ,document_info.department as department , file_no , file_name , document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND document_info.department='"+department+"' AND document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND  client_details.id ='"+viewdocument.getId()+"'  AND document_info.documentType1 LIKE '%"+viewdocument.getDocumentType1()+"%' AND upper(document_info.documentType2) LIKE '%"+viewdocument.getDocumentType2()+"%' AND  upper(document_info.documentType3) LIKE '%"+viewdocument.getDocumentType3()+"%' AND  upper(document_info.documentType4) LIKE '%"+viewdocument.getDocumentType4()+"%' AND status='quality_approved' AND document_info.upload_date between '"+createdStart+"' AND '"+createdEnd+"'  group by document_info.document_no";
	    	  }
	    	  else if(department.equalsIgnoreCase("Indirect Tax") && documentype.equalsIgnoreCase("GSTR-3B Returns"))
	    	  {
	    		    query="SELECT document_info.id ,document_info.department as department , file_no , file_name , document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND document_info.department='"+department+"' AND document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND client_details.id ='"+viewdocument.getId()+"'  AND document_info.documentType1 LIKE '%"+viewdocument.getDocumentType1()+"%' AND upper(document_info.documentType2) LIKE '%"+viewdocument.getDocumentType2()+"%' AND  upper(document_info.documentType3) LIKE '%"+viewdocument.getDocumentType3()+"%' AND  upper(document_info.documentType4) LIKE '%"+viewdocument.getDocumentType4()+"%' AND status='quality_approved' AND document_info.upload_date between '"+createdStart+"' AND '"+createdEnd+"'   group by document_info.document_no";
	    	  }
	    	  else if(department.equalsIgnoreCase("Indirect Tax") && documentype.equalsIgnoreCase("Input Detail/Docs/Invoices"))
	    	  {
	    		    query="SELECT document_info.id , document_info.department as department , file_no , file_name ,document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id  AND document_info.department='"+department+"' AND document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND client_details.id ='"+viewdocument.getId()+"'  AND document_info.documentType1 LIKE '%"+viewdocument.getDocumentType1()+"%' AND upper(document_info.documentType2) LIKE '%"+viewdocument.getDocumentType2()+"%' AND  upper(document_info.documentType3) LIKE '%"+viewdocument.getDocumentType3()+"%' AND  upper(document_info.documentType4) LIKE '%"+viewdocument.getDocumentType4()+"%' AND status='quality_approved' AND document_info.upload_date between '"+createdStart+"' AND '"+createdEnd+"'  group by document_info.document_no";
	    	  }
	    	  else if(department.equalsIgnoreCase("Indirect Tax") && documentype.equalsIgnoreCase("E-way Bill"))
	    	  {
	    		   query="SELECT document_info.id , document_info.department as department , file_no , file_name , document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND document_info.department='"+department+"' AND  document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND client_details.id ='"+viewdocument.getId()+"'  AND document_info.documentType1 LIKE '%"+viewdocument.getDocumentType1()+"%' AND upper(document_info.documentType2) LIKE '%"+viewdocument.getDocumentType2()+"%' AND  upper(document_info.documentType3) LIKE '%"+viewdocument.getDocumentType3()+"%' AND upper(document_info.documentType4) LIKE '%"+viewdocument.getDocumentType4()+"%' AND upper(document_info.documentType5) LIKE '%"+viewdocument.getDocumentType5()+"%' AND upper(document_info.documentType6) LIKE '%"+viewdocument.getDocumentType6()+"%' AND status='quality_approved' AND document_info.upload_date between '"+createdStart+"' AND '"+createdEnd+"'  group by document_info.document_no";
	    	  }
	    	  else if(department.equalsIgnoreCase("Indirect Tax") && documentype.equalsIgnoreCase("Refund Forms RFD OS/01A"))
	    	  {
	    		    query="SELECT document_info.id , document_info.department as department , file_no , file_name , document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND document_info.department='"+department+"' AND document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND client_details.id ='"+viewdocument.getId()+"'  AND document_info.documentType1 LIKE '%"+viewdocument.getDocumentType1()+"%' AND upper(document_info.documentType2) LIKE '%"+viewdocument.getDocumentType2()+"%' AND  upper(document_info.documentType3) LIKE '%"+viewdocument.getDocumentType3()+"%' AND  upper(document_info.documentType4) LIKE '%"+viewdocument.getDocumentType4()+"%' AND status='quality_approved'  AND document_info.upload_date between '"+createdStart+"' AND '"+createdEnd+"' group by document_info.document_no";
	    	  }
	    	  else if(department.equalsIgnoreCase("Indirect Tax") && documentype.equalsIgnoreCase("Debit / Credit Note"))
	    	  {
	    		    query="SELECT document_info.id , document_info.department as department , file_no , file_name , document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND document_info.department='"+department+"' AND document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND client_details.id ='"+viewdocument.getId()+"'  AND document_info.documentType1 LIKE '%"+viewdocument.getDocumentType1()+"%' AND upper(document_info.documentType2) LIKE '%"+viewdocument.getDocumentType2()+"%' AND  upper(document_info.documentType3) LIKE '%"+viewdocument.getDocumentType3()+"%' AND  upper(document_info.documentType4) LIKE '%"+viewdocument.getDocumentType4()+"%' AND status='quality_approved' AND document_info.upload_date between '"+createdStart+"' AND '"+createdEnd+"' group by document_info.document_no";
	    	  }
	    	  else if(department.equalsIgnoreCase("People & HR") && documentype.equalsIgnoreCase("Employee Documents"))
	    	  {
	    		   query="SELECT document_info.id , document_info.department as department , file_no , file_name , document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND document_info.department='"+department+"' AND document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND client_details.id ='"+viewdocument.getId()+"'  AND document_info.documentType1 LIKE '%"+viewdocument.getDocumentType1()+"%' AND  document_info.documentType2 LIKE '%"+viewdocument.getDocumentType2()+"%' AND  document_info.documentType3 LIKE '%"+viewdocument.getDocumentType3()+"%'  AND status='quality_approved' group by document_info.document_no";
	    	  }
	    	  else if(department.equalsIgnoreCase("People & HR") && documentype.equalsIgnoreCase("Other"))
	    	  {
	    		    query="SELECT document_info.id , document_info.department as department , file_no , file_name , document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND document_info.department='"+department+"' AND document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND client_details.id ='"+viewdocument.getId()+"'  AND document_info.documentType1 LIKE '%"+viewdocument.getDocumentType1()+"%' AND upper(document_info.documentType2) LIKE '%"+viewdocument.getDocumentType2()+"%' AND status='quality_approved' group by document_info.document_no";
	    	  }
	    	  else if(department.equalsIgnoreCase("People & HR") && documentype.equalsIgnoreCase("Salary Regsiter"))
	    	  {
	    		    query="SELECT document_info.id , document_info.department as department , file_no , file_name , document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND document_info.department='"+department+"' AND document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND client_details.id ='"+viewdocument.getId()+"'  AND document_info.documentType1 LIKE '%"+viewdocument.getDocumentType1()+"%' AND upper(document_info.documentType2) LIKE '%"+viewdocument.getDocumentType2()+"%' AND status='quality_approved'  group by document_info.document_no";
	    	  }
	    	  else if(department.equalsIgnoreCase("Legal") && documentype.equalsIgnoreCase("Contract"))
	    	  {
	    		    query="SELECT document_info.id , document_info.department as department , file_no , file_name , document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND document_info.department='"+department+"' AND document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND client_details.id ='"+viewdocument.getId()+"'  AND document_info.documentType1 LIKE '%"+viewdocument.getDocumentType1()+"%' AND upper(document_info.documentType2) LIKE '%"+viewdocument.getDocumentType2()+"%' AND status='quality_approved' group by document_info.document_no";//AND document_info.upload_date between '"+createdStart+"' AND '"+createdEnd+"'
	    	  }
	    	  else if(department.equalsIgnoreCase("Legal") && documentype.equalsIgnoreCase("Other"))	
	    	  {
	    		    query="SELECT document_info.id , document_info.department as department , file_no , file_name , document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND document_info.department='"+department+"' AND document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND client_details.id ='"+viewdocument.getId()+"'  AND document_info.documentType1 LIKE '%"+viewdocument.getDocumentType1()+"%' AND upper(document_info.documentType2) LIKE '%"+viewdocument.getDocumentType2()+"%' AND status='quality_approved' AND document_info.upload_date between '"+createdStart+"' AND '"+createdEnd+"' group by document_info.document_no";
	    	  }
	    	  else if(department.equalsIgnoreCase("Legal") && documentype.equalsIgnoreCase("Registration"))
	    	  {
	    		    query="SELECT document_info.id , document_info.department as department , file_no , file_name , document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND document_info.department='"+department+"' AND document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND client_details.id ='"+viewdocument.getId()+"'  AND document_info.documentType1 LIKE '%"+viewdocument.getDocumentType1()+"%' AND upper(document_info.documentType2) LIKE '%"+viewdocument.getDocumentType2()+"%' AND upper(document_info.documentType3) LIKE '%"+viewdocument.getDocumentType3()+"%' AND status='quality_approved' AND document_info.upload_date between '"+createdStart+"' AND '"+createdEnd+"' group by document_info.document_no";
	    	  }
	    	  else if(department.equalsIgnoreCase("Sale") && documentype.equalsIgnoreCase("Other"))
	    	  {
	    		    query="SELECT document_info.id , document_info.department as department , file_no , file_name , document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND document_info.department='"+department+"' AND document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND client_details.id ='"+viewdocument.getId()+"'  AND document_info.documentType1 LIKE '%"+viewdocument.getDocumentType1()+"%' AND upper(document_info.documentType2) LIKE '%"+viewdocument.getDocumentType2()+"%' AND status='quality_approved' AND document_info.upload_date between '"+createdStart+"' AND '"+createdEnd+"' group by document_info.document_no";
	    	  }
	    	  else if(department.equalsIgnoreCase("Sale") && documentype.equalsIgnoreCase("Sale(Goods)"))
	    	  {
	   		       query="SELECT document_info.id , document_info.department as department , file_no , file_name , document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND document_info.department='"+department+"' AND  document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND client_details.id ='"+viewdocument.getId()+"'  AND document_info.documentType1 LIKE '%"+viewdocument.getDocumentType1()+"%' AND upper(document_info.documentType2) LIKE '%"+viewdocument.getDocumentType2()+"%' AND  upper(document_info.documentType3) LIKE '%"+viewdocument.getDocumentType3()+"%' AND upper(document_info.documentType4) LIKE '%"+viewdocument.getDocumentType4()+"%' AND upper(document_info.documentType5) LIKE '%"+viewdocument.getDocumentType5()+"%' AND upper(document_info.documentType6) LIKE '%"+viewdocument.getDocumentType6()+"%' AND status='quality_approved' AND document_info.upload_date between '"+createdStart+"' AND '"+createdEnd+"'  group by document_info.document_no";
	    	  }
	    	  else if(department.equalsIgnoreCase("Sale") && documentype.equalsIgnoreCase("Sale(Services)"))
	    	  {
	   		       query="SELECT document_info.id , document_info.department as department , file_no , file_name , document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND document_info.department='"+department+"' AND  document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND client_details.id ='"+viewdocument.getId()+"'  AND document_info.documentType1 LIKE '%"+viewdocument.getDocumentType1()+"%' AND upper(document_info.documentType2) LIKE '%"+viewdocument.getDocumentType2()+"%' AND  upper(document_info.documentType3) LIKE '%"+viewdocument.getDocumentType3()+"%' AND upper(document_info.documentType4) LIKE '%"+viewdocument.getDocumentType4()+"%' AND upper(document_info.documentType5) LIKE '%"+viewdocument.getDocumentType5()+"%' AND upper(document_info.documentType6) LIKE '%"+viewdocument.getDocumentType6()+"%' AND status='quality_approved' AND document_info.upload_date between '"+createdStart+"' AND '"+createdEnd+"'  group by document_info.document_no";
	    	  }
	    	  else if(department.equalsIgnoreCase("Sale") && documentype.equalsIgnoreCase("Customer Registration"))
	    	  {
	     		   query="SELECT document_info.id , document_info.department as department , file_no , file_name , document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND document_info.department='"+department+"' AND document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND client_details.id ='"+viewdocument.getId()+"'  AND document_info.documentType1 LIKE '%"+viewdocument.getDocumentType1()+"%' AND upper(document_info.documentType2) LIKE '%"+viewdocument.getDocumentType2()+"%' AND upper(document_info.documentType3) LIKE '%"+viewdocument.getDocumentType3()+"%' AND status='quality_approved' AND document_info.upload_date between '"+createdStart+"' AND '"+createdEnd+"' group by document_info.document_no";
	    	  }
	    	  else if(department.equalsIgnoreCase("Purchase") && documentype.equalsIgnoreCase("Other"))
	    	  {
	    		   query="SELECT document_info.id , document_info.department as department , file_no , file_name , document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND document_info.department='"+department+"' AND document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND client_details.id ='"+viewdocument.getId()+"'  AND document_info.documentType1 LIKE '%"+viewdocument.getDocumentType1()+"%' AND upper(document_info.documentType2) LIKE '%"+viewdocument.getDocumentType2()+"%' AND status='quality_approved' AND document_info.upload_date between '"+createdStart+"' AND '"+createdEnd+"' group by document_info.document_no";
	    	  }
	    	  else if(department.equalsIgnoreCase("Purchase") && documentype.equalsIgnoreCase("Purchase(Goods)"))
	    	  {
	    	      query="SELECT document_info.id , document_info.department as department , file_no , file_name , document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND document_info.department='"+department+"' AND  document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND client_details.id ='"+viewdocument.getId()+"'  AND document_info.documentType1 LIKE '%"+viewdocument.getDocumentType1()+"%' AND upper(document_info.documentType2) LIKE '%"+viewdocument.getDocumentType2()+"%' AND  upper(document_info.documentType3) LIKE '%"+viewdocument.getDocumentType3()+"%' AND upper(document_info.documentType4) LIKE '%"+viewdocument.getDocumentType4()+"%' AND upper(document_info.documentType5) LIKE '%"+viewdocument.getDocumentType5()+"%' AND upper(document_info.documentType6) LIKE '%"+viewdocument.getDocumentType6()+"%' AND status='quality_approved' AND document_info.upload_date between '"+createdStart+"' AND '"+createdEnd+"'  group by document_info.document_no";
	    	  }
	    	  else if(department.equalsIgnoreCase("Purchase") && documentype.equalsIgnoreCase("Purchase(Services)"))
	    	  {
	    	      query="SELECT document_info.id , document_info.department as department , file_no , file_name , document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND document_info.department='"+department+"' AND  document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND client_details.id ='"+viewdocument.getId()+"'  AND document_info.documentType1 LIKE '%"+viewdocument.getDocumentType1()+"%' AND upper(document_info.documentType2) LIKE '%"+viewdocument.getDocumentType2()+"%' AND  upper(document_info.documentType3) LIKE '%"+viewdocument.getDocumentType3()+"%' AND upper(document_info.documentType4) LIKE '%"+viewdocument.getDocumentType4()+"%' AND upper(document_info.documentType5) LIKE '%"+viewdocument.getDocumentType5()+"%' AND upper(document_info.documentType6) LIKE '%"+viewdocument.getDocumentType6()+"%' AND status='quality_approved' AND document_info.upload_date between '"+createdStart+"' AND '"+createdEnd+"'  group by document_info.document_no";
	    	  }
	    	  else if(department.equalsIgnoreCase("Purchase") && documentype.equalsIgnoreCase("Vendor Registration"))
	    	  {
	    	      query="SELECT document_info.id , document_info.department as department , file_no , file_name , document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND document_info.department='"+department+"' AND  document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND client_details.id ='"+viewdocument.getId()+"'  AND document_info.documentType1 LIKE '%"+viewdocument.getDocumentType1()+"%' AND upper(document_info.documentType2) LIKE '%"+viewdocument.getDocumentType2()+"%' AND  upper(document_info.documentType3) LIKE '%"+viewdocument.getDocumentType3()+"%' AND status='quality_approved' AND document_info.upload_date between '"+createdStart+"' AND '"+createdEnd+"'  group by document_info.document_no";
	    	  }
	    	  else if(department.equalsIgnoreCase("Finance & Accounts") && documentype.equalsIgnoreCase("Audit Report"))
	    	  {
	    	      query="SELECT document_info.id , document_info.department as department , file_no , file_name , document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND document_info.department='"+department+"' AND  document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND client_details.id ='"+viewdocument.getId()+"'  AND document_info.documentType1 LIKE '%"+viewdocument.getDocumentType1()+"%' AND upper(document_info.documentType2) LIKE '%"+viewdocument.getDocumentType2()+"%' AND  upper(document_info.documentType3) LIKE '%"+viewdocument.getDocumentType3()+"%' AND status='quality_approved' AND document_info.upload_date between '"+createdStart+"' AND '"+createdEnd+"'  group by document_info.document_no";
	    	  }
	    	  else if(department.equalsIgnoreCase("Finance & Accounts") && documentype.equalsIgnoreCase("Balance Sheet"))
	    	  {
	    	      query="SELECT document_info.id , document_info.department as department , file_no , file_name , document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND document_info.department='"+department+"' AND  document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND client_details.id ='"+viewdocument.getId()+"'  AND document_info.documentType1 LIKE '%"+viewdocument.getDocumentType1()+"%' AND upper(document_info.documentType2) LIKE '%"+viewdocument.getDocumentType2()+"%' AND  upper(document_info.documentType3) LIKE '%"+viewdocument.getDocumentType3()+"%' AND status='quality_approved' AND document_info.upload_date between '"+createdStart+"' AND '"+createdEnd+"'  group by document_info.document_no";
	    	  }
	    	  else if(department.equalsIgnoreCase("Finance & Accounts") && documentype.equalsIgnoreCase("Other"))
	    	  {
	    	      query="SELECT document_info.id , document_info.department as department , file_no , file_name , document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND document_info.department='"+department+"' AND  document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND client_details.id ='"+viewdocument.getId()+"'  AND document_info.documentType1 LIKE '%"+viewdocument.getDocumentType1()+"%' AND upper(document_info.documentType2) LIKE '%"+viewdocument.getDocumentType2()+"%' AND status='quality_approved' AND document_info.upload_date between '"+createdStart+"' AND '"+createdEnd+"'  group by document_info.document_no";
	   	      }
	    	  else if(department.equalsIgnoreCase("Sale") && documentype.equalsIgnoreCase("Customer Registration"))
	    	  {
	    		    query="SELECT document_info.id , document_info.department as department , file_no , file_name , document_no , document_type , star , sum(ROUND(size , 2)) as sum , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND client_details.id ='"+viewdocument.getId()+"'  AND document_info.document_type LIKE '%"+viewdocument.getDocumenttype()+"%' AND upper(document_info.customer_code) LIKE '%"+customercode+"%' AND  upper(document_info.customer_name) LIKE '%"+customername+"%' AND status='quality_approved' AND document_info.upload_date between  '"+createdStart+"' AND '"+createdEnd+"' group by document_info.document_no";
	    	  }
	    	
	    	  
	    	    
	                	   
	    	   
	    	   
	    	  
	    	  
	    	  
	    	  try(Connection connection=DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query);)
			  {
	    		   ResultSet resultSet=preparedStatement.executeQuery(); 
			       while(resultSet.next())
	    		   {
	    			    ViewDocument viewdoc=new ViewDocument();
	    			    
	    			    if(resultSet.getString("department")==null) {
	    			    	viewdoc.setDepartment("");
		    		    }else {
	    			    	viewdoc.setDepartment(resultSet.getString("department"));
		    		    }
	    			    viewdoc.setFile_no(resultSet.getString("file_no"));
	    			    if(resultSet.getString("file_name")==null) {
	    			    	viewdoc.setFile_name("");
	    	    	    }else {
	    			    	viewdoc.setFile_name(resultSet.getString("file_name"));
	    	    		}
	    			    
	    			    viewdoc.setDocumenttype(resultSet.getString("document_type")); 
	    			    viewdoc.setStar(resultSet.getString("star")); 
	    			    viewdoc.setDocument_size(resultSet.getString("sum")+" " +"MB");
	    			    viewdoc.setUpload_date(resultSet.getString("upload_date"));
	    			    viewdoc.setId(resultSet.getInt("id"));
	    			    viewdoc.setDocument_no("<a href='document.jsp?"+resultSet.getInt("id")+"'>"+resultSet.getString("document_no")+"</a>");
		    		    list.add(viewdoc);
	    			   
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
		      return list;
	    }
	    
	    public boolean bookmarkupdate(ViewDocument viewDocument) {

	    	boolean check = false;
	        String file_no="";
	    	String document_no="";
	    
	    	
	    	DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	    	Date date = new Date();
	    	String current_date=dateFormat.format(date);
		       
	    	
	    	try (Connection connection=DBConnection.openConnection();PreparedStatement preparedStatement = connection
					.prepareStatement("select file_no  , document_no from document_info where id='"+viewDocument.getDocument_info_id()+"'");) {
	    		 ResultSet resultSet=preparedStatement.executeQuery(); 
			     resultSet.next();
			     
			     file_no = resultSet.getString("file_no");
			     document_no = resultSet.getString("document_no");
			     
			     
	    	}catch (SQLException sqlexception) {
				sqlexception.printStackTrace();
			} catch (Exception exception) {
				exception.printStackTrace();
			}	
	    	
	    	try (Connection connection=DBConnection.openConnection();PreparedStatement preparedStatement = connection
					.prepareStatement("UPDATE `document_info` SET `star`=1  , star_date ='"+current_date+"' WHERE  document_no='"+document_no+"'  and file_no='"+file_no+"'");) {
				check = preparedStatement.executeUpdate() > 0;
			} catch (SQLException sqlexception) {
				sqlexception.printStackTrace();
			} catch (Exception exception) {
				exception.printStackTrace();
			}
			
			

			return check;
		}
	    
	    
	    
	    
	    
	    
	    public boolean folderbookmarkupdate(ViewDocument viewDocument) {

	    	boolean check = false;
	        String file_no="";
	    	String document_no="";
	    	String folder_name="";
	    
	    	DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	    	Date date = new Date();
	    	String current_date=dateFormat.format(date);
		     
	    	
	    	try (Connection connection=DBConnection.openConnection();PreparedStatement preparedStatement = connection
					.prepareStatement("select file_no  , document_no , folder_name from document_info where id='"+viewDocument.getDocument_info_id()+"' and folder_name is not null");) {
	    		 ResultSet resultSet=preparedStatement.executeQuery(); 
			     resultSet.next();
			     
			     file_no = resultSet.getString("file_no");
			     document_no = resultSet.getString("document_no");
			     folder_name=resultSet.getString("folder_name");
			     
			     
	    	}catch (SQLException sqlexception) {
				sqlexception.printStackTrace();
			} catch (Exception exception) {
				exception.printStackTrace();
			}	
	    	
	    	try (Connection connection=DBConnection.openConnection();PreparedStatement preparedStatement = connection
					.prepareStatement("UPDATE `document_info` SET `star`=1  , star_date ='"+current_date+"' WHERE  document_no='"+document_no+"'  and file_no='"+file_no+"' and folder_name='"+folder_name+"'");) {
				check = preparedStatement.executeUpdate() > 0;
			} catch (SQLException sqlexception) {
				sqlexception.printStackTrace();
			} catch (Exception exception) {
				exception.printStackTrace();
			}
			
			

			return check;
		}
	    
	    
	    
	    
	    
	    
	    public boolean clienthit(ViewDocument viewDocument) {

	    	
			boolean check = false;
			
			String file_no="";
	    	String document_no="";
	    	
	    	try (Connection connection=DBConnection.openConnection();PreparedStatement preparedStatement = connection
					.prepareStatement("select file_no , document_no , company_id from document_info where id='"+viewDocument.getId()+"'");) {
	    		 ResultSet resultSet=preparedStatement.executeQuery(); 
			     resultSet.next();
			     file_no=resultSet.getString("file_no");
			     document_no=resultSet.getString("document_no");
			     new com.customeradmin.email.Logfile3().logfile(viewDocument.getDid() , resultSet.getInt("company_id") , viewDocument.getEmail() ,"Document Access", "doc" , file_no , document_no);
                 
			     PreparedStatement preparedStatement2 = connection
							.prepareStatement("UPDATE `document_info` SET hit=hit+1 where id='"+viewDocument.getId()+"'");
			    
			     check = preparedStatement2.executeUpdate() > 0; 
			     
	    	}catch (SQLException sqlexception) {
				sqlexception.printStackTrace();
			} catch (Exception exception) {
				exception.printStackTrace();
			}
			

			return check;
		}
	  
	    
	    
	    
	    
	    
	    public boolean uploadphoto(UsercustomerClient usercustomerClient) {
			boolean check=false;
			try (Connection connection=DBConnection.openConnection();PreparedStatement preparedStatement = connection.prepareStatement(
					"UPDATE `client_details` SET `imageupload`='"+usercustomerClient.getUpload()+"' WHERE `id`='"
							+ usercustomerClient.getId() + "'");) {
						check = preparedStatement.executeUpdate()>0;
				if (check) {
					 new com.customerclient.email.LogfileClient().logfile(usercustomerClient.getEmail(), "customer client has been update photo",usercustomerClient.getId(), "client");
				}
			} catch (SQLException sqlexception) {
				sqlexception.getMessage();
			} catch (Exception exception) {
				exception.printStackTrace();
			}
			return check;
		}
	    
	    public boolean removestar(ViewDocument viewDocument) {

	    	boolean check = false;
	        String file_no="";
	    	String document_no="";
	    	
	    	try (Connection connection=DBConnection.openConnection();PreparedStatement preparedStatement = connection
					.prepareStatement("select file_no , document_no from document_info where id='"+viewDocument.getDocument_info_id()+"'");) {
	    		 ResultSet resultSet=preparedStatement.executeQuery(); 
			     if(resultSet.next()) {
			    
			       file_no=resultSet.getString("file_no");
				   document_no=resultSet.getString("document_no");
				 
			     }
			     
			     PreparedStatement preparedStatement2 = connection
							.prepareStatement("UPDATE `document_info` SET `star`=0 WHERE document_no='" + document_no + "' and file_no='"+file_no+"'");
			     check = preparedStatement2.executeUpdate() > 0;      
			     if(check)
			 	 {
					  new com.customerclient.email.LogfileClient().logfile(viewDocument.getEmail(), "Remove Star", viewDocument.getId(), "client");
			          	      
			 	 }
		
	    	}catch (SQLException sqlexception) {
				sqlexception.printStackTrace();
			} catch (Exception exception) {
				exception.printStackTrace();
			}	
	    
	    	return check;
	    }	

	    public boolean addfile(AddFile addfile) {
	    	
	    	boolean check=false;
			
	    	String  customer_num="";
            String file_num="0";
         	try(Connection connection=DBConnection.openConnection(); PreparedStatement preparedStat=connection.prepareStatement("select customer_number from customer_details where id='"+addfile.getCustomer_id()+"'");)
            {
                                                 	
             	    ResultSet resultset=preparedStat.executeQuery();
                    if(resultset.next()){
                      
                       String customer_number=resultset.getString("customer_number");
                       for (int i=0 ;i <customer_number.length(); i++) {
                     	     
            					   if(i==0||i==1||i==2){
            						   
            					   }
            					   else
            					   {
            						   customer_num += customer_number.charAt(i);
            					   }
            				 
            			  }
                  
                    }
                    
                    
                    ResultSet resultdf = preparedStat.executeQuery("select file_no from document_info where company_id='"+addfile.getCustomer_id()+"' order by file_no desc limit 1");
         		    if(resultdf.next()){       
         			  String serial_number=resultdf.getString("file_no");
         			  for (int i=0 ;i<serial_number.length(); i++) 
   				      {
                	     
 					    if(i==0||i==1||i==2||i==3||i==4){
 						   
 						   
 					    }
 					    else
 					    {
 						   file_num  += serial_number.charAt(i);
 						    
 					    }
 				 
 				      }
         	      }		  
   			    
                    
         			 file_num = customer_num+"9"+String.format ("%06d",Integer.parseInt(file_num)+1);	  
             
            
            } catch (SQLException sqlexception) {
        				sqlexception.getMessage();
        	  } catch (Exception exception) {
        				exception.printStackTrace();
          }
	    	
	    	
         	
         	try (Connection connection=DBConnection.openConnection();PreparedStatement preparedStatement = connection.prepareStatement(
					"insert into  document_info(file_name , department , describtion , client_id ,access_level , other_client , company_id , upload_date , file_no , status, client_name) values(?,?,?,?,?,?,?,?,?,?,?)");) {
				   
				 preparedStatement.setString(1, addfile.getFile_name());
		         preparedStatement.setString(2, addfile.getFile_department());
		         preparedStatement.setString(3, addfile.getFile_description());
		         preparedStatement.setInt(4, addfile.getClient_id());
		         preparedStatement.setString(5, addfile.getFile_access_level());
		         preparedStatement.setString(6, addfile.getFile_user_name_id());
		         preparedStatement.setInt(7, addfile.getCustomer_id());
		         long timeNow = Calendar.getInstance().getTimeInMillis();
				 java.sql.Timestamp ts = new java.sql.Timestamp(timeNow);
				 preparedStatement.setTimestamp(8, ts);
				 preparedStatement.setString(9 , file_num);
				 preparedStatement.setString(10 , "quality_approved");
				 preparedStatement.setString(11 , addfile.getClient_name());
				 check = preparedStatement.executeUpdate()>0;
		     
			
			} catch (SQLException sqlexception) {
				sqlexception.getMessage();
			} catch (Exception exception) {
				exception.printStackTrace();
			}
			return check;
		
	    }
	         
	    
	    
	    
	    
	    public boolean updateaddFile(AddFile addfile) {
			boolean check=false;
			try (Connection connection=DBConnection.openConnection();PreparedStatement preparedStatement1 = connection.prepareStatement("select file_name , file_no from document_info where id='"+addfile.getDocument_info_id()+"'");) {
				 
				ResultSet resultSet=preparedStatement1.executeQuery(); 
			    if(resultSet.next()) {
			    
			    	PreparedStatement preparedStatement = connection.prepareStatement("UPDATE document_info SET file_name = ? , describtion = ? , modify_client = ? , access_level = ? , other_client = ? , modify_date=? , modify_client_name = ? WHERE file_no ='"+resultSet.getString("file_no")+"' and file_name ='"+resultSet.getString("file_name")+"'");
					
					 preparedStatement.setString(1, addfile.getFile_name());
			         preparedStatement.setString(2, addfile.getFile_description());
			         preparedStatement.setInt(3, addfile.getClient_id());
			         preparedStatement.setString(4, addfile.getFile_access_level());
			         preparedStatement.setString(5, addfile.getFile_user_name_id());
			         DateFormat df = new SimpleDateFormat("dd/MM/yy");
			         Date date = new Date();
			         preparedStatement.setString(6, df.format(date));
			         preparedStatement.setString(7, addfile.getClient_name());
			         check = preparedStatement.executeUpdate()>0;
			     
			     }
				
			
			} catch (SQLException sqlexception) {
				sqlexception.getMessage();
			} catch (Exception exception) {
				exception.printStackTrace();
			}
			return check;
		
	    }
	       
	    
	    
	    
		public boolean uploaddocument(IndexingUserupload userupload)
		{
			boolean check=false;
			
			String document_no="";
			String file_name="";
			String department="";
			String file_no="";
			String access_level="";
			String descrption="";
			
			boolean condition=false;
	  //========================================Start File Number=================================================================
		   
			
			try(Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM `document_info` WHERE file_no=(select file_no from document_info where id='"+userupload.getDocument_info_id()+"')  GROUP BY document_no order by id desc limit 1");)
			{
				ResultSet resultset=preparedStatement.executeQuery();
				if(resultset.next())
			     {
					
					/*
					  PreparedStatement preparedStatement2 = connection.prepareStatement("select sum(size) as size from document_info where company_id='"+resultset.getString("company_id")+"' and status='quality_approved' group by company_id");
					  ResultSet resultset2=preparedStatement2.executeQuery();
					  resultset2.next();	
					  int size=resultset2.getInt("size");
					  
					  PreparedStatement preparedStatement3 = connection.prepareStatement("select storagedata from customer_details where id='"+resultset.getString("company_id")+"'");
					  ResultSet resultset3=preparedStatement3.executeQuery();
					  resultset3.next();	
					  int storage=resultset3.getInt("storagedata");
					  
					  condition=storage>=size;
					  */
					  
					
					  file_name = resultset.getString("file_name");
					  department = resultset.getString("department");
					  file_no=resultset.getString("file_no");
					  access_level=resultset.getString("access_level");
					  descrption=resultset.getString("describtion");  
					  
					  System.out.println(resultset.getString("document_no"));
					  
					   if(userupload.getValidation()==1)
					   {
						   
						  
						   
							if(resultset.getString("document_no")==null)
							 {
								
								 String file_number=file_no;
	             			     String file_num="";
	             				 for (int i=0 ;i<file_number.length(); i++) 
	             				 {
	                          	     
	           					   if(i==0||i==1||i==2||i==3||i==4){           						   
	           						   
	           					   }
	           					   else
	           					   {
	           						   file_num += file_number.charAt(i);
	           					   }
	           				 
	           				    }
								  
								  document_no=file_num+"0001";
							 }
							 else
							 {							  
							
								 int result=resultset.getInt("document_no");
								 int count=0;
								 int resultcount=result+1;
								 int finalresult=resultcount;
								 
								 while(resultcount > 0) {
										
									    resultcount = resultcount / 10;
										count = count + 1; 
								 }
								 
								 if(count==1)
								 {
									 document_no="000000000"+finalresult;
								 }
								 else if(count==2)
								 {
									 document_no="00000000"+finalresult;
								 }
								 else if(count==3)
								 {  
									
								     document_no="0000000"+finalresult;
								 }
								 else if(count==4)
								 {
									 document_no="000000"+finalresult;
								 }
								 if(count==5)
								 {
								     document_no="00000"+finalresult;
								 }
								 else if(count==6)
							     {      
									 document_no="0000"+finalresult;
								 }
								 else if(count==7)
							     { 
									 document_no="000"+finalresult;
								 }
								 else if(count==8)
							     {
									 document_no="00"+finalresult;
								 }
								 else if(count==9)
							     {
									 document_no="0"+finalresult;
								 }
								  
							 }
					   }
					   else
					   {					  
						     // document_no = String.format ("%10d",resultset.getInt("document_no"));
						     int result=resultset.getInt("document_no");
						     int count=0;
							 int resultcount=result;
							 
							 while(result > 0){
									
								    result = result / 10;
									count = count + 1;
							  
							 }
							 if(count==1)
							 {
							     document_no="000000000"+resultcount;
							 }
							 else if(count==2)
							 {
							     document_no="00000000"+resultcount;
							 }
							 else if(count==3)
							 {
							     document_no="0000000"+resultcount;
							 }
							 else if(count==4)
							 {
							     
								 document_no="000000"+resultcount;
							 }
							 else if(count==5)
							 {
							     
								 document_no="00000"+resultcount;
							 }
							 else if(count==6)
						     {      
								    
									 document_no="0000"+resultcount;
							 }
							 else if(count==7)
						     { 
								
									 document_no="000"+resultcount;
							 }
							 else if(count==8)
						     {
								 
									 document_no="00"+resultcount;
							 }
							 else if(count==9)
						     {
								     
									 document_no="0"+resultcount;
							 }
					   }
					   
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
		
			
			
			
			
		
		
	  //=========================================End File Number=================================================================
			try(Connection connection = DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO `document_info`( `company_id`, `department`, `file`, `size`,`upload_date`,`document_no`,`billing_month`,`attachment_no`,`document_type`, `customer_code`, `customer_name`, `employee_code`, `employee_name`, `date_of_joining`, `invoice_date`, `invoice_number`, `vendor_code`, `vendor_name`,`file_no`,client_id , status , client_name,approved_date,file_name, documentType1 , documentType2 , documentType3 , documentType4 , documentType5 , documentType6 , access_level , describtion) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");) {
	              
				  DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
				  LocalDate localDate = LocalDate.now();
			      
				  preparedStatement.setInt(1,userupload.getCompanyid());
				  
				  preparedStatement.setString(2, department);
				  
				  preparedStatement.setString(3, userupload.getDocumentupload());
				  
				  preparedStatement.setDouble(4,userupload.getSize());
				  long timeNow = Calendar.getInstance().getTimeInMillis();
				  java.sql.Timestamp ts = new java.sql.Timestamp(timeNow);
				  preparedStatement.setTimestamp(5, ts);
				  
				  preparedStatement.setString(6,document_no);
				  Date date = new Date();
				  SimpleDateFormat simpleDateFormatM = new SimpleDateFormat("EEEE");
				  simpleDateFormatM = new SimpleDateFormat("MMMM");
				  SimpleDateFormat simpleDateFormatY = new SimpleDateFormat("EEEE");
				  simpleDateFormatY = new SimpleDateFormat("YYYY");
				  preparedStatement.setString(7, simpleDateFormatM.format(date).toUpperCase()+" , "+simpleDateFormatY.format(date).toUpperCase());
				  
				  preparedStatement.setString(8,userupload.getFilename());	 
				  
				  preparedStatement.setString(9,userupload.getDocumenttype());	 
				  
				  preparedStatement.setString(10,userupload.getCustomercode()); 
				  
				  preparedStatement.setString(11,userupload.getCustomername()); 
				  
				  preparedStatement.setString(12,userupload.getEmployecode()); 
				  
				  preparedStatement.setString(13,userupload.getEmployename()); 
				  
				  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			      java.util.Date udate = sdf.parse(userupload.getJoiningdate());
			      long l = udate.getTime();
			      java.sql.Date sdate = new java.sql.Date(l);
				  preparedStatement.setDate(14,sdate); 
				  
				  if(userupload.getInvoicedate() == null || userupload.getInvoicedate().equals(""))
				  {
					  SimpleDateFormat sdfIn = new SimpleDateFormat("yyyy-MM-dd");
				      java.util.Date udateIn = sdfIn.parse("0001-01-01");
				      long lIn = udateIn.getTime();
				      java.sql.Date sdateIn = new java.sql.Date(lIn);
				      preparedStatement.setDate(15,sdateIn);  
				      
				  }else {
				  
				    SimpleDateFormat sdfIn = new SimpleDateFormat("yyyy-MM-dd");
			        java.util.Date udateIn = sdfIn.parse(userupload.getInvoicedate());
			        long lIn = udateIn.getTime();
			        java.sql.Date sdateIn = new java.sql.Date(lIn);
			        preparedStatement.setDate(15,sdateIn);
				  }
			      
				  preparedStatement.setString(16,userupload.getInvoicenumber()); 
			      preparedStatement.setString(17,userupload.getVendorcode());
			      preparedStatement.setString(18,userupload.getVendorname());
			      preparedStatement.setString(19,file_no);
			      preparedStatement.setInt(20,userupload.getId());
			      preparedStatement.setString(21 , "quality_approved");
			      preparedStatement.setString(22 , userupload.getClient_name());
			      preparedStatement.setString(23 , dtf.format(localDate));
			      preparedStatement.setString(24 , file_name);
			      preparedStatement.setString(25 , userupload.getDocumentType1());
			      preparedStatement.setString(26 , userupload.getDocumentType2());
			      preparedStatement.setString(27 , userupload.getDocumentType3());
			      preparedStatement.setString(28 , userupload.getDocumentType4());
			      preparedStatement.setString(29 , userupload.getDocumentType5());
			      preparedStatement.setString(30 , userupload.getDocumentType6());
			      preparedStatement.setString(31 , access_level);
			      preparedStatement.setString(32 , descrption);
			      
			      
			      check = preparedStatement.executeUpdate()>0;
				  if(check){
				   
					  new com.customeradmin.email.Logfile3().logfile(userupload.getId() , userupload.getCompanyid() , userupload.getEmail() ,"Document Created", "doc" , file_no , document_no);
					    
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
		      return check;
	    
		}
	    
		
		 public boolean trashfolder(IndexingUserupload userupload) {

				boolean check = false;
				try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
						.prepareStatement("select file_no , folder_name  from document_info where folder_name=(select folder_name from document_info where id='"+userupload.getId()+"') and file_no =(select file_no from document_info where id='"+userupload.getId()+"') ");) {
					 ResultSet resultSet=preparedStatement.executeQuery();
					 if(resultSet.next())
					 {
						    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
							Date myDate = formatter.parse(userupload.getCurrentDate());
							Calendar c = Calendar.getInstance();
							c.setTime(myDate);
							c.add(Calendar.DATE, 30);
							String updateDate = formatter.format(c.getTime());
							
							PreparedStatement preparedStatement2 = connection
									.prepareStatement("update document_info set trash='1', deletedate='"+updateDate+"' , trash_date='"+userupload.getCurrentDate()+"' ,  trash_client_name='"+userupload.getClient_name()+"' where file_no='"+resultSet.getString("file_no")+"' and folder_name ='"+resultSet.getString("folder_name")+"'");
						
						 check = preparedStatement2.executeUpdate()>0;
						 
					      if(check){
								new IndexingLogfile().logfile(userupload.getEmail(),"client trash document" , userupload.getDid() , "client");
							}
						 
					 }
					
					
				} catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
				} catch (Exception exception) {
					exception.printStackTrace();
				}

				return check;
			}
		

		 
		 public boolean trashdocument(IndexingUserupload userupload) {

				boolean check = false;
				try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
						.prepareStatement("select file_no , document_no  from document_info where document_no=(select document_no from document_info where id='"+userupload.getId()+"') and file_no =(select file_no from document_info where id='"+userupload.getId()+"') ");) {
					 ResultSet resultSet=preparedStatement.executeQuery();
					 if(resultSet.next())
					 {
						    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
							Date myDate = formatter.parse(userupload.getCurrentDate());
							Calendar c = Calendar.getInstance();
							c.setTime(myDate);
							c.add(Calendar.DATE, 30);
							String updateDate = formatter.format(c.getTime());
						    PreparedStatement preparedStatement2 = connection
									.prepareStatement("update document_info set trash='1', deletedate='"+updateDate+"' , trash_date='"+userupload.getCurrentDate()+"' , trash_client_name='"+userupload.getClient_name()+"' where file_no='"+resultSet.getString("file_no")+"' and document_no ='"+resultSet.getString("document_no")+"'");
						
						 check = preparedStatement2.executeUpdate()>0;
						 
						 if(check){
								new IndexingLogfile().logfile(userupload.getEmail(),"client trash document" , userupload.getDid() , "client");
							}
					 
					 }
					
					
				} catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
				} catch (Exception exception) {
					exception.printStackTrace();
				}

				return check;
			}
		
		 
		 
		 public boolean cronjob(IndexingUserupload userupload) {

				boolean check = false;
				try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
						.prepareStatement("select file_no , document_no , file from document_info where deletedate='"+userupload.getCurrentDate()+"' and trash='1'");) {
					 ResultSet resultSet=preparedStatement.executeQuery();
					 while(resultSet.next())
					 {
						 
				            
				          File file = new File(resultSet.getString("file"));
                          String fileName=file.getName();
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
                          
                        boolean deletefile=new DeleteFile().deletefile_name("softdoc-262410.appspot.com" , file_name);
       				 	
                        PreparedStatement preparedStatement2 = connection
									.prepareStatement("delete from document_info  where file_no='"+resultSet.getString("file_no")+"' and document_no='"+resultSet.getString("document_no")+"'");
						
						 check = preparedStatement2.executeUpdate()>0;
					 }
					
					if(check){
						
						new IndexingLogfile().logfile(userupload.getEmail(),"client delete document" , userupload.getId() , "client");
					  
					}
					
					
				} catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
				} catch (Exception exception) {
					exception.printStackTrace();
				}

				return check;
			}
		

		 
		 
		 
		 
		   
		 public boolean UndoDocument(IndexingUserupload userupload) {

				boolean check = false;
				try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
						.prepareStatement("select file_no , document_no from document_info where id='"+userupload.getId()+"'");) {
					 ResultSet resultSet=preparedStatement.executeQuery();
					 if(resultSet.next())
					 {
					 
						 PreparedStatement preparedStatement2 = connection
									.prepareStatement("update document_info set trash='0' where file_no='"+resultSet.getString("file_no")+"' and document_no ='"+resultSet.getString("document_no")+"'");
						 check = preparedStatement2.executeUpdate()>0;
			
					 
					 }
					
					if(check){
						
						new IndexingLogfile().logfile(userupload.getEmail(),"client trash document" , userupload.getDid() , "client");
					  
					}
					
					
				} catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
				} catch (Exception exception) {
					exception.printStackTrace();
				}

				return check;
			}

		 
		 
		 
		 public boolean UndoFolder(IndexingUserupload userupload) {

				boolean check = false;
				try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
						.prepareStatement("select file_no , folder_name from document_info where id='"+userupload.getId()+"'");) {
					 ResultSet resultSet=preparedStatement.executeQuery();
					 if(resultSet.next())
					 {
					
						 PreparedStatement preparedStatement2 = connection
									.prepareStatement("update document_info set trash='0' where file_no='"+resultSet.getString("file_no")+"' and folder_name='"+resultSet.getString("folder_name")+"'");
						 check = preparedStatement2.executeUpdate()>0;
			
					 
					 }
					
					if(check){
						
						new IndexingLogfile().logfile(userupload.getEmail(),"client trash document" , userupload.getDid() , "client");
					  
					}
					
					
				} catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
				} catch (Exception exception) {
					exception.printStackTrace();
				}

				return check;
			}
		 
		 
		 public boolean UndoFile(IndexingUserupload userupload) {

				boolean check = false;
				try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
						.prepareStatement("select file_no  from document_info where id='"+userupload.getId()+"'");) {
					 ResultSet resultSet=preparedStatement.executeQuery();
					 if(resultSet.next())
					 {
					
						 PreparedStatement preparedStatement2 = connection
									.prepareStatement("update document_info set trash='0' where file_no='"+resultSet.getString("file_no")+"'");
						 check = preparedStatement2.executeUpdate()>0;
			
					 
					 }
					
					if(check){
						
						new IndexingLogfile().logfile(userupload.getEmail(),"client trash document" , userupload.getDid() , "client");
					  
					}
					
					
				} catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
				} catch (Exception exception) {
					exception.printStackTrace();
				}

				return check;
			}
		 
		 
		    public boolean updatedocument(IndexingUserupload userupload)
			{
			
		    	
		      boolean check=false;
		      boolean condition=false;
			     
		      try(Connection connection = DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("select file_no , document_no , file_name , company_id , department , document_type , status  from document_info where id='"+userupload.getDocument_info_id()+"'");) {
			        
		 		         ResultSet resultset=preparedStatement.executeQuery();
				         String file_no="";
				         String document_no="";
				         String company_id="";
				         String department="";
				         String document_type="";
				         String status="";
					     String file_name="";
					     String folder_name="";
					     
					               
				         if(resultset.next())
				         {
				        	 file_no=resultset.getString("file_no");
				             document_no=resultset.getString("document_no");
				             company_id=resultset.getString("company_id");
				             department=resultset.getString("department");
				             document_type=resultset.getString("document_type");
				             status=resultset.getString("status");
				             file_name=resultset.getString("file_name");
				             
				             /*
				               if(resultset.getString("folder_name") !=null) {
				                 folder_name=resultset.getString("folder_name");
					            }
				             */
				             
				            /* 
				              PreparedStatement preparedStatement2 = connection.prepareStatement("select sum(size) as size from document_info where company_id='"+resultset.getString("company_id")+"' and status='quality_approved' group by company_id");
							  ResultSet resultset2=preparedStatement2.executeQuery();
							  resultset2.next();	
							  int size=resultset2.getInt("size");
							  
							  PreparedStatement preparedStatement3 = connection.prepareStatement("select storagedata from customer_details where id='"+resultset.getString("company_id")+"'");
							  ResultSet resultset3=preparedStatement3.executeQuery();
							  resultset3.next();	
							  int storage=resultset3.getInt("storagedata");
							  
							  condition=storage>=size;
							  */
				             
				             
				             
				         }
				         
				              DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
							  LocalDate localDate = LocalDate.now();
						      PreparedStatement preparedStatement2 = connection.prepareStatement("INSERT INTO `document_info` (company_id  , department , file , size , upload_date , document_no , billing_month , attachment_no , document_type ,  customer_code ,  customer_name ,  employee_code ,  employee_name ,  date_of_joining ,  invoice_date , invoice_number, vendor_code, vendor_name , file_no , status , client_id , approved_date , file_name , documentType1 , documentType2 , documentType3 , documentType4 , documentType5 , documentType6) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
				              preparedStatement2.setString(1,company_id);
				  			  preparedStatement2.setString(2, department);
				  			  preparedStatement2.setString(3, userupload.getFile());
				  			  preparedStatement2.setDouble(4,userupload.getSize());
				  			  long timeNow = Calendar.getInstance().getTimeInMillis();
				  			  java.sql.Timestamp ts = new java.sql.Timestamp(timeNow);
				  			  preparedStatement2.setTimestamp(5, ts);
				  			  preparedStatement2.setString(6,document_no);
				  			  Date date = new Date();
				  			  SimpleDateFormat simpleDateFormatM = new SimpleDateFormat("EEEE");
				  			  simpleDateFormatM = new SimpleDateFormat("MMMM");
				  			  SimpleDateFormat simpleDateFormatY = new SimpleDateFormat("EEEE");
				  			  simpleDateFormatY = new SimpleDateFormat("YYYY");
				  			  preparedStatement2.setString(7, simpleDateFormatM.format(date).toUpperCase()+" , "+simpleDateFormatY.format(date).toUpperCase());
				  			  preparedStatement2.setString(8, userupload.getAttachment_count());	 
				  			  preparedStatement2.setString(9, document_type);	 
				  			  preparedStatement2.setString(10, userupload.getCustomercode()); 
				  			  preparedStatement2.setString(11, userupload.getCustomername()); 
				  			  preparedStatement2.setString(12, userupload.getEmployecode()); 
				  			  preparedStatement2.setString(13, userupload.getEmployename()); 
				  			  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				  		      java.util.Date udate = sdf.parse(userupload.getJoiningdate());
				  		      long l = udate.getTime();
				  		      java.sql.Date sdate = new java.sql.Date(l);
				  			  preparedStatement2.setDate(14,sdate); 
				  			  SimpleDateFormat sdfIn = new SimpleDateFormat("yyyy-MM-dd");
				  		      java.util.Date udateIn = sdfIn.parse(userupload.getInvoicedate());
				  		      long lIn = udateIn.getTime();
				  		      java.sql.Date sdateIn = new java.sql.Date(lIn);
				  		      preparedStatement2.setDate(15,sdateIn);  
				  		      preparedStatement2.setString(16,userupload.getInvoicenumber()); 
				  		      preparedStatement2.setString(17,userupload.getVendorcode());
				  		      preparedStatement2.setString(18,userupload.getVendorname());
				  		      preparedStatement2.setString(19,file_no);
				  		      preparedStatement2.setString(20,"quality_approved");
				  		      preparedStatement2.setInt(21,userupload.getId());
				  		      preparedStatement2.setString(22 , dtf.format(localDate));
				  		      preparedStatement2.setString(23 , file_name);
				  		      preparedStatement2.setString(24 , userupload.getDocumentType1());
						      preparedStatement2.setString(25 , userupload.getDocumentType2());
						      preparedStatement2.setString(26 , userupload.getDocumentType3());
						      preparedStatement2.setString(27 , userupload.getDocumentType4());
						      preparedStatement2.setString(28 , userupload.getDocumentType5());
						      preparedStatement2.setString(29 , userupload.getDocumentType6());
						      //preparedStatement2.setString(30 , folder_name);
						      
						      check = preparedStatement2.executeUpdate()>0;
				  			  
				  		 
				  			 if(check){
					                
				  				new com.customeradmin.email.Logfile3().logfile(userupload.getId() , Integer.parseInt(company_id)  , userupload.getEmail() ,"Document Created", "doc" , file_no , document_no);

					            
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
			       
		          return check;
			 
			 }
		    
		    
		    public boolean deletedocument(IndexingUserupload userupload)
			{
				boolean check=false;
				try(Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection.prepareStatement("delete from document_info  where id='"+userupload.getId()+"'");) 
				{
					check = preparedStatement.executeUpdate()>0;
					
				}
				catch(SQLException sqlexception)
				{
					sqlexception.printStackTrace();
				}
				catch(Exception exception)
				{
					exception.printStackTrace();
				}
				return check;
			}
		    
		    
		    
		    public boolean fileupdate(UpdateFile updatefile) {

				boolean check = false;
				try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
						.prepareStatement("select  file_no  from document_info where id='"+updatefile.getDocument_id()+"'");) {
					 ResultSet resultSet=preparedStatement.executeQuery();
					 if(resultSet.next())
					 {
						 PreparedStatement preparedStatement2 = connection
									.prepareStatement("update document_info set file_name='"+updatefile.getFileName()+"' , describtion='"+updatefile.getFileDescribtion()+"'  where file_no='"+resultSet.getString("file_no")+"'");
						 check = preparedStatement2.executeUpdate()>0;
					 }
					 
				} catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
				} catch (Exception exception) {
					exception.printStackTrace();
				}

				return check;
			}

		 
		    
		    
		    public boolean deleteAllDocument(IndexingUserupload userupload)
			{
				boolean check=false;
				
				
				try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
						.prepareStatement("select  file_no , folder_name , file  from document_info where id='"+userupload.getId()+"'");) {
					 ResultSet resultSet=preparedStatement.executeQuery();
					 while(resultSet.next())
					 {
						 
						 
						    String file=resultSet.getString("file");
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
						 
		                 boolean deletefile=new DeleteFile().deletefile_name("softdoc-262410.appspot.com",file_name);
		 				 //new com.customeradmin.email.Logfile3().logfile(userupload.getDid() , resultSet.getInt("company_id")  , userupload.getEmail() ,"Document Deleted", "doc" , resultSet.getString("file_no") , resultSet.getString("document_no"));

		                 PreparedStatement preparedStatement2 = connection
									.prepareStatement("delete from document_info  where file_no='"+resultSet.getString("file_no")+"' and folder_name='"+resultSet.getString("folder_name")+"'");
						 check = preparedStatement2.executeUpdate()>0;

					 }
					
					 
					 
					 
				} catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
				} catch (Exception exception) {
					exception.printStackTrace();
				}

				return check;
			}
		 
		    
		    public boolean addfolder(FileNumber filnumber) {
		    	
		    	
				boolean check=false;
				try (Connection connection=DBConnection.openConnection();PreparedStatement preparedStatement1 = connection.prepareStatement("select  file_name , file_no , department , describtion , access_level  from document_info where id='"+filnumber.getDocument_info_id()+"'")) {
					   
					 ResultSet resultSet=preparedStatement1.executeQuery();
					 resultSet.next();
					 
					 String file_no=resultSet.getString("file_no");
					 String deparment=resultSet.getString("department");
					 String file_name=resultSet.getString("file_name");
					 String access_level="";
					 String descrption=resultSet.getString("describtion");//access_level
					 
				     
					 if(filnumber.getFolder_access_level().equalsIgnoreCase("[]"))
					 {
						access_level=resultSet.getString("access_level");
					 }
					 else{
						 access_level=filnumber.getFolder_access_level();
					 }
					 
					 
					PreparedStatement preparedStatement = connection.prepareStatement(
							"insert into  document_info (folder_name  ,  company_id , client_id , status , client_name , upload_date , file_no , folder_status , department , access_level , other_client , file_name , describtion) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
					 preparedStatement.setString(1, filnumber.getFolder_name());
			         preparedStatement.setInt(2, filnumber.getCustomer_id());
			         preparedStatement.setInt(3, filnumber.getId());
			         preparedStatement.setString(4, "quality_approved");
			         preparedStatement.setString(5, filnumber.getClient_name());
			         long timeNow = Calendar.getInstance().getTimeInMillis();
		  			 java.sql.Timestamp ts = new java.sql.Timestamp(timeNow);
		  			 preparedStatement.setTimestamp(6, ts);
		  			 preparedStatement.setString(7, file_no);
		  			 preparedStatement.setString(8, "folder");
		  			 preparedStatement.setString(9, deparment);
		  			 preparedStatement.setString(10, access_level);
		  			 preparedStatement.setString(11, filnumber.getFolder_user_name());
		  			 preparedStatement.setString(12 , file_name);
		  			 preparedStatement.setString(13 , descrption);
		  			 check = preparedStatement.executeUpdate()>0;
			        
				} catch (SQLException sqlexception) {
					sqlexception.getMessage();
				} catch (Exception exception) {
					exception.printStackTrace();
				}
				return check;
			} 
		    
		    
		    
		    public boolean updateFolder(UpdateFile updatefile) {

				boolean check = false;
				try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
						.prepareStatement("select  folder_name , file_no  from document_info where id='"+updatefile.getDocument_info_id()+"'");) {
					 ResultSet resultSet=preparedStatement.executeQuery();
					 if(resultSet.next())
					 {
						 PreparedStatement preparedStatement2 = connection
									.prepareStatement("update document_info set folder_name='"+updatefile.getFolderName()+"' , access_level='"+updatefile.getAccess_level()+"' , other_client='"+updatefile.getFile_user_name()+"'  where file_no='"+resultSet.getString("file_no")+"' and folder_status='folder' and folder_name='"+resultSet.getString("folder_name")+"'");
						 check = preparedStatement2.executeUpdate()>0;
					 }
					
					
					 
				} catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
				} catch (Exception exception) {
					exception.printStackTrace();
				}

				return check;
			}

		    
		    
		    public boolean folderupload(IndexingUserupload userupload)
			{
				boolean check=false;
				
				String document_no="";
				
				String file_name="";
				String department="";
				String file_no="";
				String access_level="";
				String folder_name="";
				String descrption="";
				
				boolean condition=false;
		  //========================================Start File Number=================================================================
			   
				
				try(Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM `document_info` WHERE file_no=(select file_no from document_info where id='"+userupload.getDocument_info_id()+"')  GROUP BY document_no order by id desc limit 1");)
				{
					ResultSet resultset=preparedStatement.executeQuery();
					if(resultset.next())
				     {
						
						
						PreparedStatement preparedStatement2 = connection.prepareStatement("SELECT folder_name , describtion  FROM `document_info` WHERE id='"+userupload.getDocument_info_id()+"'");
						ResultSet resultset2=preparedStatement2.executeQuery();
					    if(resultset2.next())
					     {
							 folder_name=resultset2.getString("folder_name");  
							 descrption=resultset2.getString("describtion");
						 }
						

						 file_name = resultset.getString("file_name");
						 department = resultset.getString("department");
						 file_no=resultset.getString("file_no");
						 access_level=resultset.getString("access_level");
						
						
						 
						/*
						  PreparedStatement preparedStatement2 = connection.prepareStatement("select sum(size) as size from document_info where company_id='"+resultset.getString("company_id")+"' and status='quality_approved' group by company_id");
						  ResultSet resultset2=preparedStatement2.executeQuery();
						  resultset2.next();	
						  int size=resultset2.getInt("size");
						  
						  PreparedStatement preparedStatement3 = connection.prepareStatement("select storagedata from customer_details where id='"+resultset.getString("company_id")+"'");
						  ResultSet resultset3=preparedStatement3.executeQuery();
						  resultset3.next();	
						  int storage=resultset3.getInt("storagedata");
						  
						  condition=storage>=size;
						*/  
						  
						   if(userupload.getValidation()==1)
						   {
							   
								if(resultset.getString("document_no")==null)
								 {
									
									 String file_number=file_no;
		             			     String file_num="";
		             				 for (int i=0 ;i<file_number.length(); i++) 
		             				 {
		                          	     
		           					   if(i==0||i==1||i==2||i==3||i==4){           						   
		           						   
		           					   }
		           					   else
		           					   {
		           						   file_num += file_number.charAt(i);
		           					   }
		           				 
		           				    }
									  
									  document_no=file_num+"0001";
								 }
								 else
								 {							  
								
									 int result=resultset.getInt("document_no");
									 int count=0;
									 int resultcount=result+1;
									 int finalresult=resultcount;
									 
									 while(resultcount > 0) {
											
										    resultcount = resultcount / 10;
											count = count + 1; 
									 }
									 
									 if(count==1)
									 {
										 document_no="000000000"+finalresult;
									 }
									 else if(count==2)
									 {
										 document_no="00000000"+finalresult;
									 }
									 else if(count==3)
									 {  
										
									     document_no="0000000"+finalresult;
									 }
									 else if(count==4)
									 {
										 document_no="000000"+finalresult;
									 }
									 if(count==5)
									 {
									     document_no="00000"+finalresult;
									 }
									 else if(count==6)
								     {      
										 document_no="0000"+finalresult;
									 }
									 else if(count==7)
								     { 
										 document_no="000"+finalresult;
									 }
									 else if(count==8)
								     {
										 document_no="00"+finalresult;
									 }
									 else if(count==9)
								     {
										 document_no="0"+finalresult;
									 }
									  
								 }
						   }
						   else
						   {					  
							     // document_no = String.format ("%10d",resultset.getInt("document_no"));
							     int result=resultset.getInt("document_no");
							     int count=0;
								 int resultcount=result;
								 
								 while(result > 0){
										
									    result = result / 10;
										count = count + 1;
								  
								 }
								 if(count==1)
								 {
								     document_no="000000000"+resultcount;
								 }
								 else if(count==2)
								 {
								     document_no="00000000"+resultcount;
								 }
								 else if(count==3)
								 {
								     document_no="0000000"+resultcount;
								 }
								 else if(count==4)
								 {
								     
									 document_no="000000"+resultcount;
								 }
								 else if(count==5)
								 {
								     
									 document_no="00000"+resultcount;
								 }
								 else if(count==6)
							     {      
									    
										 document_no="0000"+resultcount;
								 }
								 else if(count==7)
							     { 
									
										 document_no="000"+resultcount;
								 }
								 else if(count==8)
							     {
									 
										 document_no="00"+resultcount;
								 }
								 else if(count==9)
							     {
									     
										 document_no="0"+resultcount;
								 }
						   }
						   
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
			
		    System.out.println(folder_name);
				
		
				
			  //=========================================End File Number=================================================================
				try(Connection connection = DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO `document_info`( `company_id`, `department`, `file`, `size`,`upload_date`,`document_no`,`billing_month`,`attachment_no`,`document_type`, `customer_code`, `customer_name`, `employee_code`, `employee_name`, `date_of_joining`, `invoice_date`, `invoice_number`, `vendor_code`, `vendor_name`,`file_no`,client_id , status , client_name,approved_date,file_name, documentType1 , documentType2 , documentType3 , documentType4 , documentType5 , documentType6 , folder_name , folder_status , access_level , describtion) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");) {
		              
					  DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
					  LocalDate localDate = LocalDate.now();
				      
					  preparedStatement.setInt(1,userupload.getCompanyid());
					  preparedStatement.setString(2, department);
					  preparedStatement.setString(3, userupload.getDocumentupload());
					  preparedStatement.setDouble(4,userupload.getSize());
					  long timeNow = Calendar.getInstance().getTimeInMillis();
					  java.sql.Timestamp ts = new java.sql.Timestamp(timeNow);
					  preparedStatement.setTimestamp(5, ts);
					  preparedStatement.setString(6,document_no);
					  Date date = new Date();
					  SimpleDateFormat simpleDateFormatM = new SimpleDateFormat("EEEE");
					  simpleDateFormatM = new SimpleDateFormat("MMMM");
					  SimpleDateFormat simpleDateFormatY = new SimpleDateFormat("EEEE");
					  simpleDateFormatY = new SimpleDateFormat("YYYY");
					  preparedStatement.setString(7, simpleDateFormatM.format(date).toUpperCase()+" , "+simpleDateFormatY.format(date).toUpperCase());
					  preparedStatement.setString(8,userupload.getFilename());	 
					  preparedStatement.setString(9,userupload.getDocumenttype());	 
					  preparedStatement.setString(10,userupload.getCustomercode()); 
					  preparedStatement.setString(11,userupload.getCustomername()); 
					  preparedStatement.setString(12,userupload.getEmployecode()); 
					  preparedStatement.setString(13,userupload.getEmployename()); 
					  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				      java.util.Date udate = sdf.parse(userupload.getJoiningdate());
				      long l = udate.getTime();
				      java.sql.Date sdate = new java.sql.Date(l);
					  preparedStatement.setDate(14,sdate); 
					  
					  if(userupload.getInvoicedate()==null || userupload.getInvoicedate().equals(""))
					  {
						  SimpleDateFormat sdfIn = new SimpleDateFormat("yyyy-MM-dd");
					      java.util.Date udateIn = sdfIn.parse("0001-01-01");
					      long lIn = udateIn.getTime();
					      java.sql.Date sdateIn = new java.sql.Date(lIn);
					      preparedStatement.setDate(15,sdateIn);  
					      
					  }else {
					  
					    SimpleDateFormat sdfIn = new SimpleDateFormat("yyyy-MM-dd");
				        java.util.Date udateIn = sdfIn.parse(userupload.getInvoicedate());
				        long lIn = udateIn.getTime();
				        java.sql.Date sdateIn = new java.sql.Date(lIn);
				        preparedStatement.setDate(15,sdateIn);
					  }
				      
					  preparedStatement.setString(16,userupload.getInvoicenumber()); 
				      preparedStatement.setString(17,userupload.getVendorcode());
				      preparedStatement.setString(18,userupload.getVendorname());
				      preparedStatement.setString(19, file_no);
				      preparedStatement.setInt(20,userupload.getId());
				      preparedStatement.setString(21 , "quality_approved");
				      preparedStatement.setString(22 , userupload.getClient_name());
				      preparedStatement.setString(23 , dtf.format(localDate));
				      preparedStatement.setString(24 , file_name);
				      preparedStatement.setString(25 , userupload.getDocumentType1());
				      preparedStatement.setString(26 , userupload.getDocumentType2());
				      preparedStatement.setString(27 , userupload.getDocumentType3());
				      preparedStatement.setString(28 , userupload.getDocumentType4());
				      preparedStatement.setString(29 , userupload.getDocumentType5());
				      preparedStatement.setString(30 , userupload.getDocumentType6());
				      preparedStatement.setString(31 , folder_name);
				      preparedStatement.setString(32 , "folder");
				      preparedStatement.setString(33 , access_level);
				      preparedStatement.setString(34 , descrption);
				      
				      
				      check = preparedStatement.executeUpdate()>0;
					  if(check){
					   
						  new com.customeradmin.email.Logfile3().logfile(userupload.getId() , userupload.getCompanyid() , userupload.getEmail() ,"Document Created", "doc" , file_no  ,  document_no);
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
				
			 
		       return check;
		    
			
			
		}
		    
		    
		    public boolean updatefolderdocument(IndexingUserupload userupload)
			{
			
		    	
		      boolean check=false;
		      boolean condition=false;
			     
		      try(Connection connection = DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("select file_no , document_no , file_name , company_id , department , document_type , status , folder_name , folder_status , folder_description from document_info where id='"+userupload.getDocument_info_id()+"'");) {
			        
		 		         ResultSet resultset=preparedStatement.executeQuery();
				         String file_no="";
				         String document_no="";
				         String company_id="";
				         String department="";
				         String document_type="";
				         String status="";
					     String file_name="";
					     String folder_name="";
					     String folder_description="";
					               
				         if(resultset.next())
				         {
				        	 file_no=resultset.getString("file_no");
				             document_no=resultset.getString("document_no");
				             company_id=resultset.getString("company_id");
				             department=resultset.getString("department");
				             document_type=resultset.getString("document_type");
				             status=resultset.getString("status");
				             file_name=resultset.getString("file_name");
				             folder_name=resultset.getString("folder_name");
				             folder_description=resultset.getString("folder_description");
				             
				          
				             
				              PreparedStatement preparedStatement2 = connection.prepareStatement("select sum(size) as size from document_info where company_id='"+resultset.getString("company_id")+"' and status='quality_approved' group by company_id");
							  ResultSet resultset2=preparedStatement2.executeQuery();
							  resultset2.next();	
							  int size=resultset2.getInt("size");
							  
							  PreparedStatement preparedStatement3 = connection.prepareStatement("select storagedata from customer_details where id='"+resultset.getString("company_id")+"'");
							  ResultSet resultset3=preparedStatement3.executeQuery();
							  resultset3.next();	
							  int storage=resultset3.getInt("storagedata");
							  
							  condition=storage>=size;
							  
				             
				             
				             
				         }
				         
				         if(userupload.getDocument_status().equalsIgnoreCase("add_attachment")) {  
			    	         
				           if(condition) {
				        	  
				        	  DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
							  LocalDate localDate = LocalDate.now();
						      PreparedStatement preparedStatement2 = connection.prepareStatement("INSERT INTO `document_info` (company_id  , department , file , size , upload_date , document_no , billing_month , attachment_no , document_type ,  customer_code ,  customer_name ,  employee_code ,  employee_name ,  date_of_joining ,  invoice_date , invoice_number, vendor_code, vendor_name , file_no , status , client_id , approved_date , file_name , documentType1 , documentType2 , documentType3 , documentType4 , documentType5 , documentType6 , folder_name , folder_description,folder_status) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
				              preparedStatement2.setString(1,company_id);
				  			  preparedStatement2.setString(2, department);
				  			  preparedStatement2.setString(3, userupload.getFile());
				  			  preparedStatement2.setDouble(4,userupload.getSize());
				  			  long timeNow = Calendar.getInstance().getTimeInMillis();
				  			  java.sql.Timestamp ts = new java.sql.Timestamp(timeNow);
				  			  preparedStatement2.setTimestamp(5, ts);
				  			  preparedStatement2.setString(6,document_no);
				  			  Date date = new Date();
				  			  SimpleDateFormat simpleDateFormatM = new SimpleDateFormat("EEEE");
				  			  simpleDateFormatM = new SimpleDateFormat("MMMM");
				  			  SimpleDateFormat simpleDateFormatY = new SimpleDateFormat("EEEE");
				  			  simpleDateFormatY = new SimpleDateFormat("YYYY");
				  			  preparedStatement2.setString(7, simpleDateFormatM.format(date).toUpperCase()+" , "+simpleDateFormatY.format(date).toUpperCase());
				  			  preparedStatement2.setString(8, userupload.getAttachment_count());	 
				  			  preparedStatement2.setString(9, document_type);	 
				  			  preparedStatement2.setString(10, userupload.getCustomercode()); 
				  			  preparedStatement2.setString(11, userupload.getCustomername()); 
				  			  preparedStatement2.setString(12, userupload.getEmployecode()); 
				  			  preparedStatement2.setString(13, userupload.getEmployename()); 
				  			  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				  		      java.util.Date udate = sdf.parse(userupload.getJoiningdate());
				  		      long l = udate.getTime();
				  		      java.sql.Date sdate = new java.sql.Date(l);
				  			  preparedStatement2.setDate(14,sdate); 
				  			  SimpleDateFormat sdfIn = new SimpleDateFormat("yyyy-MM-dd");
				  		      java.util.Date udateIn = sdfIn.parse(userupload.getInvoicedate());
				  		      long lIn = udateIn.getTime();
				  		      java.sql.Date sdateIn = new java.sql.Date(lIn);
				  		      preparedStatement2.setDate(15,sdateIn);  
				  		      preparedStatement2.setString(16,userupload.getInvoicenumber()); 
				  		      preparedStatement2.setString(17,userupload.getVendorcode());
				  		      preparedStatement2.setString(18,userupload.getVendorname());
				  		      preparedStatement2.setString(19,file_no);
				  		      preparedStatement2.setString(20,"quality_approved");
				  		      preparedStatement2.setInt(21,userupload.getId());
				  		      preparedStatement2.setString(22 , dtf.format(localDate));
				  		      preparedStatement2.setString(23 , file_name);
				  		      preparedStatement2.setString(24 , userupload.getDocumentType1());
						      preparedStatement2.setString(25 , userupload.getDocumentType2());
						      preparedStatement2.setString(26 , userupload.getDocumentType3());
						      preparedStatement2.setString(27 , userupload.getDocumentType4());
						      preparedStatement2.setString(28 , userupload.getDocumentType5());
						      preparedStatement2.setString(29 , userupload.getDocumentType6());
						      preparedStatement2.setString(30 , folder_name);
						      preparedStatement2.setString(31 , folder_description);
						      preparedStatement2.setString(32 , "folder");
								        		      
				  			  
				  		      check = preparedStatement2.executeUpdate()>0;
				  			  
				  		
				  			 if(check){
					                
				  				new com.customeradmin.email.Logfile3().logfile(userupload.getId() , Integer.parseInt(company_id)  , userupload.getEmail() ,"Document Created", "doc" , file_no , document_no);

					            
				  			 }
				             
				        } 
				  		    
				        }else {
				  			  
				  			  PreparedStatement preparedStatement3 = connection.prepareStatement("update  `document_info` set   `customer_code`=?, `customer_name`=?, `employee_code`=?, `employee_name`=?, `date_of_joining`=?, `invoice_date`=?, `invoice_number`=?, `vendor_code`=?, `vendor_name`=?, documentType1=? , documentType2=? , documentType3=? , documentType4=? , documentType5=? , documentType6=? where document_no='"+document_no+"' and file_no='"+file_no+"'");
				  			   
				  			   preparedStatement3.setString(1,userupload.getCustomercode());
				  			   preparedStatement3.setString(2,userupload.getCustomername());
				  			   preparedStatement3.setString(3,userupload.getEmployecode());
				  			   preparedStatement3.setString(4,userupload.getEmployename());
				  			   SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
				  			   java.util.Date udate1 = sdf1.parse(userupload.getJoiningdate());
				  			   long l1 = udate1.getTime();
				  			   java.sql.Date sdate1 = new java.sql.Date(l1);
				  			   preparedStatement3.setDate(5,sdate1);
				  			   SimpleDateFormat sdfIn1 = new SimpleDateFormat("yyyy-MM-dd");
				  			   java.util.Date udateIn1 = sdfIn1.parse(userupload.getInvoicedate());
				  			   long lIn1 = udateIn1.getTime();
				  			   java.sql.Date sdateIn1 = new java.sql.Date(lIn1);
				  			   preparedStatement3.setDate(6,sdateIn1);  
				  			   preparedStatement3.setString(7,userupload.getInvoicenumber());
				  			   preparedStatement3.setString(8,userupload.getVendorcode());
				  			   preparedStatement3.setString(9,userupload.getVendorname());
				  			   preparedStatement3.setString(10,userupload.getDocumentType1());
				  			   preparedStatement3.setString(11,userupload.getDocumentType2());
				  			   preparedStatement3.setString(12,userupload.getDocumentType3());
				  			   preparedStatement3.setString(13,userupload.getDocumentType4());
				  			   preparedStatement3.setString(14,userupload.getDocumentType5());
				  			   preparedStatement3.setString(15,userupload.getDocumentType6());
				  			   
				  			   
				  			   
				  			   check = preparedStatement3.executeUpdate()>0;
				  			   if(check){
				                
				  				   
				  				 new com.customeradmin.email.Logfile3().logfile(userupload.getId() , Integer.parseInt(company_id)  , userupload.getEmail() ,"Document Modified", "doc" , file_no , document_no);
                                
				  			   
				  			   }
				             
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
			       
		          return check;
			 
			 }    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    public String fetchdepartment(UsercustomerClient usercustomerClient)
		    {   
		    	
		    	  int id=usercustomerClient.getId();
		    	
		    	  try(Connection connection=DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("SELECT  department  FROM `client_details` WHERE `id`='"+id+"'");)
				  {
		    		   ResultSet resultSet=preparedStatement.executeQuery(); 
				       if(resultSet.next())
		    		   {
				    	   String alldepartment="";
				    	   JSONParser jsonParser1 = new JSONParser();
						   JSONArray jsonArray1=(JSONArray)jsonParser1.parse(resultSet.getString("department"));
						   for(Object depat_object : jsonArray1) {
							    JSONObject depat_access_level = (JSONObject) depat_object;
							    
							    if(((String)depat_access_level.get("access_level")).equalsIgnoreCase("Read")) {
							        alldepartment +=(String)depat_access_level.get("department")+":"+depat_access_level.get("access_level")+",";
							    }else {
							    	alldepartment +=(String)depat_access_level.get("department")+",";
							    }
							
						   }
				    	   return alldepartment;	   
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
			      
		    	  return null;
		    }
		   
		    
		    public List<UsercustomerClient> fetchName(UsercustomerClient usercustomerClient)
		    {   
		    	
		    	  
		    	  List<UsercustomerClient> list=new ArrayList<UsercustomerClient>();
		    	  try(Connection connection=DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("SELECT  employee_name , id  , imageupload , emp_email_id  FROM `client_details` WHERE `customer_id`='"+usercustomerClient.getCustomer_id()+"' and id !='"+usercustomerClient.getId()+"' and flag='0'");)
				  {
		    		   ResultSet resultSet=preparedStatement.executeQuery(); 
				       while(resultSet.next())
		    		   {
				    	    UsercustomerClient usercustomerClient1=new UsercustomerClient();
				    	    usercustomerClient1.setName(resultSet.getString("employee_name")); 
				    	    usercustomerClient1.setId(resultSet.getInt("id"));
				    	    usercustomerClient1.setEmail(resultSet.getString("emp_email_id"));
				    	    usercustomerClient1.setUpload(resultSet.getString("imageupload"));
		    			    list.add(usercustomerClient1);
		    			    
		    		   }
				      
				       /*
				       PreparedStatement preparedStatement2 = connection.prepareStatement("SELECT  company_per_email , company_per_name , id , profile_photo  FROM customer_details WHERE id='"+usercustomerClient.getCustomer_id()+"'");
				       ResultSet resultSet2=preparedStatement2.executeQuery();
				       if(resultSet2.next()) {
				    	   
				    	    UsercustomerClient usercustomerClient1=new UsercustomerClient();
				    	    usercustomerClient1.setName(resultSet2.getString("company_per_name")); 
				    	    usercustomerClient1.setId(resultSet2.getInt("id"));
				    	    usercustomerClient1.setEmail(resultSet2.getString("company_per_email"));
				    	    usercustomerClient1.setUpload(resultSet2.getString("profile_photo"));
				    	    usercustomerClient1.setRole("customer_admin");
				    	    list.add(usercustomerClient1);
				    	    
				       }*/
		    		     
			      }
				  catch(SQLException sqlexception)
				  {
					 sqlexception.printStackTrace();
				  }
				  catch(Exception exception)
				  {
					exception.printStackTrace();
				  }
			      
		    	  return list;
		    }
		    
		    
		    
		    
		    
		    public List<AddFile> fetchFileName(AddFile addfile)
		    {   
		    	
		    	
		    	  List<AddFile> list=new ArrayList<AddFile>();    
		    	  String department=addfile.getFile_department();
		    	  JSONParser jsonParser1 = new JSONParser();
				  JSONArray jsonArray1;
				  
				try {
					
					 jsonArray1 = (JSONArray) jsonParser1.parse(department);
					 for(Object depat_object : jsonArray1) {
					  JSONObject depat_access_level = (JSONObject) depat_object;
		    	  
				  try(Connection connection=DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("SELECT id , file_name ,  department , describtion , client_id , access_level , other_client  FROM document_info where company_id='"+addfile.getCustomer_id()+"' and client_id > '0' and trash='0'  and status='quality_approved' and department='"+(String)depat_access_level.get("department")+"' group by file_no");)
				  {
		    		  
		    		  
		    		   ResultSet resultSet=preparedStatement.executeQuery(); 
				       while(resultSet.next())
		    		   {
				    	   
				    	   String access_level=resultSet.getString("access_level");   
				 		   		
				    	    	  JSONParser jsonParser = new JSONParser();
								  JSONArray jsonArray = (JSONArray) jsonParser.parse(access_level);
								  JSONObject access_level1 = null;
								  int client_id=0;
								  String access_permission="";
							    	
								  
								  boolean condition=false;
								  for(Object object : jsonArray) {
								 
									     access_level1 = (JSONObject) object;
	                            	     client_id=Integer.parseInt(access_level1.get("client_id").toString());
									     if(Integer.parseInt(access_level1.get("client_id").toString()) == (long)addfile.getId())
								         {
								         	   condition=true;
								         	   access_permission=(String)access_level1.get("access_level");
										 }
								      
								  }
								 
								  
								  
								  
								  if(condition) {
								
									    	String delete="";
									    	if(access_permission.equalsIgnoreCase("Read")){
									    		
									    			 delete=" <li class='dropdown' style='postion:relative;margin-left:42px;'>" + 
										    	   		"                        <a href='javascript:void(0);' class='dropdown-toggle' data-toggle='dropdown' role='button'>" + 
										    	   		"                            <i  style='color: #6c757d;font-size:42px;position:absolute;top:-15px;left:-26px;'>..</i>" + 
										    	   		"                        </a>" + 
										    	   		"                        <ul class='dropdown-menu'>" + 
										    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
										    	   		"                                    <li style='background-color:#6c757d;'>" + 
										    	   		"                                        <a href='javascript:void(0);' class='' data-id='"+resultSet.getInt("id")+"'>" + 
										    	   		"                                            <div class='menu-info'>" + 
										    	   		"                                                <h4 style='color:#fff;'>Edit</h4>" + 
										    	   		"                                            </div>" + 
										    	   		"                                        </a>" + 
										    	   		"                                    </li>" +
										    	   		"                                 </ul>" + 
										    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
										    	   		"                                    <li style='background-color:#6c757d;'>" + 
										    	   		"                                        <a href='javascript:void(0);' class='' data-id='"+resultSet.getInt("id")+"'>" + 
										    	   		"                                            <div class='menu-info'>" + 
										    	   		"                                                <h4 style='color:#fff';>Delete</h4>" + 
										    	   		"                                            </div>" + 
										    	   		"                                        </a>" + 
										    	   		"                                    </li>" +
										    	   		"                                 </ul>" + 
										    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
										    	   		"                                    <li>" + 
										    	   		"                                        <a href='javascript:void(0);' class='request-access-modal' data-id='"+resultSet.getInt("id")+"'>" + 
										    	   		"                                            <div class='menu-info'>" + 
										    	   		"                                                <h4>Request Access</h4>" + 
										    	   		"                                            </div>" + 
										    	   		"                                        </a>" + 
										    	   		"                                    </li>" +
										    	   		"                                 </ul>" + 
										    	   		"                        </ul>" + 
										    	   		"                    </li>";
									    		
									    	
									    	}else if(access_permission.equalsIgnoreCase("Write")) {
									    	
									    		
									    		 delete=" <li class='dropdown' style='postion:relative;margin-left:42px;'>" + 
										    	   		"                        <a href='javascript:void(0);' class='dropdown-toggle' data-toggle='dropdown' role='button'>" + 
										    	   		"                            <i  style='color: #6c757d;font-size:42px;position:absolute;top:-15px;left:-26px;'>..</i>" + 
										    	   		"                        </a>" + 
										    	   		"                        <ul class='dropdown-menu'>" + 
										    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
										    	   		"                                    <li>" + 
										    	   		"                                        <a href='javascript:void(0);' class='edit-addfile' data-id='"+resultSet.getInt("id")+"'>" + 
										    	   		"                                            <div class='menu-info'>" + 
										    	   		"                                                <h4>Edit</h4>" + 
										    	   		"                                            </div>" + 
										    	   		"                                        </a>" + 
										    	   		"                                    </li>" +
										    	   		"                                 </ul>" + 
										    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
										    	   		"                                    <li>" + 
										    	   		"                                        <a href='javascript:void(0);' class='delete-file' data-id='"+resultSet.getInt("id")+"'>" + 
										    	   		"                                            <div class='menu-info'>" + 
										    	   		"                                                <h4>Delete</h4>" + 
										    	   		"                                            </div>" + 
										    	   		"                                        </a>" + 
										    	   		"                                    </li>" +
										    	   		"                                 </ul>" + 
										    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
										    	   		"                                    <li>" + 
										    	   		"                                        <a href='javascript:void(0);' class='request-access-modal' data-id='"+resultSet.getInt("id")+"'>" + 
										    	   		"                                            <div class='menu-info'>" + 
										    	   		"                                                <h4>Request Access</h4>" + 
										    	   		"                                            </div>" + 
										    	   		"                                        </a>" + 
										    	   		"                                    </li>" +
										    	   		"                                 </ul>" + 
										    	   		"                        </ul>" + 
										    	   		"                    </li>";
									    	
									    	}
									    	
									    	
									        
								    	   AddFile addfile1=new AddFile();
								    	   addfile1.setFile_name("<a href='folderdetails.jsp?"+resultSet.getInt("id")+"'>"+resultSet.getString("file_name")+"</a>"); 
								    	   addfile1.setFile_department(resultSet.getString("department"));
								    	   addfile1.setFile_description(resultSet.getString("describtion"));
								    	   addfile1.setFile_access_level(resultSet.getString("access_level"));
								    	   addfile1.setFile_user_name_id(resultSet.getString("other_client"));
								    	   addfile1.setId(resultSet.getInt("id"));
								    	   addfile1.setAction("<a href='javascript:void(0);' style='text-decoration:none;font-size:29px;font-weight:bolder;color:#000;'>"+delete+"</a>");
								    	   addfile1.setDetail("<a href='javascript:void(0);' style='text-decoration:none;font-size:29px;font-weight:bolder;color:#000;' class='details' data-id='"+resultSet.getInt("id")+"'><i class='material-icons' style='color:#fff ; background-color:#000;border-radius:13px;'>info</i></a>");
								    	   list.add(addfile1);
								    	   
									}
								  
		    		        }
								  
								
				                  PreparedStatement preparedStatement2 = connection.prepareStatement("SELECT id , file_name ,  department , describtion , client_id , access_level , other_client  FROM document_info where company_id='"+addfile.getCustomer_id()+"' and client_id ='"+addfile.getId()+"' and trash='0'  and status='quality_approved' and department='"+(String)depat_access_level.get("department")+"' group by file_no");
								  ResultSet resultSet2=preparedStatement2.executeQuery(); 
							      while(resultSet2.next())
					    		  {
							    	
							    	  
							    		String  client_action=" <li class='dropdown' style='postion:relative;margin-left:42px;'>" + 
									    	   		"                        <a href='javascript:void(0);' class='dropdown-toggle' data-toggle='dropdown' role='button'>" + 
									    	   		"                            <i  style='color: #6c757d;font-size:42px;position:absolute;top:-15px;left:-26px;'>..</i>" + 
									    	   		"                        </a>" + 
									    	   		"                        <ul class='dropdown-menu'>" + 
									    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
									    	   		"                                    <li>" + 
									    	   		"                                        <a href='javascript:void(0);' class='edit-addfile' data-id='"+resultSet2.getInt("id")+"'>" + 
									    	   		"                                            <div class='menu-info'>" + 
									    	   		"                                                <h4>Edit</h4>" + 
									    	   		"                                            </div>" + 
									    	   		"                                        </a>" + 
									    	   		"                                    </li>" +
									    	   		"                                 </ul>" + 
									    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
									    	   		"                                    <li>" + 
									    	   		"                                        <a href='javascript:void(0);' class='delete-file' data-id='"+resultSet2.getInt("id")+"'>" + 
									    	   		"                                            <div class='menu-info'>" + 
									    	   		"                                                <h4>Delete</h4>" + 
									    	   		"                                            </div>" + 
									    	   		"                                        </a>" + 
									    	   		"                                    </li>" +
									    	   		"                                 </ul>" + 
									    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
									    	   		"                                    <li>" + 
									    	   		"                                        <a href='javascript:void(0);' class='request-access-modal' data-id='"+resultSet2.getInt("id")+"'>" + 
									    	   		"                                            <div class='menu-info'>" + 
									    	   		"                                                <h4>Request Access</h4>" + 
									    	   		"                                            </div>" + 
									    	   		"                                        </a>" + 
									    	   		"                                    </li>" +
									    	   		"                                 </ul>" + 
									    	   		"                        </ul>" + 
									    	   		"                    </li>";
							    	  
							   	   AddFile addfile1=new AddFile();
						    	   addfile1.setFile_name("<a href='folderdetails.jsp?"+resultSet2.getInt("id")+"'>"+resultSet2.getString("file_name")+"</a>"); 
						    	   addfile1.setFile_department(resultSet2.getString("department"));
						    	   addfile1.setFile_description(resultSet2.getString("describtion"));
						    	   addfile1.setFile_access_level(resultSet2.getString("access_level"));
						    	   addfile1.setFile_user_name_id(resultSet2.getString("other_client"));
						    	   addfile1.setId(resultSet2.getInt("id"));
						    	   addfile1.setAction("<a href='javascript:void(0);' style='text-decoration:none;font-size:29px;font-weight:bolder;color:#000;'>"+client_action+"</a>");
						    	   addfile1.setDetail("<a href='javascript:void(0);' style='text-decoration:none;font-size:29px;font-weight:bolder;color:#000;' class='details' data-id='"+resultSet2.getInt("id")+"'><i class='material-icons' style='color:#fff ; background-color:#000;border-radius:13px;'>info</i></a>");
						    	   list.add(addfile1);
						    
							    	  
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
				
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}  
		    	  return list;
		    }
		    
		    
		    
		    public boolean deletefile(IndexingUserupload userupload) {

				boolean check = false;
				try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
						.prepareStatement("select file_no , document_no from document_info where id='"+userupload.getId()+"'");) {
					 ResultSet resultSet=preparedStatement.executeQuery();
					 if(resultSet.next())
					 {
						 
						 
						    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
							Date myDate = formatter.parse(userupload.getCurrentDate());
							Calendar c = Calendar.getInstance();
							c.setTime(myDate);
							c.add(Calendar.DATE, 30);
							String updateDate = formatter.format(c.getTime());
						    PreparedStatement preparedStatement2 = connection
									.prepareStatement("update document_info set trash='1'  ,  deletedate='"+updateDate+"' , trash_date='"+userupload.getCurrentDate()+"' , trash_client_name='"+userupload.getClient_name()+"'  where file_no='"+resultSet.getString("file_no")+"'");
						
						 check = preparedStatement2.executeUpdate()>0;
							
					 }
					
					if(check){
						
						new IndexingLogfile().logfile(userupload.getEmail(),"client trash document" , userupload.getDid() , "client");
					  
					}
					
					
				} catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
				} catch (Exception exception) {
					exception.printStackTrace();
				}

				return check;
			}
		    
		    
		    
		    public List<IndexingUserupload> editAddFile(IndexingUserupload userupload) {

				
				List<IndexingUserupload> list=new ArrayList<IndexingUserupload>();     
				try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
						.prepareStatement("select id , file_no , file_name , department , describtion , other_client , access_level from document_info where file_name=(select file_name from document_info where id='"+userupload.getDocument_info_id()+"') and file_no=(select file_no from document_info where id='"+userupload.getDocument_info_id()+"')");) {
					 	ResultSet resultSet=preparedStatement.executeQuery();
					  
					 	
					 	if(resultSet.next())
					    {
						 
					 	
					 			 String access_level=resultSet.getString("access_level");
					 	
					 			 if(!"[]".equals(resultSet.getString("access_level"))) {
					 			 
					 			 JSONParser jsonParser = new JSONParser();
								 JSONArray jsonArray = (JSONArray) jsonParser.parse(access_level);
								 for(Object object : jsonArray) {
									 
									   JSONObject access_level1 = (JSONObject) object;//(int)access_level1.get("client_id")
									   PreparedStatement preparedStatement2 = connection
	     										.prepareStatement("select employee_name , emp_email_id , imageupload from client_details where id='"+access_level1.get("client_id")+"'");
	     							    ResultSet resultSet2=preparedStatement2.executeQuery();
	     								if(resultSet2.next()) {		  
	     							    
	     							    IndexingUserupload userupload1=new IndexingUserupload();
	     							    userupload1.setId(resultSet.getInt("id"));
	     							
	     							    userupload1.setOther_client(Integer.parseInt((String)access_level1.get("client_id")));
	     								userupload1.setFilename(resultSet.getString("file_name"));
	     								userupload1.setDepartmentname(resultSet.getString("department"));
	     								userupload1.setFile_description(resultSet.getString("describtion"));
	     								userupload1.setAccess_level((String)access_level1.get("access_level"));
	     								userupload1.setFile_no(resultSet.getString("file_no"));;
	     								userupload1.setEmployee_name(resultSet2.getString("employee_name"));
	     								userupload1.setEmp_email_id(resultSet2.getString("emp_email_id"));
	     								userupload1.setImageupload(resultSet2.getString("imageupload"));
	     								list.add(userupload1);
	 							 }
					
					 	  }
								 
						
					 }else {
						 
						   
						    IndexingUserupload userupload1=new IndexingUserupload();
						    userupload1.setId(resultSet.getInt("id"));
							userupload1.setAccess_level("");
	     					userupload1.setFilename(resultSet.getString("file_name"));
							userupload1.setDepartmentname(resultSet.getString("department"));
							userupload1.setFile_description(resultSet.getString("describtion"));
							userupload1.setFile_no(resultSet.getString("file_no"));;
							list.add(userupload1);
						 
						 
					 }
								 
							
					 
				 
				 }
					
		  	   } catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
			  } catch (Exception exception) {
					exception.printStackTrace();
			 }

				return list;
			}
	    
	    

		  
		    
		    
		    public List<UsercustomerClient> suggestionName(UsercustomerClient usercustomerClient)
		    {   
		    	
		    	  
		    	  List<UsercustomerClient> list=new ArrayList<UsercustomerClient>();
		    	  try(Connection connection=DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("SELECT  employee_name , id  , imageupload , emp_email_id  FROM `client_details` WHERE `customer_id`='"+usercustomerClient.getCustomer_id()+"' and  employee_name LIKE '%"+usercustomerClient.getSearch_box()+"%' and flag='0'");)
				  {
		    		   ResultSet resultSet=preparedStatement.executeQuery(); 
				       while(resultSet.next())
		    		   {
				    	    UsercustomerClient usercustomerClient1=new UsercustomerClient();
				    	    usercustomerClient1.setName(resultSet.getString("employee_name")); 
				    	    usercustomerClient1.setId(resultSet.getInt("id"));
				    	    usercustomerClient1.setEmail(resultSet.getString("emp_email_id"));
				    	    usercustomerClient1.setUpload(resultSet.getString("imageupload"));
		    			    list.add(usercustomerClient1);
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
			      
		    	  return list;
		    }
		    
		    
		    
		    
		    
		    
		    public boolean requestaccess(RequestAccess requestAccess) {
				boolean check=false;
				
				Date date = new Date();
				String currentDate=new SimpleDateFormat("yyyy-MM-dd").format(date);
				 
				try (Connection connection=DBConnection.openConnection();PreparedStatement preparedStatement = connection.prepareStatement(
						"insert into  requestaccess(access_level  , document_info_id  , client_id , request_date) values(?,?,?,?)");) {
					 
					 preparedStatement.setString(1, requestAccess.getAccess_level());
			         preparedStatement.setInt(2, requestAccess.getDocument_info_id());
			         preparedStatement.setInt(3, requestAccess.getClient_id());
			         preparedStatement.setString(4, currentDate);
			         check = preparedStatement.executeUpdate()>0;
			     
				
				} catch (SQLException sqlexception) {
					sqlexception.getMessage();
				} catch (Exception exception) {
					exception.printStackTrace();
				}
				return check;
			
		    }
		    
		    
		    
		    public List<IndexingUserupload> fileDetails(IndexingUserupload userupload) {

				
				List<IndexingUserupload> list=new ArrayList<IndexingUserupload>();     
				try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
						.prepareStatement("select  client_name  , id , DATE_FORMAT( upload_date ,'%d %b %Y') AS upload_date , modify_client , DATE_FORMAT(modify_date ,'%d %b %Y') AS modify_date , modify_client_name , file_no , file_name ,  other_client , access_level from document_info where file_name=(select file_name from document_info where id='"+userupload.getDocument_info_id()+"') and file_no=(select file_no from document_info where id='"+userupload.getDocument_info_id()+"')");) {
					 	ResultSet resultSet=preparedStatement.executeQuery();
					 	if(resultSet.next())
					    {
							
					 		
					 		if(resultSet.getString("access_level") !=null ) {
						 		
							 	
					 			 String access_level=resultSet.getString("access_level");   
					 			 String access_level_permission="";
					 			 JSONParser jsonParser = new JSONParser();
								 JSONArray jsonArray = (JSONArray) jsonParser.parse(access_level);
								 boolean condition=false;
								 int client_id=0;
								 for(Object object : jsonArray) {
								
									 JSONObject access_level1 = (JSONObject) object;
									 PreparedStatement preparedStatement2 = connection
	     										.prepareStatement("select employee_name , emp_email_id , imageupload from client_details where id='"+Integer.parseInt((String)access_level1.get("client_id"))+"'");
	     							    ResultSet resultSet2=preparedStatement2.executeQuery();
	     								if(resultSet2.next()) {
	     									
	     									access_level_permission +=resultSet2.getString("employee_name")+":"+(String)access_level1.get("access_level")+",";
	     								}
								   
	     								if(Integer.parseInt((String)access_level1.get("client_id")) == userupload.getId()){
	     									condition=true;
	     									client_id=Integer.parseInt((String)access_level1.get("client_id"));
	     								}	
	     								
								 }	 
							
								 	if(condition){
									 
									    IndexingUserupload userupload1=new IndexingUserupload();
	     							    userupload1.setId(resultSet.getInt("id"));
	     							    userupload1.setClient_name(resultSet.getString("client_name"));
	     							    userupload1.setOther_client(client_id);
	     							    userupload1.setAccess_level(access_level_permission);
	     								userupload1.setFile_no(resultSet.getString("file_no"));
	     								userupload1.setCurrentDate(resultSet.getString("upload_date"));
	          							userupload1.setModify_date(resultSet.getString("modify_date"));
	          							userupload1.setModify_name(resultSet.getString("modify_client_name"));
	          							list.add(userupload1);
	          							
									 }else {
										 
										    IndexingUserupload userupload1=new IndexingUserupload();
		     							    userupload1.setId(resultSet.getInt("id"));
		     							    userupload1.setClient_name(resultSet.getString("client_name"));
		     							    //userupload1.setOther_client(Integer.parseInt((String)access_level1.get("client_id")));
		     							    userupload1.setAccess_level(access_level_permission);
		     								userupload1.setFile_no(resultSet.getString("file_no"));
		     								userupload1.setCurrentDate(resultSet.getString("upload_date"));
		          							userupload1.setModify_date(resultSet.getString("modify_date"));
		          							userupload1.setModify_name(resultSet.getString("modify_client_name"));
		          							list.add(userupload1);
										 
									 }
	 				
									 
					           
					 		 }
					 			
					 }
					
		  	   } catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
			  } catch (Exception exception) {
					exception.printStackTrace();
			 }

				return list;
			}
	    
	    
		    
            public List<IndexingUserupload> folderDocumentDetails(IndexingUserupload userupload) {

				
				List<IndexingUserupload> list=new ArrayList<IndexingUserupload>();     
				try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
						.prepareStatement("select  folder_name , client_name  , id , DATE_FORMAT( upload_date ,'%d %b %Y') AS upload_date , modify_client , DATE_FORMAT(modify_date ,'%d %b %Y') AS modify_date , modify_client_name , file_no , file_name ,  other_client , access_level from document_info where folder_name=(select folder_name from document_info where id='"+userupload.getDocument_info_id()+"') and file_no=(select file_no from document_info where id='"+userupload.getDocument_info_id()+"')");) {
					 	ResultSet resultSet=preparedStatement.executeQuery();
					 	if(resultSet.next())
					    {
							
					 		
					 		if(resultSet.getString("access_level") !=null ) {
						 		
							 	
					 			 String access_level=resultSet.getString("access_level");   
					 			 JSONParser jsonParser = new JSONParser();
								 JSONArray jsonArray = (JSONArray) jsonParser.parse(access_level);
								 boolean condition=false;
								 int client_id=0;
								 String access_level_permission="";
						 			
								 for(Object object : jsonArray) {
									 
									 JSONObject access_level1 = (JSONObject) object;
									 PreparedStatement preparedStatement2 = connection
	     										.prepareStatement("select employee_name , emp_email_id , imageupload from client_details where id='"+Integer.parseInt((String)access_level1.get("client_id"))+"'");
	     							    ResultSet resultSet2=preparedStatement2.executeQuery();
	     								if(resultSet2.next()) {
	     									
	     									access_level_permission +=resultSet2.getString("employee_name")+":"+(String)access_level1.get("access_level")+",";
	     								}
								   
	     								if(Integer.parseInt((String)access_level1.get("client_id")) == userupload.getId()){
	     									condition=true;
	     									client_id=Integer.parseInt((String)access_level1.get("client_id"));
	     								}	
									 
	 				
					              }
								 
								 
								 
								 if(condition){
									 
									    IndexingUserupload userupload1=new IndexingUserupload();
	     							    userupload1.setId(resultSet.getInt("id"));
	     							    userupload1.setClient_name(resultSet.getString("client_name"));
	     							    //userupload1.setOther_client(Integer.parseInt((String)access_level1.get("client_id")));
	     							    userupload1.setAccess_level(access_level_permission);
	     								userupload1.setFolder_name(resultSet.getString("folder_name"));
	     								userupload1.setCurrentDate(resultSet.getString("upload_date"));
	          							userupload1.setModify_date(resultSet.getString("modify_date"));
	          							userupload1.setModify_name(resultSet.getString("modify_client_name"));
	          							list.add(userupload1);
	     						        
       							
								 }else {
									 
									    IndexingUserupload userupload1=new IndexingUserupload();
	     							    userupload1.setId(resultSet.getInt("id"));
	     							    userupload1.setClient_name(resultSet.getString("client_name"));
	     							    //userupload1.setOther_client(Integer.parseInt((String)access_level1.get("client_id")));
	     							    userupload1.setAccess_level(access_level_permission);
	     							    userupload1.setFolder_name(resultSet.getString("folder_name"));
	     								userupload1.setCurrentDate(resultSet.getString("upload_date"));
	          							userupload1.setModify_date(resultSet.getString("modify_date"));
	          							userupload1.setModify_name(resultSet.getString("modify_client_name"));
	          							list.add(userupload1);
	          							
								 }
								 
								 
					 		 }
					 			
					 }
					
		  	   } catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
			  } catch (Exception exception) {
					exception.printStackTrace();
			 }

				return list;
			}
	    
	      
            
            
            
            
            
          public List<IndexingUserupload> folderDocumentNoDetails(IndexingUserupload userupload) {
				
				List<IndexingUserupload> list=new ArrayList<IndexingUserupload>();     
				try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
						.prepareStatement("select  file_no , document_no , client_name  , id , DATE_FORMAT( upload_date ,'%d %b %Y') AS upload_date , modify_client , DATE_FORMAT(modify_date ,'%d %b %Y') AS modify_date , modify_client_name , file_no , file_name ,  other_client , access_level from document_info where document_no=(select document_no from document_info where id='"+userupload.getDocument_info_id()+"') and file_no=(select file_no from document_info where id='"+userupload.getDocument_info_id()+"')");) {
					 	ResultSet resultSet=preparedStatement.executeQuery();
					 	if(resultSet.next())
					    {
							
					 		
					 		if(resultSet.getString("access_level") !=null ) {
						 		
							 	
					 			 String access_level=resultSet.getString("access_level");   
					 			 JSONParser jsonParser = new JSONParser();
								 JSONArray jsonArray = (JSONArray) jsonParser.parse(access_level);
								 String access_level_permission="";
								 boolean condition=false;
								 int client_id=0;
							
								 for(Object object : jsonArray) {
									 
									 
									 JSONObject access_level1 = (JSONObject) object;
									 PreparedStatement preparedStatement2 = connection
	     										.prepareStatement("select employee_name , emp_email_id , imageupload from client_details where id='"+Integer.parseInt((String)access_level1.get("client_id"))+"'");
	     							    ResultSet resultSet2=preparedStatement2.executeQuery();
	     								if(resultSet2.next()) {
	     									
	     									access_level_permission +=resultSet2.getString("employee_name")+":"+(String)access_level1.get("access_level")+",";
	     								}
	     								
	     								
	     								if(Integer.parseInt((String)access_level1.get("client_id")) == userupload.getId()){
	     									condition=true;
	     									client_id=Integer.parseInt((String)access_level1.get("client_id"));
	     								}
									 
	 				
					              }
								 
								 
								
								 if(condition){
									 
									    IndexingUserupload userupload1=new IndexingUserupload();
	     							    userupload1.setId(resultSet.getInt("id"));
	     							    userupload1.setClient_name(resultSet.getString("client_name"));
	     							   // userupload1.setOther_client(Integer.parseInt((String)access_level1.get("client_id")));
	     							    userupload1.setAccess_level(access_level_permission);
	     								userupload1.setDocument_no(resultSet.getString("document_no"));
	     								userupload1.setFile_no(resultSet.getString("file_no"));
		     							userupload1.setCurrentDate(resultSet.getString("upload_date"));
	          							userupload1.setModify_date(resultSet.getString("modify_date"));
	          							userupload1.setModify_name(resultSet.getString("modify_client_name"));
	          							list.add(userupload1);
	     						
								 }else {
									 
									    IndexingUserupload userupload1=new IndexingUserupload();
	     							    userupload1.setId(resultSet.getInt("id"));
	     							    userupload1.setClient_name(resultSet.getString("client_name"));
	     							    userupload1.setDocument_no(resultSet.getString("document_no"));
	     								userupload1.setFile_no(resultSet.getString("file_no"));
		     							//userupload1.setOther_client(Integer.parseInt((String)access_level1.get("client_id")));
	     							    userupload1.setAccess_level(access_level_permission);
	     								userupload1.setCurrentDate(resultSet.getString("upload_date"));
	          							userupload1.setModify_date(resultSet.getString("modify_date"));
	          							userupload1.setModify_name(resultSet.getString("modify_client_name"));
	          							list.add(userupload1);
	          					 }
								 
								
								 
								 
					 		 }
					 			
					 }
					
		  	   } catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
			  } catch (Exception exception) {
					exception.printStackTrace();
			 }

				return list;
			}
	    
		    public List<IndexingUserupload> folderdetails(IndexingUserupload indexingUserupload)
		    {   
		    	
		    	  
		    	  List<IndexingUserupload> list=new ArrayList<IndexingUserupload>();
		    	  try(Connection connection=DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("select  id , folder_name , access_level  from document_info where file_no=(select file_no from document_info where id='"+indexingUserupload.getDocument_info_id()+"') and folder_name is not null and folder_status='folder' and trash='0' group by folder_name");)
				  {
		    		   ResultSet resultSet=preparedStatement.executeQuery(); 
				       while(resultSet.next())
		    		   {
				    	   
				    	   String access_level=resultSet.getString("access_level");   
				    	   
				    	   System.out.println(access_level);
				    	   
				    	   
				    	   if(access_level !="[]") {
				    	
				    		   if(!access_level.isEmpty()) {
				    			   
				    			   
				    			   
					    	    	  JSONParser jsonParser = new JSONParser();
									  JSONArray jsonArray = (JSONArray) jsonParser.parse(access_level);
									  JSONObject access_level1 = null;
									  String access_permission="";
								      boolean condition=false;
									  
									  for(Object object : jsonArray) {
									 
										     access_level1 = (JSONObject) object;
										     
										     if(!"".equals((String)access_level1.get("access_level"))) {
										     
									          if(Integer.parseInt(access_level1.get("client_id").toString())==(int)indexingUserupload.getId())
									          {
									         	   condition=true;
									         	   access_permission=(String)access_level1.get("access_level");
											    		        	 
									          }
									         
										 }
									  
									}
				    			   
				    			   
				    			   
				    			   if(condition) {
				    				   
				    				   String action="";
				    				   
				    				   
				    				   if(access_permission.equalsIgnoreCase("Read")){
				    				   		
				    					   
				    					  action=" <li class='dropdown' style='postion:relative;margin-left:42px;'>" + 
									    	   		"                        <a href='javascript:void(0);' class='dropdown-toggle' data-toggle='dropdown' role='button'>" + 
									    	   		"                            <i  style='color: #6c757d;font-size:42px;position:absolute;top:-32px;left:-26px;'>..</i>" + 
									    	   		"                        </a>" + 
									    	   		"                        <ul class='dropdown-menu'>" + 
									    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
									    	   		"                                    <li style='background-color:#6c757d;'>" + 
									    	   		"                                        <a href='javascript:void(0);' class='' data-id='"+resultSet.getInt("id")+"'>" + 
									    	   		"                                            <div class='menu-info'>" + 
									    	   		"                                                <h4 style='color:#fff;'>Edit</h4>" + 
									    	   		"                                            </div>" + 
									    	   		"                                        </a>" + 
									    	   		"                                    </li>" +
									    	   		"                                 </ul>" + 
									    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
									    	   		"                                    <li style='background-color:#6c757d;'>" + 
									    	   		"                                        <a href='javascript:void(0);' class='' data-id='"+resultSet.getInt("id")+"'>" + 
									    	   		"                                            <div class='menu-info'>" + 
									    	   		"                                                <h4 style='color:#fff;'>Delete</h4>" + 
									    	   		"                                            </div>" + 
									    	   		"                                        </a>" + 
									    	   		"                                    </li>" +
									    	   		"                                 </ul>" + 
									    	   		"                           </ul>" + 
									    	   		"                    </li>";
				    				   		
				    				   		
				    				   	}else if(access_permission.equalsIgnoreCase("Write")) {
				    				   		
				    				   		
				    				   	   action= " <li class='dropdown' style='postion:relative;margin-left:42px;'>" + 
									    	   		"                        <a href='javascript:void(0);' class='dropdown-toggle' data-toggle='dropdown' role='button'>" + 
									    	   		"                            <i  style='color: #6c757d;font-size:42px;position:absolute;top:-32px;left:-26px;'>..</i>" + 
									    	   		"                        </a>" + 
									    	   		"                        <ul class='dropdown-menu'>" + 
									    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
									    	   		"                                    <li>" + 
									    	   		"                                        <a href='javascript:void(0);' class='edit-folder' data-id='"+resultSet.getInt("id")+"'>" + 
									    	   		"                                            <div class='menu-info'>" + 
									    	   		"                                                <h4>Edit</h4>" + 
									    	   		"                                            </div>" + 
									    	   		"                                        </a>" + 
									    	   		"                                    </li>" +
									    	   		"                                 </ul>" + 
									    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
									    	   		"                                    <li>" + 
									    	   		"                                        <a href='javascript:void(0);' class='delete-folder' data-id='"+resultSet.getInt("id")+"'>" + 
									    	   		"                                            <div class='menu-info'>" + 
									    	   		"                                                <h4>Delete</h4>" + 
									    	   		"                                            </div>" + 
									    	   		"                                        </a>" + 
									    	   		"                                    </li>" +
									    	   		"                                 </ul>" + 
									    	   		"                           </ul>" + 
									    	   		"                    </li>";
				    				   		
				    				   		
				    				   		
				    				   	}
				    				   
				    				   IndexingUserupload indexingUserupload1=new IndexingUserupload();
							    	   indexingUserupload1.setFolder_name("<a href='folder-view.jsp?"+resultSet.getInt("id")+"'>"+resultSet.getString("folder_name")+"</a>");
							    	   indexingUserupload1.setId(resultSet.getInt("id"));
							    	   String checkbox="<input type='checkbox'  name='delete_folder' value='"+resultSet.getInt("id")+"' id='delete_"+resultSet.getInt("id")+"'><label for='delete_"+resultSet.getInt("id")+"'></label> ";
							    	   indexingUserupload1.setDelete_checkbox(checkbox);
							    	   indexingUserupload1.setDetails("<a href='javascript:void(0);' style='text-decoration:none;font-size:29px;font-weight:bolder;color:#000;' class='details' data-id='"+resultSet.getInt("id")+"'><i class='material-icons' style='color:#fff ; background-color:#000;border-radius:13px;'>info</i></a>");
							    	   indexingUserupload1.setAction(action);
							    	   list.add(indexingUserupload1);
					    			
				    				   
				    				   
				    				   
				    				   
				    			   }else {
				    				   
				    				   
				    				   
				    				   IndexingUserupload indexingUserupload1=new IndexingUserupload();
							    	   indexingUserupload1.setFolder_name("<a href='folder-view.jsp?"+resultSet.getInt("id")+"'>"+resultSet.getString("folder_name")+"</a>");
							    	   indexingUserupload1.setId(resultSet.getInt("id"));
							    	   String checkbox="<input type='checkbox'  name='delete_folder' value='"+resultSet.getInt("id")+"' id='delete_"+resultSet.getInt("id")+"'><label for='delete_"+resultSet.getInt("id")+"'></label> ";
							    	   indexingUserupload1.setDelete_checkbox(checkbox);
							    	   indexingUserupload1.setDetails("<a href='javascript:void(0);' style='text-decoration:none;font-size:29px;font-weight:bolder;color:#000;' class='details' data-id='"+resultSet.getInt("id")+"'><i class='material-icons' style='color:#fff ; background-color:#000;border-radius:13px;'>info</i></a>");
							    	   String action=" <li class='dropdown' style='postion:relative;margin-left:42px;'>" + 
								    	   		"                        <a href='javascript:void(0);' class='dropdown-toggle' data-toggle='dropdown' role='button'>" + 
								    	   		"                            <i  style='color: #6c757d;font-size:42px;position:absolute;top:-32px;left:-26px;'>..</i>" + 
								    	   		"                        </a>" + 
								    	   		"                        <ul class='dropdown-menu'>" + 
								    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
								    	   		"                                    <li>" + 
								    	   		"                                        <a href='javascript:void(0);' class='edit-folder' data-id='"+resultSet.getInt("id")+"'>" + 
								    	   		"                                            <div class='menu-info'>" + 
								    	   		"                                                <h4>Edit</h4>" + 
								    	   		"                                            </div>" + 
								    	   		"                                        </a>" + 
								    	   		"                                    </li>" +
								    	   		"                                 </ul>" + 
								    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
								    	   		"                                    <li>" + 
								    	   		"                                        <a href='javascript:void(0);' class='delete-folder' data-id='"+resultSet.getInt("id")+"'>" + 
								    	   		"                                            <div class='menu-info'>" + 
								    	   		"                                                <h4>Delete</h4>" + 
								    	   		"                                            </div>" + 
								    	   		"                                        </a>" + 
								    	   		"                                    </li>" +
								    	   		"                                 </ul>" + 
								    	   		"                           </ul>" + 
								    	   		"                    </li>";
							    	   
							    	   indexingUserupload1.setAction(action);
							    	   list.add(indexingUserupload1);
					    			
				    				   
				    				   
				    				   
				    				   
				    				   
				    				   
				    				   
				    				   
				    				   
				    				   
				    			   }
				    			   
				    			   
				    		   }else {
				    			   
				    			   IndexingUserupload indexingUserupload1=new IndexingUserupload();
						    	   indexingUserupload1.setFolder_name("<a href='folder-view.jsp?"+resultSet.getInt("id")+"'>"+resultSet.getString("folder_name")+"</a>");
						    	   indexingUserupload1.setId(resultSet.getInt("id"));
						    	   String checkbox="<input type='checkbox'  name='delete_folder' value='"+resultSet.getInt("id")+"' id='delete_"+resultSet.getInt("id")+"'><label for='delete_"+resultSet.getInt("id")+"'></label> ";
						    	   indexingUserupload1.setDelete_checkbox(checkbox);
						    	   indexingUserupload1.setDetails("<a href='javascript:void(0);' style='text-decoration:none;font-size:29px;font-weight:bolder;color:#000;' class='details' data-id='"+resultSet.getInt("id")+"'><i class='material-icons' style='color:#fff ; background-color:#000;border-radius:13px;'>info</i></a>");
						    	   String action=" <li class='dropdown' style='postion:relative;margin-left:42px;'>" + 
							    	   		"                        <a href='javascript:void(0);' class='dropdown-toggle' data-toggle='dropdown' role='button'>" + 
							    	   		"                            <i  style='color: #6c757d;font-size:42px;position:absolute;top:-32px;left:-26px;'>..</i>" + 
							    	   		"                        </a>" + 
							    	   		"                        <ul class='dropdown-menu'>" + 
							    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
							    	   		"                                    <li>" + 
							    	   		"                                        <a href='javascript:void(0);' class='edit-folder' data-id='"+resultSet.getInt("id")+"'>" + 
							    	   		"                                            <div class='menu-info'>" + 
							    	   		"                                                <h4>Edit</h4>" + 
							    	   		"                                            </div>" + 
							    	   		"                                        </a>" + 
							    	   		"                                    </li>" +
							    	   		"                                 </ul>" + 
							    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
							    	   		"                                    <li>" + 
							    	   		"                                        <a href='javascript:void(0);' class='delete-folder' data-id='"+resultSet.getInt("id")+"'>" + 
							    	   		"                                            <div class='menu-info'>" + 
							    	   		"                                                <h4>Delete</h4>" + 
							    	   		"                                            </div>" + 
							    	   		"                                        </a>" + 
							    	   		"                                    </li>" +
							    	   		"                                 </ul>" + 
							    	   		"                           </ul>" + 
							    	   		"                    </li>";
						    	   
						    	   indexingUserupload1.setAction(action);
						    	   list.add(indexingUserupload1);
				    			   
				    			   
				    			   
				    		   }
				    		   
				    		    
				    		   
				    		   
				    		   
				    	   }else {
				    		   
				    		   IndexingUserupload indexingUserupload1=new IndexingUserupload();
					    	   indexingUserupload1.setFolder_name("<a href='folder-view.jsp?"+resultSet.getInt("id")+"'>"+resultSet.getString("folder_name")+"</a>");
					    	   indexingUserupload1.setId(resultSet.getInt("id"));
					    	   String checkbox="<input type='checkbox'  name='delete_folder' value='"+resultSet.getInt("id")+"' id='delete_"+resultSet.getInt("id")+"'><label for='delete_"+resultSet.getInt("id")+"'></label> ";
					    	   indexingUserupload1.setDelete_checkbox(checkbox);
					    	   indexingUserupload1.setDetails("<a href='javascript:void(0);' style='text-decoration:none;font-size:29px;font-weight:bolder;color:#000;' class='details' data-id='"+resultSet.getInt("id")+"'><i class='material-icons' style='color:#fff ; background-color:#000;border-radius:13px;'>info</i></a>");
					    	   String action=" <li class='dropdown' style='postion:relative;margin-left:42px;'>" + 
						    	   		"                        <a href='javascript:void(0);' class='dropdown-toggle' data-toggle='dropdown' role='button'>" + 
						    	   		"                            <i  style='color: #6c757d;font-size:42px;position:absolute;top:-32px;left:-26px;'>..</i>" + 
						    	   		"                        </a>" + 
						    	   		"                        <ul class='dropdown-menu'>" + 
						    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
						    	   		"                                    <li>" + 
						    	   		"                                        <a href='javascript:void(0);' class='edit-folder' data-id='"+resultSet.getInt("id")+"'>" + 
						    	   		"                                            <div class='menu-info'>" + 
						    	   		"                                                <h4>Edit</h4>" + 
						    	   		"                                            </div>" + 
						    	   		"                                        </a>" + 
						    	   		"                                    </li>" +
						    	   		"                                 </ul>" + 
						    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
						    	   		"                                    <li>" + 
						    	   		"                                        <a href='javascript:void(0);' class='delete-folder' data-id='"+resultSet.getInt("id")+"'>" + 
						    	   		"                                            <div class='menu-info'>" + 
						    	   		"                                                <h4>Delete</h4>" + 
						    	   		"                                            </div>" + 
						    	   		"                                        </a>" + 
						    	   		"                                    </li>" +
						    	   		"                                 </ul>" + 
						    	   		"                           </ul>" + 
						    	   		"                    </li>";
					    	   
					    	   indexingUserupload1.setAction(action);
					    	   list.add(indexingUserupload1);
			    			
				    	   }
				    	   
				    	   
				    	   
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
			      
		    	  return list;
		    }
		    
		    
		    
		    
		    
            public List<IndexingUserupload> singlefetchfolder(IndexingUserupload userupload) {

				
				List<IndexingUserupload> list=new ArrayList<IndexingUserupload>();     
				try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
						.prepareStatement("select id , folder_name ,  other_client , access_level from document_info where folder_name=(select folder_name from document_info where id='"+userupload.getDocument_info_id()+"') and file_no=(select file_no from document_info where id='"+userupload.getDocument_info_id()+"')");) {
					 	ResultSet resultSet=preparedStatement.executeQuery();
					  
					 	
					 	if(resultSet.next())
					    {
						 
					 		if(resultSet.getString("access_level") !=null ) {
						 		
							 	
					 			 if(!"[]".equals(resultSet.getString("access_level"))) {
					 			
					 			 String access_level=resultSet.getString("access_level");   
					 			 JSONParser jsonParser = new JSONParser();
								 JSONArray jsonArray = (JSONArray) jsonParser.parse(access_level);
								 for(Object object : jsonArray) {
									 
									 
									   JSONObject access_level1 = (JSONObject) object;//(int)access_level1.get("client_id")
									   PreparedStatement preparedStatement2 = connection
	     										.prepareStatement("select employee_name , emp_email_id , imageupload from client_details where id='"+access_level1.get("client_id")+"'");
	     							    ResultSet resultSet2=preparedStatement2.executeQuery();
	     								if(resultSet2.next()) {		  
	     							    
	     							   IndexingUserupload userupload1=new IndexingUserupload();
	     							    userupload1.setId(resultSet.getInt("id"));
	     							    userupload1.setOther_client(Integer.parseInt((String)access_level1.get("client_id")));
	     								userupload1.setFolder_name(resultSet.getString("folder_name"));
	         							userupload1.setAccess_level((String)access_level1.get("access_level"));
	     								userupload1.setEmployee_name(resultSet2.getString("employee_name"));
	     								userupload1.setEmp_email_id(resultSet2.getString("emp_email_id"));
	     								userupload1.setImageupload(resultSet2.getString("imageupload"));
	     								list.add(userupload1);
	 							 }
					
					 	  }
							
					  }else {
					 		
							 
						  IndexingUserupload userupload1=new IndexingUserupload();
						  userupload1.setId(resultSet.getInt("id"));
						  userupload1.setFolder_name(resultSet.getString("folder_name"));
						  list.add(userupload1);
				
					 		
					 	}	 
					
			      }
				 
			  }
					
		  	   } catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
			  } catch (Exception exception) {
					exception.printStackTrace();
			 }

				return list;
			}
	    
		    

            
            
            
            
            
            
            
public List<IndexingUserupload> singlefetchdocument(IndexingUserupload userupload) {

				
				List<IndexingUserupload> list=new ArrayList<IndexingUserupload>();     
				try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
						.prepareStatement("select id , document_no ,  other_client , access_level from document_info where document_no=(select document_no from document_info where id='"+userupload.getDocument_info_id()+"') and file_no=(select file_no from document_info where id='"+userupload.getDocument_info_id()+"')");) {
					 	ResultSet resultSet=preparedStatement.executeQuery();
					 	
					 	if(resultSet.next())
					    {
						 	if(resultSet.getString("access_level") !=null ) {
						 		
							 	 String access_level=resultSet.getString("access_level");   
					 			 JSONParser jsonParser = new JSONParser();
								 JSONArray jsonArray = (JSONArray) jsonParser.parse(access_level);
								 for(Object object : jsonArray) {
									 
									 
									   JSONObject access_level1 = (JSONObject) object;//(int)access_level1.get("client_id")
									   PreparedStatement preparedStatement2 = connection
	     										.prepareStatement("select employee_name , emp_email_id , imageupload from client_details where id='"+access_level1.get("client_id")+"'");
	     							    ResultSet resultSet2=preparedStatement2.executeQuery();
	     								if(resultSet2.next()) {		  
	     							    
	     							   IndexingUserupload userupload1=new IndexingUserupload();
	     							    userupload1.setId(resultSet.getInt("id"));
	     							    userupload1.setOther_client(Integer.parseInt((String)access_level1.get("client_id")));
	     								userupload1.setAccess_level((String)access_level1.get("access_level"));
	     								userupload1.setEmployee_name(resultSet2.getString("employee_name"));
	     								userupload1.setEmp_email_id(resultSet2.getString("emp_email_id"));
	     								userupload1.setImageupload(resultSet2.getString("imageupload"));
	     								list.add(userupload1);
	 							 }
					
					 	  }
							
					  }
							
				   }
					
		  	   } catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
			  } catch (Exception exception) {
					exception.printStackTrace();
			 }

				return list;
			}
	    
            
            
            
            
            
            
            
            public List<IndexingUserupload> fetchdocumenttype(IndexingUserupload userupload) {

            	
				
				List<IndexingUserupload> list=new ArrayList<IndexingUserupload>();     
				try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
						.prepareStatement("select department from document_info where id='"+userupload.getDocument_info_id()+"'");) {
					 	ResultSet resultSet=preparedStatement.executeQuery();
					 	
					 	if(resultSet.next())
					    {
						 
					 		PreparedStatement preparedStatement2 = connection
     										.prepareStatement("select document_type  from document_type where department ='"+resultSet.getString("department")+"' and industry='"+userupload.getIndustry()+"'");
     							    ResultSet resultSet2=preparedStatement2.executeQuery();
     							    if(resultSet2.next()) {		  
     							    
     							       IndexingUserupload userupload1=new IndexingUserupload();
     							      userupload1.setDocumenttype(resultSet2.getString("document_type"));
     								  list.add(userupload1);
                     		}
							
					 }
					
		  	   } catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
			  } catch (Exception exception) {
					exception.printStackTrace();
			 }

				return list;
			}
            
            

            
            public List<IndexingUserupload> folderDocumentType(IndexingUserupload indexingUserupload)
		    {   
		    	 
            	  List<IndexingUserupload> list=new ArrayList<IndexingUserupload>();
		    	  try(Connection connection=DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("select id , document_type , document_no , access_level from document_info where file_no=(select file_no from document_info where id='"+indexingUserupload.getDocument_info_id()+"') and folder_name=(select folder_name from document_info where id='"+indexingUserupload.getDocument_info_id()+"') and trash='0' and folder_status='folder' and document_no is not null  group by document_no");)
				  {
		    		   ResultSet resultSet=preparedStatement.executeQuery(); 
				       while(resultSet.next())
		    		   {
				    	   
				    	   
				    	   String access_level=resultSet.getString("access_level");   
				    	   if(access_level !=null) {
				    		
				    		   
				    		   if(!access_level.isEmpty()) {
				    			   
				    			   
				    			   
				    		    	  JSONParser jsonParser = new JSONParser();
									  JSONArray jsonArray = (JSONArray) jsonParser.parse(access_level);
									  JSONObject access_level1 = null;
									  String client_id="";
									  String access_permission="";
								    	
									  
									  boolean condition=false;
									  for(Object object : jsonArray) {
									 
										     access_level1 = (JSONObject) object;
									         client_id=(String)access_level1.get("client_id");
									         if(Integer.parseInt(client_id)==(int)indexingUserupload.getId())
									         {
									         	   condition=true;
									         	   access_permission=(String)access_level1.get("access_level");
											    		        	 
									         }
									         
									      
									  }
				    			
				    			   
									  if(condition) {
										  
										  String action=""; 
										  
										  if(access_permission.equalsIgnoreCase("Read")){
											  
										  
											  action=" <li class='dropdown' style='postion:relative;margin-left:42px;'>" + 
										    	   		"                        <a href='javascript:void(0);' class='dropdown-toggle' data-toggle='dropdown' role='button'>" + 
										    	   		"                            <i  style='color: #6c757d;font-size:42px;position:absolute;top:-32px;left:-26px;'>..</i>" + 
										    	   		"                        </a>" + 
										    	   		"                        <ul class='dropdown-menu'>" + 
										    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
										    	   		"                                    <li>" + 
										    	   		"                                        <a href='javascript:void(0);' class='start-folder' data-id='"+resultSet.getInt("id")+"'>" + 
										    	   		"                                            <div class='menu-info'>" + 
										    	   		"                                                <h4>Star</h4>" + 
										    	   		"                                            </div>" + 
										    	   		"                                        </a>" + 
										    	   		"                                    </li>" +
										    	   		"                                 </ul>" + 
										    	   		"                           </ul>" + 
										    	   		"                    </li>";
											  
											  
										  }else if(access_permission.equalsIgnoreCase("Write")) {
										  
											  
											   action=" <li class='dropdown' style='postion:relative;margin-left:42px;'>" + 
										    	   		"                        <a href='javascript:void(0);' class='dropdown-toggle' data-toggle='dropdown' role='button'>" + 
										    	   		"                            <i  style='color: #6c757d;font-size:42px;position:absolute;top:-32px;left:-26px;'>..</i>" + 
										    	   		"                        </a>" + 
										    	   		"                        <ul class='dropdown-menu'>" + 
										    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
										    	   		"                                    <li>" + 
										    	   		"                                        <a href='javascript:void(0);' class='start-folder' data-id='"+resultSet.getInt("id")+"'>" + 
										    	   		"                                            <div class='menu-info'>" + 
										    	   		"                                                <h4>Star</h4>" + 
										    	   		"                                            </div>" + 
										    	   		"                                        </a>" + 
										    	   		"                                    </li>" +
										    	   		"                                 </ul>" + 
										    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
										    	   		"                                    <li>" + 
										    	   		"                                        <a href='javascript:void(0);' class='delete-folder-documentType' data-id='"+resultSet.getInt("id")+"'>" + 
										    	   		"                                            <div class='menu-info'>" + 
										    	   		"                                                <h4>Move</h4>" + 
										    	   		"                                            </div>" + 
										    	   		"                                        </a>" + 
										    	   		"                                    </li>" +
										    	   		"                                 </ul>" + 
										    	 /*  		"                                <ul class='menu' style='overflow:hidden'>" + 
										    	   		"                                    <li>" + 
										    	   		"                                        <a href='javascript:void(0);' class='delete-folder-documentType'  data-id='"+resultSet.getInt("id")+"'>" + 
										    	   		"                                            <div class='menu-info'>" + 
										    	   		"                                                <h4>Delete</h4>" + 
										    	   		"                                            </div>" + 
										    	   		"                                        </a>" + 
										    	   		"                                    </li>" +
										    	   		"                                 </ul>" +*/ 
										    	   		"                           </ul>" + 
										    	   		"                    </li>";
											  
										  
										  }
										  
										  
										   IndexingUserupload indexingUserupload1=new IndexingUserupload();
								    	   indexingUserupload1.setDocumenttype(resultSet.getString("document_type"));
								    	   indexingUserupload1.setId(resultSet.getInt("id"));
								    	   indexingUserupload1.setDocument_no("<a href='folderdocument.jsp?"+resultSet.getInt("id")+"'>"+resultSet.getString("document_no")+"</a>");
								    	   String checkbox="<input type='checkbox'  name='delete_folder'  data-id='"+resultSet.getInt("id")+"' value='"+resultSet.getInt("id")+"' id='delete_"+resultSet.getInt("id")+"'><label for='delete_"+resultSet.getInt("id")+"'></label> ";
								    	   indexingUserupload1.setDelete_checkbox(checkbox);
								    	   indexingUserupload1.setDetails("<a href='javascript:void(0);' style='text-decoration:none;font-size:29px;font-weight:bolder;color:#000;' class='details' data-id='"+resultSet.getInt("id")+"'><i class='material-icons' style='color:#fff ; background-color:#000;border-radius:13px;'>info</i></a>");
								    	   indexingUserupload1.setAction(action);
								    	   list.add(indexingUserupload1);
										  
										  
										  
										  
									  }else {
										  
									
										  String action=" <li class='dropdown' style='postion:relative;margin-left:42px;'>" + 
									    	   		"                        <a href='javascript:void(0);' class='dropdown-toggle' data-toggle='dropdown' role='button'>" + 
									    	   		"                            <i  style='color: #6c757d;font-size:42px;position:absolute;top:-32px;left:-26px;'>..</i>" + 
									    	   		"                        </a>" + 
									    	   		"                        <ul class='dropdown-menu'>" + 
									    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
									    	   		"                                    <li>" + 
									    	   		"                                        <a href='javascript:void(0);' class='start-folder' data-id='"+resultSet.getInt("id")+"'>" + 
									    	   		"                                            <div class='menu-info'>" + 
									    	   		"                                                <h4>Star</h4>" + 
									    	   		"                                            </div>" + 
									    	   		"                                        </a>" + 
									    	   		"                                    </li>" +
									    	   		"                                 </ul>" + 
									    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
									    	   		"                                    <li>" + 
									    	   		"                                        <a href='javascript:void(0);' class='delete-folder-documentType'  data-id='"+resultSet.getInt("id")+"'>" + 
									    	   		"                                            <div class='menu-info'>" + 
									    	   		"                                                <h4>Delete</h4>" + 
									    	   		"                                            </div>" + 
									    	   		"                                        </a>" + 
									    	   		"                                    </li>" +
									    	   		"                                 </ul>" + 
									    	   		"                           </ul>" + 
									    	   		"                    </li>";
								    	  
								    	   IndexingUserupload indexingUserupload1=new IndexingUserupload();
								    	   indexingUserupload1.setDocumenttype(resultSet.getString("document_type"));
								    	   indexingUserupload1.setId(resultSet.getInt("id"));
								    	   indexingUserupload1.setDocument_no("<a href='folderdocument.jsp?"+resultSet.getInt("id")+"'>"+resultSet.getString("document_no")+"</a>");
								    	   String checkbox="<input type='checkbox'  name='delete_folder' class='' data-id='"+resultSet.getInt("id")+"' value='"+resultSet.getInt("id")+"' id='delete_"+resultSet.getInt("id")+"'><label for='delete_"+resultSet.getInt("id")+"'></label> ";
								    	   indexingUserupload1.setDelete_checkbox(checkbox);
								    	   indexingUserupload1.setDetails("<a href='javascript:void(0);' style='text-decoration:none;font-size:29px;font-weight:bolder;color:#000;' class='details' data-id='"+resultSet.getInt("id")+"'><i class='material-icons' style='color:#fff ; background-color:#000;border-radius:13px;'>info</i></a>");
								    	   indexingUserupload1.setAction(action);
								    	   list.add(indexingUserupload1);
										  
										  
									  }
				    			   
				    			   
				    			   
				    			   
				    			   
				    			   
				    		   }else {
				    		
				    			   
				    			   String action=" <li class='dropdown' style='postion:relative;margin-left:42px;'>" + 
							    	   		"                        <a href='javascript:void(0);' class='dropdown-toggle' data-toggle='dropdown' role='button'>" + 
							    	   		"                            <i  style='color: #6c757d;font-size:42px;position:absolute;top:-32px;left:-26px;'>..</i>" + 
							    	   		"                        </a>" + 
							    	   		"                        <ul class='dropdown-menu'>" + 
							    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
							    	   		"                                    <li>" + 
							    	   		"                                        <a href='javascript:void(0);' class='start-folder' data-id='"+resultSet.getInt("id")+"'>" + 
							    	   		"                                            <div class='menu-info'>" + 
							    	   		"                                                <h4>Star</h4>" + 
							    	   		"                                            </div>" + 
							    	   		"                                        </a>" + 
							    	   		"                                    </li>" +
							    	   		"                                 </ul>" + 
							    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
							    	   		"                                    <li>" + 
							    	   		"                                        <a href='javascript:void(0);' class='delete-folder-documentType'  data-id='"+resultSet.getInt("id")+"'>" + 
							    	   		"                                            <div class='menu-info'>" + 
							    	   		"                                                <h4>Delete</h4>" + 
							    	   		"                                            </div>" + 
							    	   		"                                        </a>" + 
							    	   		"                                    </li>" +
							    	   		"                                 </ul>" + 
							    	   		"                           </ul>" + 
							    	   		"                    </li>";
						    	  
						    	   IndexingUserupload indexingUserupload1=new IndexingUserupload();
						    	   indexingUserupload1.setDocumenttype(resultSet.getString("document_type"));
						    	   indexingUserupload1.setId(resultSet.getInt("id"));
						    	   indexingUserupload1.setDocument_no("<a href='folderdocument.jsp?"+resultSet.getInt("id")+"'>"+resultSet.getString("document_no")+"</a>");
						    	   String checkbox="<input type='checkbox'  name='delete_folder' class='' data-id='"+resultSet.getInt("id")+"' value='"+resultSet.getInt("id")+"' id='delete_"+resultSet.getInt("id")+"'><label for='delete_"+resultSet.getInt("id")+"'></label> ";
						    	   indexingUserupload1.setDelete_checkbox(checkbox);
						    	   indexingUserupload1.setDetails("<a href='javascript:void(0);' style='text-decoration:none;font-size:29px;font-weight:bolder;color:#000;' class='details' data-id='"+resultSet.getInt("id")+"'><i class='material-icons' style='color:#fff ; background-color:#000;border-radius:13px;'>info</i></a>");
						    	   indexingUserupload1.setAction(action);
						    	   list.add(indexingUserupload1);
				    			   
				    			   
				    			   
				    		   }
				    		   
				    	  
				    	   
				    	   }else {
				    	
				    		   
				    		   String action=" <li class='dropdown' style='postion:relative;margin-left:42px;'>" + 
						    	   		"                        <a href='javascript:void(0);' class='dropdown-toggle' data-toggle='dropdown' role='button'>" + 
						    	   		"                            <i  style='color: #6c757d;font-size:42px;position:absolute;top:-32px;left:-26px;'>..</i>" + 
						    	   		"                        </a>" + 
						    	   		"                        <ul class='dropdown-menu'>" + 
						    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
						    	   		"                                    <li>" + 
						    	   		"                                        <a href='javascript:void(0);' class='start-folder' data-id='"+resultSet.getInt("id")+"'>" + 
						    	   		"                                            <div class='menu-info'>" + 
						    	   		"                                                <h4>Star</h4>" + 
						    	   		"                                            </div>" + 
						    	   		"                                        </a>" + 
						    	   		"                                    </li>" +
						    	   		"                                 </ul>" + 
						    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
						    	   		"                                    <li>" + 
						    	   		"                                        <a href='javascript:void(0);' class='delete-folder-documentType'  data-id='"+resultSet.getInt("id")+"'>" + 
						    	   		"                                            <div class='menu-info'>" + 
						    	   		"                                                <h4>Delete</h4>" + 
						    	   		"                                            </div>" + 
						    	   		"                                        </a>" + 
						    	   		"                                    </li>" +
						    	   		"                                 </ul>" + 
						    	   		"                           </ul>" + 
						    	   		"                    </li>";
					    	  
					    	   IndexingUserupload indexingUserupload1=new IndexingUserupload();
					    	   indexingUserupload1.setDocumenttype(resultSet.getString("document_type"));
					    	   indexingUserupload1.setId(resultSet.getInt("id"));
					    	   indexingUserupload1.setDocument_no("<a href='folderdocument.jsp?"+resultSet.getInt("id")+"'>"+resultSet.getString("document_no")+"</a>");
					    	   String checkbox="<input type='checkbox'  name='delete_folder' class='' data-id='"+resultSet.getInt("id")+"' value='"+resultSet.getInt("id")+"' id='delete_"+resultSet.getInt("id")+"'><label for='delete_"+resultSet.getInt("id")+"'></label> ";
					    	   indexingUserupload1.setDelete_checkbox(checkbox);
					    	   indexingUserupload1.setDetails("<a href='javascript:void(0);' style='text-decoration:none;font-size:29px;font-weight:bolder;color:#000;' class='details' data-id='"+resultSet.getInt("id")+"'><i class='material-icons' style='color:#fff ; background-color:#000;border-radius:13px;'>info</i></a>");
					    	   indexingUserupload1.setAction(action);
					    	   list.add(indexingUserupload1);
			    		  
				    		   
				    	   }
				    	   
				    	   
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
			      
		    	  return list;
		    }

            
            
            public boolean trashDocumenttype(IndexingUserupload userupload)
			{
				boolean check=false;
				
				
				try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
						.prepareStatement("select  file_no , folder_name , file , document_type  from document_info where id='"+userupload.getId()+"'");) {
					 ResultSet resultSet=preparedStatement.executeQuery();
					 while(resultSet.next())
					 {
						 
						 
						    String file=resultSet.getString("file");
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
						 
		                 boolean deletefile=new DeleteFile().deletefile_name("softdoc-262410.appspot.com",file_name);

		                 PreparedStatement preparedStatement2 = connection
									.prepareStatement("delete from document_info  where file_no='"+resultSet.getString("file_no")+"' and folder_name='"+resultSet.getString("folder_name")+"' and document_type ='"+resultSet.getString("document_type")+"'");
						 check = preparedStatement2.executeUpdate()>0;

					 }
					
					 
					 
					 
				} catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
				} catch (Exception exception) {
					exception.printStackTrace();
				}

				return check;
			}
            
            
            
            public boolean trashDocumentType(IndexingUserupload userupload) {

				boolean check = false;
				try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
						.prepareStatement("select file_no , document_no , document_type  from document_info where document_no=(select document_no from document_info where id='"+userupload.getId()+"') and file_no =(select file_no from document_info where id='"+userupload.getId()+"') ");) {
					 ResultSet resultSet=preparedStatement.executeQuery();
					 if(resultSet.next())
					 {
						    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
							Date myDate = formatter.parse(userupload.getCurrentDate());
							Calendar c = Calendar.getInstance();
							c.setTime(myDate);
							c.add(Calendar.DATE, 30);
							String updateDate = formatter.format(c.getTime());
						    PreparedStatement preparedStatement2 = connection
									.prepareStatement("update document_info set trash='1', deletedate='"+updateDate+"' where file_no='"+resultSet.getString("file_no")+"' and document_no ='"+resultSet.getString("document_no")+"'");
						 check = preparedStatement2.executeUpdate()>0;
					 }
					
					
				} catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
				} catch (Exception exception) {
					exception.printStackTrace();
				}

				return check;
			}  
		    
            
            
            public List<IndexingUserupload> FileDocumentType(IndexingUserupload indexingUserupload)
		    {   
		    	
		    	  List<IndexingUserupload> list=new ArrayList<IndexingUserupload>();
		    	  try(Connection connection=DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("select  id , document_type , document_no , access_level from document_info where file_no=(select file_no from document_info where id='"+indexingUserupload.getDocument_info_id()+"') and trash='0' and folder_status is null and document_no is not null group by document_no");)
				  {
		    		   ResultSet resultSet=preparedStatement.executeQuery(); 
				       while(resultSet.next())
		    		   {
				    	   
				    	   String access_level=resultSet.getString("access_level");  
				    	   if(access_level !=null) {
				    		   
				    		   if(!access_level.isEmpty()) {
				    			   
				    			   JSONParser jsonParser = new JSONParser();
								   JSONArray jsonArray = (JSONArray) jsonParser.parse(access_level);
								   JSONObject access_level1 = null;
								   String access_permission="";
				    			   
								   
								      boolean condition=false;
									  for(Object object : jsonArray) {
									 
										     access_level1 = (JSONObject) object;
									         if(Integer.parseInt(access_level1.get("client_id").toString()) == (int)indexingUserupload.getId())
									         {
									         	   condition=true;
									         	   access_permission=(String)access_level1.get("access_level");
									         }
									  }
								   
									  
									  //System.out.println("");
									
									  if(condition) {
										  
										  String action="";
										  if(access_permission.equalsIgnoreCase("Read")){
									
											   action="<li class='dropdown' style='postion:relative;margin-left:42px;'>" + 
										    	   		"                        <a href='javascript:void(0);' class='dropdown-toggle' data-toggle='dropdown' role='button'>" + 
										    	   		"                            <i  style='color: #6c757d;font-size:42px;position:absolute;top:-32px;left:-26px;'>..</i>" + 
										    	   		"                        </a>" + 
										    	   		"                        <ul class='dropdown-menu'>" + 
										    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
										    	   		"                                    <li style='background-color:#6c757d;'>" + 
										    	   		"                                        <a href='javascript:void(0);' class='' data-id='"+resultSet.getInt("id")+"'>" + 
										    	   		"                                            <div class='menu-info'>" + 
										    	   		"                                                <h4 style='color:#fff;'>Edit</h4>" + 
										    	   		"                                            </div>" + 
										    	   		"                                        </a>" + 
										    	   		"                                    </li>" +
										    	   		"                                 </ul>" + 
										    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
										    	   		"                                    <li style='background-color:#6c757d;'>" + 
										    	   		"                                        <a href='javascript:void(0);' class='' data-id='"+resultSet.getInt("id")+"'>" + 
										    	   		"                                            <div class='menu-info'>" + 
										    	   		"                                                <h4 style='color:#fff;'>Delete</h4>" + 
										    	   		"                                            </div>" + 
										    	   		"                                        </a>" + 
										    	   		"                                    </li>" +
										    	   		"                                 </ul>" + 
										    	   		"                           </ul>" + 
										    	   		"                    </li>";
									    	   
											  
											  
											  
										  }else if(access_permission.equalsIgnoreCase("Write")) {
											  
											  
											  action="<li class='dropdown' style='postion:relative;margin-left:42px;'>" + 
										    	   		"                        <a href='javascript:void(0);' class='dropdown-toggle' data-toggle='dropdown' role='button'>" + 
										    	   		"                            <i  style='color: #6c757d;font-size:42px;position:absolute;top:-32px;left:-26px;'>..</i>" + 
										    	   		"                        </a>" + 
										    	   		"                        <ul class='dropdown-menu'>" + 
										    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
										    	   		"                                    <li>" + 
										    	   		"                                        <a href='javascript:void(0);' class='edit-document' data-id='"+resultSet.getInt("id")+"'>" + 
										    	   		"                                            <div class='menu-info'>" + 
										    	   		"                                                <h4>Edit</h4>" + 
										    	   		"                                            </div>" + 
										    	   		"                                        </a>" + 
										    	   		"                                    </li>" +
										    	   		"                                 </ul>" + 
										    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
										    	   		"                                    <li>" + 
										    	   		"                                        <a href='javascript:void(0);' class='trash-document' data-id='"+resultSet.getInt("id")+"'>" + 
										    	   		"                                            <div class='menu-info'>" + 
										    	   		"                                                <h4>Delete</h4>" + 
										    	   		"                                            </div>" + 
										    	   		"                                        </a>" + 
										    	   		"                                    </li>" +
										    	   		"                                 </ul>" + 
										    	   		"                           </ul>" + 
										    	   		"                    </li>";
									    	   
											  
											  
											  
										  } 
										  
										  
										  
										   IndexingUserupload indexingUserupload1=new IndexingUserupload();
								    	   indexingUserupload1.setDocument_no("<a href='document.jsp?"+resultSet.getInt("id")+"'>"+resultSet.getString("document_no")+"</a>");
								    	   indexingUserupload1.setDocumenttype(resultSet.getString("document_type"));
								    	   indexingUserupload1.setId(resultSet.getInt("id"));
								    	   String checkbox="<input type='checkbox'  name='delete_file_document_type' value='"+resultSet.getInt("id")+"' id='document_type_"+resultSet.getInt("id")+"'><label for='document_type_"+resultSet.getInt("id")+"'></label> ";
								    	   indexingUserupload1.setDelete_checkbox(checkbox);
								    	   indexingUserupload1.setDetails("<a href='javascript:void(0);' class='document_details' style='text-decoration:none;font-size:29px;font-weight:bolder;color:#000;' data-id='"+resultSet.getInt("id")+"'><i class='material-icons' style='color:#fff ; background-color:#000;border-radius:13px;'>info</i></a>");
								    	   indexingUserupload1.setAction(action);
								    	  //indexingUserupload1.setFolder_view_link("<a href='folder-view.jsp?"+resultSet.getInt("id")+"'>"+resultSet.getString("document_type")+"</a>");
								    	   list.add(indexingUserupload1);
						    	
								    	   
									  }else {
									
										  
										  IndexingUserupload indexingUserupload1=new IndexingUserupload();
								    	   indexingUserupload1.setDocument_no("<a href='document.jsp?"+resultSet.getInt("id")+"'>"+resultSet.getString("document_no")+"</a>");
								    	   indexingUserupload1.setDocumenttype(resultSet.getString("document_type"));
								    	   indexingUserupload1.setId(resultSet.getInt("id"));
								    	   String checkbox="<input type='checkbox'  name='delete_file_document_type' value='"+resultSet.getInt("id")+"' id='document_type_"+resultSet.getInt("id")+"'><label for='document_type_"+resultSet.getInt("id")+"'></label> ";
								    	   indexingUserupload1.setDelete_checkbox(checkbox);
								    	   indexingUserupload1.setDetails("<a href='javascript:void(0);' class='document_details' style='text-decoration:none;font-size:29px;font-weight:bolder;color:#000;' data-id='"+resultSet.getInt("id")+"'><i class='material-icons' style='color:#fff ; background-color:#000;border-radius:13px;'>info</i></a>");
								    	   String  action="<li class='dropdown' style='postion:relative;margin-left:42px;'>" + 
									    	   		"                        <a href='javascript:void(0);' class='dropdown-toggle' data-toggle='dropdown' role='button'>" + 
									    	   		"                            <i  style='color: #6c757d;font-size:42px;position:absolute;top:-32px;left:-26px;'>..</i>" + 
									    	   		"                        </a>" + 
									    	   		"                        <ul class='dropdown-menu'>" + 
									    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
									    	   		"                                    <li>" + 
									    	   		"                                        <a href='javascript:void(0);' class='edit-document' data-id='"+resultSet.getInt("id")+"'>" + 
									    	   		"                                            <div class='menu-info'>" + 
									    	   		"                                                <h4>Edit</h4>" + 
									    	   		"                                            </div>" + 
									    	   		"                                        </a>" + 
									    	   		"                                    </li>" +
									    	   		"                                 </ul>" + 
									    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
									    	   		"                                    <li>" + 
									    	   		"                                        <a href='javascript:void(0);' class='trash-document' data-id='"+resultSet.getInt("id")+"'>" + 
									    	   		"                                            <div class='menu-info'>" + 
									    	   		"                                                <h4>Delete</h4>" + 
									    	   		"                                            </div>" + 
									    	   		"                                        </a>" + 
									    	   		"                                    </li>" +
									    	   		"                                 </ul>" + 
									    	   		"                           </ul>" + 
									    	   		"                    </li>";
								    	   
										  
								    	   
								    	   indexingUserupload1.setAction(action);
								    	  //indexingUserupload1.setFolder_view_link("<a href='folder-view.jsp?"+resultSet.getInt("id")+"'>"+resultSet.getString("document_type")+"</a>");
								    	   list.add(indexingUserupload1);
						    			   
										  
										  
									  }
									  
				    			   
				    			   
				    		   }else {
				    	
				    			   
				    			   IndexingUserupload indexingUserupload1=new IndexingUserupload();
						    	   indexingUserupload1.setDocument_no("<a href='document.jsp?"+resultSet.getInt("id")+"'>"+resultSet.getString("document_no")+"</a>");
						    	   indexingUserupload1.setDocumenttype(resultSet.getString("document_type"));
						    	   indexingUserupload1.setId(resultSet.getInt("id"));
						    	   String checkbox="<input type='checkbox'  name='delete_file_document_type' value='"+resultSet.getInt("id")+"' id='document_type_"+resultSet.getInt("id")+"'><label for='document_type_"+resultSet.getInt("id")+"'></label> ";
						    	   indexingUserupload1.setDelete_checkbox(checkbox);
						    	   indexingUserupload1.setDetails("<a href='javascript:void(0);' class='document_details' style='text-decoration:none;font-size:29px;font-weight:bolder;color:#000;' data-id='"+resultSet.getInt("id")+"'><i class='material-icons' style='color:#fff ; background-color:#000;border-radius:13px;'>info</i></a>");
						    	   String action=" <li class='dropdown' style='postion:relative;margin-left:42px;'>" + 
							    	   		"                        <a href='javascript:void(0);' class='dropdown-toggle' data-toggle='dropdown' role='button'>" + 
							    	   		"                            <i  style='color: #6c757d;font-size:42px;position:absolute;top:-32px;left:-26px;'>..</i>" + 
							    	   		"                        </a>" + 
							    	   		"                        <ul class='dropdown-menu'>" + 
							    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
							    	   		"                                    <li>" + 
							    	   		"                                        <a href='javascript:void(0);' class='edit-document' data-id='"+resultSet.getInt("id")+"'>" + 
							    	   		"                                            <div class='menu-info'>" + 
							    	   		"                                                <h4>Edit</h4>" + 
							    	   		"                                            </div>" + 
							    	   		"                                        </a>" + 
							    	   		"                                    </li>" +
							    	   		"                                 </ul>" + 
							    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
							    	   		"                                    <li>" + 
							    	   		"                                        <a href='javascript:void(0);' class='trash-document' data-id='"+resultSet.getInt("id")+"'>" + 
							    	   		"                                            <div class='menu-info'>" + 
							    	   		"                                                <h4>Delete</h4>" + 
							    	   		"                                            </div>" + 
							    	   		"                                        </a>" + 
							    	   		"                                    </li>" +
							    	   		"                                 </ul>" + 
							    	   		"                           </ul>" + 
							    	   		"                    </li>";
						    	   
						    	   indexingUserupload1.setAction(action);
						    	  //indexingUserupload1.setFolder_view_link("<a href='folder-view.jsp?"+resultSet.getInt("id")+"'>"+resultSet.getString("document_type")+"</a>");
						    	   list.add(indexingUserupload1);
				    			   
				    			   
				    			   
				    		   }
				    		   
				    		   
				    	   }else {
				    
				    		   IndexingUserupload indexingUserupload1=new IndexingUserupload();
					    	   indexingUserupload1.setDocument_no("<a href='document.jsp?"+resultSet.getInt("id")+"'>"+resultSet.getString("document_no")+"</a>");
					    	   indexingUserupload1.setDocumenttype(resultSet.getString("document_type"));
					    	   indexingUserupload1.setId(resultSet.getInt("id"));
					    	   String checkbox="<input type='checkbox'  name='delete_file_document_type' value='"+resultSet.getInt("id")+"' id='document_type_"+resultSet.getInt("id")+"'><label for='document_type_"+resultSet.getInt("id")+"'></label> ";
					    	   indexingUserupload1.setDelete_checkbox(checkbox);
					    	   indexingUserupload1.setDetails("<a href='javascript:void(0);' class='document_details' style='text-decoration:none;font-size:29px;font-weight:bolder;color:#000;' data-id='"+resultSet.getInt("id")+"'><i class='material-icons' style='color:#fff ; background-color:#000;border-radius:13px;'>info</i></a>");
					    	   String action=" <li class='dropdown' style='postion:relative;margin-left:42px;'>" + 
						    	   		"                        <a href='javascript:void(0);' class='dropdown-toggle' data-toggle='dropdown' role='button'>" + 
						    	   		"                            <i  style='color: #6c757d;font-size:42px;position:absolute;top:-32px;left:-26px;'>..</i>" + 
						    	   		"                        </a>" + 
						    	   		"                        <ul class='dropdown-menu'>" + 
						    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
						    	   		"                                    <li>" + 
						    	   		"                                        <a href='javascript:void(0);' class='edit-document' data-id='"+resultSet.getInt("id")+"'>" + 
						    	   		"                                            <div class='menu-info'>" + 
						    	   		"                                                <h4>Edit</h4>" + 
						    	   		"                                            </div>" + 
						    	   		"                                        </a>" + 
						    	   		"                                    </li>" +
						    	   		"                                 </ul>" + 
						    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
						    	   		"                                    <li>" + 
						    	   		"                                        <a href='javascript:void(0);' class='trash-document' data-id='"+resultSet.getInt("id")+"'>" + 
						    	   		"                                            <div class='menu-info'>" + 
						    	   		"                                                <h4>Delete</h4>" + 
						    	   		"                                            </div>" + 
						    	   		"                                        </a>" + 
						    	   		"                                    </li>" +
						    	   		"                                 </ul>" + 
						    	   		"                           </ul>" + 
						    	   		"                    </li>";
					    	   
					    	   indexingUserupload1.setAction(action);
					    	  //indexingUserupload1.setFolder_view_link("<a href='folder-view.jsp?"+resultSet.getInt("id")+"'>"+resultSet.getString("document_type")+"</a>");
					    	   list.add(indexingUserupload1);
			    		   }
			    		 
				     		   
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
		    	  
		    	 return list; 
		    	  
		    } 	  
            
            
            public List<IndexingUserupload> DocumentIndexing(IndexingUserupload indexingUserupload)
		    {   
		    	
		    	  List<IndexingUserupload> list=new ArrayList<IndexingUserupload>();
		    	  try(Connection connection=DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("select * from  document_info where id='"+indexingUserupload.getDocument_info_id()+"'");)
				  {
		    		   ResultSet resultSet=preparedStatement.executeQuery(); 
				       if(resultSet.next())
		    		   {
				    	   IndexingUserupload indexingUserupload1=new IndexingUserupload();
				    	   
				    	    indexingUserupload1.setDocument_info_id(resultSet.getInt("id"));
				    	    indexingUserupload1.setDocumenttype(resultSet.getString("document_type"));
				    	    if(resultSet.getString("document_type").equalsIgnoreCase("Employee OutBoarding")){
				    	    	
				    	    	indexingUserupload1.setEmployecode(resultSet.getString("employee_code"));
				    	    	indexingUserupload1.setEmployee_name(resultSet.getString("employee_name"));
				    	    	indexingUserupload1.setJoiningdate(resultSet.getString("date_of_joining"));
				    	    	
				    	    }else if(resultSet.getString("document_type").equalsIgnoreCase("Vendor Registration")){
				    	    	
				    	    	indexingUserupload1.setInvoicedate(resultSet.getString("invoice_date"));
				    	    	indexingUserupload1.setInvoicenumber(resultSet.getString("invoice_number"));
				    	    	indexingUserupload1.setVendorcode(resultSet.getString("vendor_code"));
				    	    	indexingUserupload1.setVendorname(resultSet.getString("vendor_name"));
				    	    	
				    	    }else if(resultSet.getString("document_type").equalsIgnoreCase("Customer Registration")){
				    	    
				    	    	indexingUserupload1.setCustomercode(resultSet.getString("customer_code"));
				    	    	indexingUserupload1.setCustomername(resultSet.getString("customer_name"));
				    	    	
				    	    }else if(resultSet.getString("document_type").equalsIgnoreCase("Sales")){
					    	    
				    	    	
				    	    	indexingUserupload1.setInvoicedate(resultSet.getString("invoice_date"));
				    	    	indexingUserupload1.setInvoicenumber(resultSet.getString("invoice_number"));
				    	    	indexingUserupload1.setCustomercode(resultSet.getString("customer_code"));
				    	    	indexingUserupload1.setCustomername(resultSet.getString("customer_name"));
				    	    
				    	    }else if(resultSet.getString("document_type").equalsIgnoreCase("Purchase")){
					    	    
				    	    	indexingUserupload1.setInvoicedate(resultSet.getString("invoice_date"));
				    	    	indexingUserupload1.setInvoicenumber(resultSet.getString("invoice_number"));
				    	    	indexingUserupload1.setVendorcode(resultSet.getString("vendor_code"));
				    	    	indexingUserupload1.setVendorname(resultSet.getString("vendor_name"));
				    	    
				    	    }else if(resultSet.getString("document_type").equalsIgnoreCase("Challen")){
					    	    
				    	    	indexingUserupload1.setDocumentType1(resultSet.getString("documentType1"));
				    	    	indexingUserupload1.setDocumentType2(resultSet.getString("documentType2"));
				    	    	indexingUserupload1.setDocumentType3(resultSet.getString("documentType3"));
				    	    	indexingUserupload1.setDocumentType4(resultSet.getString("documentType4"));
				    	    	indexingUserupload1.setDocumentType5(resultSet.getString("documentType5"));
				    	    	indexingUserupload1.setDocumentType6(resultSet.getString("documentType6"));
				    	    	
				    	    }else if(resultSet.getString("document_type").equalsIgnoreCase("Tax Audit Report")){
					    	    
				    	    	indexingUserupload1.setDocumentType1(resultSet.getString("documentType1"));
				    	    	indexingUserupload1.setDocumentType2(resultSet.getString("documentType2"));
				    	    	indexingUserupload1.setDocumentType3(resultSet.getString("documentType3"));
				    	    	indexingUserupload1.setDocumentType4(resultSet.getString("documentType4"));
				    	    	indexingUserupload1.setDocumentType5(resultSet.getString("documentType5"));
				    	    	indexingUserupload1.setDocumentType6(resultSet.getString("documentType6"));
				    	    	
                             }else if(resultSet.getString("document_type").equalsIgnoreCase("Power of Attorney")){
					    	    
				    	    	indexingUserupload1.setDocumentType1(resultSet.getString("documentType1"));
				    	    	indexingUserupload1.setDocumentType2(resultSet.getString("documentType2"));
				    	    	indexingUserupload1.setDocumentType3(resultSet.getString("documentType3"));
				    	    	indexingUserupload1.setDocumentType4(resultSet.getString("documentType4"));
				    	    	indexingUserupload1.setDocumentType5(resultSet.getString("documentType5"));
				    	    	indexingUserupload1.setDocumentType6(resultSet.getString("documentType6"));
				    	    	
                             }else if(resultSet.getString("document_type").equalsIgnoreCase("Notice")){
 					    	    
 				    	    	indexingUserupload1.setDocumentType1(resultSet.getString("documentType1"));
 				    	    	indexingUserupload1.setDocumentType2(resultSet.getString("documentType2"));
 				    	    	indexingUserupload1.setDocumentType3(resultSet.getString("documentType3"));
 				    	    	indexingUserupload1.setDocumentType4(resultSet.getString("documentType4"));
 				    	    	indexingUserupload1.setDocumentType5(resultSet.getString("documentType5"));
 				    	    	indexingUserupload1.setDocumentType6(resultSet.getString("documentType6"));
 				    	    	
                              }else if(resultSet.getString("document_type").equalsIgnoreCase("Submission")){
 					    	    
 				    	    	indexingUserupload1.setDocumentType1(resultSet.getString("documentType1"));
 				    	    	indexingUserupload1.setDocumentType2(resultSet.getString("documentType2"));
 				    	    	indexingUserupload1.setDocumentType3(resultSet.getString("documentType3"));
 				    	    	indexingUserupload1.setDocumentType4(resultSet.getString("documentType4"));
 				    	    	indexingUserupload1.setDocumentType5(resultSet.getString("documentType5"));
 				    	    	indexingUserupload1.setDocumentType6(resultSet.getString("documentType6"));
 				    	    	
 				    	    }else if(resultSet.getString("document_type").equalsIgnoreCase("Assessment Order")){
 					    	    
 				    	    	indexingUserupload1.setDocumentType1(resultSet.getString("documentType1"));
 				    	    	indexingUserupload1.setDocumentType2(resultSet.getString("documentType2"));
 				    	    	indexingUserupload1.setDocumentType3(resultSet.getString("documentType3"));
 				    	    	indexingUserupload1.setDocumentType4(resultSet.getString("documentType4"));
 				    	    	indexingUserupload1.setDocumentType5(resultSet.getString("documentType5"));
 				    	    	indexingUserupload1.setDocumentType6(resultSet.getString("documentType6"));
 				    	    	
                              }else if(resultSet.getString("document_type").equalsIgnoreCase("Income Tax Return")){
 					    	    
 				    	    	indexingUserupload1.setDocumentType1(resultSet.getString("documentType1"));
 				    	    	indexingUserupload1.setDocumentType2(resultSet.getString("documentType2"));
 				    	    	indexingUserupload1.setDocumentType3(resultSet.getString("documentType3"));
 				    	    	indexingUserupload1.setDocumentType4(resultSet.getString("documentType4"));
 				    	    	indexingUserupload1.setDocumentType5(resultSet.getString("documentType5"));
 				    	    	indexingUserupload1.setDocumentType6(resultSet.getString("documentType6"));
 				    	    	
 				    	    }else if(resultSet.getString("document_type").equalsIgnoreCase("Engagement Letter")){
 					    	    
 				    	    	indexingUserupload1.setDocumentType1(resultSet.getString("documentType1"));
 				    	    	indexingUserupload1.setDocumentType2(resultSet.getString("documentType2"));
 				    	    	indexingUserupload1.setDocumentType3(resultSet.getString("documentType3"));
 				    	    	indexingUserupload1.setDocumentType4(resultSet.getString("documentType4"));
 				    	    	indexingUserupload1.setDocumentType5(resultSet.getString("documentType5"));
 				    	    	indexingUserupload1.setDocumentType6(resultSet.getString("documentType6"));
 				    	    	
 				    	    }else if(resultSet.getString("document_type").equalsIgnoreCase("Challen:")){
 					    	    
 				    	    	indexingUserupload1.setDocumentType1(resultSet.getString("documentType1"));
 				    	    	indexingUserupload1.setDocumentType2(resultSet.getString("documentType2"));
 				    	    	indexingUserupload1.setDocumentType3(resultSet.getString("documentType3"));
 				    	    	indexingUserupload1.setDocumentType4(resultSet.getString("documentType4"));
 				    	    	indexingUserupload1.setDocumentType5(resultSet.getString("documentType5"));
 				    	    	indexingUserupload1.setDocumentType6(resultSet.getString("documentType6"));
 				    	    	
 				    	    }else if(resultSet.getString("document_type").equalsIgnoreCase("GSTR-1 Returns")){
 					    	    
 				    	    	indexingUserupload1.setDocumentType1(resultSet.getString("documentType1"));
 				    	    	indexingUserupload1.setDocumentType2(resultSet.getString("documentType2"));
 				    	    	indexingUserupload1.setDocumentType3(resultSet.getString("documentType3"));
 				    	    	indexingUserupload1.setDocumentType4(resultSet.getString("documentType4"));
 				    	    	indexingUserupload1.setDocumentType5(resultSet.getString("documentType5"));
 				    	    	indexingUserupload1.setDocumentType6(resultSet.getString("documentType6"));
 				    	    	
 				    	    }else if(resultSet.getString("document_type").equalsIgnoreCase("Invoice / Docs - Output")){
 					    	    
 				    	    	indexingUserupload1.setDocumentType1(resultSet.getString("documentType1"));
 				    	    	indexingUserupload1.setDocumentType2(resultSet.getString("documentType2"));
 				    	    	indexingUserupload1.setDocumentType3(resultSet.getString("documentType3"));
 				    	    	indexingUserupload1.setDocumentType4(resultSet.getString("documentType4"));
 				    	    	indexingUserupload1.setDocumentType5(resultSet.getString("documentType5"));
 				    	    	indexingUserupload1.setDocumentType6(resultSet.getString("documentType6"));
 				    	    	
 				    	    }else if(resultSet.getString("document_type").equalsIgnoreCase("STR-3B Returns")){
 					    	    
 				    	    	indexingUserupload1.setDocumentType1(resultSet.getString("documentType1"));
 				    	    	indexingUserupload1.setDocumentType2(resultSet.getString("documentType2"));
 				    	    	indexingUserupload1.setDocumentType3(resultSet.getString("documentType3"));
 				    	    	indexingUserupload1.setDocumentType4(resultSet.getString("documentType4"));
 				    	    	indexingUserupload1.setDocumentType5(resultSet.getString("documentType5"));
 				    	    	indexingUserupload1.setDocumentType6(resultSet.getString("documentType6"));
 				    	    	
 				    	    }else if(resultSet.getString("document_type").equalsIgnoreCase("Input Detail/Docs/Invoices")){
 					    	    
 				    	    	indexingUserupload1.setDocumentType1(resultSet.getString("documentType1"));
 				    	    	indexingUserupload1.setDocumentType2(resultSet.getString("documentType2"));
 				    	    	indexingUserupload1.setDocumentType3(resultSet.getString("documentType3"));
 				    	    	indexingUserupload1.setDocumentType4(resultSet.getString("documentType4"));
 				    	    	indexingUserupload1.setDocumentType5(resultSet.getString("documentType5"));
 				    	    	indexingUserupload1.setDocumentType6(resultSet.getString("documentType6"));
 				    	    	
 				    	    }else if(resultSet.getString("document_type").equalsIgnoreCase("Refund Forms RFD OS/01A")){
 					    	    
 				    	    	indexingUserupload1.setDocumentType1(resultSet.getString("documentType1"));
 				    	    	indexingUserupload1.setDocumentType2(resultSet.getString("documentType2"));
 				    	    	indexingUserupload1.setDocumentType3(resultSet.getString("documentType3"));
 				    	    	indexingUserupload1.setDocumentType4(resultSet.getString("documentType4"));
 				    	    	indexingUserupload1.setDocumentType5(resultSet.getString("documentType5"));
 				    	    	indexingUserupload1.setDocumentType6(resultSet.getString("documentType6"));
 				    	    	
 				    	    }else if(resultSet.getString("document_type").equalsIgnoreCase("E-way Bill")){
 					    	    
 				    	    	indexingUserupload1.setDocumentType1(resultSet.getString("documentType1"));
 				    	    	indexingUserupload1.setDocumentType2(resultSet.getString("documentType2"));
 				    	    	indexingUserupload1.setDocumentType3(resultSet.getString("documentType3"));
 				    	    	indexingUserupload1.setDocumentType4(resultSet.getString("documentType4"));
 				    	    	indexingUserupload1.setDocumentType5(resultSet.getString("documentType5"));
 				    	    	indexingUserupload1.setDocumentType6(resultSet.getString("documentType6"));
 				    	    	
 				    	    }else if(resultSet.getString("document_type").equalsIgnoreCase("Refund Forms RFD OS/01A")){
 					    	    
 				    	    	indexingUserupload1.setDocumentType1(resultSet.getString("documentType1"));
 				    	    	indexingUserupload1.setDocumentType2(resultSet.getString("documentType2"));
 				    	    	indexingUserupload1.setDocumentType3(resultSet.getString("documentType3"));
 				    	    	indexingUserupload1.setDocumentType4(resultSet.getString("documentType4"));
 				    	    	indexingUserupload1.setDocumentType5(resultSet.getString("documentType5"));
 				    	    	indexingUserupload1.setDocumentType6(resultSet.getString("documentType6"));
 				    	    	
 				    	    }else if(resultSet.getString("document_type").equalsIgnoreCase("Debit / Credit Note")){
 					    	    
 				    	    	indexingUserupload1.setDocumentType1(resultSet.getString("documentType1"));
 				    	    	indexingUserupload1.setDocumentType2(resultSet.getString("documentType2"));
 				    	    	indexingUserupload1.setDocumentType3(resultSet.getString("documentType3"));
 				    	    	indexingUserupload1.setDocumentType4(resultSet.getString("documentType4"));
 				    	    	indexingUserupload1.setDocumentType5(resultSet.getString("documentType5"));
 				    	    	indexingUserupload1.setDocumentType6(resultSet.getString("documentType6"));
 				    	    	
 				    	    }else if(resultSet.getString("document_type").equalsIgnoreCase("Confirmations")){
 					    	    
 				    	    	indexingUserupload1.setDocumentType1(resultSet.getString("documentType1"));
 				    	    	indexingUserupload1.setDocumentType2(resultSet.getString("documentType2"));
 				    	    	indexingUserupload1.setDocumentType3(resultSet.getString("documentType3"));
 				    	    	indexingUserupload1.setDocumentType4(resultSet.getString("documentType4"));
 				    	    	indexingUserupload1.setDocumentType5(resultSet.getString("documentType5"));
 				    	    	indexingUserupload1.setDocumentType6(resultSet.getString("documentType6"));
 				    	    	
 				    	    }else if(resultSet.getString("document_type").equalsIgnoreCase("General")){
 					    	    
 				    	    	indexingUserupload1.setDocumentType1(resultSet.getString("documentType1"));
 				    	    	indexingUserupload1.setDocumentType2(resultSet.getString("documentType2"));
 				    	    	indexingUserupload1.setDocumentType3(resultSet.getString("documentType3"));
 				    	    	indexingUserupload1.setDocumentType4(resultSet.getString("documentType4"));
 				    	    	indexingUserupload1.setDocumentType5(resultSet.getString("documentType5"));
 				    	    	indexingUserupload1.setDocumentType6(resultSet.getString("documentType6"));
 				    	    	
 				    	    }else if(resultSet.getString("document_type").equalsIgnoreCase("Minutes")){
 					    	    
 				    	    	indexingUserupload1.setDocumentType1(resultSet.getString("documentType1"));
 				    	    	indexingUserupload1.setDocumentType2(resultSet.getString("documentType2"));
 				    	    	indexingUserupload1.setDocumentType3(resultSet.getString("documentType3"));
 				    	    	indexingUserupload1.setDocumentType4(resultSet.getString("documentType4"));
 				    	    	indexingUserupload1.setDocumentType5(resultSet.getString("documentType5"));
 				    	    	indexingUserupload1.setDocumentType6(resultSet.getString("documentType6"));
 				    	    	
 				    	    }else if(resultSet.getString("document_type").equalsIgnoreCase("Workpaper")){
 					    	    
 				    	    	indexingUserupload1.setDocumentType1(resultSet.getString("documentType1"));
 				    	    	indexingUserupload1.setDocumentType2(resultSet.getString("documentType2"));
 				    	    	indexingUserupload1.setDocumentType3(resultSet.getString("documentType3"));
 				    	    	indexingUserupload1.setDocumentType4(resultSet.getString("documentType4"));
 				    	    	indexingUserupload1.setDocumentType5(resultSet.getString("documentType5"));
 				    	    	indexingUserupload1.setDocumentType6(resultSet.getString("documentType6"));
 				    	    	
 				    	    }else if(resultSet.getString("document_type").equalsIgnoreCase("Financials")){
 					    	    
 				    	    	indexingUserupload1.setDocumentType1(resultSet.getString("documentType1"));
 				    	    	indexingUserupload1.setDocumentType2(resultSet.getString("documentType2"));
 				    	    	indexingUserupload1.setDocumentType3(resultSet.getString("documentType3"));
 				    	    	indexingUserupload1.setDocumentType4(resultSet.getString("documentType4"));
 				    	    	indexingUserupload1.setDocumentType5(resultSet.getString("documentType5"));
 				    	    	indexingUserupload1.setDocumentType6(resultSet.getString("documentType6"));
 				    	    	
 				    	    }else if(resultSet.getString("document_type").equalsIgnoreCase("Engagement Letter:")){
 					    	    
 				    	    	indexingUserupload1.setDocumentType1(resultSet.getString("documentType1"));
 				    	    	indexingUserupload1.setDocumentType2(resultSet.getString("documentType2"));
 				    	    	indexingUserupload1.setDocumentType3(resultSet.getString("documentType3"));
 				    	    	indexingUserupload1.setDocumentType4(resultSet.getString("documentType4"));
 				    	    	indexingUserupload1.setDocumentType5(resultSet.getString("documentType5"));
 				    	    	indexingUserupload1.setDocumentType6(resultSet.getString("documentType6"));
 				    	   
 				    	    }else if(resultSet.getString("document_type").equalsIgnoreCase("Employee Documents")){
					    	    
				    	    	indexingUserupload1.setDocumentType1(resultSet.getString("documentType1"));
				    	    	indexingUserupload1.setDocumentType2(resultSet.getString("documentType2"));
				    	    	indexingUserupload1.setDocumentType3(resultSet.getString("documentType3"));
 				   	    
 				    	    }else if(resultSet.getString("document_type").equalsIgnoreCase("Other")){
				    	    
			    	    	indexingUserupload1.setDocumentType1(resultSet.getString("documentType1"));
			    	    	indexingUserupload1.setDocumentType2(resultSet.getString("documentType2"));
 				   	     
 				    	    }else if(resultSet.getString("document_type").equalsIgnoreCase("Salary Regsiter")){
				    	    
			    	    	indexingUserupload1.setDocumentType1(resultSet.getString("documentType1"));
			    	    	indexingUserupload1.setDocumentType2(resultSet.getString("documentType2"));
			    	
	                        
 				    	    }else if(resultSet.getString("document_type").equalsIgnoreCase("Contract")){
				    	    
			    	    	indexingUserupload1.setDocumentType1(resultSet.getString("documentType1"));
			    	    	indexingUserupload1.setDocumentType2(resultSet.getString("documentType2"));
			    	    	indexingUserupload1.setDocumentType3(resultSet.getString("documentType3"));
					    	
 				    	   }else if(resultSet.getString("document_type").equalsIgnoreCase("Registration")){
 					    	    
			    	    	indexingUserupload1.setDocumentType1(resultSet.getString("documentType1"));
			    	    	indexingUserupload1.setDocumentType2(resultSet.getString("documentType2"));
			    	    	indexingUserupload1.setDocumentType3(resultSet.getString("documentType3"));
 				    	  
 				    	   }else if(resultSet.getString("document_type").equalsIgnoreCase("Purchase(Goods)")){
					    	    
			    	    	indexingUserupload1.setDocumentType1(resultSet.getString("documentType1"));
			    	    	indexingUserupload1.setDocumentType2(resultSet.getString("documentType2"));
			    	    	indexingUserupload1.setDocumentType3(resultSet.getString("documentType3"));
			    	     	indexingUserupload1.setDocumentType4(resultSet.getString("documentType4"));
			    	    	indexingUserupload1.setDocumentType5(resultSet.getString("documentType5"));
			    	    	indexingUserupload1.setDocumentType6(resultSet.getString("documentType6"));
					   
 				    	   }else if(resultSet.getString("document_type").equalsIgnoreCase("Purchase(Services)")){
					    	    
 				    	    	indexingUserupload1.setDocumentType1(resultSet.getString("documentType1"));
 				    	    	indexingUserupload1.setDocumentType2(resultSet.getString("documentType2"));
 				    	    	indexingUserupload1.setDocumentType3(resultSet.getString("documentType3"));
 				    	     	indexingUserupload1.setDocumentType4(resultSet.getString("documentType4"));
 				    	    	indexingUserupload1.setDocumentType5(resultSet.getString("documentType5"));
 				    	    	indexingUserupload1.setDocumentType6(resultSet.getString("documentType6"));
 						   
 				    	   }else if(resultSet.getString("document_type").equalsIgnoreCase("Sale(Goods)")){
					    	    
				    	    	indexingUserupload1.setDocumentType1(resultSet.getString("documentType1"));
				    	    	indexingUserupload1.setDocumentType2(resultSet.getString("documentType2"));
				    	    	indexingUserupload1.setDocumentType3(resultSet.getString("documentType3"));
				    	     	indexingUserupload1.setDocumentType4(resultSet.getString("documentType4"));
				    	    	indexingUserupload1.setDocumentType5(resultSet.getString("documentType5"));
				    	    	indexingUserupload1.setDocumentType6(resultSet.getString("documentType6"));
 				    	 
 				    	   }else if(resultSet.getString("document_type").equalsIgnoreCase("Sale(Services)")){
					    	    
				    	    	indexingUserupload1.setDocumentType1(resultSet.getString("documentType1"));
				    	    	indexingUserupload1.setDocumentType2(resultSet.getString("documentType2"));
				    	    	indexingUserupload1.setDocumentType3(resultSet.getString("documentType3"));
				    	     	indexingUserupload1.setDocumentType4(resultSet.getString("documentType4"));
				    	    	indexingUserupload1.setDocumentType5(resultSet.getString("documentType5"));
				    	    	indexingUserupload1.setDocumentType6(resultSet.getString("documentType6"));
						   
 				    	  }else if(resultSet.getString("document_type").equalsIgnoreCase("Audit Report")){
					    	    
				    	    	indexingUserupload1.setDocumentType1(resultSet.getString("documentType1"));
				    	    	indexingUserupload1.setDocumentType2(resultSet.getString("documentType2"));
				    	    	indexingUserupload1.setDocumentType3(resultSet.getString("documentType3"));
				    	     	indexingUserupload1.setDocumentType4(resultSet.getString("documentType4"));
				    	   
 				    	  }else if(resultSet.getString("document_type").equalsIgnoreCase("Balance Sheet")){
					    	    
				    	    	indexingUserupload1.setDocumentType1(resultSet.getString("documentType1"));
				    	    	indexingUserupload1.setDocumentType2(resultSet.getString("documentType2"));
				    	    	indexingUserupload1.setDocumentType3(resultSet.getString("documentType3"));
				    	   
				    	   }              
				    	    
				            list.add(indexingUserupload1);
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
		    	  
		    	 return list; 
		    	  
		    } 
            
           
            
            
            
            
            
            
            public List<IndexingUserupload> IndexingAttachment(IndexingUserupload indexingUserupload)
		    {   
		    	
		    	  List<IndexingUserupload> list=new ArrayList<IndexingUserupload>();
		    	  try(Connection connection=DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("select  id , ROUND(size , 2) as size , file  from document_info where file_no=(select file_no from document_info where id='"+indexingUserupload.getDocument_info_id()+"') and document_no = (select document_no from document_info where id='"+indexingUserupload.getDocument_info_id()+"')");)
				  {
		    		   ResultSet resultSet=preparedStatement.executeQuery(); 
				       while(resultSet.next())
		    		   {
				    	   
				    	   
				    	   IndexingUserupload indexingUserupload1=new IndexingUserupload();
				    	   indexingUserupload1.setId(resultSet.getInt("id"));
				    	   
				    	    String filename=resultSet.getString("file");
                            File file = new File(filename); 
                            String fileName=file.getName();
             		        String file_name="";
             		        for (int j=0; j<=fileName.length()-1; j++) {  
             	            
             		         if(fileName.charAt(j) == '?') { 
             	            	break;
             	             }
             	             else
             	             {
             	            	 file_name =file_name+fileName.charAt(j);
             	             }
             	           } 
				    	   
             		       String exact_file_name[]=file_name.split("_");
             		       indexingUserupload1.setAttachment_name(exact_file_name[1]);
				    	   indexingUserupload1.setSize(resultSet.getDouble("size"));   
				    	   indexingUserupload1.setVersion("<a href='javascript.void();' data-id='"+resultSet.getInt("id")+"'>1</a>");
				    	   indexingUserupload1.setLock("<a href='javascript.void();' data-id='"+resultSet.getInt("id")+"'><span class='material-icons' style='color:#6c757d;'>enhanced_encryption</span></a>");
				    	  
				    	   
				    	   int count=0;
				    	   PreparedStatement preparedStatement3 = connection
									.prepareStatement("select count(document_info_id) as count from document_comments where document_info_id ='"+resultSet.getInt("id")+"'");
						    ResultSet resultSet3=preparedStatement3.executeQuery();
							if(resultSet3.next()) {	
								
								count=resultSet3.getInt("count");
							}
				    	   
				    	   
				    	   String comments="<a href='javascript:void(0);' class='comments' data-id='"+resultSet.getInt("id")+"'>"+count+"</a>"; 
					       String action="<li class='dropdown' style='postion:relative;margin-left:42px;'>" + 
					    	   		"                        <a href='javascript:void(0);' class='dropdown-toggle' data-toggle='dropdown' role='button'>" + 
					    	   		"                            <i  style='color: #6c757d;font-size:42px;position:absolute;top:-32px;left:-26px;'>..</i>" + 
					    	   		"                        </a>" + 
					    	   		"                        <ul class='dropdown-menu'>" + 
					    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
					    	   		"                                    <li>" + 
					    	   		"                                        <a href='view_pdf.jsp?url="+resultSet.getInt("id")+"' data-id='"+resultSet.getInt("id")+"' target='_blank'>" + 
					    	   		"                                            <div class='menu-info'>" + 
					    	   		"                                                <h4>View</h4>" + 
					    	   		"                                            </div>" + 
					    	   		"                                        </a>" + 
					    	   		"                                    </li>" +
					    	   		"                                 </ul>" + 
					    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
					    	   		"                                    <li>" + 
					    	   		"                                        <a href='"+resultSet.getString("file")+"' download>" + 
					    	   		"                                            <div class='menu-info'>" + 
					    	   		"                                                <h4>Download</h4>" + 
					    	   		"                                            </div>" + 
					    	   		"                                        </a>" + 
					    	   		"                                    </li>" +
					    	   		"                                 </ul>" + 
					    	/*  	"                                <ul class='menu' style='overflow:hidden'>" + 
					    	   		"                                    <li>" + 
					    	   		"                                        <a href='javascript:void(0);' class='' data-id='"+resultSet.getInt("id")+"'>" + 
					    	   		"                                            <div class='menu-info'>" + 
					    	   		"                                                <h4>Rename</h4>" + 
					    	   		"                                            </div>" + 
					    	   		"                                        </a>" + 
					    	   		"                                    </li>" +
					    	   		"                                 </ul>" + */
					    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
					    	   		"                                    <li>" + 
					    	   		"                                        <a href='javascript:void(0);' class='delete-single-attachment' data-id='"+resultSet.getInt("id")+"'>" + 
					    	   		"                                            <div class='menu-info'>" + 
					    	   		"                                                <h4>Delete</h4>" + 
					    	   		"                                            </div>" + 
					    	   		"                                        </a>" + 
					    	   		"                                    </li>" +
					    	   		"                                 </ul>" + 
					    	   		"                           </ul>" + 
					    	   		"                    </li>";
				    	
				    	   indexingUserupload1.setComments(comments);
					       indexingUserupload1.setAction(action);
				    	   list.add(indexingUserupload1);
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
		    	  
		    	 return list; 
		    	  
		    } 	  
            
            
            
            
            
            
            
            
            public List<IndexingUserupload> folderAttachment(IndexingUserupload indexingUserupload)
		    {   
		    	
		    	  List<IndexingUserupload> list=new ArrayList<IndexingUserupload>();
		    	  try(Connection connection=DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("select  id , ROUND(size , 2) as size , file  from document_info where file_no=(select file_no from document_info where id='"+indexingUserupload.getDocument_info_id()+"') and document_no = (select document_no from document_info where id='"+indexingUserupload.getDocument_info_id()+"') and folder_name = (select folder_name from document_info where id='"+indexingUserupload.getDocument_info_id()+"')");)
				  {
		    		   ResultSet resultSet=preparedStatement.executeQuery(); 
				       while(resultSet.next())
		    		   {
				    	   
				    	   
				    	   IndexingUserupload indexingUserupload1=new IndexingUserupload();
				    	   indexingUserupload1.setId(resultSet.getInt("id"));
				    	   
				    	    String filename=resultSet.getString("file");
                            File file = new File(filename); 
                            String fileName=file.getName();
             		        String file_name="";
             		        for (int j=0; j<=fileName.length()-1; j++) {  
             	            
             		         if(fileName.charAt(j) == '?') { 
             	            	break;
             	             }
             	             else
             	             {
             	            	 file_name =file_name+fileName.charAt(j);
             	             }
             	           } 
				    	   
             		       String exact_file_name[]=file_name.split("_");
             		       indexingUserupload1.setAttachment_name(exact_file_name[1]);
				    	   indexingUserupload1.setSize(resultSet.getDouble("size"));   
				    	   indexingUserupload1.setVersion("<a href='javascript.void();' data-id='"+resultSet.getInt("id")+"'>1</a>");
				    	   indexingUserupload1.setLock("<a href='javascript.void();' data-id='"+resultSet.getInt("id")+"'><span class='material-icons' style='color:#6c757d;'>enhanced_encryption</span></a>");
				    	  
				    	   
				    	   int count=0;
				    	   PreparedStatement preparedStatement3 = connection
									.prepareStatement("select count(document_info_id) as count from document_comments where document_info_id ='"+resultSet.getInt("id")+"'");
						    ResultSet resultSet3=preparedStatement3.executeQuery();
							if(resultSet3.next()) {	
								
								count=resultSet3.getInt("count");
							}
				    	   
				    	   
				    	   String comments="<a href='javascript:void(0);' class='comments' data-id='"+resultSet.getInt("id")+"'>"+count+"</a>"; 
					       String action="<li class='dropdown' style='postion:relative;margin-left:42px;'>" + 
					    	   		"                        <a href='javascript:void(0);' class='dropdown-toggle' data-toggle='dropdown' role='button'>" + 
					    	   		"                            <i  style='color: #6c757d;font-size:42px;position:absolute;top:-32px;left:-26px;'>..</i>" + 
					    	   		"                        </a>" + 
					    	   		"                        <ul class='dropdown-menu'>" + 
					    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
					    	   		"                                    <li>" + 
					    	   		"                                        <a href='view_pdf.jsp?url="+resultSet.getInt("id")+"' data-id='"+resultSet.getInt("id")+"' target='_blank'>" + 
					    	   		"                                            <div class='menu-info'>" + 
					    	   		"                                                <h4>View</h4>" + 
					    	   		"                                            </div>" + 
					    	   		"                                        </a>" + 
					    	   		"                                    </li>" +
					    	   		"                                 </ul>" + 
					    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
					    	   		"                                    <li>" + 
					    	   		"                                        <a href='"+resultSet.getString("file")+"' download>" + 
					    	   		"                                            <div class='menu-info'>" + 
					    	   		"                                                <h4>Download</h4>" + 
					    	   		"                                            </div>" + 
					    	   		"                                        </a>" + 
					    	   		"                                    </li>" +
					    	   		"                                 </ul>" + 
					    	/*   		"                                <ul class='menu' style='overflow:hidden'>" + 
					    	   		"                                    <li>" + 
					    	   		"                                        <a href='javascript:void(0);' class='' data-id='"+resultSet.getInt("id")+"'>" + 
					    	   		"                                            <div class='menu-info'>" + 
					    	   		"                                                <h4>Rename</h4>" + 
					    	   		"                                            </div>" + 
					    	   		"                                        </a>" + 
					    	   		"                                    </li>" +
					    	   		"                                 </ul>" + */
					    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
					    	   		"                                    <li>" + 
					    	   		"                                        <a href='javascript:void(0);' class='delete-single-attachment' data-id='"+resultSet.getInt("id")+"'>" + 
					    	   		"                                            <div class='menu-info'>" + 
					    	   		"                                                <h4>Delete</h4>" + 
					    	   		"                                            </div>" + 
					    	   		"                                        </a>" + 
					    	   		"                                    </li>" +
					    	   		"                                 </ul>" + 
					    	   		"                           </ul>" + 
					    	   		"                    </li>";
				    	
				    	   indexingUserupload1.setComments(comments);
					       indexingUserupload1.setAction(action);
				    	   list.add(indexingUserupload1);
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
		    	  
		    	 return list; 
		    	  
		    } 	  
            
            
            
            
            
            
            public List<IndexingUserupload> dashboradDocument(IndexingUserupload indexingUserupload)
		    {   
		    	
		    	  List<IndexingUserupload> list=new ArrayList<IndexingUserupload>();
		    	  try(Connection connection=DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("select  id , file_name , document_no ,  DATE_FORMAT( upload_date ,'%d %b %Y') AS upload_date , document_type from document_info where company_id='"+indexingUserupload.getCompanyid()+"' and document_no is not null and file_name is not null  and trash=0 group by document_no order by id desc limit 50");)
				  {
		    		   ResultSet resultSet=preparedStatement.executeQuery(); 
				       while(resultSet.next())
		    		   {
				    	   
				    	   IndexingUserupload indexingUserupload1=new IndexingUserupload();
				    	   indexingUserupload1.setId(resultSet.getInt("id"));
				    	   indexingUserupload1.setFilename(resultSet.getString("file_name"));
				    	   indexingUserupload1.setDocumenttype(resultSet.getString("document_type"));
				    	   indexingUserupload1.setDocument_no(resultSet.getString("document_no"));
				    	   indexingUserupload1.setUpload_id(resultSet.getString("upload_date"));
				    	   list.add(indexingUserupload1);
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
		    	  
		    	 return list; 
		    	  
		    }
            
            
            
            
            
            
            
            
		    public List<IndexingUserupload> documentDetails(IndexingUserupload userupload) {

				
				List<IndexingUserupload> list=new ArrayList<IndexingUserupload>();     
				try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
						.prepareStatement("select  restore_client_name , restore_date , trash_client_name , trash_date , id , client_name , department , file_name , document_type , DATE_FORMAT( upload_date ,'%d %b %Y') AS upload_date , modify_client , DATE_FORMAT(modify_date ,'%d %b %Y') AS modify_date , modify_client_name , file_no , file_name ,  other_client , access_level , document_no from document_info where document_no=(select document_no from document_info where id='"+userupload.getDocument_info_id()+"') and file_no=(select file_no from document_info where id='"+userupload.getDocument_info_id()+"')");) {
					 	ResultSet resultSet=preparedStatement.executeQuery();
					 	 if(resultSet.next())
					    {
							
					 		
					 	    String access_level="";
					 		IndexingUserupload userupload1=new IndexingUserupload();
					 		if(resultSet.getString("access_level") !=null)
				 			 {
				 			 	 JSONParser jsonParser = new JSONParser();
							     JSONArray jsonArray = (JSONArray) jsonParser.parse(resultSet.getString("access_level"));
							     JSONObject access_level1 = null;
		                         for(Object object : jsonArray) {
		                    	   
										access_level1 = (JSONObject) object;
										String access_level2=(String)access_level1.get("access_level");
										String employee_name="";
									
										PreparedStatement preparedStatement1 = connection
												.prepareStatement("select  employee_name  from  client_details  where id='"+Integer.parseInt((String)access_level1.get("client_id"))+"'");
											 	ResultSet resultSet1=preparedStatement1.executeQuery();
											 	 if(resultSet1.next())
											    {
											 		employee_name=resultSet1.getString("employee_name");
											    }
										
											 	access_level +=employee_name+":"+access_level2+","; 	 
											 	 
					                   }
							    }
				 				
						 	
					 		
					 		
					 		
					 		
						    userupload1.setAccess_level(access_level);
						    userupload1.setCurrentDate(resultSet.getString("upload_date"));
						    userupload1.setFile_no(resultSet.getString("file_no"));;
						    userupload1.setModify_date(resultSet.getString("modify_date"));
						    userupload1.setModify_name(resultSet.getString("modify_client_name"));
						    userupload1.setClient_name(resultSet.getString("client_name"));
						    userupload1.setDepartmentname(resultSet.getString("department"));
						    userupload1.setDocumenttype(resultSet.getString("document_type"));
						    userupload1.setDocument_no(resultSet.getString("document_no"));
						    userupload1.setId(resultSet.getInt("id"));
						    userupload1.setFilename(resultSet.getString("file_name"));
						    userupload1.setTrash_date(resultSet.getString("trash_date"));
						    userupload1.setTrash_client_name(resultSet.getString("trash_client_name"));
						    userupload1.setRestore_date(resultSet.getString("restore_date"));
						    userupload1.setRestore_client_name(resultSet.getString("restore_client_name"));
						    list.add(userupload1);
				 		 
					 		 
					 	 		
					 		/*
							 	
					 			 String other_client =":";
					 			 String access_level=":";
					 			 if(resultSet.getString("other_client") !=null)
					 			 {
					 				other_client =resultSet.getString("other_client");
							 	 }
					 			 
					 			if(resultSet.getString("access_level") !=null)
					 			 {
					 				access_level =resultSet.getString("access_level");
							 	 }
					 			 
					 			 
					 			 
					 			 String access[]=access_level.split(":");
                                 String other_client_id[]=other_client.split(":");
                                 for(int i=0;i<other_client_id.length;i++)
                                 {
                                
                                	
                                	if(Integer.parseInt(other_client_id[i])==userupload.getId()){
                                	
                                		IndexingUserupload userupload1=new IndexingUserupload();
          							    userupload1.setOther_client(Integer.parseInt(other_client_id[i]));
          							    userupload1.setAccess_level(resultSet.getString("access_level"));
          							    userupload1.setCurrentDate(resultSet.getString("upload_date"));
          							    userupload1.setFile_no(resultSet.getString("file_no"));;
          							    userupload1.setModify_date(resultSet.getString("modify_date"));
          							    userupload1.setModify_name(resultSet.getString("modify_client_name"));
          							    userupload1.setClient_name(resultSet.getString("client_name"));
          							    userupload1.setDepartmentname(resultSet.getString("department"));
          							    list.add(userupload1);
                                        break;
                                		
                                	 }else if(Integer.parseInt(other_client_id[i]) != userupload.getId()){
                                     	
                                 		
                                		IndexingUserupload userupload1=new IndexingUserupload();
           							    userupload1.setOther_client(Integer.parseInt(other_client_id[i]));
           							    userupload1.setAccess_level(resultSet.getString("access_level"));
           							    userupload1.setCurrentDate(resultSet.getString("upload_date"));
           							    userupload1.setFile_no(resultSet.getString("file_no"));;
           							    userupload1.setModify_date(resultSet.getString("modify_date"));
           							    userupload1.setModify_name(resultSet.getString("modify_client_name"));
           							    userupload1.setClient_name(resultSet.getString("client_name"));
           							    userupload1.setDepartmentname(resultSet.getString("department"));
           							    list.add(userupload1);
                                        break;
                                 		
                                 	 }
      							    
                                 	
                                	
                                }
					 		
					 		*/
					 		
					 	
					 			
					 	}
					
		  	   } catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
			  } catch (Exception exception) {
					exception.printStackTrace();
			 }

				return list;
			}
	    
		    
		    
		    public boolean trashallAttachment(IndexingUserupload userupload) {

		    	boolean check = false;
				try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
						.prepareStatement("select file_no , document_no from document_info where id='"+userupload.getId()+"'");) {
					 ResultSet resultSet=preparedStatement.executeQuery();
					 if(resultSet.next())
					 {
						 
						 
						    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
							Date myDate = formatter.parse(userupload.getCurrentDate());
							Calendar c = Calendar.getInstance();
							c.setTime(myDate);
							c.add(Calendar.DATE, 30);
							String updateDate = formatter.format(c.getTime());
						  
							PreparedStatement preparedStatement2 = connection
									.prepareStatement("update document_info set trash='1'  ,  deletedate='"+updateDate+"' , trash_date='"+userupload.getCurrentDate()+"' , trash_client_name='"+userupload.getClient_name()+"'  where file_no='"+resultSet.getString("file_no")+"' and document_no ='"+resultSet.getString("document_no")+"'");
						
						check = preparedStatement2.executeUpdate()>0;
							
					 }
					
				} catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
				} catch (Exception exception) {
					exception.printStackTrace();
				}

				return check;
			}
		
            
            
            
		    
		    
		    
		    
		    
		    
		    public boolean editIndexing(IndexingUserupload userupload)
			{
				boolean check=false;
				try(Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection.prepareStatement("SELECT document_no , file_no , document_type FROM `document_info` WHERE file_no=(select file_no from document_info where id='"+userupload.getDocument_info_id()+"') and document_no=(select document_no from document_info where id='"+userupload.getDocument_info_id()+"')");)
				{
					ResultSet resultset=preparedStatement.executeQuery();
					if(resultset.next())
				     {
						
						PreparedStatement preparedStatement1=null;
						if(userupload.getInvoicedate() == null)
						  {
							  SimpleDateFormat sdfIn = new SimpleDateFormat("yyyy-MM-dd");
						      java.util.Date udateIn = sdfIn.parse("0001-01-01");
						      long lIn = udateIn.getTime();
						      java.sql.Date sdateIn = new java.sql.Date(lIn);
						  	  preparedStatement1 = connection.prepareStatement("UPDATE document_info SET customer_code ='"+userupload.getCustomercode()+"' , customer_name= '"+userupload.getCustomername()+"' , employee_code='"+userupload.getEmployecode()+"' , employee_name= '"+userupload.getEmployename()+"'  , invoice_date= '"+sdateIn+"'  , invoice_number='"+userupload.getInvoicenumber()+"' , vendor_code='"+userupload.getVendorcode()+"' , vendor_name= '"+userupload.getVendorname()+"' , documentType1= '"+userupload.getDocumentType1()+"' , documentType2 ='"+userupload.getDocumentType2()+"' , documentType3 = '"+userupload.getDocumentType3()+"' , documentType4 = '"+userupload.getDocumentType4()+"' , documentType5 ='"+userupload.getDocumentType5()+"' , documentType6= '"+userupload.getDocumentType6()+"' WHERE document_no='"+resultset.getString("document_no")+"' and file_no='"+resultset.getString("file_no")+"' and document_type ='"+resultset.getString("document_type")+"'");
							
						      
						      
						  }else {
						  
						    SimpleDateFormat sdfIn = new SimpleDateFormat("yyyy-MM-dd");
					        java.util.Date udateIn = sdfIn.parse(userupload.getInvoicedate());
					        long lIn = udateIn.getTime();
					        java.sql.Date sdateIn = new java.sql.Date(lIn);
							preparedStatement1 = connection.prepareStatement("UPDATE document_info SET customer_code ='"+userupload.getCustomercode()+"' , customer_name= '"+userupload.getCustomername()+"' , employee_code='"+userupload.getEmployecode()+"' , employee_name= '"+userupload.getEmployename()+"'  , invoice_date= '"+sdateIn+"'  , invoice_number='"+userupload.getInvoicenumber()+"' , vendor_code='"+userupload.getVendorcode()+"' , vendor_name= '"+userupload.getVendorname()+"' , documentType1= '"+userupload.getDocumentType1()+"' , documentType2 ='"+userupload.getDocumentType2()+"' , documentType3 = '"+userupload.getDocumentType3()+"' , documentType4 = '"+userupload.getDocumentType4()+"' , documentType5 ='"+userupload.getDocumentType5()+"' , documentType6= '"+userupload.getDocumentType6()+"' WHERE document_no='"+resultset.getString("document_no")+"' and file_no='"+resultset.getString("file_no")+"' and document_type ='"+resultset.getString("document_type")+"'");
								
					        
						  }
						 check = preparedStatement1.executeUpdate()>0;
						   
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
			  
		      return check;
		    
			}
		    
		    
		   
		    public boolean editpermission(AddFile addfile) {
				boolean check=false;
				
				System.out.println(addfile.getFile_access_level());
				
				try (Connection connection=DBConnection.openConnection();PreparedStatement preparedStatement1 = connection.prepareStatement("select document_no , file_no from document_info where id='"+addfile.getDocument_info_id()+"'");) {
					 
					ResultSet resultSet=preparedStatement1.executeQuery(); 
				    if(resultSet.next()) {
				    
				    	PreparedStatement preparedStatement = connection.prepareStatement("UPDATE document_info SET  modify_client = ? , access_level = ? , other_client = ? , modify_date=? , modify_client_name = ? WHERE file_no ='"+resultSet.getString("file_no")+"' and document_no ='"+resultSet.getString("document_no")+"'");
						
						 preparedStatement.setInt(1, addfile.getClient_id());
				         preparedStatement.setString(2, addfile.getFile_access_level());
				         preparedStatement.setString(3, addfile.getFile_user_name_id());
				         DateFormat df = new SimpleDateFormat("dd/MM/yy");
				         Date date = new Date();
				         preparedStatement.setString(4, df.format(date));
				         preparedStatement.setString(5, addfile.getClient_name());
				         check = preparedStatement.executeUpdate()>0;
				    	 
				     }
					
				
				} catch (SQLException sqlexception) {
					sqlexception.getMessage();
				} catch (Exception exception) {
					exception.printStackTrace();
				}
				return check;
			
		    }
		    
		    
		    
		    
		    
		    public boolean deleteSingleAttachment(IndexingUserupload userupload)
			{
				boolean check=false;
				
				
				try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
						.prepareStatement("select  file  from document_info where id='"+userupload.getDocument_info_id()+"'");) {
					 ResultSet resultSet=preparedStatement.executeQuery();
					 if(resultSet.next())
					 {
						 
						 
						    String file=resultSet.getString("file");
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
						 
		                 boolean deletefile=new DeleteFile().deletefile_name("softdoc-262410.appspot.com" , file_name);
		                 PreparedStatement preparedStatement2 = connection
									.prepareStatement("delete from document_info  where id='"+userupload.getDocument_info_id()+"'");
						 check = preparedStatement2.executeUpdate()>0;

					 }
					
					 
					 
					 
				} catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
				} catch (Exception exception) {
					exception.printStackTrace();
				}

				return check;
			}
		    
		    
		    
		    public boolean deletetrash(IndexingUserupload userupload)
			{
				boolean check=false;
				
				String file_no = null;
				
				try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
						.prepareStatement("select  file , file_no  from document_info where id='"+userupload.getDocument_info_id()+"'");) {
					 ResultSet resultSet=preparedStatement.executeQuery();
					 if(resultSet.next())
					 {
						  String file_name="";
						 
						  file_no=resultSet.getString("file_no");
						  
						   if(resultSet.getString("file") !=null) {
						 
						    String file=resultSet.getString("file");
						    File fileDetails = new File(file);
		                    String fileName=fileDetails.getName();
		                   
		                    
		                    for (int j=0; j<=fileName.length()-1; j++) {  
		                   
		                    if(fileName.charAt(j) == '?'){
		                         break;
		                     }
		                     else
		                     {
		                       file_name =file_name+fileName.charAt(j);
		                     }
		          
		                    }
						 
						  }   
		                    
		                 boolean deletefile=new DeleteFile().deletefile_name("softdoc-262410.appspot.com" , file_name);
		        
					 }
					
			         PreparedStatement preparedStatement2 = connection
												.prepareStatement("delete from document_info  where file_no='"+file_no+"'");
									 check = preparedStatement2.executeUpdate()>0;

					 
					 
					 
				} catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
				} catch (Exception exception) {
					exception.printStackTrace();
				}

				return check;
			}
		    
		    
		    public List<IndexingUserupload> starDocument(IndexingUserupload indexingUserupload)
		    {   
		    	
		    	 String department=indexingUserupload.getDepartmentname();
		    	  JSONParser jsonParser1 = new JSONParser();
				  JSONArray jsonArray1 = null;
				  
				 
				  try {
					jsonArray1 = (JSONArray) jsonParser1.parse(department);
					
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				  List<IndexingUserupload> list=new ArrayList<IndexingUserupload>();
				  for(Object depat_object : jsonArray1) {
					

					JSONObject depat_access_level = (JSONObject) depat_object;
					  
				 
				  try(Connection connection=DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("SELECT  id , document_no , file_name  , document_type , DATE_FORMAT(star_date, '%d %b %Y')as star_date , DATE_FORMAT(modify_date ,'%d %b %Y') AS modify_date  , modify_client_name  FROM `document_info`  WHERE  company_id='"+indexingUserupload.getCompanyid()+"' AND  status='quality_approved' AND star = '1'  and department='"+(String)depat_access_level.get("department")+"' group by document_no");)//AND folder_name is not null AND star = '1' group by folder_name
				  {
		    		  
		    		  
		    		   ResultSet resultSet=preparedStatement.executeQuery(); 
				       while(resultSet.next())
		    		   {
				    	
				    	   
				    	   IndexingUserupload indexingUserupload1=new IndexingUserupload();
				    	   indexingUserupload1.setId(resultSet.getInt("id"));
				    	   String checkbox="<input type='checkbox'  name='star_document' value='"+resultSet.getInt("id")+"'  id='folder_star_"+resultSet.getInt("id")+"'><label for='folder_star_"+resultSet.getInt("id")+"'></label>";
				    	   indexingUserupload1.setDelete_checkbox(checkbox);
				    	   indexingUserupload1.setFilename("<a href='folderdetails.jsp?"+resultSet.getInt("id")+"'>"+resultSet.getString("file_name")+"</a>");
				    	   
				    	   /*
				    	   
				    	  if(resultSet.getString("folder_name") !=null) {
				    	  	    indexingUserupload1.setFolder_name("<a href='folder-view.jsp?"+resultSet.getInt("id")+"'>"+resultSet.getString("folder_name")+"</a>");
				    	  }else {
				    	  	    indexingUserupload1.setFolder_name("");
				    	  }*/
				    	   
				    	   indexingUserupload1.setDocument_no(resultSet.getString("document_no"));
				    	   
				    	   indexingUserupload1.setDocumenttype("<a href='document.jsp?"+resultSet.getInt("id")+"'>"+resultSet.getString("document_type")+"</a>");
				    	   
				    	   if(resultSet.getString("star_date") == null) {
				    		   indexingUserupload1.setStar_date("");
					      }else {
				    		   indexingUserupload1.setStar_date(resultSet.getString("star_date"));
					       }
				    	  
				    	   if(resultSet.getString("modify_date") == null) {
				    		   indexingUserupload1.setModify_date("");
					      }else {
					    	  indexingUserupload1.setModify_date(resultSet.getString("modify_date"));
					       }
				    	   
				    	   if(resultSet.getString("modify_client_name") == null) {
				    		   indexingUserupload1.setModify_name("");
				            }else {
					    	   indexingUserupload1.setModify_name(resultSet.getString("modify_client_name"));
					        }
				    	  
				    	
				    	   list.add(indexingUserupload1);
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
		    	  
		    	  return list;  
			
			}	
		    	  
		 return null;   	
		    	  
		}
            
		    
		    
		    
		    
		    public List<IndexingUserupload> starFolderDocument(IndexingUserupload indexingUserupload)
		    {   
		    	
		    	  List<IndexingUserupload> list=new ArrayList<IndexingUserupload>();
		    	  try(Connection connection=DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("SELECT  id , folder_name , file_name  , document_type , DATE_FORMAT(star_date ,'%d %b %Y') AS star_date , DATE_FORMAT(modify_date ,'%d %b %Y') AS modify_date  , modify_client_name  FROM `document_info`  WHERE  company_id='"+indexingUserupload.getCompanyid()+"' AND  status='quality_approved' AND star = '1' AND folder_name is not null group by document_no");)
				  {
		    		  
		    		  
		    		   ResultSet resultSet=preparedStatement.executeQuery(); 
				       while(resultSet.next())
		    		   {
				    	   
				    	   IndexingUserupload indexingUserupload1=new IndexingUserupload();
				    	   indexingUserupload1.setId(resultSet.getInt("id"));
				    	   String checkbox="<input type='checkbox'  name='star_document' value='"+resultSet.getInt("id")+"'  id='star_"+resultSet.getInt("id")+"'><label for='star_"+resultSet.getInt("id")+"'></label>";
				    	   indexingUserupload1.setDelete_checkbox(checkbox);
				    	   indexingUserupload1.setFilename("<a href='folderdetails.jsp?"+resultSet.getInt("id")+"'>"+resultSet.getString("file_name")+"</a>");
				    	   
				    	  if(resultSet.getString("folder_name") !=null) {
				    	  	    indexingUserupload1.setFolder_name("<a href='folder-view.jsp?"+resultSet.getInt("id")+"'>"+resultSet.getString("folder_name")+"</a>");
				    	  }else {
				    	  	    indexingUserupload1.setFolder_name("");
				    	  }
				    	   
				    	   indexingUserupload1.setDocumenttype("<a href='document.jsp?"+resultSet.getInt("id")+"'>"+resultSet.getString("document_type")+"</a>");
				    	   
				    	   if(resultSet.getString("star_date") == null) {
				    		   indexingUserupload1.setStar_date("");
					      }else {
				    		   indexingUserupload1.setStar_date(resultSet.getString("star_date"));
					       }
				    	  
				    	   if(resultSet.getString("modify_date") == null) {
				    		   indexingUserupload1.setModify_date("");
					      }else {
					    	  indexingUserupload1.setModify_date(resultSet.getString("modify_date"));
					       }
				    	   
				    	   if(resultSet.getString("modify_client_name") == null) {
				    		   indexingUserupload1.setModify_name("");
				            }else {
					    	   indexingUserupload1.setModify_name(resultSet.getString("modify_client_name"));
					        }
				    	  
				    	
				    	   list.add(indexingUserupload1);
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
		    	  
		    	 return list; 
		    	  
		    }
            
		    
		    
		    
		    
		    
		    public List<IndexingUserupload> trashDashboard(IndexingUserupload indexingUserupload)
		    {   
		    	  List<IndexingUserupload> list=new ArrayList<IndexingUserupload>();
		    	  
		    	  String department=indexingUserupload.getDepartmentname();
		    	  JSONParser jsonParser1 = new JSONParser();
				  JSONArray jsonArray1 = null;
				  
				 
				  try {
					jsonArray1 = (JSONArray) jsonParser1.parse(department);
					
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		    	 
				  
				  for(Object depat_object : jsonArray1) {
						
						JSONObject depat_access_level = (JSONObject) depat_object;
						
						
				   
		    	  try(Connection connection=DBConnection.openConnection();PreparedStatement  preparedStatement=connection.prepareStatement("select id , file , folder_name , document_type , file_name , DATE_FORMAT( trash_date ,'%d %b %Y') AS trash_date  , trash_client_name  from document_info where  company_id='"+indexingUserupload.getCompanyid()+"' and department='"+(String)depat_access_level.get("department")+"'  and trash='1' and client_id > '0' and document_no is null and folder_status='folder' group by folder_name");
				    	    )
				  {
		    		  
		    		   ResultSet resultSet=preparedStatement.executeQuery(); 
				       while(resultSet.next())
		    		   {
				    	   
				    	   
				    	   IndexingUserupload indexingUserupload1=new IndexingUserupload();
				    	   indexingUserupload1.setId(resultSet.getInt("id"));
				    	   String checkbox="<input type='checkbox'  name='trash_document' value='"+resultSet.getInt("id")+"'  id='trash_"+resultSet.getInt("id")+"'><label for='trash_"+resultSet.getInt("id")+"'></label>";
				    	   indexingUserupload1.setDelete_checkbox(checkbox);
				    	  
				    	   if(resultSet.getString("file_name") == null || resultSet.getString("file_name").equals("")) {
				    	      indexingUserupload1.setFilename(resultSet.getString(""));
				    	   }else {
				    	      indexingUserupload1.setFilename(resultSet.getString("file_name"));
				    		   
				    	   }
				    	   
				    	   if(resultSet.getString("folder_name") == null) {
				    		   indexingUserupload1.setFolder_name("");
						  }else {
				    		  indexingUserupload1.setFolder_name(resultSet.getString("folder_name"));
					      }
				    	  
				    	   
				    	   
				    	  // indexingUserupload1.setDocumenttype(resultSet.getString("document_type"));
				    	   
				    	   if(resultSet.getString("trash_date") == null) {
				    		   indexingUserupload1.setTrash_date("");
					      }else {
				    		   indexingUserupload1.setTrash_date(resultSet.getString("trash_date"));
					       }
				    	  
				    	 
				    	   if(resultSet.getString("trash_client_name") == null) {
				    		   indexingUserupload1.setTrash_client_name("");
				            }else {
					    	   indexingUserupload1.setTrash_client_name(resultSet.getString("trash_client_name"));
					        }
				    	  
				    	    
				    	   String action=" <li class='dropdown' style='postion:relative;margin-left:42px;'>" + 
					    	   		"                        <a href='javascript:void(0);' class='dropdown-toggle' data-toggle='dropdown' role='button'>" + 
					    	   		"                            <i  style='color: #6c757d;font-size:42px;position:absolute;top:-32px;left:-26px;'>..</i>" + 
					    	   		"                        </a>" + 
					    	   		"                        <ul class='dropdown-menu'>" + 
					    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
					    	   		"                                    <li>" + 
					    	   		"                                        <a href='javascript:void(0);' class='restore' data-id='"+resultSet.getInt("id")+"'>" + 
					    	   		"                                            <div class='menu-info'>" + 
					    	   		"                                                <h4>Restore</h4>" + 
					    	   		"                                            </div>" + 
					    	   		"                                        </a>" + 
					    	   		"                                    </li>" +
					    	   		"                                 </ul>" + 
					    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
					    	   		"                                    <li>" + 
					    	   		"                                        <a href='javascript:void(0);' class='delete-single-attachment' data-id='"+resultSet.getInt("id")+"'>" + 
					    	   		"                                            <div class='menu-info'>" + 
					    	   		"                                                <h4>Delete</h4>" + 
					    	   		"                                            </div>" + 
					    	   		"                                        </a>" + 
					    	   		"                                    </li>" +
					    	   		"                                 </ul>" + 
					    	   		"                           </ul>" + 
					    	   		"                    </li>";
				    	   indexingUserupload1.setAction(action);
				    	   list.add(indexingUserupload1);
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
		    	 return list; 
		    	  
		    }
		    
		    
		    
		    
		    
		    
		    public List<IndexingUserupload> trashFile(IndexingUserupload indexingUserupload)
		    {   
		    	  List<IndexingUserupload> list=new ArrayList<IndexingUserupload>();
		    	  
		    	  String department=indexingUserupload.getDepartmentname();
		    	  JSONParser jsonParser1 = new JSONParser();
				  JSONArray jsonArray1 = null;
				  
				 
				  try {
					jsonArray1 = (JSONArray) jsonParser1.parse(department);
					
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		    	 
				  
				  for(Object depat_object : jsonArray1) {
						
						JSONObject depat_access_level = (JSONObject) depat_object;
						
						
				   
		    	  try(Connection connection=DBConnection.openConnection();PreparedStatement  preparedStatement=connection.prepareStatement("select id , department , file , document_type , file_name , DATE_FORMAT( trash_date ,'%d %b %Y') AS trash_date  , trash_client_name  from document_info where  company_id='"+indexingUserupload.getCompanyid()+"' and department='"+(String)depat_access_level.get("department")+"'  and trash='1' and client_id > '0' and file_no is not null group by file_no");
				    	    )
				  {
		    		  
		    		   ResultSet resultSet=preparedStatement.executeQuery(); 
				       while(resultSet.next())
		    		   {
				    	   
				    	   
				    	   
				    	   IndexingUserupload indexingUserupload1=new IndexingUserupload();
				    	   indexingUserupload1.setId(resultSet.getInt("id"));
				    	   String checkbox="<input type='checkbox'  name='trash_document' value='"+resultSet.getInt("id")+"'  id='trash_"+resultSet.getInt("id")+"'><label for='trash_"+resultSet.getInt("id")+"'></label>";
				    	   indexingUserupload1.setDelete_checkbox(checkbox);
				    	   
				    	   indexingUserupload1.setFilename(resultSet.getString("file_name"));
				    	   indexingUserupload1.setDepartmentname(resultSet.getString("department"));
				    	   
				    	  
				    	   if(resultSet.getString("trash_date") == null) {
				    		   indexingUserupload1.setTrash_date("");
					      }else {
				    		   indexingUserupload1.setTrash_date(resultSet.getString("trash_date"));
					       }
				    	  
				    	 
				    	   if(resultSet.getString("trash_client_name") == null) {
				    		   indexingUserupload1.setTrash_client_name("");
				            }else {
					    	   indexingUserupload1.setTrash_client_name(resultSet.getString("trash_client_name"));
					        }
				    	  
				    	    
				    	   String action=" <li class='dropdown' style='postion:relative;margin-left:42px;'>" + 
					    	   		"                        <a href='javascript:void(0);' class='dropdown-toggle' data-toggle='dropdown' role='button'>" + 
					    	   		"                            <i  style='color: #6c757d;font-size:42px;position:absolute;top:-32px;left:-26px;'>..</i>" + 
					    	   		"                        </a>" + 
					    	   		"                        <ul class='dropdown-menu'>" + 
					    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
					    	   		"                                    <li>" + 
					    	   		"                                        <a href='javascript:void(0);' class='file_restore' data-id='"+resultSet.getInt("id")+"'>" + 
					    	   		"                                            <div class='menu-info'>" + 
					    	   		"                                                <h4>Restore</h4>" + 
					    	   		"                                            </div>" + 
					    	   		"                                        </a>" + 
					    	   		"                                    </li>" +
					    	   		"                                 </ul>" + 
					    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
					    	   		"                                    <li>" + 
					    	   		"                                        <a href='javascript:void(0);' class='delete-file' data-id='"+resultSet.getInt("id")+"'>" + 
					    	   		"                                            <div class='menu-info'>" + 
					    	   		"                                                <h4>Delete</h4>" + 
					    	   		"                                            </div>" + 
					    	   		"                                        </a>" + 
					    	   		"                                    </li>" +
					    	   		"                                 </ul>" + 
					    	   		"                           </ul>" + 
					    	   		"                    </li>";
				    	   indexingUserupload1.setAction(action);
				    	   list.add(indexingUserupload1);
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
		    	 return list; 
		    	  
		    }
		    
		    
		    
		    
		    public List<IndexingUserupload> trashDashboardDocument(IndexingUserupload indexingUserupload)
		    {   
		    	
		  	     List<IndexingUserupload> list=new ArrayList<IndexingUserupload>();
		    	 String department=indexingUserupload.getDepartmentname();
		    	 JSONParser jsonParser1 = new JSONParser();
				 JSONArray jsonArray1 = null;
				  
				 
				  try {
					jsonArray1 = (JSONArray) jsonParser1.parse(department);
					
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		    	 
				  
				  for(Object depat_object : jsonArray1) {
						
						JSONObject depat_access_level = (JSONObject) depat_object;
		    	  
						try(Connection connection=DBConnection.openConnection();PreparedStatement  preparedStatement=connection.prepareStatement("select id , file , folder_name , document_type , file_name , DATE_FORMAT( trash_date ,'%d %b %Y') AS trash_date  , trash_client_name , document_no  from document_info where  company_id='"+indexingUserupload.getCompanyid()+"' and department='"+(String)depat_access_level.get("department")+"'  and trash='1' and client_id > '0' and document_no is not null and folder_status is null  group by document_no");
				    	    )
				  {
		    		  
		    		   ResultSet resultSet=preparedStatement.executeQuery(); 
				       while(resultSet.next())
		    		   {
				    	   
				    	   
				    	   IndexingUserupload indexingUserupload1=new IndexingUserupload();
				    	   indexingUserupload1.setId(resultSet.getInt("id"));
				    	   String checkbox="<input type='checkbox'  name='trash_document' value='"+resultSet.getInt("id")+"'  id='trash_"+resultSet.getInt("id")+"'><label for='trash_"+resultSet.getInt("id")+"'></label>";
				    	   indexingUserupload1.setDelete_checkbox(checkbox);
				    	   indexingUserupload1.setFilename(resultSet.getString("file_name"));
				    	   
				    	   
				    	   if(resultSet.getString("document_no") == null) {
				    		   indexingUserupload1.setDocument_no("");
						  }else {
				    		  indexingUserupload1.setDocument_no(resultSet.getString("document_no"));
					      }
				    	  
				    	   
				    	   
				    	   indexingUserupload1.setDocumenttype(resultSet.getString("document_type"));
				    	   
				    	   if(resultSet.getString("trash_date") == null) {
				    		   indexingUserupload1.setTrash_date("");
					      }else {
				    		   indexingUserupload1.setTrash_date(resultSet.getString("trash_date"));
					       }
				    	  
				    	 
				    	   if(resultSet.getString("trash_client_name") == null) {
				    		   indexingUserupload1.setTrash_client_name("");
				            }else {
					    	   indexingUserupload1.setTrash_client_name(resultSet.getString("trash_client_name"));
					        }
				    	  
				    	   String action=" <li class='dropdown' style='postion:relative;margin-left:42px;'>" + 
					    	   		"                        <a href='javascript:void(0);' class='dropdown-toggle' data-toggle='dropdown' role='button'>" + 
					    	   		"                            <i  style='color: #6c757d;font-size:42px;position:absolute;top:-32px;left:-26px;'>..</i>" + 
					    	   		"                        </a>" + 
					    	   		"                        <ul class='dropdown-menu'>" + 
					    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
					    	   		"                                    <li>" + 
					    	   		"                                        <a href='javascript:void(0);' class='restore-document' data-id='"+resultSet.getInt("id")+"'>" + 
					    	   		"                                            <div class='menu-info'>" + 
					    	   		"                                                <h4>Restore</h4>" + 
					    	   		"                                            </div>" + 
					    	   		"                                        </a>" + 
					    	   		"                                    </li>" +
					    	   		"                                 </ul>" + 
					    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
					    	   		"                                    <li>" + 
					    	   		"                                        <a href='javascript:void(0);' class='delete-single-attachment' data-id='"+resultSet.getInt("id")+"'>" + 
					    	   		"                                            <div class='menu-info'>" + 
					    	   		"                                                <h4>Delete</h4>" + 
					    	   		"                                            </div>" + 
					    	   		"                                        </a>" + 
					    	   		"                                    </li>" +
					    	   		"                                 </ul>" + 
					    	   		"                           </ul>" + 
					    	   		"                    </li>";
				    	   indexingUserupload1.setAction(action);
				    	   list.add(indexingUserupload1);
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
		    	 return list; 
		    	  
		    }
		    
		    
		    
		    
		    public boolean emptyTrash(IndexingUserupload userupload)
			{
				boolean check=false;
				
				String file_no="";
				String folder_name="";
				String document_no="";
				
				try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
						.prepareStatement("select  file_no , folder_name , file , document_no from document_info where id='"+userupload.getId()+"'");) {
					 ResultSet resultSet=preparedStatement.executeQuery();
					 while(resultSet.next())
					 {
						 
						 file_no=resultSet.getString("file_no");
						 folder_name=resultSet.getString("folder_name");
						
						 
						 if(resultSet.getString("file") !=null) {
						    String file=resultSet.getString("file");
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
		                   boolean deletefile=new DeleteFile().deletefile_name("softdoc-262410.appspot.com",file_name);
						 }
		                   
					 }
					
					 	                 PreparedStatement preparedStatement2 = connection
								.prepareStatement("delete from document_info  where file_no='"+file_no+"' and folder_name='"+folder_name+"'");
					 check = preparedStatement2.executeUpdate()>0;

					 
					 
				} catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
				} catch (Exception exception) {
					exception.printStackTrace();
				}

				return check;
			}
		 
		    
		    
		    public boolean emptyTrashdocument(IndexingUserupload userupload)
			{
				boolean check=false;
				
				String file_no="";
				String folder_name="";
				String document_no="";
				
				try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
						.prepareStatement("select  file_no , folder_name , file , document_no from document_info where id='"+userupload.getId()+"'");) {
					 ResultSet resultSet=preparedStatement.executeQuery();
					 while(resultSet.next())
					 {
						 
						 file_no=resultSet.getString("file_no");
						 folder_name=resultSet.getString("folder_name");
						 document_no=resultSet.getString("document_no");
						 
						 if(resultSet.getString("file") !=null) {
						    String file=resultSet.getString("file");
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
		                   boolean deletefile=new DeleteFile().deletefile_name("softdoc-262410.appspot.com",file_name);
						 }
		                   
					 }
					
					 	                 PreparedStatement preparedStatement2 = connection
								.prepareStatement("delete from document_info  where file_no='"+file_no+"' and document_no='"+document_no+"'");
					 check = preparedStatement2.executeUpdate()>0;

					 
					 
				} catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
				} catch (Exception exception) {
					exception.printStackTrace();
				}

				return check;
			}
		    
            
		    public List<IndexingUserupload> briefcase(IndexingUserupload indexingUserupload)
		    {   
		    	
		    	  List<IndexingUserupload> list=new ArrayList<IndexingUserupload>();
		    	  try(Connection connection=DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("select  id , folder_name , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date , modify_date from document_info where company_id='"+indexingUserupload.getCompanyid()+"' and folder_name is not null  and trash=0 and folder_status='folder'  group by folder_name");)
				  {
		    		   ResultSet resultSet=preparedStatement.executeQuery(); 
				       while(resultSet.next())
		    		   {
				    	   
				    	   IndexingUserupload indexingUserupload1=new IndexingUserupload();
				    	   indexingUserupload1.setId(resultSet.getInt("id"));
				    	   String checkbox="<input type='checkbox'  name='briefcase' value='"+resultSet.getInt("id")+"'  id='briefcase_"+resultSet.getInt("id")+"'><label for='briefcase_"+resultSet.getInt("id")+"'></label>";
				    	   indexingUserupload1.setDelete_checkbox(checkbox);
				    	  
				    	   indexingUserupload1.setFolder_name(resultSet.getString("folder_name"));
					     
				    	   
				    	   indexingUserupload1.setUpload_id(resultSet.getString("upload_date")); 
				    	   if(resultSet.getString("modify_date") == null) {
				    		   indexingUserupload1.setModify_date("");
					       }else {
					    	  indexingUserupload1.setModify_date(resultSet.getString("modify_date"));
					       }
				    	   String action=" <li class='dropdown' style='postion:relative;margin-left:42px;'>" + 
					    	   		"                        <a href='javascript:void(0);' class='dropdown-toggle' data-toggle='dropdown' role='button'>" + 
					    	   		"                            <i  style='color: #6c757d;font-size:42px;position:absolute;top:-32px;left:-26px;'>..</i>" + 
					    	   		"                        </a>" + 
					    	   		"                        <ul class='dropdown-menu'>" + 
					    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
					    	   		"                                    <li>" + 
					    	   		"                                        <a href='javascript:void(0);' class='rename' data-id='"+resultSet.getInt("id")+"'>" + 
					    	   		"                                            <div class='menu-info'>" + 
					    	   		"                                                <h4>Rename</h4>" + 
					    	   		"                                            </div>" + 
					    	   		"                                        </a>" + 
					    	   		"                                    </li>" +
					    	   		"                                 </ul>" + 
					    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
					    	   		"                                    <li>" + 
					    	   		"                                        <a href='javascript:void(0);' class='delete-folder' data-id='"+resultSet.getInt("id")+"'>" + 
					    	   		"                                            <div class='menu-info'>" + 
					    	   		"                                                <h4>Delete</h4>" + 
					    	   		"                                            </div>" + 
					    	   		"                                        </a>" + 
					    	   		"                                    </li>" +
					    	   		"                                 </ul>" + 
					    	   		"                           </ul>" + 
					    	   		"                    </li>";
				    	     indexingUserupload1.setAction(action);
				    	     list.add(indexingUserupload1);
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
		    	  
		    	 return list; 
		    	  
		    }
		    
		    
            
		    
		    public boolean folderdelete(IndexingUserupload userupload)
			{
				boolean check=false;
				
				String file_no="";
				String folder_name="";
				
				try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
						.prepareStatement("select  file_no , folder_name , file , document_no from document_info where id='"+userupload.getId()+"'");) {
					 ResultSet resultSet=preparedStatement.executeQuery();
					 while(resultSet.next())
					 {
						 
						 file_no=resultSet.getString("file_no");
						 folder_name=resultSet.getString("folder_name");
						 
						 if(resultSet.getString("file") !=null) {
						  
							    String file=resultSet.getString("file");
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
			                   boolean deletefile=new DeleteFile().deletefile_name("softdoc-262410.appspot.com",file_name);
						 
						 }
						 
					
					 }
					
					 	                 PreparedStatement preparedStatement2 = connection
								.prepareStatement("delete from document_info  where file_no='"+file_no+"' and folder_name='"+folder_name+"'");
					 check = preparedStatement2.executeUpdate()>0;

					 
					 
				} catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
				} catch (Exception exception) {
					exception.printStackTrace();
				}

				return check;
			}
            
       
		    
		    public boolean documentdelete(IndexingUserupload userupload)
			{
				boolean check=false;
				
				String file_no="";
				String document_no="";
				try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
						.prepareStatement("select  file_no , document_no , file from document_info where id='"+userupload.getId()+"'");) {
					 ResultSet resultSet=preparedStatement.executeQuery();
					 while(resultSet.next())
					 {
						 
						 file_no=resultSet.getString("file_no");
						 document_no=resultSet.getString("document_no");
						 
						 if(resultSet.getString("file") !=null) {
						  
							    String file=resultSet.getString("file");
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
			                   boolean deletefile=new DeleteFile().deletefile_name("softdoc-262410.appspot.com",file_name);
						 
						 }
						 
					
					 }
					
					 	                 PreparedStatement preparedStatement2 = connection
								.prepareStatement("delete from document_info  where file_no='"+file_no+"' and document_no='"+document_no+"'");
					 check = preparedStatement2.executeUpdate()>0;

					 
					 
				} catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
				} catch (Exception exception) {
					exception.printStackTrace();
				}

				return check;
			}
		    
		    
		    public String folderAccess(IndexingUserupload userupload)
			{
		    	
		    	
				String access_permission="";
                try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
						.prepareStatement("select  access_level from document_info where  file_no=(select file_no from document_info where id='"+userupload.getId()+"')");) {
					 ResultSet resultSet=preparedStatement.executeQuery();
					 
				
					 if(resultSet.next())
					 {
						 
						 if(resultSet.getString("access_level") !=null) {
							 
							
							 JSONParser jsonParser = new JSONParser();
							  JSONArray jsonArray = (JSONArray) jsonParser.parse(resultSet.getString("access_level"));
							  JSONObject access_level1 = null;
	                          String client_id=""; 	
	                         
	                          for(Object object : jsonArray) {
								     access_level1 = (JSONObject) object;
								     client_id=(String)access_level1.get("client_id");
							         if(Integer.parseInt(client_id)==userupload.getDid())
							         {
							         	   access_permission=(String)access_level1.get("access_level");
							         	  
							         }
							  }
							 
							 
	                         
							 
						 }
						
				     }
						 
					 
				} catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
				} catch (Exception exception) {
					exception.printStackTrace();
				}

				return access_permission;
			}
            

		    
		    public List<IndexingUserupload> dashboardRequestAccess(IndexingUserupload userupload)
			{
		    	
		    	 List<IndexingUserupload> list=new ArrayList<IndexingUserupload>();
		     	 try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
						.prepareStatement("select document_info.id as id ,file_name , requestaccess.client_id as client_id , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date from document_info , requestaccess where document_info.id = requestaccess.document_info_id and requestaccess.client_id='"+userupload.getId()+"' group by file_name");) {
					 ResultSet resultSet=preparedStatement.executeQuery();
					 while(resultSet.next())
					 {
						 
						 IndexingUserupload indexingUserupload1=new IndexingUserupload();
						 String employee_name="";
						 String file_name=resultSet.getString("file_name");
						 String create_date=resultSet.getString("upload_date");
						 
						 
						 
						 PreparedStatement preparedStatement2 = connection
									.prepareStatement("select employee_name  from client_details where id='"+resultSet.getInt("client_id")+"'");
						    ResultSet resultSet2=preparedStatement2.executeQuery();
							if(resultSet2.next()) {		  
						    	employee_name=resultSet2.getString("employee_name");
						    }//?"+resultSet.getInt("id")+"
					      indexingUserupload1.setRequest_access("<a href='recordroom.jsp' style='font-size:18px;background:#6c757d;color:#fff;text-decoration:none;'>"+employee_name+" has requested access to "+file_name+" file on "+create_date+"</a>");
						  list.add(indexingUserupload1);
	                         
				     }
						 
					 
				} catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
				} catch (Exception exception) {
					exception.printStackTrace();
				}

				return list;
			}

		    
		    
		    
		    public List<IndexingUserupload> requestByYou(IndexingUserupload userupload)
			{
		    	
		    	 List<IndexingUserupload> list=new ArrayList<IndexingUserupload>();
		    	try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
						.prepareStatement("select  id , document_info_id , DATE_FORMAT(request_date ,'%d %b %Y') AS request_date , approval_status , request_type , client_id from requestaccess where client_id='"+userupload.getId()+"'");) {
					 ResultSet resultSet=preparedStatement.executeQuery();
					 while(resultSet.next())
					 {
						 String employee_name="";
						 String emp_email_id="";
						 IndexingUserupload indexingUserupload1=new IndexingUserupload();
						 PreparedStatement preparedStatement2 = connection
									.prepareStatement("select employee_name , emp_email_id from client_details where id='"+resultSet.getInt("client_id")+"'");
						    ResultSet resultSet2=preparedStatement2.executeQuery();
							if(resultSet2.next()) {		  
						    	employee_name=resultSet2.getString("employee_name");
						    	emp_email_id=resultSet2.getString("emp_email_id");
						    }
							
							indexingUserupload1.setEmployee_name(employee_name);
							indexingUserupload1.setEmployee_email_id(emp_email_id);
							indexingUserupload1.setRequest_date(resultSet.getString("request_date"));
							indexingUserupload1.setApproval_status(resultSet.getString("approval_status"));
							indexingUserupload1.setRequest_type(resultSet.getString("request_type"));
							
							if(resultSet.getString("document_info_id") !=null) {
								
								 indexingUserupload1.setDetails("<a href='javascript:void(0);' class='request-access-file' style='text-decoration:none;font-size:29px;font-weight:bolder;color:#000;' data-id='"+resultSet.getInt("id")+"'><i class='material-icons' style='color:#fff ; background-color:#000;border-radius:13px;'>info</i></a>");
							
							}else {
							
								 indexingUserupload1.setDetails("<a href='javascript:void(0);' class='request-access-department' style='text-decoration:none;font-size:29px;font-weight:bolder;color:#000;' data-id='"+resultSet.getInt("id")+"'><i class='material-icons' style='color:#fff ; background-color:#000;border-radius:13px;'>info</i></a>");
							
							}
						    list.add(indexingUserupload1);
	                         
				     }
						 
					 
				} catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
				} catch (Exception exception) {
					exception.printStackTrace();
				}

				return list;
			}


		    
             public List<IndexingUserupload> editDocument(IndexingUserupload userupload) {

				
				List<IndexingUserupload> list=new ArrayList<IndexingUserupload>();     
				try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
						.prepareStatement("select id , file_no , file_name , department , describtion , other_client , access_level from document_info where document_no=(select document_no from document_info where id='"+userupload.getDocument_info_id()+"') and file_no=(select file_no from document_info where id='"+userupload.getDocument_info_id()+"')");) {
					 	ResultSet resultSet=preparedStatement.executeQuery();
					  
					 	
					 	if(resultSet.next())
					    {
						 
							if(resultSet.getString("access_level") !=null ) {
					 		
					 	
					 			 String access_level=resultSet.getString("access_level");   
					 			 JSONParser jsonParser = new JSONParser();
								 JSONArray jsonArray = (JSONArray) jsonParser.parse(access_level);
								 for(Object object : jsonArray) {
									 
									 
									   JSONObject access_level1 = (JSONObject) object;//(int)access_level1.get("client_id")
									   PreparedStatement preparedStatement2 = connection
	     										.prepareStatement("select employee_name , emp_email_id , imageupload from client_details where id='"+access_level1.get("client_id")+"'");
	     							    ResultSet resultSet2=preparedStatement2.executeQuery();
	     								if(resultSet2.next()) {		  
	     							    
	     							    IndexingUserupload userupload1=new IndexingUserupload();
	     							    userupload1.setId(resultSet.getInt("id"));
	     							
	     							    userupload1.setOther_client(Integer.parseInt((String)access_level1.get("client_id")));
	     								userupload1.setFilename(resultSet.getString("file_name"));
	     								userupload1.setDepartmentname(resultSet.getString("department"));
	     								userupload1.setFile_description(resultSet.getString("describtion"));
	     								userupload1.setAccess_level((String)access_level1.get("access_level"));
	     								userupload1.setFile_no(resultSet.getString("file_no"));;
	     								userupload1.setEmployee_name(resultSet2.getString("employee_name"));
	     								userupload1.setEmp_email_id(resultSet2.getString("emp_email_id"));
	     								userupload1.setImageupload(resultSet2.getString("imageupload"));
	     								list.add(userupload1);
	 							 }
					
					 	  }
							
					 }
				 
				 }
					
		  	   } catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
			  } catch (Exception exception) {
					exception.printStackTrace();
			 }

				return list;
			}
  
             
             
             public String Customerdepartment(UsercustomerClient usercustomerClient)
 		    {   
 		    	
 		    	
 		    	  try(Connection connection=DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("SELECT depart_info FROM `customer_details` where `id`='"+usercustomerClient.getCustomer_id()+"'");)
 				  {
 		    		   ResultSet resultSet=preparedStatement.executeQuery(); 
 				       if(resultSet.next())
 		    		   {
 				    	   return resultSet.getString("depart_info");	   
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
 			      
 		    	  return null;
 		    }

             
             
 		    public boolean requestaccessDept(RequestAccess requestAccess) {
 				boolean check=false;
 				
 				Date date = new Date();
 				String currentDate=new SimpleDateFormat("yyyy-MM-dd").format(date);
 				try (Connection connection=DBConnection.openConnection();PreparedStatement preparedStatement = connection.prepareStatement(
 						"insert into  requestaccess(access_level , client_id , request_date , request_type) values(?,?,?,?)");) {
 					 
 					 preparedStatement.setString(1, requestAccess.getAccess_level());
 			         //preparedStatement.setInt(2, requestAccess.getDocument_info_id());
 			         preparedStatement.setInt(2, requestAccess.getClient_id());
 			         preparedStatement.setString(3, currentDate);
 			         preparedStatement.setString(4, "Department Access");
			         check = preparedStatement.executeUpdate()>0;
 			     
 				
 				} catch (SQLException sqlexception) {
 					sqlexception.getMessage();
 				} catch (Exception exception) {
 					exception.printStackTrace();
 				}
 				return check;
 			
 		    }    
             
 		    
 		   public boolean Comments(Comments comments) {
				boolean check=false;
				
				
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
				LocalDateTime currentDateTime = LocalDateTime.now();  
				
				try (Connection connection=DBConnection.openConnection();PreparedStatement preparedStatement = connection.prepareStatement(
						"insert into  document_comments(client_id , document_info_id  , send , date_time) values(?,?,?,?)");) {
					 
					 preparedStatement.setInt(1, comments.getClient_id());
			         preparedStatement.setInt(2, comments.getDocument_info_id());
			         preparedStatement.setString(3, comments.getSend());
			         preparedStatement.setString(4,  dtf.format(currentDateTime));
			         check = preparedStatement.executeUpdate()>0;
			     
				
				} catch (SQLException sqlexception) {
					sqlexception.getMessage();
				} catch (Exception exception) {
					exception.printStackTrace();
				}
				return check;
			
		    }      

 		   
 		   
 		   
 		   
 		   
 		  public List<Comments> fetchComments(Comments comments) {

 			  
				List<Comments> list=new ArrayList<Comments>();
				try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
						.prepareStatement("select id , send , client_id , DATE_FORMAT(date_time ,'%d %b %Y') AS date_time , DATE_FORMAT(date_time ,'%r') AS time from document_comments where document_info_id ='"+comments.getDocument_info_id()+"'");) {
					 	ResultSet resultSet=preparedStatement.executeQuery();
					  	while(resultSet.next())
					    {
						 
					 		Comments comments1=new Comments();
					 		
					 		comments1.setId(resultSet.getInt("id"));
					 		comments1.setSend(resultSet.getString("send"));
					 		comments1.setDate_time(resultSet.getString("date_time")+" "+resultSet.getString("time"));
					 		
					 		String reply_comments=null;
					 		String reply_date_time=null;
					 		String reply_employee_name=null;
					 		String reply_imageupload=null;
					 		boolean reply_condition=false;
					 		 PreparedStatement preparedStatement3 = connection
										.prepareStatement("select id , reply , client_id , DATE_FORMAT(date_time ,'%d %b %Y') AS date_time , DATE_FORMAT(date_time ,'%r') AS time from reply_comments where comments_id='"+resultSet.getInt("id")+"'");
							    ResultSet resultSet3=preparedStatement3.executeQuery();
								if(resultSet3.next()) {		  
							
									reply_comments=resultSet3.getString("reply");
									reply_date_time=resultSet3.getString("date_time")+" "+resultSet3.getString("time");
									reply_condition=true;
									
									   PreparedStatement preparedStatement4 = connection
	     										.prepareStatement("select employee_name , emp_email_id , imageupload from client_details where id='"+resultSet3.getInt("client_id")+"'");
	     							    ResultSet resultSet4=preparedStatement4.executeQuery();
	     								if(resultSet4.next()) {		  
	     								
	     									reply_employee_name=resultSet4.getString("employee_name");
	     									reply_imageupload=resultSet4.getString("imageupload");
	 									
	     								}
								 }
					 		
								comments1.setComment_reply(reply_comments);
								comments1.setReply_date_time(reply_date_time);
								comments1.setReply_employee_name(reply_employee_name);
								comments1.setReply_imageupload(reply_imageupload);
								comments1.setReply_condition(reply_condition);
								
					 		String employee_name="";
					 		String imageupload="";
					 				   PreparedStatement preparedStatement2 = connection
	     										.prepareStatement("select employee_name , emp_email_id , imageupload from client_details where id='"+resultSet.getInt("client_id")+"'");
	     							    ResultSet resultSet2=preparedStatement2.executeQuery();
	     								if(resultSet2.next()) {		  
	     							    
	     									employee_name=resultSet2.getString("employee_name");
	     									imageupload=resultSet2.getString("imageupload");
	 							         }
					
	     								
	     								comments1.setEmployee_name(employee_name);
	     								comments1.setImageupload(imageupload);
	     								
	     				   list.add(comments1);
	     								
					 	  }
							
					 
				 
				 }
			   catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
			  } catch (Exception exception) {
					exception.printStackTrace();
			 }

				return list;
			}


 		  
 		   
		   public boolean replycomments(Comments comments) {
				boolean check=false;
				
				
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
				LocalDateTime currentDateTime = LocalDateTime.now();  
			
				try (Connection connection=DBConnection.openConnection();PreparedStatement preparedStatement = connection.prepareStatement(
						"insert into  reply_comments(comments_id  , reply , client_id , date_time) values(?,?,?,?)");) {
					 
					 preparedStatement.setInt(1, comments.getComments_id());
			         preparedStatement.setString(2, comments.getComment_reply());
			         preparedStatement.setInt(3, comments.getClient_id());
			         preparedStatement.setString(4,  dtf.format(currentDateTime));
			         check = preparedStatement.executeUpdate()>0;
			       
				
				} catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
				} catch (Exception exception) {
					exception.printStackTrace();
				}
				return check;
			
		    }      

		   
		   
		   
		   public List<Comments> replyCommentsFetch(Comments comments) {

	 			  
				List<Comments> list=new ArrayList<Comments>();
				try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
						.prepareStatement("select id , reply , client_id , DATE_FORMAT(date_time ,'%d %b %Y') AS date_time , DATE_FORMAT(date_time ,'%r') AS time from reply_comments where comments_id  ='"+comments.getComments_id()+"'");) {
					 	ResultSet resultSet=preparedStatement.executeQuery();
					  	while(resultSet.next())
					    {
						 
					 		Comments comments1=new Comments();
					 		
					 		comments1.setId(resultSet.getInt("id"));
					 		comments1.setComment_reply(resultSet.getString("reply"));
					 		comments1.setDate_time(resultSet.getString("date_time")+" "+resultSet.getString("time"));
					 		
					 		String employee_name="";
					 		String imageupload="";
					 		 
									   PreparedStatement preparedStatement2 = connection
	     										.prepareStatement("select employee_name , emp_email_id , imageupload from client_details where id='"+resultSet.getInt("client_id")+"'");
	     							    ResultSet resultSet2=preparedStatement2.executeQuery();
	     								if(resultSet2.next()) {		  
	     							    
	     									employee_name=resultSet2.getString("employee_name");
	     									imageupload=resultSet2.getString("imageupload");
	 							         }
										comments1.setEmployee_name(employee_name);
	     								comments1.setImageupload(imageupload);
	     								
	     				   list.add(comments1);
	     								
					 	  }
							
					 
				 
				 }
			   catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
			  } catch (Exception exception) {
					exception.printStackTrace();
			 }

				return list;
			}


		   
		   public boolean folderDocumentAttachement(IndexingUserupload userupload)
			{
			
		    	
		      boolean check=false;
		      try(Connection connection = DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("select file_no , document_no , file_name , company_id , department , document_type , status , folder_name  from document_info where id='"+userupload.getDocument_info_id()+"'");) {
			        
		 		         ResultSet resultset=preparedStatement.executeQuery();
				         
		 		         String file_no="";
				         String document_no="";
				         String company_id="";
				         String department="";
				         String document_type="";
				         String file_name="";
					     String folder_name="";
					     
					               
				         if(resultset.next())
				         {
				        	 
				        	 file_no=resultset.getString("file_no");
				             document_no=resultset.getString("document_no");
				             company_id=resultset.getString("company_id");
				             department=resultset.getString("department");
				             document_type=resultset.getString("document_type");
				             file_name=resultset.getString("file_name");
				             if(resultset.getString("folder_name") !=null) {
				                 folder_name=resultset.getString("folder_name");
					          }
				             
				             
				            /* 
				              PreparedStatement preparedStatement2 = connection.prepareStatement("select sum(size) as size from document_info where company_id='"+resultset.getString("company_id")+"' and status='quality_approved' group by company_id");
							  ResultSet resultset2=preparedStatement2.executeQuery();
							  resultset2.next();	
							  int size=resultset2.getInt("size");
							  
							  PreparedStatement preparedStatement3 = connection.prepareStatement("select storagedata from customer_details where id='"+resultset.getString("company_id")+"'");
							  ResultSet resultset3=preparedStatement3.executeQuery();
							  resultset3.next();	
							  int storage=resultset3.getInt("storagedata");
							  
							  condition=storage>=size;
							  */
				             
				             
				             
				         }
				         
				              DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
							  LocalDate localDate = LocalDate.now();
						      PreparedStatement preparedStatement2 = connection.prepareStatement("INSERT INTO `document_info` (company_id  , department , file , size , upload_date , document_no , billing_month , attachment_no , document_type ,  customer_code ,  customer_name ,  employee_code ,  employee_name ,  date_of_joining ,  invoice_date , invoice_number, vendor_code, vendor_name , file_no , status , client_id , approved_date , file_name , documentType1 , documentType2 , documentType3 , documentType4 , documentType5 , documentType6 , folder_name , folder_status) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
				              preparedStatement2.setString(1,company_id);
				  			  preparedStatement2.setString(2, department);
				  			  preparedStatement2.setString(3, userupload.getFile());
				  			  preparedStatement2.setDouble(4,userupload.getSize());
				  			  long timeNow = Calendar.getInstance().getTimeInMillis();
				  			  java.sql.Timestamp ts = new java.sql.Timestamp(timeNow);
				  			  preparedStatement2.setTimestamp(5, ts);
				  			  preparedStatement2.setString(6,document_no);
				  			  Date date = new Date();
				  			  SimpleDateFormat simpleDateFormatM = new SimpleDateFormat("EEEE");
				  			  simpleDateFormatM = new SimpleDateFormat("MMMM");
				  			  SimpleDateFormat simpleDateFormatY = new SimpleDateFormat("EEEE");
				  			  simpleDateFormatY = new SimpleDateFormat("YYYY");
				  			  preparedStatement2.setString(7, simpleDateFormatM.format(date).toUpperCase()+" , "+simpleDateFormatY.format(date).toUpperCase());
				  			  preparedStatement2.setString(8, userupload.getAttachment_count());	 
				  			  preparedStatement2.setString(9, document_type);	 
				  			  preparedStatement2.setString(10, userupload.getCustomercode()); 
				  			  preparedStatement2.setString(11, userupload.getCustomername()); 
				  			  preparedStatement2.setString(12, userupload.getEmployecode()); 
				  			  preparedStatement2.setString(13, userupload.getEmployename()); 
				  			  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				  		      java.util.Date udate = sdf.parse(userupload.getJoiningdate());
				  		      long l = udate.getTime();
				  		      java.sql.Date sdate = new java.sql.Date(l);
				  			  preparedStatement2.setDate(14,sdate); 
				  			  SimpleDateFormat sdfIn = new SimpleDateFormat("yyyy-MM-dd");
				  		      java.util.Date udateIn = sdfIn.parse(userupload.getInvoicedate());
				  		      long lIn = udateIn.getTime();
				  		      java.sql.Date sdateIn = new java.sql.Date(lIn);
				  		      preparedStatement2.setDate(15,sdateIn);  
				  		      preparedStatement2.setString(16,userupload.getInvoicenumber()); 
				  		      preparedStatement2.setString(17,userupload.getVendorcode());
				  		      preparedStatement2.setString(18,userupload.getVendorname());
				  		      preparedStatement2.setString(19,file_no);
				  		      preparedStatement2.setString(20,"quality_approved");
				  		      preparedStatement2.setInt(21,userupload.getId());
				  		      preparedStatement2.setString(22 , dtf.format(localDate));
				  		      preparedStatement2.setString(23 , file_name);
				  		      preparedStatement2.setString(24 , userupload.getDocumentType1());
						      preparedStatement2.setString(25 , userupload.getDocumentType2());
						      preparedStatement2.setString(26 , userupload.getDocumentType3());
						      preparedStatement2.setString(27 , userupload.getDocumentType4());
						      preparedStatement2.setString(28 , userupload.getDocumentType5());
						      preparedStatement2.setString(29 , userupload.getDocumentType6());
						      preparedStatement2.setString(30 , folder_name);
						      preparedStatement2.setString(31 , "folder");
						      check = preparedStatement2.executeUpdate()>0;
				  			  
				  		 
				  			 if(check){
					                
				  				new com.customeradmin.email.Logfile3().logfile(userupload.getId() , Integer.parseInt(company_id)  , userupload.getEmail() ,"Document Created", "doc" , file_no , document_no);

					            
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
			       
		          return check;
			 
			 }
		      
		   
		   
		   
		   
		   public List<RequestAccess> accessRequestedYou(RequestAccess requestAccess)
			{
		    	
		    	 List<RequestAccess> list=new ArrayList<RequestAccess>();
		    	try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
						.prepareStatement("select  id , document_info_id , access_level  from requestaccess where client_id='"+requestAccess.getClient_id()+"' and id='"+requestAccess.getId()+"'");) {
					 ResultSet resultSet=preparedStatement.executeQuery();
					 while(resultSet.next())
					 {
						
						 
						 String file_name="";
						 String department="";
						 String upload_date="";
						 String client_name=""; 
						 String access_level="";
						 
								 RequestAccess requestAccess1=new RequestAccess();
						 if(resultSet.getString("document_info_id") !=null) {
					
							 PreparedStatement preparedStatement2 = connection
										.prepareStatement("select file_name , department ,  DATE_FORMAT(upload_date ,'%d %b %Y') AS  upload_date  , client_id from document_info where id='"+resultSet.getInt("document_info_id")+"'");
							    ResultSet resultSet2=preparedStatement2.executeQuery();
								if(resultSet2.next()) {		  
							    	
									  file_name=resultSet2.getString("file_name");
									  department=resultSet2.getString("department");
									  upload_date=resultSet2.getString("upload_date");
									 
									  PreparedStatement preparedStatement3 = connection
												.prepareStatement("select employee_name from client_details where id='"+resultSet2.getInt("client_id")+"'");
									    ResultSet resultSet3=preparedStatement3.executeQuery();
										if(resultSet3.next()) {	
											
											client_name=resultSet3.getString("employee_name");
											
										}
									
									
							    }
						
							 
						 }else {
						
							 access_level=resultSet.getString("access_level");
							 
					}
						 
						 requestAccess1.setAccess_level(access_level);
						 requestAccess1.setFile_name(file_name);
						 requestAccess1.setDepartment(department);
						 requestAccess1.setClient_name(client_name);
						 requestAccess1.setUpload_date(upload_date);
						 list.add(requestAccess1);
	                         
				     }
						 
					 
				} catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
				} catch (Exception exception) {
					exception.printStackTrace();
				}

				return list;
			}
		   
		   
		   
		   public List<RequestAccess> requestByFrom(RequestAccess requestAccess)
			{
		    	
		    	 List<RequestAccess> list=new ArrayList<RequestAccess>();
		    	try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
						.prepareStatement("select  id , document_info_id , DATE_FORMAT(request_date ,'%d %b %Y') AS  request_date , request_type , approval_status , client_id   from requestaccess");) {
					 ResultSet resultSet=preparedStatement.executeQuery();
					 while(resultSet.next())
					 {
						
						 
						 String employee_name=null; 
						 String request_date=null;
						 String request_type=null;
						 String employee_email=null;
						 String approval_status=null;
						 
						 int client_id=resultSet.getInt("client_id");
						 int document_info_id=resultSet.getInt("document_info_id");
						 int id=resultSet.getInt("id");
						 
						 RequestAccess requestAccess1=new RequestAccess();
						 if(resultSet.getString("document_info_id") !=null) {
					
							 PreparedStatement preparedStatement2 = connection
										.prepareStatement("select  client_id from document_info where id='"+resultSet.getInt("document_info_id")+"'");
							    ResultSet resultSet2=preparedStatement2.executeQuery();
								if(resultSet2.next()) {		  
							    	
									 if(resultSet2.getInt("client_id")==requestAccess.getClient_id()) {
										
												  request_date=resultSet.getString("request_date");
												  request_type=resultSet.getString("request_type");
												  approval_status=resultSet.getString("approval_status");
												  
												  PreparedStatement preparedStatement4 = connection
															.prepareStatement("select employee_name , emp_email_id from client_details where id='"+client_id+"'");
												    ResultSet resultSet4=preparedStatement4.executeQuery();
													if(resultSet4.next()) {	
														
														employee_name=resultSet4.getString("employee_name");
														employee_email=resultSet4.getString("emp_email_id");
											}
										 
									 }
									
							    }
						
							 
						 }
						 
						 
						 if(request_date !=null) {
							 
							 requestAccess1.setRequest_date(request_date);
							 requestAccess1.setRequest_type(request_type);
							 requestAccess1.setEmployee_name(employee_name);
							 requestAccess1.setEmployee_email_id(employee_email);
							 requestAccess1.setApproval_status(approval_status);
							 requestAccess1.setDetails("<a href='javascript:void(0);' data-id='"+document_info_id+"' data-req='"+id+"' class='request-access-from-file' style='text-decoration:none;font-size:29px;font-weight:bolder;color:#000;'><i class='material-icons' style='color:#fff ; background-color:#000;border-radius:13px;'>info</i></a>");
							 list.add(requestAccess1);
							 
						 }
						 
						 
					 }
						 
					 
				} catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
				} catch (Exception exception) {
					exception.printStackTrace();
				}

				return list;
			}

		   
		   
		   public List<RequestAccess> requestByFromFileAccept(RequestAccess requestAccess)
			{
		    	
		    	 List<RequestAccess> list=new ArrayList<RequestAccess>();
		    	try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
						.prepareStatement("select file_name , department , DATE_FORMAT(upload_date , '%d %b %Y') as upload_date , client_id from document_info where id='"+requestAccess.getDocument_info_id()+"'");) {
					 ResultSet resultSet=preparedStatement.executeQuery();
					 while(resultSet.next())
					 {
						
						 
						 String employee_name=null; 
						 String employee_email=null;
						
						  RequestAccess requestAccess1=new RequestAccess();
				          requestAccess1.setFile_name(resultSet.getString("file_name"));
						  requestAccess1.setDepartment(resultSet.getString("department"));	
						  requestAccess1.setUpload_date(resultSet.getString("upload_date"));
						 
						  PreparedStatement preparedStatement4 = connection
							.prepareStatement("select employee_name , emp_email_id from client_details where id='"+resultSet.getInt("client_id")+"'");
						    ResultSet resultSet4=preparedStatement4.executeQuery();
							if(resultSet4.next()) {	
								
								employee_name=resultSet4.getString("employee_name");
								employee_email=resultSet4.getString("emp_email_id");
					       }
						 
						  requestAccess1.setEmployee_name(employee_name);
						  requestAccess1.setEmployee_email_id(employee_email);
						  list.add(requestAccess1);
							 
						 
						 
						 
					 }
						 
					 
				} catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
				} catch (Exception exception) {
					exception.printStackTrace();
				}

				return list;
			}

		   
		   
		   
		   public boolean updateRemarksRequestAccess(RequestAccess requestAccess)
			{
		    	boolean check=false;
		    	
		    	try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
						.prepareStatement("update requestaccess set remarks ='"+requestAccess.getRemarks()+"' where id='"+requestAccess.getId()+"'");) {
					 check = preparedStatement.executeUpdate()>0;
					
					 if(requestAccess.getStatus().equalsIgnoreCase("approve")) {
					
						 
						           PreparedStatement preparedStatement2 = connection
									.prepareStatement(" select di.access_level as access_level_di , di.document_no , di.file_no  , req.access_level as access_level_req , req.client_id as client_id_req  from document_info as di , requestaccess as req where di.id=req.document_info_id and req.id='"+requestAccess.getId()+"'");
								    ResultSet resultSet2=preparedStatement2.executeQuery();
									if(resultSet2.next()) {	
										
										 JSONArray array = new JSONArray();
										 String access_level_di=resultSet2.getString("access_level_di");
										 String access_level_req=resultSet2.getString("access_level_req");
										 String file_no=resultSet2.getString("file_no");
                                         
                                   
										 JSONParser jsonParser = new JSONParser();
										 JSONArray jsonArray = (JSONArray) jsonParser.parse(access_level_di);
										 
										
										 for(Object object : jsonArray) {
											 
											 JSONObject json2 = new JSONObject();
											 JSONObject access_level1 = (JSONObject) object;
											
											 
											 if(resultSet2.getInt("client_id_req") == (Long)access_level1.get("client_id")) {
											
												 Long client_id=(Long)access_level1.get("client_id"); 
												 json2.put("client_id" , client_id);
												 json2.put("access_level" , access_level_req);
												 
											 }else {
												 
												 Long client_id=(Long)access_level1.get("client_id");
												 String access_level=(String)access_level1.get("access_level");
												 
												 json2.put("client_id" ,   client_id);
												 json2.put("access_level" ,  access_level);
											 
											 }
											 
											 
											  array.add(json2);
											 
										 }
								
										 PreparedStatement preparedStatement3 = connection
													.prepareStatement("update document_info set access_level ='"+array.toJSONString()+"' where file_no='"+file_no+"'");
										 check = preparedStatement3.executeUpdate()>0;
										 
					      }
									
					 }			
					 
				} catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
				} catch (Exception exception) {
					exception.printStackTrace();
				}

		    	
		    	
				return check;
			}
		   

		   public boolean uploadBriefcase(Briefcase briefcase) {
				boolean check=false;
				
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
				LocalDateTime currentDateTime = LocalDateTime.now();  
				
				try (Connection connection=DBConnection.openConnection();PreparedStatement preparedStatement = connection.prepareStatement(
						"insert into briefcase (attachment , upload_date , client_id , size) values(?,?,?,?)");) {
					
					preparedStatement.setString(1, briefcase.getUpload());
					preparedStatement.setString(2, dtf.format(currentDateTime));
					preparedStatement.setInt(3, briefcase.getId());
					preparedStatement.setDouble(4 , briefcase.getSize());
					check = preparedStatement.executeUpdate()>0;
					
				} catch (SQLException sqlexception) {
					sqlexception.getMessage();
				} catch (Exception exception) {
					exception.printStackTrace();
				}
				return check;
			}   
		   
		   
		   
		   
		   
		   
		   
		   
		   public List<Briefcase> fetchuploadBriefcase(Briefcase briefcase)
			{
		    	
		    	 List<Briefcase> list=new ArrayList<Briefcase>();
		     	 try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
						.prepareStatement("select id , attachment , DATE_FORMAT(upload_date ,'%d %b %Y') AS upload_date   from briefcase  where client_id='"+briefcase.getId()+"'");) {
					 ResultSet resultSet=preparedStatement.executeQuery();
					 while(resultSet.next())
					 {
						 
						 Briefcase briefcase1=new Briefcase();
						 String checkbox="<input type='checkbox'  name='briefcase_upload' value='"+resultSet.getInt("id")+"'  id='briefcase_upload_"+resultSet.getInt("id")+"'><label for='briefcase_upload_"+resultSet.getInt("id")+"'></label>";
						 briefcase1.setDelete_checkbox(checkbox);
						 
						 String file_name="";
						 
						 if(resultSet.getString("attachment") !=null) {
							  
							    String file=resultSet.getString("attachment");
							    File fileDetails = new File(file);
			                    String fileName=fileDetails.getName();
			                    for (int j=0; j<=fileName.length()-1; j++) {  
			                    if(fileName.charAt(j) == '?'){
			                         break;
			                     }
			                     else
			                     {
			                       file_name =file_name+fileName.charAt(j);
			                     }
			          
			                   }
			             }
						 
						 String file_file_name[]=file_name.split("_");
						 briefcase1.setUpload(file_file_name[1]);
						 briefcase1.setUpload_date(resultSet.getString("upload_date"));
						 String action=" <li class='dropdown' style='postion:relative;margin-left:42px;'>" + 
					    	   		"                        <a href='javascript:void(0);' class='dropdown-toggle' data-toggle='dropdown' role='button'>" + 
					    	   		"                            <i  style='color: #6c757d;font-size:42px;position:absolute;top:-32px;left:-26px;'>..</i>" + 
					    	   		"                        </a>" + 
					    	   		"                        <ul class='dropdown-menu'>" + 
					    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
					    	   		"                                    <li>" + 
					    	        "                                        <a href='view-briefcase.jsp?url="+resultSet.getInt("id")+"' data-id='"+resultSet.getInt("id")+"' target='_blank'>" + 
					    	   		"                                            <div class='menu-info'>" + 
					    	   		"                                                <h4>View</h4>" + 
					    	   		"                                            </div>" + 
					    	   		"                                        </a>" + 
					    	   		"                                    </li>" +
					    	   		"                                 </ul>" + 
					    	   		"                                <ul class='menu' style='overflow:hidden'>" + 
					    	   		"                                    <li>" + 
					    	   		"                                        <a href='"+resultSet.getString("attachment")+"' download>" + 
					    	   		"                                            <div class='menu-info'>" + 
					    	   		"                                                <h4>Download</h4>" + 
					    	   		"                                            </div>" + 
					    	   		"                                        </a>" + 
					    	   		"                                    </li>" +
					    	   		"                                 </ul>" + 
					    	   		"                           </ul>" + 
					    	   		"                    </li>";
						 
						     briefcase1.setDetails(action);
						     list.add(briefcase1);
	                         
				     }
						 
					 
				} catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
				} catch (Exception exception) {
					exception.printStackTrace();
				}

				return list;
			}

		   
		   
		   
		   public boolean client_message(Message client_message) {
				boolean check=false;
				
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
				LocalDateTime currentDateTime = LocalDateTime.now();  
				
				try (Connection connection=DBConnection.openConnection();PreparedStatement preparedStatement = connection.prepareStatement(
						"insert into  client_message(client_id , message , date_time , send_id , attachment) values( ? , ? , ? ,? ,?)");) {
					 
					 preparedStatement.setInt(1, client_message.getClient_id());
			         preparedStatement.setString(2, client_message.getNew_message());
			         preparedStatement.setString(3,  dtf.format(currentDateTime));
			         preparedStatement.setInt(4, client_message.getClient_chat_id());
			         preparedStatement.setString(5 , client_message.getImage_upload());
			         check = preparedStatement.executeUpdate()>0;
			     
				
				} catch (SQLException sqlexception) {
					sqlexception.getMessage();
				} catch (Exception exception) {
					exception.printStackTrace();
				}
				return check;
			
		    }      
		   
		   
		   
		   public boolean client_message_admin(Message client_message) {
				boolean check=false;
				
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
				LocalDateTime currentDateTime = LocalDateTime.now();  
				
				try (Connection connection=DBConnection.openConnection();PreparedStatement preparedStatement = connection.prepareStatement(
						"insert into  client_message(customer_admin_id , message , date_time , send_id , attachment) values( ? , ? , ? ,? ,?)");) {
					 
					 preparedStatement.setInt(1, client_message.getCustomer_id());
			         preparedStatement.setString(2, client_message.getNew_message());
			         preparedStatement.setString(3,  dtf.format(currentDateTime));
			         preparedStatement.setInt(4, client_message.getClient_chat_id());
			         preparedStatement.setString(5 , client_message.getImage_upload());
			         check = preparedStatement.executeUpdate()>0;
			     
				
				} catch (SQLException sqlexception) {
					sqlexception.getMessage();
				} catch (Exception exception) {
					exception.printStackTrace();
				}
				return check;
			
		    }      
		   
		   
		   

	 		  public List<Message> fetchClientMessage(Message message) {

	 			  
					List<Message> list=new ArrayList<Message>();
					try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
							.prepareStatement("select id , attachment , message , client_id , DATE_FORMAT(date_time ,'%d %b %Y') AS date_time , DATE_FORMAT(date_time ,'%r') AS time from client_message where (client_id ='"+message.getClient_id()+"' and send_id='"+message.getClient_chat_id()+"') OR (client_id ='"+message.getClient_chat_id()+"' and send_id='"+message.getClient_id()+"') ");) {
						 	ResultSet resultSet=preparedStatement.executeQuery();
						  	while(resultSet.next())
						    {
						  		
						  		Message message1=new Message();
						  		
						  		 String attachment_name="";
						  		 
						  		
						  		 
								 if(resultSet.getString("attachment") !=null) {
								
									    String file_name="";
									    String file=resultSet.getString("attachment");
									    File fileDetails = new File(file);
					                    String fileName=fileDetails.getName();
					                    for (int j=0; j<=fileName.length()-1; j++) {  
					                    if(fileName.charAt(j) == '?'){
					                         break;
					                     }
					                     else
					                     {
					                       file_name =file_name+fileName.charAt(j);
					                     }
					          
					                   }
					             
					                   String file_file_name[]=file_name.split("_");
					                  
					                   if(file_file_name[1].equalsIgnoreCase("null")) {
					                	   attachment_name="<a href='"+file+"' download></a>";
						               }else {
					                	   attachment_name="<a href='"+file+"' download>"+file_file_name[1]+"</a>";
					                   } 
					             
								 }
								 
								 
								 
								
						  		if(message.getClient_id()==resultSet.getInt("client_id")){
				
							  		message1.setDirection_rule("left");
							  		message1.setNew_message(resultSet.getString("message"));
							  		String imageupload="";
							  		
							  	     PreparedStatement preparedStatement4 = connection
									  .prepareStatement("select imageupload from client_details where id='"+message.getClient_id()+"'");
										    ResultSet resultSet4=preparedStatement4.executeQuery();
											if(resultSet4.next()) {	
												imageupload=resultSet4.getString("imageupload");
									       }
									
											 
											
									message1.setAttachement(attachment_name);		
									message1.setImage_upload(imageupload);
							  		message1.setClient_id(resultSet.getInt("client_id"));
								    message1.setDate_time(resultSet.getString("date_time")+" "+resultSet.getString("time"));				
			     				    list.add(message1);
			     		  			
						  		}else {
					
							  		message1.setDirection_rule("right");
							  		String imageupload="";
							  		 PreparedStatement preparedStatement4 = connection
											  .prepareStatement("select imageupload from client_details where id='"+message.getClient_chat_id()+"'");
												    ResultSet resultSet4=preparedStatement4.executeQuery();
													if(resultSet4.next()) {	
														imageupload=resultSet4.getString("imageupload");
											       }
									 
									 message1.setAttachement(attachment_name);				
									 message1.setImage_upload(imageupload);
									 message1.setNew_message(resultSet.getString("message"));
							  		 message1.setClient_id(resultSet.getInt("client_id"));
								     message1.setDate_time(resultSet.getString("date_time")+" "+resultSet.getString("time"));				
			     				     list.add(message1);
			     	
						  		}
						  		
						  }
					 
					 }
				   catch (SQLException sqlexception) {
						sqlexception.printStackTrace();
				  } catch (Exception exception) {
						exception.printStackTrace();
				 }

					return list;
				}

		   
	 		  
	 		  
	 		  
	 		  
	 		  
	 		  
	 		 public List<Message> fetchClientMessageAdmin(Message message) {

	 			  
					List<Message> list=new ArrayList<Message>();
					try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
							.prepareStatement("select id , attachment , message , customer_admin_id , DATE_FORMAT(date_time ,'%d %b %Y') AS date_time , DATE_FORMAT(date_time ,'%r') AS time from client_message where ( customer_admin_id ='"+message.getCustomer_id()+"' and send_id='"+message.getClient_chat_id()+"') OR (customer_admin_id ='"+message.getClient_chat_id()+"' and send_id='"+message.getCustomer_id()+"') ");) {
						 	ResultSet resultSet=preparedStatement.executeQuery();
						  	while(resultSet.next())
						    {
						  		
						  		Message message1=new Message();
						  		String attachment_name="";
						  		 
								 if(resultSet.getString("attachment") !=null) {
								
									    String file_name="";
									    String file=resultSet.getString("attachment");
									    File fileDetails = new File(file);
					                    String fileName=fileDetails.getName();
					                    for (int j=0; j<=fileName.length()-1; j++) {  
					                    if(fileName.charAt(j) == '?'){
					                         break;
					                     }
					                     else
					                     {
					                       file_name =file_name+fileName.charAt(j);
					                     }
					          
					                   }
					             
					                   String file_file_name[]=file_name.split("_");
					                  
					                   if(file_file_name[1].equalsIgnoreCase("null")) {
					                	   attachment_name="<a href='"+file+"' download></a>";
						               }else {
					                	   attachment_name="<a href='"+file+"' download>"+file_file_name[1]+"</a>";
					                   } 
					             
								 }
								 
								
						  		if(message.getCustomer_id() == resultSet.getInt("customer_admin_id")){
				
							  		message1.setDirection_rule("left");
							  		message1.setNew_message(resultSet.getString("message"));
							  		String imageupload="";
							  		
							  	     PreparedStatement preparedStatement4 = connection
									  .prepareStatement("select profile_photo from customer_details where id='"+message.getCustomer_id()+"'");
										    ResultSet resultSet4=preparedStatement4.executeQuery();
											if(resultSet4.next()) {	
												imageupload=resultSet4.getString("profile_photo");
									       }
									
											 
											
									message1.setAttachement(attachment_name);		
									message1.setImage_upload(imageupload);
							  		message1.setClient_id(resultSet.getInt("customer_admin_id"));
								    message1.setDate_time(resultSet.getString("date_time")+" "+resultSet.getString("time"));				
			     				    list.add(message1);
			     		  			
						  		}else {
					
							  		message1.setDirection_rule("right");
							  		String imageupload="";
							  		 PreparedStatement preparedStatement4 = connection
											  .prepareStatement("select profile_photo from customer_details where id='"+message.getCustomer_id()+"'");
												    ResultSet resultSet4=preparedStatement4.executeQuery();
													if(resultSet4.next()) {	
														imageupload=resultSet4.getString("profile_photo");
											       }
									 
									 message1.setAttachement(attachment_name);				
									 message1.setImage_upload(imageupload);
									 message1.setNew_message(resultSet.getString("message"));
							  		 message1.setClient_id(resultSet.getInt("customer_admin_id"));
								     message1.setDate_time(resultSet.getString("date_time")+" "+resultSet.getString("time"));				
			     				     list.add(message1);
			     	
						  		}
						  		
						  }
					 
					 }
				   catch (SQLException sqlexception) {
						sqlexception.printStackTrace();
				  } catch (Exception exception) {
						exception.printStackTrace();
				 }

					return list;
				}

	 		  
	 		  
	 		  
	 		  public List<Message> single_client_details(Message message) {

	 			  
					List<Message> list=new ArrayList<Message>();
					try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
							.prepareStatement("select id , employee_name , emp_email_id , imageupload from client_details where id='"+message.getClient_chat_id()+"'");) {
						 	ResultSet resultSet=preparedStatement.executeQuery();
						  	while(resultSet.next())
						    {
							 	Message message1=new Message();
						 		message1.setId(resultSet.getInt("id"));
						 		message1.setName(resultSet.getString("employee_name"));
						 		message1.setEmail(resultSet.getString("emp_email_id"));
						 		message1.setImage_upload(resultSet.getString("imageupload"));
						 		list.add(message1);
		     								
						 	  }
								
						 
					 
					 }
				   catch (SQLException sqlexception) {
						sqlexception.printStackTrace();
				  } catch (Exception exception) {
						exception.printStackTrace();
				 }

					return list;
		}

	 		  
	 		  //profile_photo from customer_details
	 		  
	 	public List<Message> single_client_details_admin(Message message) {

	 			  
					List<Message> list=new ArrayList<Message>();
					try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
							.prepareStatement("select id  , company_per_name , company_per_email , profile_photo from customer_details where id='"+message.getCustomer_id()+"'");) {
						 	ResultSet resultSet=preparedStatement.executeQuery();
						  	while(resultSet.next())
						    {
							 	Message message1=new Message();
						 		message1.setId(resultSet.getInt("id"));
						 		message1.setName(resultSet.getString("company_per_name"));
						 		message1.setEmail(resultSet.getString("company_per_email"));
						 		message1.setImage_upload(resultSet.getString("profile_photo"));
						 		list.add(message1);
		     								
						 	  }
								
						 
					 
					 }
				   catch (SQLException sqlexception) {
						sqlexception.printStackTrace();
				  } catch (Exception exception) {
						exception.printStackTrace();
				 }

					return list;
		}
	 		  
	 		  
	 		  
	 	
			    public boolean upload_file_briefcase(Briefcase briefcase)
				{
					boolean check=false;
					try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
							.prepareStatement("select  attachment , id from briefcase where id='"+briefcase.getId()+"'");) {
						 ResultSet resultSet=preparedStatement.executeQuery();
						 if(resultSet.next())
						 {
							 
							 
							 if(resultSet.getString("attachment") !=null) {
							  
								    String file=resultSet.getString("attachment");
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
				                   boolean deletefile=new DeleteFile().deletefile_name("softdoc-262410.appspot.com",file_name);
							 
							 }
						
		 	                  PreparedStatement preparedStatement2 = connection.prepareStatement("delete from briefcase  where id='"+resultSet.getString("id")+"'");
		                      check = preparedStatement2.executeUpdate()>0;

		 
						
						 }
						
						 
					} catch (SQLException sqlexception) {
						sqlexception.printStackTrace();
					} catch (Exception exception) {
						exception.printStackTrace();
					}

					return check;
				}
	          
			    
			    
			    public double BriefcaseSize(Briefcase briefcase) {

					double size=0;
					try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
							.prepareStatement("select ROUND(size , 2) as size from briefcase where client_id='"+briefcase.getId()+"'");) {
						 	ResultSet resultSet=preparedStatement.executeQuery();
						  	if(resultSet.next())
						    {
							 
						  	   size=resultSet.getDouble("size")/1000;
							    
						   }
						
			  	   } catch (SQLException sqlexception) {
						sqlexception.printStackTrace();
				  } catch (Exception exception) {
						exception.printStackTrace();
				 }

					return size;
				}
	            
			    
			    
	 		  
	 		  /*
	 		  public List<Comments> fetchComments(Comments comments) {

	 			  
					List<Comments> list=new ArrayList<Comments>();
					try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
							.prepareStatement("select id , send , client_id , DATE_FORMAT(date_time ,'%d %b %Y') AS date_time , DATE_FORMAT(date_time ,'%r') AS time from document_comments where document_info_id ='"+comments.getDocument_info_id()+"'");) {
						 	ResultSet resultSet=preparedStatement.executeQuery();
						  	while(resultSet.next())
						    {
							 
						 		Comments comments1=new Comments();
						 		
						 		comments1.setId(resultSet.getInt("id"));
						 		comments1.setSend(resultSet.getString("send"));
						 		comments1.setDate_time(resultSet.getString("date_time")+" "+resultSet.getString("time"));
						 		
						 		String reply_comments=null;
						 		String reply_date_time=null;
						 		String reply_employee_name=null;
						 		String reply_imageupload=null;
						 		boolean reply_condition=false;
						 		 PreparedStatement preparedStatement3 = connection
											.prepareStatement("select id , reply , client_id , DATE_FORMAT(date_time ,'%d %b %Y') AS date_time , DATE_FORMAT(date_time ,'%r') AS time from reply_comments where comments_id='"+resultSet.getInt("id")+"'");
								    ResultSet resultSet3=preparedStatement3.executeQuery();
									if(resultSet3.next()) {		  
								
										reply_comments=resultSet3.getString("reply");
										reply_date_time=resultSet3.getString("date_time")+" "+resultSet3.getString("time");
										reply_condition=true;
										
										   PreparedStatement preparedStatement4 = connection
		     										.prepareStatement("select employee_name , emp_email_id , imageupload from client_details where id='"+resultSet3.getInt("client_id")+"'");
		     							    ResultSet resultSet4=preparedStatement4.executeQuery();
		     								if(resultSet4.next()) {		  
		     								
		     									reply_employee_name=resultSet4.getString("employee_name");
		     									reply_imageupload=resultSet4.getString("imageupload");
		 									
		     								}
									 }
						 		
									comments1.setComment_reply(reply_comments);
									comments1.setReply_date_time(reply_date_time);
									comments1.setReply_employee_name(reply_employee_name);
									comments1.setReply_imageupload(reply_imageupload);
									comments1.setReply_condition(reply_condition);
									
						 		String employee_name="";
						 		String imageupload="";
						 				   PreparedStatement preparedStatement2 = connection
		     										.prepareStatement("select employee_name , emp_email_id , imageupload from client_details where id='"+resultSet.getInt("client_id")+"'");
		     							    ResultSet resultSet2=preparedStatement2.executeQuery();
		     								if(resultSet2.next()) {		  
		     							    
		     									employee_name=resultSet2.getString("employee_name");
		     									imageupload=resultSet2.getString("imageupload");
		 							         }
						
		     								
		     								comments1.setEmployee_name(employee_name);
		     								comments1.setImageupload(imageupload);
		     								
		     				   list.add(comments1);
		     								
						 	  }
								
						 
					 
					 }
				   catch (SQLException sqlexception) {
						sqlexception.printStackTrace();
				  } catch (Exception exception) {
						exception.printStackTrace();
				 }

					return list;
				}

	 		  */
			
			 	public List<Message> notification(Message message) {

		 			  
					List<Message> list=new ArrayList<Message>();
					try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
							.prepareStatement("select message , client_id , DATE_FORMAT(date_time ,'%d %b %Y') AS date_time  from client_message where send_id='"+message.getClient_id()+"' and client_id !='"+message.getClient_id()+"' order by id desc limit 5");) {
						 	ResultSet resultSet=preparedStatement.executeQuery();
						  	while(resultSet.next())
						    {
							 	Message message1=new Message();
						 		message1.setNew_message(resultSet.getString("message"));
						 	    message1.setDate_time(resultSet.getString("date_time"));
						 		
						 		PreparedStatement preparedStatement2 = connection.prepareStatement("SELECT  employee_name , imageupload , emp_email_id  FROM `client_details` WHERE  id ='"+resultSet.getInt("client_id")+"' and flag='0'");
							 	ResultSet resultSet2=preparedStatement2.executeQuery();
							 	if(resultSet2.next())
							    {
							      message1.setImage_upload(resultSet2.getString("imageupload"));
							      message1.setName(resultSet2.getString("employee_name"));
							      message1.setEmail(resultSet2.getString("emp_email_id"));
							    } 
						 		
						 		list.add(message1);
		     								
						 	  }
								
						 
					 
					 }
				   catch (SQLException sqlexception) {
						sqlexception.printStackTrace();
				  } catch (Exception exception) {
						exception.printStackTrace();
				 }

					return list;
		}
			 	
 }