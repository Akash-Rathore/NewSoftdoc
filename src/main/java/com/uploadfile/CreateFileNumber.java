	package com.uploadfile;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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

@WebServlet(name = "/CreateFileNumber", urlPatterns = { "api/process/createfilenum" })
@MultipartConfig
public class CreateFileNumber extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
          
		 
		 int id=Integer.parseInt(request.getParameter("id"));
		 String pickupform=request.getParameter("pickupform");
         String mobile=request.getParameter("mobile");
		 String pickup_date2=request.getParameter("pickup_date");
		 final String OLD_FORMAT = "dd MMM yyyy";
	     final String NEW_FORMAT = "yyyy-MM-dd";
	     SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
	     Date d;
	     String pickup_date1="";
	     try{
			   d = sdf.parse(pickup_date2);
			   sdf.applyPattern(NEW_FORMAT);
			   pickup_date1 = sdf.format(d);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	     String file_number1=request.getParameter("filenumber");
		 String array[]=file_number1.split(":");
		 String department=request.getParameter("departments");
         String array1[]=department.split(":");
         Part part = request.getPart("images");
		 String url=new IndexingUploading().uploadFile(part,"softdoc-262410.appspot.com");
		
		 
		 String location_id="";
		 String update="";
		 
		 int check6=0;
		 //System.out.println(file_number1);
		 PrintWriter out=response.getWriter();
		 Gson gson = new Gson();
		 JSONObject json = new JSONObject();
		 try (Connection connection1 = StoreDBConnection.openConnection();
	    		  Statement statement1 = connection1.createStatement();) {
	    	      int check1 = statement1.executeUpdate("update `scheduling` set `pickup_date`='"+pickup_date1+"',`mobile`='"+mobile+"',`images`='"+url+"' , pickup_form='"+pickupform+"' , flag='1' where id='"+id+"'");
				  if(check1>0)
				 {
			//================================start select scheduling=============================================================
					  try (Connection connection2 = StoreDBConnection.openConnection();
				    		  Statement statement2 = connection1.createStatement();) {
						      ResultSet resultset2 = statement2.executeQuery("select * from `scheduling` where id='"+id+"'");
						      if(resultset2.next())
						      {
						   //==================================start document_info=================================================
						    	    String company_id=resultset2.getString("company_id");
						    	    String pickup_date=resultset2.getString("pickup_date");
						    	    String company_name=resultset2.getString("company_name");
						    	    
						    	    for(int j=0;j<array.length;j++)
						            {						                   
						            
						    	    try (Connection connection3= StoreDBConnection.openConnection();
								    		  Statement statement3 = connection1.createStatement();) {
						    	    	      int check2 = statement1.executeUpdate("insert into document_info (file_no,company_id,status,pickup_date,department,scheduling_id) values('"+array[j]+"','"+company_id+"','store','"+pickup_date+"' ,'"+array1[j]+"' , '"+id+"')");
						  			          //System.out.println("insert into document_info (file_no,company_id,status,pickup_date,department) values('"+array[j]+"','\"+company_id+\"','store','\"+pickup_date+\" ,'"+array1[j]+"')\"");
						    	    	      if(check2>0) { 
						    	    	      //========================start location===============================
						    	    	      try (Connection connection4= StoreDBConnection.openConnection();
										    		  Statement statement4 = connection4.createStatement();) {
						    	    	    	      ResultSet resultset4 = statement4.executeQuery("SELECT * FROM customer_location WHERE company_id='"+company_id+"'");
						    	    	    	      if(resultset4.next())
						    	    	    	       {
						    	    	    	    	
						    	    	    	    	 location_id=resultset4.getString("id"); 
						    	    	    	    	 String pickup_frequency=resultset4.getString("pickup_frequency");
						    	    	    	    	 int frequency=Integer.parseInt(pickup_frequency);
						    	    	   				 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
						    	    	   				 Date myDate = formatter.parse(pickup_date);
						    	    	   				 Calendar c = Calendar.getInstance();
						    	    	   				 c.setTime(myDate);
						    	    	   				 c.add(Calendar.DATE, frequency);
						    	    	   				 update = formatter.format(c.getTime());
						    	    	   			//========================================//======================   	  
						    	    	   				 if(j==0){
						    	    	   					 
						    	    	   				 try (Connection connection5= StoreDBConnection.openConnection();
													    		  Statement statement5 = connection5.createStatement();) {
											    	    	      int check5 = statement5.executeUpdate("update `scheduling` set `return_date`='"+update+"' where id='"+id+"'");
											  			          if(check5>0){
											  			        	try (Connection connection6= StoreDBConnection.openConnection();
																    		  Statement statement6 = connection6.createStatement();) {
														    	    	      check6 = statement6.executeUpdate("insert into `scheduling` (company_name,company_id,status,pickup_date,loc_id) values('"+company_name+"','"+company_id+"','store','"+update+"','"+location_id+"')");
														  			         
														  			   }
											  			          }
											  			   }
						    	    	   			  
						    	    	   			} 
						    	                  //========================================//========================
						    	    	   		  	 
						    	    	    	    	   
						    	    	    	       }
						    	    	    	       else
						    	    	    	       {
						    	    	    	    	   json.put("code","400");
								  						    json.put("message","something went wrong");
								  						    String	message = gson.toJson(json);
								  						    out.write(message);    	    	    	    	   
						    	    	    	       }
						    	    	      }
						    	    	    //=========================end location================================  
						  			      }
						  			      else
						  			      {
						  			    	json.put("code","400");
				  						    json.put("message","something went wrong");
				  						    String	message = gson.toJson(json);
				  						    out.write(message);
						  			      }
						    	        
						    	    }
						    	    
						       } 
						    	    if(check6>0) {
					  			          
				  			        	
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
						    //=========	    
						   //==================================end document_info================================================= 	  
						      }
						      else
						      { json.put("code","400");
	  						    json.put("message","something went wrong");
	  						    String	message = gson.toJson(json);
	  						    out.write(message);
						      }
						    	  
			
					  } 
			//================================end select scheduling=============================================================
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
}
