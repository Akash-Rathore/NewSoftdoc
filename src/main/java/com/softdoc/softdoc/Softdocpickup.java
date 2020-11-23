package com.softdoc.softdoc;


import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

import com.softdocapi.email.EmailApi;
import com.softdocpickupapi.Location;
import com.softdocpickupapi.Store;
import com.customerclient.connection.DBConnection;
import com.softdocadmin.connection.StoreDBConnection;
public class Softdocpickup {

	//=============================//========================================================================
	
	    public Picklogin getlogin(Picklogin picklogin) {
		
	     try(Connection connect=StoreDBConnection.openConnection();Statement   statement = connect.createStatement();)
		 {
	    	  ResultSet resultset=statement.executeQuery("SELECT * FROM `softdoc_staff` WHERE email='" +picklogin.getEmail()+ "' AND role='store' and flag='0' ");
		      if(resultset.next())
		      {
		    	  try(Connection connection=StoreDBConnection.openConnection();   PreparedStatement   preparedStatement = connection.prepareStatement("SELECT * FROM `softdoc_staff` WHERE email='" +picklogin.getEmail()+ "' AND PASSWORD='"+picklogin.getPassword()+ "' AND role='store'");)
				    {

					      ResultSet result=preparedStatement.executeQuery();
			   	      	  if(result.next())
			              {
			   		    	   
			   		    	  Picklogin picklogin1=new Picklogin(resultset.getInt("id"),"200",resultset.getString("email"),"sucessfully login",resultset.getString("name"));
			   		    	  return picklogin1;
			          	  
			              }
			              else
			              {    
			            	  
			            	  Picklogin picklogin1=new Picklogin("400","wrong password");
			   		    	  return picklogin1; 
			              }
			                
			   	      }
			   	      catch(Exception exception)
			   	      {
			   		      exception.printStackTrace();  
			   	      }
 
		      }
		      else
		      {
		    	  Picklogin picklogin1=new Picklogin("400","user not exit");
		    	  return picklogin1;
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

   // ==================================//=============================
  
   public Picklogin getforgot(Picklogin picklogin) {

		
		try (Connection connection = StoreDBConnection.openConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(
						"SELECT * FROM `softdoc_staff` WHERE email='" +picklogin.getEmail() + "' AND role='store'");) {

			ResultSet resultset = preparedStatement.executeQuery();
			if (resultset.next()) {
				 
				 Picklogin picklogin1=new Picklogin(resultset.getInt("id"),"200","change password successfully");
			    //email purpose
			    EmailApi emailapi=new EmailApi();
   		        emailapi.email("Password recovery for your Softdoc Account", 
   		        		
   		        		          
   		        	           "<br> Hello "+ resultset.getString("name")+",<br>"
			    				+"Please find below your password:"
			    			    +""+resultset.getString("password")+""
			    			    +"*It is highly recommended that you change your password immediately to protect your data and privacy.<br>"
			    			    +"Please do not share your password with anybody.* <br>"
			    			    + "Regards,<br>"
								+ "Team Softdoc <br><br>"
								+ "*This is a system generated email. Please do not reply to this email.* <br>" ,picklogin.getEmail());
    				 
			        	return picklogin1;
			
			
			} else {
				
				
				Picklogin picklogin1=new Picklogin("400","something went wrong");
			    return picklogin1;
			}
		} catch (SQLException sqlexception) {
			sqlexception.printStackTrace();
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	// ==================================//=============================
		public List<Faq> getfaq() {

			List<Faq> list = new ArrayList<Faq>();
			try (Connection connection = StoreDBConnection.openConnection();
					PreparedStatement preparedStatement = connection
							.prepareStatement("SELECT `title`, id , `description` FROM `faq`");) {
				ResultSet resultset = preparedStatement.executeQuery();
				while (resultset.next()) {

					Faq faq=new Faq();
					faq.setId(resultset.getInt("id"));
					faq.setCode("200");
					faq.setMessage("success");
					faq.setTitle(resultset.getString("title"));
					faq.setDescription(resultset.getString("description"));
		            list.add(faq);
				}

			} catch (SQLException sqlexception) {
				sqlexception.printStackTrace();
			} catch (Exception exception) {
				exception.printStackTrace();
			}

			return list;
		}
		// ==================================//=============================
       public List<Privacypolicy> web_details() {
			List<Privacypolicy> list = new ArrayList<Privacypolicy>();
			try (Connection connection = StoreDBConnection.openConnection();
					PreparedStatement preparedStatement = connection
							.prepareStatement("SELECT id,`description`, `type` FROM `web_details`");) {
				ResultSet resultset = preparedStatement.executeQuery();
				while (resultset.next()) {
					Privacypolicy privacypolicy=new Privacypolicy();
					privacypolicy.setId(resultset.getInt("id"));
					privacypolicy.setCode("200");
					privacypolicy.setMessage("success");
					privacypolicy.setDescription(resultset.getString("description"));
					privacypolicy.setName(resultset.getString("type"));
					list.add(privacypolicy);
				}

			} catch (SQLException sqlexception) {
				sqlexception.printStackTrace();
			} catch (Exception exception) {
				exception.printStackTrace();
			}
			return list;

		}
       // ==================================//=============================
       public Pickup_details totalpickupdata() {
			List<Todaypickup> list = new ArrayList<Todaypickup>();
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDateTime now = LocalDateTime.now();
			try (Connection connection = StoreDBConnection.openConnection();
					PreparedStatement preparedStatement = connection.prepareStatement(
							"SELECT * FROM `scheduling` where `pickup_date`='" + dtf.format(now) + "' and flag='0'");) {

				ResultSet resultset = preparedStatement.executeQuery();
				while (resultset.next()) {

					String company_name="";
					try (Connection connect = StoreDBConnection.openConnection();
							  Statement statment = connect.createStatement();) {
						ResultSet result = statment.executeQuery("SELECT * FROM `customer_details` where id='" + resultset.getString("company_id")+"'");
						while (result.next()) {
							
							  company_name=result.getString("company_name");
							
						  }
					}

					
					Todaypickup todaypickup=new Todaypickup();
					todaypickup.setId(resultset.getInt("id"));
					todaypickup.setPickup_date(resultset.getString("pickup_date"));
					todaypickup.setCompany_name(company_name);
					todaypickup.setCode("200");
					todaypickup.setMessage("success");
					todaypickup.setCompany_id(resultset.getString("company_id"));
					list.add(todaypickup);
				}

			} catch (SQLException sqlexception) {
				sqlexception.printStackTrace();
			} catch (Exception exception) {
				exception.printStackTrace();
			}
		
			List<Previouspickup> listprev = new ArrayList<Previouspickup>();
			DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDateTime now1 = LocalDateTime.now();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date myDate = null;
			try {
				myDate = formatter.parse(dtf1.format(now1));
			} catch (ParseException parseException) {
				parseException.getMessage();
			}
			Calendar c = Calendar.getInstance();
			c.setTime(myDate);
			c.add(Calendar.DATE,1);
			String tomorrow = formatter.format(c.getTime());
			try (Connection connection = StoreDBConnection.openConnection();
					PreparedStatement preparedStatement = connection
							.prepareStatement("SELECT * FROM `scheduling` where `pickup_date`='" + tomorrow + "'");) {
				ResultSet resultset = preparedStatement.executeQuery();
				while (resultset.next()) {
				
					Previouspickup previouspickup=new Previouspickup();
					previouspickup.setId(resultset.getInt("id"));
					previouspickup.setCode("200");
					previouspickup.setMessage("success");
					previouspickup.setCompany_id(resultset.getString("company_id"));
					previouspickup.setPickup_date(resultset.getString("pickup_date"));
					previouspickup.setCompany_name(resultset.getString("company_name"));
					listprev.add(previouspickup);
				
				}

			} catch (SQLException sqlexception) {
				sqlexception.printStackTrace();
			} catch (Exception exception) {
				exception.printStackTrace();
			}
			Pickup_details pickup_details=new Pickup_details(list,listprev);
			return pickup_details;
		}

		// end pickupdate
       
       public List<Todaypickup> todaypickup() {
			boolean check = false;
			List<Todaypickup> list = new ArrayList<Todaypickup>();
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDateTime now = LocalDateTime.now();

			try (Connection connection = StoreDBConnection.openConnection();
					PreparedStatement preparedStatement = connection.prepareStatement(
							"SELECT * FROM `scheduling` where `pickup_date`='" + dtf.format(now) + "' and flag='0'");) {

				ResultSet resultset = preparedStatement.executeQuery();
				while (resultset.next()) {

					Todaypickup todaypickup=new Todaypickup();
					todaypickup.setId(resultset.getInt("id"));
					todaypickup.setPickup_date(resultset.getString("pickup_date"));
					todaypickup.setCompany_name(resultset.getString("company_name"));
					todaypickup.setCode("200");
					todaypickup.setMessage("success");
					todaypickup.setCompany_id(resultset.getString("company_id"));
					list.add(todaypickup);
				
				}

			} catch (SQLException sqlexception) {
				sqlexception.printStackTrace();
			} catch (Exception exception) {
				exception.printStackTrace();
			}

			return list;
		}

       
		// ==================================//=============================
		// tomorrowpickup
		public List<Previouspickup> tomorrowpickup() {
			// Current date
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDateTime now = LocalDateTime.now();
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date myDate = null;
			try {
				myDate = formatter.parse(dtf.format(now));
			} catch (ParseException parseException) {
				parseException.getMessage();
			}
			Calendar c = Calendar.getInstance();
			c.setTime(myDate);
			c.add(Calendar.DATE,1);
			String previous = formatter.format(c.getTime());
			List<Previouspickup> list = new ArrayList<Previouspickup>();
			try (Connection connection = StoreDBConnection.openConnection();
					PreparedStatement preparedStatement = connection
							.prepareStatement("SELECT * FROM `scheduling` where `pickup_date`='" + previous + "'");) {

				ResultSet resultset = preparedStatement.executeQuery();
				while (resultset.next()) {
				
					Previouspickup previouspickup=new Previouspickup();
					previouspickup.setId(resultset.getInt("id"));
					previouspickup.setCode("200");
					previouspickup.setMessage("success");
					previouspickup.setCompany_id(resultset.getString("company_id"));
					previouspickup.setPickup_date(resultset.getString("pickup_date"));
					previouspickup.setCompany_name(resultset.getString("company_name"));
					list.add(previouspickup);
				
				}

			} catch (SQLException sqlexception) {
				sqlexception.printStackTrace();
			} catch (Exception exception) {
				exception.printStackTrace();
			}

			return list;
		}
        
		// ==================================//=============================

		
		//start customer details
		public Customerdetails customerdetails(Customerdetails customerdetail) {

			//List<Customerdetails> list = new ArrayList<Customerdetails>();
			try (Connection connection = StoreDBConnection.openConnection();
					PreparedStatement preparedStatement = connection
							.prepareStatement("SELECT * FROM `customer_details` where id='" + customerdetail.getId() + "' and flag=0");) {

				ResultSet resultset = preparedStatement.executeQuery();

				if(resultset.next()) {
					
                   String location="";
				   int pincode=0;
				   String mobile="";
					try (Connection connect = StoreDBConnection.openConnection();
							  Statement  statement = connection.createStatement();) {
						 ResultSet result = statement.executeQuery("SELECT * FROM `customer_location` where company_id='"+resultset.getString("id")+"'");
						 if (result.next()) {

							 location=result.getString("address_line_one")+" "+result.getString("address_line_two")+" "+result.getString("city");
							 pincode=result.getInt("pincode");
							 mobile=result.getString("loc_person_mobile");
						 }					
					                
					}  
					Customerdetails customerdetails = new Customerdetails();
					customerdetails.setCompany_id(resultset.getString("id"));
					customerdetails.setId(resultset.getInt("id"));
					customerdetails.setCode("200");
					customerdetails.setMessage("success");
					customerdetails.setCompany_number(resultset.getString("customer_number"));
					customerdetails.setCompany_name(resultset.getString("company_name"));
					customerdetails.setLocation(location);
					customerdetails.setPincode(pincode);
					customerdetails.setCompany_per_name(resultset.getString("company_per_name"));
					customerdetails.setMobile(mobile);
					return customerdetails;
				}

			} catch (SQLException sqlexception) {
				sqlexception.printStackTrace();
			} catch (Exception exception) {
				exception.printStackTrace();
			}

			return null;
		}
		// end customer details
		// ==================================//=============================

		// start customerlocation
		public List<Location> customerlocation(Location locationid) {

			List<Location> list = new ArrayList<Location>();

			try (Connection connection = StoreDBConnection.openConnection();
					PreparedStatement preparedStatement = connection
							.prepareStatement("SELECT * FROM `customer_location` where company_id='"+locationid.getId()+"'");) {

				ResultSet resultset = preparedStatement.executeQuery();
				while (resultset.next()) {

					Location location = new Location();
					location.setId(resultset.getInt("id"));
					location.setCode("200");
					location.setMessage("success");
					location.setAddress_line_one(resultset.getString("address_line_one"));
					location.setAddress_line_two(resultset.getString("address_line_two"));
					location.setCity(resultset.getString("city"));
					location.setPincode(resultset.getString("pincode"));
					location.setDate(resultset.getString("date"));
					location.setLoc_person_name(resultset.getString("loc_person_name"));
					location.setLoc_person_mobile(resultset.getString("loc_person_mobile"));
					location.setLoc_person_email(resultset.getString("loc_person_email"));
					location.setLoc_per_designation(resultset.getString("loc_per_designation"));
					location.setCompany_name(resultset.getString("company_name"));
					list.add(location);
					
				}

			} catch (SQLException sqlexception) {
				sqlexception.printStackTrace();
			} catch (Exception exception) {
				exception.printStackTrace();
			}

			return list;
		}
		// end customer location;
   // ==================================//=============================
  
		
		
		public List<Store> returndetails() {

			List<Store> list = new ArrayList<Store>();
			try (Connection connection = StoreDBConnection.openConnection();
					PreparedStatement preparedStatement = connection
							.prepareStatement("SELECT * FROM `customer_details`");) {
				ResultSet resultset = preparedStatement.executeQuery();
				while (resultset.next()) {

					Store alien = new Store();
					alien.setCompany_number(resultset.getString("customer_number"));
					alien.setCompany_name(resultset.getString("company_name"));
					alien.setLocation(resultset.getString("location"));
					alien.setPincode(resultset.getInt("pincode"));
					alien.setCompany_per_name(resultset.getString("company_per_name"));
					alien.setMobile(resultset.getString("mobile"));
					list.add(alien);
				}

			} catch (SQLException sqlexception) {
				sqlexception.printStackTrace();
			} catch (Exception exception) {
				exception.printStackTrace();
			}
			return list;
		}

		// ==================================//=============================
		 public Picklogin clientlogin(Picklogin picklogin) {
			  
			 try(Connection connect=StoreDBConnection.openConnection();Statement   statement = connect.createStatement();)
			  {
				 ResultSet result=statement.executeQuery("SELECT * FROM `client_details` WHERE emp_email_id='" +picklogin.getEmail()+ "' and flag='0'");
				 if(result.next())
				 {
					 
					   try(Connection connection=StoreDBConnection.openConnection(); PreparedStatement   preparedStatement = connection.prepareStatement("SELECT * FROM `client_details` WHERE emp_email_id='" +picklogin.getEmail()+ "' AND PASSWORD='"+picklogin.getPassword()+ "'");)
					    {

						      ResultSet resultset=preparedStatement.executeQuery();
				   	      	  if(resultset.next())
				              {
				   		    	   
				   		    	  Picklogin picklogin1=new Picklogin(resultset.getInt("id"),"200",resultset.getString("emp_email_id"),"sucessfully login",resultset.getString("employee_name"),resultset.getString("customer_id"));
				   		    	  return picklogin1;
				          	  
				              }
				              else
				              {    
				            	  
				            	  Picklogin picklogin1=new Picklogin("400","something went wrong");
				   		    	  return picklogin1; 
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
				 else
				 {
					 Picklogin picklogin1=new Picklogin("400","user not exit");
					 return picklogin1;
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
		 
	//==================================//=======================================
	   public Picklogin clientforgot(Picklogin picklogin) {

				
				try (Connection connection = StoreDBConnection.openConnection();
						PreparedStatement preparedStatement = connection.prepareStatement(
								"SELECT * FROM `client_details` WHERE emp_email_id='"+picklogin.getEmail()+"'");) {

					ResultSet resultset = preparedStatement.executeQuery();
					if (resultset.next()) {
						 
						 Picklogin picklogin1=new Picklogin(resultset.getInt("id"),"200","change password successfully");
					    //email purpose
					    EmailApi emailapi=new EmailApi();
		   		        emailapi.email("Password recovery for your Softdoc Account", 
		   		        
		   		        		"<br> Hello "+ resultset.getString("employee_name")+",<br>"
					    				+"Please find below your password:"
					    			    +""+resultset.getString("password")+""
					    			    +"*It is highly recommended that you change your password immediately to protect your data and privacy.<br>"
					    			    +"Please do not share your password with anybody.* <br>"
					    			    + "Regards,<br>"
										+ "Team Softdoc <br><br>"
										+ "*This is a system generated email. Please do not reply to this email.* <br>" ,picklogin.getEmail());
		   		        		
						return picklogin1;
					
					
					} else {
						
						
						Picklogin picklogin1=new Picklogin("400","something went wrong");
					    return picklogin1;
					}
				} catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
				} catch (Exception exception) {
					exception.printStackTrace();
				}
				return null;
			}
  //========================================//=======================================================
          
		public Clientdetails clientdetail(Clientdetails clientdetails) {

			try (Connection connection = StoreDBConnection.openConnection();
					PreparedStatement preparedStatement = connection
							.prepareStatement("SELECT ccd.imageupload,ccd.employee_id,ccd.customer_id,ccd.id,ccd.emp_email_id,ccd.employee_name,ccd.location,ccd.mobile,cd.company_name FROM `client_details`as ccd,`customer_details` as cd where ccd.customer_id=cd.id and ccd.id='"+clientdetails.getId()+"'");) {

				ResultSet resultset = preparedStatement.executeQuery();

				if(resultset.next()) {

					Clientdetails clientdetail = new Clientdetails();
					clientdetail.setId(resultset.getInt("id"));
					clientdetail.setCode("200");
					clientdetail.setMessage("success");
					clientdetail.setEmail(resultset.getString("emp_email_id"));
					clientdetail.setName(resultset.getString("employee_name"));
					clientdetail.setLocation(resultset.getString("location"));
					clientdetail.setMobile(resultset.getString("mobile"));
					clientdetail.setCustomer_id(resultset.getString("customer_id"));
					clientdetail.setEmployee_id(resultset.getString("employee_id"));
					clientdetail.setComapany_name(resultset.getString("company_name"));
					clientdetail.setProfile_pic(resultset.getString("imageupload"));
					
					return clientdetail;	
				}

			} catch (SQLException sqlexception) {
				sqlexception.printStackTrace();
			} catch (Exception exception) {
				exception.printStackTrace();
			}

			return null;
		}
    //====================================================//====================================================
	
        
		public Clientdetails updateclientdetail(Clientdetails clientdetails) {

			try (Connection connection = StoreDBConnection.openConnection();
					PreparedStatement preparedStatement = connection
							.prepareStatement("update `client_details` set `emp_email_id`=?,`mobile`=?,`location`=?,`employee_name`=? where id='"+clientdetails.getId()+"'");) {

				       preparedStatement.setString(1,clientdetails.getEmail());
				       preparedStatement.setString(2,clientdetails.getMobile());
				       preparedStatement.setString(3,clientdetails.getLocation());
				       preparedStatement.setString(4,clientdetails.getName());
				       boolean check = preparedStatement.executeUpdate()>0;
				       if(check)
				       {
				    	   Clientdetails clientcondition = new Clientdetails("200","success");
				    	   return clientcondition;
				       }
				       else
				       {
				    	   Clientdetails clientcondition = new Clientdetails("400","something went wrong");
				    	   return clientcondition;
				       }

					
				}

			catch (SQLException sqlexception) {
				sqlexception.printStackTrace();
			} catch (Exception exception) {
				exception.printStackTrace();
			}

			return null;
		}		
		
	//=====================================================//===================================================	
  
		  public Changepassword changepassword(Changepassword changepassword)
		  {       
			       String email=changepassword.getEmail();
				  
				   String confirm="";
				   try(Connection connection = StoreDBConnection.openConnection();Statement statement = connection.createStatement();)
				   {
					    ResultSet resultset=statement.executeQuery("SELECT `password` FROM `client_details` WHERE `emp_email_id`='"+email+"'");
					    if(resultset.next())
					    {
					        //=========================//============================	
					        String password=resultset.getString(1);
					        if(password.equals(changepassword.getPassword()))
							   {
							       confirm = changepassword.getConfirm();  
							   }
							   try(Connection connect = StoreDBConnection.openConnection();PreparedStatement preparedStatement = connect.prepareStatement("UPDATE `client_details` SET `password` = '"+confirm+"' WHERE `emp_email_id`='"+email+"'");)
							   {
								    boolean check=preparedStatement.executeUpdate()>0;
								   if(check) {
								      Changepassword changepassword1=new Changepassword("200","success");
								      return changepassword1;
								   }
								   else
								   {
									   Changepassword changepassword1=new Changepassword("400","something went wrong");
									   return changepassword1;
									  
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
//=====================================================//===================================================	
  
		  public List<Clientdetails> showdepartment(Clientdetails clientdetails){
 
			  List<Clientdetails> list = new ArrayList<Clientdetails>();
			  try (Connection connection = StoreDBConnection.openConnection();
						PreparedStatement preparedStatement = connection.prepareStatement("select * from client_details where id='"+clientdetails.getId()+"'");) {

					ResultSet resultset = preparedStatement.executeQuery();
					if(resultset.next()) {
						
						String department=resultset.getString("department"); 
						String array[]=department.split(",");
					    
						for(int j = 0; j < array.length; j++) {
                          
							Clientdetails clientdetails1=new Clientdetails();
							clientdetails1.setDepartment(array[j]);
                        	list.add(clientdetails1);
        						
                        }
                        
					 	
					}

				} catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
				} catch (Exception exception) {
					exception.printStackTrace();
				}
		    
			  return list;
		  
		  }
 
 //=================================//==================================================
		  public List<Filenumber> showdocumentnumber(Filenumber filenumber){
			  
			  List<Filenumber> list = new ArrayList<Filenumber>();
		      try (Connection connection = StoreDBConnection.openConnection();
						PreparedStatement preparedStatement = connection.prepareStatement("select df.document_no as document_no , df.file , df.attachment_no,df.file_no,df.id from client_details as ccd,document_info as df where ccd.customer_id=df.company_id and ccd.id='"+filenumber.getId()+"' group by document_no order by df.id");) {

					ResultSet resultset = preparedStatement.executeQuery();
					while (resultset.next()) {
						
						 Filenumber filenumber1=new Filenumber();
						 filenumber1.setCode("200");
						 filenumber1.setMessage("success");
						 filenumber1.setId(resultset.getInt("id"));
						 filenumber1.setDocument_no(resultset.getString("document_no"));
						 //filenumber1.setAttachement(resultset.getString("attachment_no"));
					     //filenumber1.setShowfile(resultset.getString("file"));
						 list.add(filenumber1);
							
					}

				} catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
				} catch (Exception exception) {
					exception.printStackTrace();
				}
		    
			  return list;
		  
		  }
     
  //======================================//=========================================  
  public Filenumber starfile(Filenumber filenumber){
			  
			  try(Connection connection = StoreDBConnection.openConnection();
						PreparedStatement preparedStatement = connection.prepareStatement("update `document_info` set star=1 where document_no='"+filenumber.getDocument_no()+"'");) {
  		           
		    	   boolean check = preparedStatement.executeUpdate()>0;
			       if(check)
			       {
			    	   Filenumber filenumber1 = new Filenumber("200","success");
			    	   return filenumber1;
			       }
			       else
			       {
			    	   Filenumber filenumber1 = new Filenumber("400","something went wrong");
				       return filenumber1;
			       }
				
			  } catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
				} catch (Exception exception) {
					exception.printStackTrace();
				}
		    
			  return null;
		  
		  }
//===============================//======================================================================
  public List<Filenumber> showdocument(Filenumber filenumber){
	  List<Filenumber> list = new ArrayList<Filenumber>();
      try (Connection connection = StoreDBConnection.openConnection();
				PreparedStatement preparedStatement = connection.prepareStatement("select df.document_no as document_no,df.file,df.attachment_no,df.file_no,df.id from client_details as ccd,document_info as df where ccd.customer_id=df.company_id and ccd.id='"+filenumber.getId()+"' and star='1' group by df.document_no");) {

			ResultSet resultset = preparedStatement.executeQuery();
			while (resultset.next()) {
				
				Filenumber filenumber1=new Filenumber();
				filenumber1.setCode("200");
				filenumber1.setMessage("success");
				filenumber1.setId(resultset.getInt("id"));
		        //filenumber1.setFilenumber(resultset.getString("file_no"));
				filenumber1.setDocument_no(resultset.getString("document_no"));
			    //filenumber1.setShowfile(resultset.getString("file"));
				list.add(filenumber1);
					
			}

		} catch (SQLException sqlexception) {
			sqlexception.printStackTrace();
		} catch (Exception exception) {
			exception.printStackTrace();
		}
    
	  return list;
  
  }
//======================================================//===========================================================
   public Filenumber filenumber(Filenumber filenumber){
	 //========================= start generate number===========================================
	   
	   try (Connection connection = StoreDBConnection.openConnection();Statement statement = connection.createStatement();) {
			ResultSet resultset = statement.executeQuery("select * from scheduling where id='"+filenumber.getId()+"'");
			 if(resultset.next()) {
	
				 int id=resultset.getInt("id");
				 String company_id=resultset.getString("company_id");
				 String pickup_date1=resultset.getString("pickup_date");
			 	
				
				 final String OLD_FORMAT = "yyyy-MM-dd";
     			 final String NEW_FORMAT = "dd MMM yyyy";
     			 SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
     			 Date d = sdf.parse(pickup_date1);
     			 sdf.applyPattern(NEW_FORMAT);
     			 String pickup_date = sdf.format(d);
		     	 
				 
				 //========================= 
				 try (Connection connect = StoreDBConnection.openConnection();Statement state = connect.createStatement();) {
        			ResultSet result = state.executeQuery("select * from customer_details where id='"+company_id+"'");
        			 if(result.next()) {
        		     //============================//========================   
        				 String company_name=result.getString("company_name");
        				 String colour=result.getString("colour");
        				 int dpi=result.getInt("dpi");
        				 String customer_number=result.getString("customer_number");
        				
        				 String deptinfo =result.getString("depart_info");
                         String array[]=deptinfo.split(",");
                         
                         List<Department> listdepartment = new ArrayList<Department>();
                         for(int i=0;i<array.length;i++)
                         {
                        	  Department department=new Department();
                        	  department.setDepartment(array[i]);
                        	  listdepartment.add(department);
                         }
        				
                         
                         String  customer_num="";
        				 for (int i=0 ;i <customer_number.length(); i++) {
                 	     
        					   if(i==0||i==1||i==2){
        						   
        					   }
        					   else
        					   {
        						   customer_num += customer_number.charAt(i);
        					   }
        				 
        				 }
        				//===============Scanning quality start=============== 
        			   	  int scan=0;
        				  if(colour.equals("colour"))
        				  {
        					 if(dpi==200)
        					 {
        						 scan=1;
        					 }
        					 else if(dpi==300)
        					 {
        						 scan=3;
        					 }
        					 else if(dpi==400)
        					 {
        						 scan=5;
        						 
        					 }else if(dpi==600)
        					 {
        						 scan=7;
        					 }
        				  }
        				  else
        				  {
        					  if(dpi==200)
         					 {
         						 scan=2;
         					 }
         					 else if(dpi==300)
         					 {
         						 scan=4;
         					 }
         					 else if(dpi==400)
         					 {
         						 scan=6;
         					 }else if(dpi==600)
         					 {
         						 scan=8;
         					 }
        				  }
        			  //===============//===============Scanning quality end=============== 
          			    
                 	 //============================start document_info======================== 
                 	    try (Connection connectdf = StoreDBConnection.openConnection();Statement statedf = connect.createStatement();) {
                			ResultSet resultdf = state.executeQuery("select * from document_info where company_id='"+company_id+"' order by file_no desc limit 1");
                			 if(resultdf.next()) {
                			 
                			     String serial_number=resultdf.getString("file_no");
                			    //start: last six number of file_number 
                			     String file_num="";
                				 for (int i=0 ;i<serial_number.length(); i++) 
                				 {
                             	     
              					   if(i==0||i==1||i==2||i==3||i==4){
              						   
              						   
              					   }
              					   else
              					   {
              						   file_num += serial_number.charAt(i);
              					   }
              				 
              				    }
                			    
                				 String file_number = String.format ("%06d",Integer.parseInt(file_num)+1);
                			   //end: last six number of file_number
                				 Filenumber filenumber1=new Filenumber(id,pickup_date,customer_num,company_name,scan,file_number,"200","success",listdepartment);
                	         	  return filenumber1;    			       
                				 
                			 }
                			 else
                			 {
                				  String serial_number="000000";
                				  Filenumber filenumber1=new Filenumber(id,pickup_date,customer_num,company_name,scan,serial_number,"200","success",listdepartment);
                   	         	  return filenumber1;
                			 }
                		} 	
                 	   catch (SQLException sqlexception) {
           				sqlexception.printStackTrace();
           			   } catch (Exception exception) {
           				exception.printStackTrace();
           			 }
                 	//============================end document_info======================== 
                  
                 	    
                 	    
        			 }
        	    }
		       catch (SQLException sqlexception) {
				sqlexception.printStackTrace();
			 } catch (Exception exception) {
				exception.printStackTrace();
			}
         	 
       //=======================//==============================================  	    
          }
		} catch (SQLException sqlexception) {
			sqlexception.printStackTrace();
		} catch (Exception exception) {
			exception.printStackTrace();
		}
    
	  return null;
   //==========================end generate number============================================  
	 /*  try (Connection connection = StoreDBConnection.openConnection();
				PreparedStatement preparedStatement = connection.prepareStatement("select * from document_info");) {
			ResultSet resultset = preparedStatement.executeQuery();
			while (resultset.next()) {
				
				Filenumber filenumber1=new Filenumber();
				filenumber1.setCode("200");
				filenumber1.setMessage("success");
				filenumber1.setId(resultset.getInt("id"));
				filenumber1.setFilenumber(resultset.getString("file_no"));
				filenumber1.setAttachement(resultset.getString("attachment_no"));
				filenumber1.setShowfile(resultset.getString("file"));
				return filenumber1;		
					
			}

		} catch (SQLException sqlexception) {
			sqlexception.printStackTrace();
		} catch (Exception exception) {
			exception.printStackTrace();
		}
    
	  return null;
    */
  }
  //=========================================//================================================
   public List<Clientcomplain> showcomplain(Clientcomplain clientcomplain){
		  List<Clientcomplain> list = new ArrayList<Clientcomplain>();
	      try (Connection connection = StoreDBConnection.openConnection();
					PreparedStatement preparedStatement = connection.prepareStatement("SELECT  complain_list.area_of_issue , complain_list.complain_id , complain_list.date , complain_list.status FROM complain_list,client_details,customer_details WHERE customer_details.id=client_details.customer_id AND complain_list.customer_id=client_details.customer_id AND complain_list.client_id='"+clientcomplain.getId()+"' group by complain_id");) {

				ResultSet resultset = preparedStatement.executeQuery();
				while (resultset.next()) {
					Clientcomplain clientcomplain1=new Clientcomplain();
					clientcomplain1.setCode("200");
					clientcomplain1.setMessage("success");
					clientcomplain1.setComplain_id(resultset.getString("complain_id"));
					clientcomplain1.setStatus(resultset.getString("status"));
					  final String OLD = "yyyy-MM-dd hh:mm:ss";
        			  final String NEW = "dd MMM yyyy";
        			  SimpleDateFormat simpleDateFormat = new SimpleDateFormat(OLD);
                      Date date = simpleDateFormat.parse(resultset.getString("date"));
                      simpleDateFormat.applyPattern(NEW);
        			String newdate = simpleDateFormat.format(date);
                  	clientcomplain1.setName(newdate);
					list.add(clientcomplain1);
				}

			} catch (SQLException sqlexception) {
				sqlexception.printStackTrace();
			} catch (Exception exception) {
				exception.printStackTrace();
			}
	    
		  return list;
	  
	  }
  //=========================================//================================================= 
   public Clientcomplain clientcomplain(Clientcomplain clientcomplain)
	  {
		    boolean check=false;
		    int rand_integer = ThreadLocalRandom.current().nextInt(100000);
		    String customerid="COM"+rand_integer;
		    try(Connection connection=DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO `complain_list` (`client_id` , `complain_id`, `attachment`, `title`, `area_of_issue`, `documentnumberref`,`category`,`date`,`customer_id`) VALUES (? , ?, ?, ?, ?, ?,?,?,?)");)
		    {
					      preparedStatement.setInt(1, clientcomplain.getId());
					      preparedStatement.setString(2, customerid);
					      preparedStatement.setString(3, clientcomplain.getAttachement());
					      preparedStatement.setString(4, clientcomplain.getTitle());
					      preparedStatement.setString(5, clientcomplain.getDescription());
					      preparedStatement.setString(6, clientcomplain.getDocumentnumberref());
					      preparedStatement.setString(7, clientcomplain.getCategory());
					      Timestamp timestamp = new Timestamp(System.currentTimeMillis());
						  preparedStatement.setTimestamp(8, timestamp);
						  preparedStatement.setString(9, clientcomplain.getCustomer_id());
						  check = preparedStatement.executeUpdate()>0;
						  if(check)
					       {
							   Clientcomplain clientcomplain1 = new Clientcomplain("200","success");
					    	   return clientcomplain1;
					       }
					       else
					       {
					    	   Clientcomplain clientcomplain1 = new Clientcomplain("400","something went wrong");
						       return clientcomplain1;
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
   //=========================================//================================================= 
   public List<Documenttype> documenttype(Documenttype documenttype){
		 
	       List<Documenttype> list = new ArrayList<Documenttype>();
		   if(documenttype.getDepartment().equals("Hr"))
	      {
			   Documenttype documenttype1=new Documenttype("Employee OutBoarding","200","success");
	    	   list.add(documenttype1);
		  
	      }
		   else if(documenttype.getDepartment().equals("Purchase"))
	      {
			   Documenttype documenttype1=new Documenttype("Purchase","200","success");
			   Documenttype documenttype2=new Documenttype("Vendor Registration","200","success");
			   list.add(documenttype2);
			   list.add(documenttype1); 
	      } 
		  else if(documenttype.getDepartment().equals("Sales"))
	      {
			   Documenttype documenttype1=new Documenttype("Customer Registration","200","success");
			   Documenttype documenttype2=new Documenttype("Sales","200","success");
			   list.add(documenttype2); 
			   list.add(documenttype1); 
	      }
		  else if(documenttype.getDepartment().equalsIgnoreCase("Direct Tax"))
	      {
			   Documenttype documenttype1=new Documenttype("Challen","200","success");
			   Documenttype documenttype2=new Documenttype("Tax Audit Report","200","success");
			   Documenttype documenttype3=new Documenttype("Power of Attorney","200","success");
			   Documenttype documenttype4=new Documenttype("Notice","200","success");
			   Documenttype documenttype5=new Documenttype("Submission","200","success");
			   Documenttype documenttype6=new Documenttype("Assessment Order","200","success");
			   Documenttype documenttype7=new Documenttype("Income Tax Return","200","success");
			   Documenttype documenttype8=new Documenttype("Engagement Letter","200","success");
			   list.add(documenttype8);
			   list.add(documenttype7);
			   list.add(documenttype6);
			   list.add(documenttype5);
			   list.add(documenttype4); 
			   list.add(documenttype3); 
			   list.add(documenttype2); 
			   list.add(documenttype1); 
	      }
		  else if(documenttype.getDepartment().equalsIgnoreCase("Statutory Audit"))
	      {
			   Documenttype documenttype1=new Documenttype("Confirmations","200","success");
			   Documenttype documenttype2=new Documenttype("General","200","success");
			   Documenttype documenttype3=new Documenttype("Minutes","200","success");
			   Documenttype documenttype4=new Documenttype("Workpaper","200","success");
			   Documenttype documenttype5=new Documenttype("Financials","200","success");
			   Documenttype documenttype6=new Documenttype("Engegement Letter","200","success");
			   list.add(documenttype6);
			   list.add(documenttype5);
			   list.add(documenttype4); 
			   list.add(documenttype3); 
			   list.add(documenttype2); 
			   list.add(documenttype1); 
	      
	      }
		  else if(documenttype.getDepartment().equalsIgnoreCase("Indirect Tax"))
	      {
			   Documenttype documenttype1=new Documenttype("Challen","200","success");
			   Documenttype documenttype2=new Documenttype("GSTR-1 Returns","200","success");
			   Documenttype documenttype3=new Documenttype("Invoice / Docs - Output","200","success");
			   Documenttype documenttype4=new Documenttype("GSTR-3B Returns","200","success");
			   Documenttype documenttype5=new Documenttype("Input Detail/Docs/Invoices","200","success");
			   Documenttype documenttype6=new Documenttype("E-way Bill","200","success");
			   Documenttype documenttype7=new Documenttype("Refund Forms RFD OS/01A","200","success");
			   Documenttype documenttype8=new Documenttype("Debit / Credit Note","200","success");
			   
			   list.add(documenttype8);
			   list.add(documenttype7);
			   list.add(documenttype6);
			   list.add(documenttype5);
			   list.add(documenttype4); 
			   list.add(documenttype3); 
			   list.add(documenttype2); 
			   list.add(documenttype1); 
	      }
		   
 		 
		  return list;
	   
	  }
   
   //=========================================//===================================================   
   
   public Filenumber createfile(Filenumber filenumber){
		 
	      try (Connection connection1 = StoreDBConnection.openConnection();
	    		  Statement statement1 = connection1.createStatement();) {
	    	      int check1 = statement1.executeUpdate("update `scheduling` set `pickup_date`='"+filenumber.getPickup_date()+"',`mobile`='"+filenumber.getMobile()+"',`images`='"+filenumber.getImages()+"' where id='"+filenumber.getId()+"'");
				  if(check1>0)
				 {
			//================================start select scheduling=============================================================
					  try (Connection connection2 = StoreDBConnection.openConnection();
				    		  Statement statement2 = connection1.createStatement();) {
						      ResultSet resultset2 = statement2.executeQuery("select * from `scheduling` where id='"+filenumber.getId()+"'");
						      if(resultset2.next())
						      {
						   //==================================start document_info=================================================
						    	    String company_id=resultset2.getString("company_id");
						    	    String pickup_date=resultset2.getString("pickup_date");
						    	    String company_name=resultset2.getString("company_name");
						    	    try (Connection connection3= StoreDBConnection.openConnection();
								    		  Statement statement3 = connection1.createStatement();) {
						    	    	      int check2 = statement1.executeUpdate("insert into document_info (file_no,company_id,status,pickup_date) values('"+filenumber.getFilenumber()+"','"+company_id+"','store','"+pickup_date+"')");
						  			          if(check2>0) { 
						    	    	      //========================start location===============================
						    	    	      try (Connection connection4= StoreDBConnection.openConnection();
										    		  Statement statement4 = connection4.createStatement();) {
						    	    	    	      ResultSet resultset4 = statement4.executeQuery("SELECT * FROM customer_location WHERE company_id='"+company_id+"'");
						    	    	    	      if(resultset4.next())
						    	    	    	       {
						    	    	    	    	
						    	    	    	    	 String pickup_frequency=resultset4.getString("pickup_frequency");
						    	    	    	    	 int frequency=Integer.parseInt(pickup_frequency);
						    	    	   				 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
						    	    	   				 Date myDate = formatter.parse(pickup_date);
						    	    	   				 Calendar c = Calendar.getInstance();
						    	    	   				 c.setTime(myDate);
						    	    	   				 c.add(Calendar.DATE, frequency);
						    	    	   				 String update = formatter.format(c.getTime());
						    	    	   			//========================================//======================   	  
										    	    	 try (Connection connection5= StoreDBConnection.openConnection();
													    		  Statement statement5 = connection5.createStatement();) {
											    	    	      int check5 = statement5.executeUpdate("update `scheduling` set `return_date`='"+update+"' where id='"+filenumber.getId()+"'");
											  			          if(check5>0){
											  			       //=========================//===================================   
											  			        	try (Connection connection6= StoreDBConnection.openConnection();
																    		  Statement statement6 = connection6.createStatement();) {
														    	    	      int check6 = statement6.executeUpdate("insert into `scheduling` (company_name,company_id,status,pickup_date) values('"+company_name+"','"+company_id+"','store','"+update+"')");
														  			          if(check6>0) {
														  			          
														  			        	    Filenumber filenumber1=new Filenumber("200","success");
												    	    	    	    	    return filenumber1;
														  			        	  
														  			          
														  			             }
														  			             else
														  			             {
														  			                Filenumber filenumber1=new Filenumber("400","something went wrong");
																    	    	    return filenumber1;  
														  			             }
														  			   }
											  			        //=======================//======================================= 	  
											  			          
											  			          
											  			          }
											  			   }
										    	    	 
						    	                  //========================================//========================
						    	    	   		  	 
						    	    	    	    	   
						    	    	    	       }
						    	    	    	       else
						    	    	    	       {
						    	    	    	    	   Filenumber filenumber1=new Filenumber("400","something went wrong");
										    	    	   return filenumber1;    	    	    	    	   
						    	    	    	       }
						    	    	      }
						    	    	    //=========================end location================================  
						  			      }
						  			      else
						  			      {
						  		    	    	   Filenumber filenumber1=new Filenumber("400","something went wrong");
								    	    	   return filenumber1;
							   
						  			      }
						    	        
						    	    }
						   //==================================end document_info================================================= 	  
						      }
						      else
						      {
				    	    	   Filenumber filenumber1=new Filenumber("400","something went wrong");
				    	    	   return filenumber1;
			 
						      }
						    	  
			
					  } 
			//================================end select scheduling=============================================================
				 }
				 else
				 {
	    	    	   Filenumber filenumber1=new Filenumber("400","something went wrong");
	    	    	   return filenumber1;
 
				 }
					 
	   	     } catch (SQLException sqlexception) {
				sqlexception.printStackTrace();
			} catch (Exception exception) {
				exception.printStackTrace();
			}
	    
		  return null;
	  
	  }

  //=========================================//===================================================   
   //start customer details
 		public List<Todaypickup> returntodaydocument(Todaypickup today) {

 			List<Todaypickup> list = new ArrayList<Todaypickup>();

 			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDateTime now = LocalDateTime.now();
			
			try (Connection connection = StoreDBConnection.openConnection();
					PreparedStatement preparedStatement = connection.prepareStatement(
							"SELECT * FROM `scheduling` where `return_date`='" + dtf.format(now) + "'");) {

				ResultSet resultset = preparedStatement.executeQuery();
				while (resultset.next()) {

					Todaypickup todaypickup=new Todaypickup();
					todaypickup.setId(resultset.getInt("id"));
					todaypickup.setReturn_date(resultset.getString("return_date"));
			        todaypickup.setCompany_name(resultset.getString("company_name"));
					todaypickup.setCode("200");
					todaypickup.setMessage("success");
					todaypickup.setCompany_id(resultset.getString("company_id"));
					list.add(todaypickup);
				
				}
	
		
			} catch (SQLException sqlexception) {
				sqlexception.printStackTrace();
			} catch (Exception exception) {
				exception.printStackTrace();
			}

			return list;
 		}
  //================================//=====================================================================
 		public List<Previouspickup> returntomorrowpickup(){
			// Current date
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDateTime now = LocalDateTime.now();
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date myDate = null;
			try {
				myDate = formatter.parse(dtf.format(now));
			} catch (ParseException parseException) {
				parseException.getMessage();
			}
			Calendar c = Calendar.getInstance();
			c.setTime(myDate);
			c.add(Calendar.DATE,1);
			String previous = formatter.format(c.getTime());
			List<Previouspickup> list = new ArrayList<Previouspickup>();
			try (Connection connection = StoreDBConnection.openConnection();
					PreparedStatement preparedStatement = connection
							.prepareStatement("SELECT * FROM `scheduling` where `return_date`='" + previous + "'");) {

				ResultSet resultset = preparedStatement.executeQuery();
				while (resultset.next()) {
				
					Previouspickup previouspickup=new Previouspickup();
					previouspickup.setId(resultset.getInt("id"));
					previouspickup.setCode("200");
					previouspickup.setMessage("success");
					previouspickup.setCompany_id(resultset.getString("company_id"));
					previouspickup.setReturn_date(resultset.getString("return_date"));
					previouspickup.setCompany_name(resultset.getString("company_name"));
					list.add(previouspickup);
				
				}

			} catch (SQLException sqlexception) {
				sqlexception.printStackTrace();
			} catch (Exception exception) {
				exception.printStackTrace();
			}

			return list;
		}

 		
  //===============================//======================================================================
		  public Filenumber returndetail(Filenumber filenumber){

			  try (Connection connection = StoreDBConnection.openConnection();
						PreparedStatement preparedStatement = connection.prepareStatement("update `scheduling` set return_to=?,return_contact=?,return_images=? where id='"+filenumber.getId()+"'");) {

				     preparedStatement.setString(1, filenumber.getReturn_no());
				     preparedStatement.setString(2,filenumber.getReturn_contact());
				     preparedStatement.setString(3, filenumber.getReturn_images());
				     int check = preparedStatement.executeUpdate();
					 if(check>0) {
						

		    	    	   Filenumber filenumber1=new Filenumber("200","success");
		    	    	   return filenumber1;
	 
					 	
					}
					 else
					{
						   Filenumber filenumber1=new Filenumber("400","something went wrong");
		    	    	   return filenumber1;
	 	
					}

				} catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
				} catch (Exception exception) {
					exception.printStackTrace();
				}

			  return null;
		  
		  }
 
 //==============================//========================================================================	
		  
  public List<Filenumber> clientdocument(Filenumber filenumber){
	          List<Filenumber> list = new ArrayList<Filenumber>();
			  try (Connection connection= StoreDBConnection.openConnection();
		    		  Statement statement = connection.createStatement();) {
				    
					ResultSet resultset = statement.executeQuery("select * from client_details where id="+filenumber.getId()+"");
					if(resultset.next()) {
						  String department=resultset.getString("department");
						  
						  
						  String customer_id=resultset.getString("customer_id");
						  String array[]=department.split(",");
                         
						  for(int j=0;j<array.length;j++){
							  
						  try(Statement statement1 = connection.createStatement();){
						   ResultSet result = statement1.executeQuery("select * from document_info where department='"+array[j]+"' and company_id='"+customer_id+"' group by document_no");
							  
						   while(result.next())
						   {
							    Filenumber filenumber1=new Filenumber();
								filenumber1.setCode("200");
								filenumber1.setMessage("success");
								filenumber1.setId(result.getInt("id"));
								//filenumber1.setFilenumber(result.getString("file_no"));
								filenumber1.setDocument_no(result.getString("document_no"));
								//filenumber1.setShowfile(result.getString("file"));
								filenumber1.setStar(result.getString("star"));
								list.add(filenumber1);
								
						   }
						  
						 
						  }
						
						 
						}
						  return list;
					 	
					}

				} catch (SQLException sqlexception) {
					sqlexception.printStackTrace();
				} catch (Exception exception) {
					exception.printStackTrace();
				}
		    
			  return null;
		  
		  }

 //=====================================//==================================================================  		
  public Filenumber returndate(Filenumber filenumber){
      

	   try (Connection connection = StoreDBConnection.openConnection();
				PreparedStatement preparedStatement = connection.prepareStatement("select * from `scheduling` where company_id='"+filenumber.getId()+"'");) {

			ResultSet resultset = preparedStatement.executeQuery();
			if(resultset.next()) {
				
				Filenumber filenumber1=new Filenumber();
				filenumber1.setId(resultset.getInt("id"));
				filenumber1.setReturn_date(resultset.getString("return_date"));
				filenumber1.setMobile(resultset.getString("mobile"));
				filenumber1.setImages(resultset.getString("images"));
				filenumber1.setCode("200");
				filenumber1.setMessage("success");
				return filenumber1;
			 	
			}

		} catch (SQLException sqlexception) {
			sqlexception.printStackTrace();
		} catch (Exception exception) {
			exception.printStackTrace();
		}
    
	  return null;
  
  }

   //=====================================//==================================================================  		
  public List<Filenumber> fetchdocumentfileter(Filenumber filenumber){
	 
	  
	   //==================//================================================================================
	  List<Filenumber> list = new ArrayList<Filenumber>();
	  String query="";
	  
	  if(filenumber.getDepartment().equals("Hr")&&filenumber.getDocumenttype().equals("Employee OutBoarding"))
	  {  
		    String employee_code="";
		    if(filenumber.getEmployee_code()==null)
		    {
		    	employee_code="";
		    }
		    else
		    {
		    	employee_code=filenumber.getEmployee_code();
		    }
		    
		    String employee_name="";
		    if(filenumber.getEmployee_name()==null)
		    {
		    	employee_name="";
		    }
		    else
		    {
		    	employee_name=filenumber.getEmployee_name();
		    }
		    
		    String data_of_joining="";
		    if(filenumber.getDataofjoining()==null)
		    {
		    	data_of_joining="";
		    }
		    else
		    {
		    	data_of_joining=filenumber.getDataofjoining();
		    }
		    
		    
		    query="SELECT * FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND client_details.id ='"+filenumber.getId()+"'  AND  document_info.document_type LIKE '%"+filenumber.getDocumenttype()+"%' AND upper(document_info.employee_code) LIKE '%"+employee_code+"%' AND upper(document_info.employee_name) LIKE '%"+employee_name+"%' AND upper(document_info.date_of_joining) LIKE '%"+data_of_joining+"%' AND status='quality_approved' group by document_info.document_no";
	  }
	  else if(filenumber.getDepartment().equals("Purchase")&&filenumber.getDocumenttype().equals("Purchase"))
	  {
		    String invoice_date="";
		    if(filenumber.getInvoice_date()==null)
		    {
		    	invoice_date="";
		    }
		    else
		    {
		    	invoice_date=filenumber.getInvoice_date();
		    }
		    
		    String vendor_code="";
		    if(filenumber.getVendor_code()==null)
		    {
		    	vendor_code="";
		    }
		    else
		    {
		    	vendor_code=filenumber.getVendor_code();
		    }
		    
		    String invoice_number="";
		    if(filenumber.getInvoice_number()==null)
		    {
		    	invoice_number="";
		    }
		    else
		    {
		    	invoice_number=filenumber.getInvoice_number();
		    }
		    
		    String vendor_name="";
		    if(filenumber.getVendor_name()==null)
		    {
		    	vendor_name="";
		    }
		    else
		    {
		    	vendor_name=filenumber.getVendor_name();
		    }
		    
		    
		    
		    query="SELECT * FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND client_details.id ='"+filenumber.getId()+"'  AND  document_info.document_type LIKE '%"+filenumber.getDocumenttype()+"%' AND document_info.invoice_date like '%"+invoice_date+"%' AND  upper(document_info.invoice_number) LIKE '%"+invoice_number+"%' AND  upper(document_info.vendor_code) LIKE '%"+vendor_code+"%' AND upper(document_info.vendor_name) LIKE '%"+vendor_name+"%' AND status='quality_approved' group by document_info.document_no";
	  }
	  else if(filenumber.getDepartment().equals("Purchase")&&filenumber.getDocumenttype().equals("Vendor Registration"))
	  {
		  
		  
		    String vendor_code="";
		    if(filenumber.getVendor_code()==null)
		    {
		    	vendor_code="";
		    }
		    else
		    {
		    	vendor_code=filenumber.getVendor_code();
		    }
		    
		    String vendor_name="";
		    if(filenumber.getVendor_name()==null)
		    {
		    	vendor_name="";
		    }
		    else
		    {
		    	vendor_name=filenumber.getVendor_name();
		    }
		    query="SELECT * FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND client_details.id ='"+filenumber.getId()+"'  AND  document_info.document_type LIKE '%"+filenumber.getDocumenttype()+"%' AND upper(document_info.vendor_code) LIKE '%"+vendor_code+"%' AND  upper(document_info.vendor_name) LIKE '%"+vendor_name+"%' AND status='quality_approved' group by document_info.document_no";
	  }
	  else if(filenumber.getDepartment().equals("Sales")&&filenumber.getDocumenttype().equals("Customer Registration"))
	  {
		    String customer_name="";
		    if(filenumber.getCustomer_name()==null)
		    {
		    	customer_name="";
		    }
		    else
		    {
		    	customer_name=filenumber.getCustomer_name();
		    }
		    String customer_code="";
		    if(filenumber.getCustomer_code()==null)
		    {
		    	customer_code="";
		    }
		    else
		    {
		    	customer_code=filenumber.getCustomer_code();
		    }
		    query="SELECT * FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND client_details.id ='"+filenumber.getId()+"'  AND document_info.document_type LIKE '%"+filenumber.getDocumenttype()+"%' AND upper(document_info.customer_code) LIKE '%"+customer_code+"%' AND upper(document_info.customer_name) LIKE '%"+customer_name+"%' AND status='quality_approved' group by document_info.document_no";
	  }
	  else if(filenumber.getDepartment().equals("Sales")&&filenumber.getDocumenttype().equals("Sales"))
	  {
		    String customer_name="";
		    if(filenumber.getCustomer_name()==null)
		    {
		    	customer_name="";
		    }
		    else
		    {
		    	customer_name=filenumber.getCustomer_name();
		    }
		    
		    String customer_code="";
		    if(filenumber.getCustomer_code()==null)
		    {
		    	customer_code="";
		    }
		    else
		    {
		    	customer_code=filenumber.getCustomer_code();
		    }
		   
		    
		    String invoice_date="";
		    if(filenumber.getInvoice_date()==null)
		    {
		        invoice_date="";
		    }
		    else
		    {
		    	invoice_date=filenumber.getInvoice_date();
		    }
		   
		    String invoice_number="";
		    if(filenumber.getInvoice_number()==null)
		    {
		    	invoice_number="";
		    }
		    else
		    {
		    	invoice_number=filenumber.getInvoice_number();
		    }
		    query="SELECT * FROM `document_info`, client_details WHERE client_details.customer_id = document_info.company_id AND client_details.id ='"+filenumber.getId()+"'  AND document_info.document_type LIKE '%"+filenumber.getDocumenttype()+"%' AND upper(document_info.customer_code) LIKE '%"+customer_code+"%' AND upper(document_info.customer_name) LIKE '%"+customer_name+"%' AND upper(document_info.invoice_date) like '%"+invoice_date+"%' AND  upper(document_info.invoice_number) LIKE '%"+invoice_number+"%' AND status='quality_approved' group by document_info.document_no";
	  }
	  try (Connection connection = StoreDBConnection.openConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query);) {

			ResultSet result = preparedStatement.executeQuery();
			while (result.next()) {
				
				Filenumber filenumber1=new Filenumber();
				filenumber1.setMessage("success");
				filenumber1.setId(result.getInt("document_info.id"));
				filenumber1.setFilenumber(result.getString("file_no"));
				filenumber1.setDocument_no(result.getString("document_no"));
				filenumber1.setStar(result.getString("star"));
				list.add(filenumber1);
			}

		} catch (SQLException sqlexception) {
			sqlexception.printStackTrace();
		} catch (Exception exception) {
			exception.printStackTrace();
		}
    
	  return list;
  
   }
  
  //=========Number of attachment============================
   public List<Filenumber> attachmentnumber(Filenumber filenumber){
	  
	
	  List<Filenumber> list = new ArrayList<Filenumber>();
      try (Connection connection = StoreDBConnection.openConnection();
				PreparedStatement preparedStatement = connection.prepareStatement("select  df.file_no , df.upload_date , df.document_no , df.document_type,df.department,df.invoice_date,df.invoice_number,df.vendor_code,df.vendor_name,df.date_of_joining,df.employee_name,df.employee_code,df.customer_name,df.customer_code,df.file,df.attachment_no,df.file_no,df.id from client_details as ccd,document_info as df where ccd.customer_id=df.company_id and df.document_no='"+filenumber.getDocument_no()+"' and ccd.id='"+filenumber.getId()+"'");) {

			ResultSet resultset = preparedStatement.executeQuery();
			while (resultset.next()) {
				
				Filenumber filenumber1=new Filenumber();
				filenumber1.setCode("200");
				filenumber1.setMessage("success");
				filenumber1.setId(resultset.getInt("id"));
				
				 String filename=resultset.getString("file");
                 File file = new File(filename); 
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
 		        filenumber1.setAttachement(file_name);
				filenumber1.setShowfile(resultset.getString("file"));
				filenumber1.setCustomer_code(resultset.getString("customer_code"));
				filenumber1.setCustomer_name(resultset.getString("customer_name"));
				filenumber1.setEmployee_code(resultset.getString("employee_code"));
				filenumber1.setEmployee_name(resultset.getString("employee_name"));
                 final String OLD_FORMAT = "yyyy-MM-dd";
    			 final String NEW_FORMAT = "dd MMM yyyy";
    			 SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
    			 Date d = sdf.parse(resultset.getString("date_of_joining"));
    			 sdf.applyPattern(NEW_FORMAT);
    			 String dateofjoining = sdf.format(d);
				 filenumber1.setDataofjoining(dateofjoining);
				 final String OLD_FORMAT2 = "yyyy-MM-dd";
	    		 final String NEW_FORMAT2 = "dd MMM yyyy";
	    		 SimpleDateFormat sdf2 = new SimpleDateFormat(OLD_FORMAT2);
	    		 Date d2 = sdf2.parse(resultset.getString("invoice_date"));
	    		 sdf2.applyPattern(NEW_FORMAT2);
	    		 String invoice_date = sdf.format(d2);
				 filenumber1.setInvoice_date(invoice_date);
				filenumber1.setInvoice_number(resultset.getString("invoice_number"));
				filenumber1.setVendor_code(resultset.getString("vendor_code"));
				filenumber1.setVendor_name(resultset.getString("vendor_name"));
				filenumber1.setDepartment(resultset.getString("department"));
				filenumber1.setDocumenttype(resultset.getString("document_type"));
				filenumber1.setFilenumber(resultset.getString("file_no"));
				
				final String OLD_FORMAT1 = "yyyy-MM-dd hh:mm:ss";
    			final String NEW_FORMAT1 = "dd MMM yyyy";
    			SimpleDateFormat sdf1 = new SimpleDateFormat(OLD_FORMAT1);
    			Date d1 = sdf1.parse(resultset.getString("upload_date"));
    			sdf1.applyPattern(NEW_FORMAT1);
    			String newDateString = sdf1.format(d1);
				
    			filenumber1.setUpload_date(newDateString);
				filenumber1.setDocument_no(resultset.getString("document_no"));
				list.add(filenumber1);
					
			}

		} catch (SQLException sqlexception) {
			sqlexception.printStackTrace();
		} catch (Exception exception) {
			exception.printStackTrace();
		}
    
	  return list;
    }

  
   
   public List<Todaypickup> returntodaypickup() {
	
		List<Todaypickup> list = new ArrayList<Todaypickup>();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDateTime now = LocalDateTime.now();

		try (Connection connection = StoreDBConnection.openConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(
						"SELECT * FROM `scheduling` where `return_date`='" + dtf.format(now) + "' and flag='1'");) {

			ResultSet resultset = preparedStatement.executeQuery();
			while (resultset.next()) {

				Todaypickup todaypickup=new Todaypickup();
				todaypickup.setId(resultset.getInt("id"));
				

                final String OLD_FORMAT = "yyyy-MM-dd";
    			final String NEW_FORMAT = "dd MMM yyyy";
    			SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
    			Date d = sdf.parse(resultset.getString("return_date"));
    			sdf.applyPattern(NEW_FORMAT);
    			String return_date = sdf.format(d);
				todaypickup.setReturn_date(return_date);
				todaypickup.setCompany_name(resultset.getString("company_name"));
				todaypickup.setCode("200");
				todaypickup.setMessage("success");
				todaypickup.setCompany_id(resultset.getString("company_id"));
				list.add(todaypickup);
			
			}

		} catch (SQLException sqlexception) {
			sqlexception.printStackTrace();
		} catch (Exception exception) {
			exception.printStackTrace();
		}

		return list;
	}

   
   public Filenumber unstarfile(Filenumber filenumber){
		  
		  try(Connection connection = StoreDBConnection.openConnection();
					PreparedStatement preparedStatement = connection.prepareStatement("update `document_info` set star=0 where document_no='"+filenumber.getDocument_no()+"'");) {
	           
	    	   boolean check = preparedStatement.executeUpdate()>0;
		       if(check)
		       {
		    	   Filenumber filenumber1 = new Filenumber("200","success");
		    	   return filenumber1;
		       }
		       else
		       {
		    	   Filenumber filenumber1 = new Filenumber("400","something went wrong");
			       return filenumber1;
		       }
			
		  } catch (SQLException sqlexception) {
				sqlexception.printStackTrace();
			} catch (Exception exception) {
				exception.printStackTrace();
			}
	    
		  return null;
	  
	  }

   

   public HitDocument hitdocument(HitDocument hitdocument){
		  
		  try(Connection connection = StoreDBConnection.openConnection();
					PreparedStatement preparedStatement = connection.prepareStatement("UPDATE `document_info` SET hit=hit+1 where id='"+hitdocument.getDocumentinfo_id()+"'");) {
	           
	    	   boolean check = preparedStatement.executeUpdate()>0;
		       if(check)
		       {
		    	   HitDocument hitDocument1 = new HitDocument("200","success");
		    	   return hitDocument1;
		       }
		       else
		       {
		    	   HitDocument hitDocument1 = new HitDocument("400","something went wrong");
		    	   return hitDocument1;
		        
		       }
			
		  } catch (SQLException sqlexception) {
				sqlexception.printStackTrace();
			} catch (Exception exception) {
				exception.printStackTrace();
			}
	    
		  return null;
	  
	  }

    
   
 }

