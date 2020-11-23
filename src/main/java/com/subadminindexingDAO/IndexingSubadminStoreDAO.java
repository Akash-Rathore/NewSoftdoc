package com.subadminindexingDAO;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Month;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

import com.customerclientModal.ViewDocument;
import com.softdocadmin.email.Logfile;
import com.softdocindexing.connection.IndexingDBConnection;
import com.subadminindexingModal.IndexingUserProfile;
import com.subadminindexingModal.IndexingUserupload;
import com.subadminqualityModal.QualityUserProfile;
import com.subadminstore.loginfile.StoreLogfile;
import com.subadminstoreModal.UserProfileStore;
import com.uploadfile.DeleteFile;
import com.subadminindexing.loginfile.IndexingLogfile;

public class IndexingSubadminStoreDAO {

	

	public IndexingSubadminStoreDAO() {
	
	}


	// update profile of subadminstore
	public int updateprofile(IndexingUserProfile user) {
		int rowUpdated = 0;
		String email = user.getEmail();
		try (Connection connection = IndexingDBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement(
				"UPDATE `softdoc_staff` SET `username`=?,`password`=?,`name`=?,`designation`=?,`mobile`=?,`location`=? WHERE `id`='"
						+ user.getId() + "'");) {

			preparedStatement.setString(1, user.getUsername());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.setString(3, user.getName());
			preparedStatement.setString(4, user.getDesignation());
			preparedStatement.setLong(5, user.getMobile());
			preparedStatement.setString(6, user.getLocation());
			rowUpdated = preparedStatement.executeUpdate();

			// This is for logfile

			if (rowUpdated > 0) {
				
				
				    new IndexingLogfile().logfile(email,"Subadmin Indexing has been update profile",user.getId(),"Indexing");
       	      	
			}

		} catch (SQLException sqlexception) {
			sqlexception.getMessage();
		} catch (Exception exception) {
			exception.printStackTrace();
		}

		return rowUpdated;
	}

	
	public boolean uploaddocument(IndexingUserupload userupload)
	{
		boolean check=false;
		
		String document_no="";
  //========================================Start File Number=================================================================
			
		try(Connection connection = IndexingDBConnection.openConnection();PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM `document_info` WHERE file_no='"+userupload.getFile()+"' GROUP BY document_no order by id desc limit 1");)
		{
			ResultSet resultset=preparedStatement.executeQuery();
			if(resultset.next())
		     {
				   if(userupload.getValidation()==1)
				   {
				
						if(resultset.getString("document_no")==null)
						 {
							
							 String file_number=userupload.getFile();
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
							  //String version = resultset.getString("document_no");
							  //String newVersion = "000000" + (Integer.parseInt(version.substring(1,version.length()))+1);
							  //System.out.println(newVersion);
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
		try(Connection connection = IndexingDBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO `document_info`( `company_id`, `department`, `file`, `size`,`upload_date`,`document_no`,`billing_month`,`attachment_no`,`document_type`, `customer_code`, `customer_name`, `employee_code`, `employee_name`, `date_of_joining`, `invoice_date`, `invoice_number`, `vendor_code`, `vendor_name`,`file_no`, documentType1 , documentType2 , documentType3 , documentType4 , documentType5 , documentType6 ) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");) {
              preparedStatement.setInt(1,userupload.getCompanyid());
			  preparedStatement.setString(2, userupload.getDepartmentname());
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
			  
			  if(userupload.getInvoicedate().equals(""))
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
		      preparedStatement.setString(19,userupload.getFile());
		      preparedStatement.setString(20,userupload.getDocumentType1());
		      preparedStatement.setString(21,userupload.getDocumentType2());
		      preparedStatement.setString(22,userupload.getDocumentType3());
		      preparedStatement.setString(23,userupload.getDocumentType4());
		      preparedStatement.setString(24,userupload.getDocumentType5());
		      preparedStatement.setString(25,userupload.getDocumentType6());
		      
		      check = preparedStatement.executeUpdate()>0;
			  
			  if(check){
			   
				  new IndexingLogfile().logfile(userupload.getEmail(),"Subadmin Indexing has been upload document",userupload.getId(),"Indexing");
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
    
	
	public boolean updatequality(IndexingUserupload userupload)
	{
		boolean check=false;
		String file_no=userupload.getFile_no();
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate localDate = LocalDate.now();
		
		
		try(Connection connection = IndexingDBConnection.openConnection();PreparedStatement preparedStatement = connection.prepareStatement("UPDATE document_info SET status = 'quality' , history_indexing='history_indexing' , quality_date='"+dtf.format(localDate)+"' WHERE file_no ='"+file_no+"'");) 
		{
			check = preparedStatement.executeUpdate()>0;
			if(check){
				   
			
				new IndexingLogfile().logfile(userupload.getEmail(),"Subadmin Indexing has been send to quality team",userupload.getId(),"Indexing");
			  
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
	
	
	public boolean editdocument(IndexingUserupload userupload)
	{
		boolean check=false;
		int editid=userupload.getEditid();
		try(Connection connection = IndexingDBConnection.openConnection();PreparedStatement preparedStatement = connection.prepareStatement("UPDATE `document_info` SET `file`=?,`size`=?  WHERE id='"+editid+"'");) 
		{
			 preparedStatement.setString(1,userupload.getEditupload());
			 preparedStatement.setDouble(2, userupload.getSize());
			 check = preparedStatement.executeUpdate()>0;
		}
		catch(SQLException sqlException)
		{
			sqlException.printStackTrace();
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		
		return check;
	}
	
	public boolean updateindexing(IndexingUserupload userupload)
	{
		boolean check=false;
		String file_no=userupload.getFile_no();
		String document_no=userupload.getDocument_no();
		
		try(Connection connection = IndexingDBConnection.openConnection();PreparedStatement preparedStatement = connection.prepareStatement("UPDATE document_info SET status = 'return_quality' , remark=? WHERE document_no ='"+document_no+"' and file_no='"+file_no+"'");) 
		{
		    preparedStatement.setString(1,userupload.getRemark());
			check = preparedStatement.executeUpdate()>0;
			if(check){
				   
				  new IndexingLogfile().logfile(userupload.getEmail(),"Subadmin Indexing has been send to Return quality team",userupload.getId(),"Indexing");
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
  
	
	 //===================================start update indexing document==========================================
	

	public boolean updateindexingdoc(IndexingUserupload userupload)
	{
		boolean check=false;
		int editid=userupload.getEditid();
		try(Connection connection = IndexingDBConnection.openConnection();PreparedStatement preparedStatement = connection.prepareStatement("UPDATE `document_info` SET `file`=?,`size`=?  WHERE id='"+editid+"'");) 
		{
			 preparedStatement.setString(1,userupload.getEditupload());
			 preparedStatement.setDouble(2, userupload.getSize());
			 check = preparedStatement.executeUpdate()>0;
		}
		catch(SQLException sqlException)
		{
			sqlException.printStackTrace();
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		
		return check;
	}
	
   //===================================end update indexing document==========================================
	public boolean indexuploaddelete(IndexingUserupload userupload)
	{
		boolean check=false;
		try(Connection connection = IndexingDBConnection.openConnection();PreparedStatement preparedStatement = connection.prepareStatement("delete from document_info  where id='"+userupload.getId()+"'");) 
		{
			check = preparedStatement.executeUpdate()>0;
			  new IndexingLogfile().logfile(userupload.getEmail(),"Subadmin Indexing  delete attachment",userupload.getDid(),"Indexing");
				
			
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
   //===========================================================	
	public boolean changepassword(IndexingUserProfile indexingUserProfile) {
		boolean check = false;
		try (Connection connection = IndexingDBConnection.openConnection();Statement  statement = connection
				.createStatement();) {
			ResultSet resultset = statement.executeQuery("SELECT `password` FROM `softdoc_staff` WHERE id='" +indexingUserProfile.getId() + "'");
			if (resultset.next()) {
			
			    String password = resultset.getString("password");
				if (password.equals(indexingUserProfile.getPassword())) {
				   String confirm = indexingUserProfile.getConfirm();
				    try (Connection connect = IndexingDBConnection.openConnection();PreparedStatement preparedStatement = connect
							.prepareStatement("UPDATE `softdoc_staff` SET `password` ='" + confirm + "' WHERE `id`='"
									+indexingUserProfile.getId() + "' and role='indexing'");) {
						check = preparedStatement.executeUpdate() > 0;
						if (check) {
							 new IndexingLogfile().logfile(indexingUserProfile.getEmail(),"Subadmin Indexing change password",indexingUserProfile.getId(),"indexing");
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
	
	public boolean uploadphoto( IndexingUserProfile indexingUserProfile) {
		boolean check=false;
		try (Connection connection = IndexingDBConnection.openConnection();PreparedStatement preparedStatement = connection.prepareStatement(
				"UPDATE `softdoc_staff` SET `profile_photo`='"+indexingUserProfile.getUpload()+"' WHERE `id`='"
						+ indexingUserProfile.getId() + "' and `role`='indexing'");) {
					check = preparedStatement.executeUpdate()>0;
			if (check) {
				 new IndexingLogfile().logfile(indexingUserProfile.getEmail(),"Subadmin Indexing  update photo",indexingUserProfile.getId(),"indexing");
			}
		} catch (SQLException sqlexception) {
			sqlexception.getMessage();
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return check;
	}
   //=========================================//==============================================
	public boolean updatedocument(IndexingUserupload userupload)
	{
	
      boolean check=false;
      try(Connection connection = IndexingDBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("select file_no , document_no , company_id , department , document_type , status from document_info where id='"+userupload.getDocument_info_id()+"'");) {
	        
 		         ResultSet resultset=preparedStatement.executeQuery();
		         String file_no="";
		         String document_no="";
		         String company_id="";
		         String department="";
		         String document_type="";
		         String status="";
		         if(resultset.next())
		         {
		        	 file_no=resultset.getString("file_no");
		             document_no=resultset.getString("document_no");
		             company_id=resultset.getString("company_id");
		             department=resultset.getString("department");
		             document_type=resultset.getString("document_type");
		             status=resultset.getString("status");
		         }
		         
		         if(userupload.getDocument_status().equalsIgnoreCase("add_attachment")) {  
	    	         
		             
		              PreparedStatement preparedStatement2 = connection.prepareStatement("INSERT INTO `document_info` (company_id  , department , file , size , upload_date , document_no , billing_month , attachment_no , document_type ,  customer_code ,  customer_name ,  employee_code ,  employee_name ,  date_of_joining ,  invoice_date , invoice_number, vendor_code, vendor_name , file_no , status, documentType1 , documentType2 , documentType3 , documentType4 , documentType5 , documentType6) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		              
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
		  		      preparedStatement2.setString(20,status);
		  		      preparedStatement2.setString(21,userupload.getDocumentType1());
		  		      preparedStatement2.setString(22,userupload.getDocumentType2());
		  		      preparedStatement2.setString(23,userupload.getDocumentType3());
		  	 	      preparedStatement2.setString(24,userupload.getDocumentType4());
		  		      preparedStatement2.setString(25,userupload.getDocumentType5());
		  		      preparedStatement2.setString(26,userupload.getDocumentType6());
	  		      
		  		      
		  		      check = preparedStatement2.executeUpdate()>0;
		  			  
		  		
		  			 if(check){
			                new IndexingLogfile().logfile(userupload.getEmail(),"Subadmin Indexing has been at attachment",userupload.getId(),"Indexing");
			               }
		             
		             
		             }else {
		  			  
		  			  PreparedStatement preparedStatement3 = connection.prepareStatement("update  `document_info` set   `customer_code`=?, `customer_name`=?, `employee_code`=?, `employee_name`=?, `date_of_joining`=?, `invoice_date`=?, `invoice_number`=?, `vendor_code`=?, `vendor_name`=? , `documentType1`=? , `documentType2`=? , `documentType3`=? , `documentType4`=? , `documentType5`=? , `documentType6`=?  where document_no='"+document_no+"' and file_no='"+file_no+"'");
		  			   
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
		                  new IndexingLogfile().logfile(userupload.getEmail(),"Subadmin Indexing has been update document",userupload.getId(),"Indexing");
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
	
	
	public boolean addattachment(IndexingUserupload userupload)
	{
		
		boolean check=false;
		String document_no=userupload.getUpload_id();
		try(Connection connection = IndexingDBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO `document_info`( `company_id`, `department`, `file`, `size`,`upload_date`,`document_no`,`billing_month`,`attachment_no`,`document_type`, `customer_code`, `customer_name`, `employee_code`, `employee_name`, `date_of_joining`, `invoice_date`, `invoice_number`, `vendor_code`, `vendor_name`,`file_no`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");) {
              preparedStatement.setInt(1,userupload.getCompanyid());
			  preparedStatement.setString(2, userupload.getDepartmentname());
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
			  SimpleDateFormat sdfIn = new SimpleDateFormat("yyyy-MM-dd");
		      java.util.Date udateIn = sdfIn.parse(userupload.getInvoicedate());
		      long lIn = udateIn.getTime();
		      java.sql.Date sdateIn = new java.sql.Date(lIn);
		      preparedStatement.setDate(15,sdateIn);  
		      preparedStatement.setString(16,userupload.getInvoicenumber()); 
		      preparedStatement.setString(17,userupload.getVendorcode());
		      preparedStatement.setString(18,userupload.getVendorname());
		      preparedStatement.setString(19,userupload.getFile());
			  check = preparedStatement.executeUpdate()>0;
			  if(check){
			       new IndexingLogfile().logfile(userupload.getEmail(),"Subadmin Indexing has been attachment document",userupload.getId(),"Indexing");
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
	
	
	 public boolean attachmenthit(IndexingUserupload userupload) {

			boolean check = false;
			try (Connection connection = IndexingDBConnection.openConnection();PreparedStatement preparedStatement = connection
					.prepareStatement("UPDATE `document_info` SET hit=hit+1 where id='"+userupload.getId()+"'");) {
				check = preparedStatement.executeUpdate() > 0;
				if(check){
				       new IndexingLogfile().logfile(userupload.getEmail(),"Subadmin Indexing Hit attachment",userupload.getDid(),"Indexing");
				  }
				
				
			} catch (SQLException sqlexception) {
				sqlexception.printStackTrace();
			} catch (Exception exception) {
				exception.printStackTrace();
			}

			return check;
		}
	
	
	  public boolean updatedocumentquality(IndexingUserupload userupload)
		{
			boolean check=false;
			String document_no="";
			String file_name="";
	       //========================================Start File Number=================================================================
			try(Connection connection = IndexingDBConnection.openConnection();PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM `document_info` WHERE id='"+userupload.getUpload_id()+"'");)
			{
				ResultSet resultset=preparedStatement.executeQuery();
				if(resultset.next())
			     {
					
					 document_no=resultset.getString("document_no");
					 file_name=resultset.getString("attachment_no"); 
					   
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
			try(Connection connection = IndexingDBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("update  `document_info` set  `company_id`=?, `department`=?, `file`=?, `size`=?,`upload_date`=?,`document_no`=?,`billing_month`=?,`attachment_no`=?,`document_type`=?, `customer_code`=?, `customer_name`=?, `employee_code`=?, `employee_name`=?, `date_of_joining`=?, `invoice_date`=?, `invoice_number`=?, `vendor_code`=?, `vendor_name`=?,`file_no`=? where id='"+userupload.getUpload_id()+"'");) {
	             
				  preparedStatement.setInt(1,userupload.getCompanyid());
				  preparedStatement.setString(2, userupload.getDepartmentname());
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
				  preparedStatement.setString(8,file_name);	 
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
				  SimpleDateFormat sdfIn = new SimpleDateFormat("yyyy-MM-dd");
			      java.util.Date udateIn = sdfIn.parse(userupload.getInvoicedate());
			      long lIn = udateIn.getTime();
			      java.sql.Date sdateIn = new java.sql.Date(lIn);
			      preparedStatement.setDate(15,sdateIn);  
			      preparedStatement.setString(16,userupload.getInvoicenumber()); 
			      preparedStatement.setString(17,userupload.getVendorcode());
			      preparedStatement.setString(18,userupload.getVendorname());
			      preparedStatement.setString(19,userupload.getFile());
				  check = preparedStatement.executeUpdate()>0;
				  if(check){
				       new IndexingLogfile().logfile(userupload.getEmail(),"Subadmin Indexing has been update document",userupload.getId(),"Indexing");
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

	  
		 public boolean deleteDocument(IndexingUserupload userupload) {

				boolean check = false;
				try (Connection connection = IndexingDBConnection.openConnection();PreparedStatement preparedStatement = connection
						.prepareStatement("select file_no , document_no , file from document_info where id='"+userupload.getId()+"'");) {
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
									.prepareStatement("delete from document_info where file_no='"+resultSet.getString("file_no")+"' and document_no='"+resultSet.getString("document_no")+"'");
						 check = preparedStatement2.executeUpdate()>0;
					 }
					
					if(check){
						
						new IndexingLogfile().logfile(userupload.getEmail(),"Subadmin Indexing Delete Document Number",userupload.getDid(),"Indexing");
					  
					}
					
					
				} catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
				} catch (Exception exception) {
					exception.printStackTrace();
				}

				return check;
			}
		
		

}