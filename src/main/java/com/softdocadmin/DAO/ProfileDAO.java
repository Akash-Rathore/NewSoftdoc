package com.softdocadmin.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

import com.softdocadmin.email.Logfile;
import com.softdocadmin.modal.ComplainList;
import com.softdocadmin.modal.LocationCustomer;
import com.softdocadmin.modal.Uploadingbill;
import com.softdocadmin.modal.UserProfile;
import com.softdocadmin.modal.Usercustomer;
import com.superadmin.loginfile.SuperLogfile;
import com.customeradmin.connection.DBConnection;
import com.customerclientModal.ViewDocument;
import com.softdocadmin.connection.StoreDBConnection;

public class ProfileDAO {

	Connection connection = null;

	public ProfileDAO() {
		connection = DBConnection.openConnection();
	}

	public int updateprofile(UserProfile user) {
		int rowUpdated = 0;
		String email = user.getEmail();

		try (Connection connection = DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement(
				"UPDATE `softdoc_staff` SET `username`=?,`password`=?,`name`=?,`designation`=?,`mobile`=?,`location`=? WHERE `id`='"
						+ user.getId() + "' and `role`='admin'");) {

			preparedStatement.setString(1, user.getUsername());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.setString(3, user.getName());
			preparedStatement.setString(4, user.getDesignation());
			preparedStatement.setLong(5, user.getMobile());
			preparedStatement.setString(6, user.getLocation());
			rowUpdated = preparedStatement.executeUpdate();

			// This is for logfile
			if (rowUpdated > 0) {
				new Logfile().logfile(email, "softdocadmin has been update profile", user.getId(), "admin");
			}

		} catch (SQLException sqlexception) {
			sqlexception.getMessage();
		} catch (Exception exception) {
			exception.printStackTrace();
		}

		return rowUpdated;
	}

	public int customerinsert(Usercustomer usercustomer) {

		String companyadmincode="";
		
	       try(Connection connection=StoreDBConnection.openConnection(); PreparedStatement  preparedStatement=connection.prepareStatement("select * from customer_details ORDER BY id DESC LIMIT 1");)
           { ResultSet resultset=preparedStatement.executeQuery();
               if(resultset.next())
               {
   
                         String clientnumber = String.format ("%04d",resultset.getInt("id")+1);  
                         String companyname =usercustomer.getCompany_name();
                 	     String company="";
                 	     for (int i = 0; i <= 3; i++) {
                 	    	   
                 	    	 company += companyname.charAt(i);
                		 
                 	     }
                 	     companyadmincode=company.toUpperCase()+"CA"+clientnumber;
                
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
		
		int inseruser = 0;
		Random random = new Random();
		int password = random.nextInt(100000000);

		//, servicetype , storagedata , noofusers , planstardate , planenddate
		
		try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection.prepareStatement(
				"INSERT INTO `customer_details` (`customer_number`, `company_name`, `billing_address_first`, `billing_address_sec`, `city`, `state`, `pincode`, `company_pan`, `gstin`, `tan`, `type`, `industry`, `company_per_name`, `company_per_designation`, `company_per_email`, `mobile`, `depart_info`, `dpi`, `colour`, `gst_certificate`, `pan`, `tan_att`, `signed_contract`, `questionnaire`, `others`,`date`,`password`,`joining_date`,`customeradmincode`,`pan_text`, servicetype , storagedata , noofusers , planstardate , planenddate) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ?);");) {

			preparedStatement.setString(1, usercustomer.getCustomer_number());
			preparedStatement.setString(2, usercustomer.getCompany_name());
			preparedStatement.setString(3, usercustomer.getBilling_address_first());
			preparedStatement.setString(4, usercustomer.getBilling_address_sec());
			preparedStatement.setString(5, usercustomer.getCity());
			preparedStatement.setString(6, usercustomer.getState());
			preparedStatement.setInt(7, usercustomer.getPincode());
			preparedStatement.setString(8, usercustomer.getCompany_pan());
			preparedStatement.setString(9, usercustomer.getGstin());
			preparedStatement.setString(10, usercustomer.getTan());
			preparedStatement.setString(11, usercustomer.getType());
			preparedStatement.setString(12, usercustomer.getIndustry());
			preparedStatement.setString(13, usercustomer.getCompany_per_name());
			preparedStatement.setString(14, usercustomer.getCompany_per_designation());
			preparedStatement.setString(15, usercustomer.getCompany_per_email());
			preparedStatement.setLong(16, usercustomer.getMobile());
			preparedStatement.setString(17, usercustomer.getDepart_info());
			preparedStatement.setInt(18, usercustomer.getDpi());
			preparedStatement.setString(19, usercustomer.getColour());
			// file store
			preparedStatement.setString(20, usercustomer.getGst_certificate());
			preparedStatement.setString(21, usercustomer.getPan());
			preparedStatement.setString(22, usercustomer.getTan_att());
			preparedStatement.setString(23, usercustomer.getSigned_contract());
			preparedStatement.setString(24, usercustomer.getQuestionnaire());
			preparedStatement.setString(25, usercustomer.getOthers());
			// datetime
			long timeNow = Calendar.getInstance().getTimeInMillis();
			java.sql.Timestamp ts = new java.sql.Timestamp(timeNow);
			preparedStatement.setTimestamp(26, ts);
			preparedStatement.setInt(27, password);
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDateTime now = LocalDateTime.now();
			preparedStatement.setString(28, dtf.format(now));
		    preparedStatement.setString(29,companyadmincode);
		    preparedStatement.setString(30,usercustomer.getPan_text());
		    preparedStatement.setString(31,usercustomer.getServiceType());
			preparedStatement.setString(32,usercustomer.getStorageData());
			preparedStatement.setString(33,usercustomer.getNoOfUsers());
			preparedStatement.setString(34,usercustomer.getPlanStarDate());
			preparedStatement.setString(35,usercustomer.getPlanEndDate());
			
			
			inseruser = preparedStatement.executeUpdate();
			System.out.println(inseruser);
			// This is for logfile
			if (inseruser > 0) {

				// Email sending and receving
				new com.softdocadmin.email.EmailClient().email("Your Softdoc Admin account is ready!",
						"<br> Hello "+ usercustomer.getCompany_per_name() +",<br>"
								+ "Your Softdoc Admin account has been created. Please make a note of your Login ID and password below: <br>"
								+ "Login -"+usercustomer.getCompany_per_email()+"<br>"
								+ "Password -"+password+"<br><br>"
								+ "*It is highly recommended that you change your password immediately on first login to protect your data \r\n" 
								+ "and privacy. Please do not share your password with anybody.* <br>"
								+ "You can access your account by clicking on the following link: <br>"
								+ "https://softdoc-262410.appspot.com/customer/ <br>"
								+ "Feel free to reach out to us at  info@softdoc.co.in for any queries/clarifications.<br>"
								+ "Welcome to the Softdoc Family! <br>"
								+ "Regards,<br>"
								+ "Team Softdoc <br><br>"
								+ "*This is a system generated email. Please do not reply to this email.* <br>",
						usercustomer.getCompany_per_email());

				// logfile
				new Logfile().logfile(usercustomer.getEmail(), "has been create customer", usercustomer.getId(),
						"admin");

				 try(PreparedStatement preparedStat = connection
						.prepareStatement("INSERT INTO `sequence`(`id`) VALUES (?)");) {
					  preparedStat.setInt(1,usercustomer.getPincode());
					  boolean serial=preparedStat.executeUpdate()>0;
				}
				catch(Exception exception)
				{
					exception.printStackTrace();
				}
				
			}

		} catch (SQLException sqlexception) {
			sqlexception.getMessage();
		} catch (Exception p) {
			p.printStackTrace();
		}

		return inseruser;
	}

	// delete customer details
	public boolean customerdelete(Usercustomer usercustomer) {

		boolean check = false;
		int id=usercustomer.getId();
		try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
				.prepareStatement("UPDATE `customer_details` SET `flag`=?,`leaving_date`=? where id='"+id+"'");) {

			preparedStatement.setInt(1,1);
			long timeNow = Calendar.getInstance().getTimeInMillis();
			java.sql.Timestamp ts = new java.sql.Timestamp(timeNow);
			preparedStatement.setTimestamp(2, ts);
			
			check = preparedStatement.executeUpdate() > 0;
            
			// This is for logfile
			if (check) {
				new Logfile().logfile(usercustomer.getEmail(), "Has been delete customer", usercustomer.getIdsession(),
						"admin");
			}

		} catch (SQLException sqlexception) {
			sqlexception.printStackTrace();
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return check;

	}

	// update customer details
	public boolean customerupdate(Usercustomer usercustomer) {

		 boolean check = false;
	     int id = usercustomer.getId();
	     
	     String gst_certificate=usercustomer.getGst_certificate();
	     String pan=usercustomer.getPan();
         String tan_att=usercustomer.getTan_att();
         String signed_contract=usercustomer.getSigned_contract();
         String questionnaire=usercustomer.getQuestionnaire();
         String others=usercustomer.getOthers();        
         
	     try(Connection connection=DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("select * from customer_details where id='"+id+"'");)
		  {
    		   ResultSet resultSet=preparedStatement.executeQuery(); 
		       resultSet.next();
    		  
		       if(usercustomer.getGst_certificate().equals(""))
    		   {
    			   gst_certificate=resultSet.getString("gst_certificate"); 
    		   }
    		   
    		   if(usercustomer.getPan().equals(""))
    		   {
    			   pan=resultSet.getString("pan");   
    		   }
    		   
    		   if(usercustomer.getTan_att().equals(""))
    		   {
    			   tan_att=resultSet.getString("tan_att");
    		   }
    		   
    		   if(usercustomer.getSigned_contract().equals(""))
    		   {
    			   signed_contract=resultSet.getString("signed_contract");
    		   }
    		   
    		   if(usercustomer.getQuestionnaire().equals(""))
    		   {
    			   questionnaire=resultSet.getString("questionnaire");
    		   }
    		   
    		   if(usercustomer.getOthers().equals(""))
    		   {
    			   others=resultSet.getString("others");
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
		
		
		try (Connection connection = DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement(
				"UPDATE `customer_details` SET `customer_number` =?, `company_name` = ?, `billing_address_first` = ?, `billing_address_sec` = ?, `city` = ?, `state` = ?, `pincode` = ?, `company_pan` = ?, `gstin` = ?, `tan` = ?, `type` = ?, `industry` = ?, `company_per_name` = ?, `company_per_designation` = ?, `company_per_email` = ?, `mobile`=?,`depart_info`=?,`dpi`=?,`colour`=?,`gst_certificate`=?,`pan`=?,`tan_att`=?,`signed_contract`=?,`questionnaire`=?,`others`=?,`modify`=?,`pan_text`=? , servicetype = ? , storagedata = ? , noofusers= ? , planstardate= ? , planenddate= ? WHERE `id`='"
						+ id + "'");) {

			preparedStatement.setString(1, usercustomer.getCustomer_number());
			preparedStatement.setString(2, usercustomer.getCompany_name());
			preparedStatement.setString(3, usercustomer.getBilling_address_first());
			preparedStatement.setString(4, usercustomer.getBilling_address_sec());
			preparedStatement.setString(5, usercustomer.getCity());
			preparedStatement.setString(6, usercustomer.getState());
			preparedStatement.setInt(7, usercustomer.getPincode());
			preparedStatement.setString(8, usercustomer.getCompany_pan());
			preparedStatement.setString(9, usercustomer.getGstin());
			preparedStatement.setString(10, usercustomer.getTan());
			preparedStatement.setString(11, usercustomer.getType());
			preparedStatement.setString(12, usercustomer.getIndustry());
			preparedStatement.setString(13, usercustomer.getCompany_per_name());
			preparedStatement.setString(14, usercustomer.getCompany_per_designation());
			preparedStatement.setString(15, usercustomer.getCompany_per_email());
			preparedStatement.setLong(16, usercustomer.getMobile());
			preparedStatement.setString(17, usercustomer.getDepart_info());
			preparedStatement.setInt(18, usercustomer.getDpi());
			preparedStatement.setString(19, usercustomer.getColour());
			preparedStatement.setString(20, gst_certificate);
			preparedStatement.setString(21, pan);
			preparedStatement.setString(22, tan_att);
			preparedStatement.setString(23, signed_contract);
			preparedStatement.setString(24, questionnaire);
			preparedStatement.setString(25, others);
			long timeNow = Calendar.getInstance().getTimeInMillis();
			java.sql.Timestamp ts = new java.sql.Timestamp(timeNow);
			preparedStatement.setTimestamp(26, ts);
			preparedStatement.setString(27, usercustomer.getPan_text());
			preparedStatement.setString(28,usercustomer.getServiceType());
			System.out.println(usercustomer.getStorageData()+"kljlkjlkj");
		    preparedStatement.setString(29,usercustomer.getStorageData());
			preparedStatement.setString(30,usercustomer.getNoOfUsers());
			preparedStatement.setString(31,usercustomer.getPlanStarDate());
			preparedStatement.setString(32,usercustomer.getPlanEndDate());
			check = preparedStatement.executeUpdate() > 0;

			// logfile
			if (check) {
				new Logfile().logfile(usercustomer.getEmail(), "Has been update customer", usercustomer.getIdsession(),
						"admin");
			}

		} catch (SQLException sqlexception) {

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return check;

	}

	// create of Subadmin
	public boolean subadmine(UserProfile userprofile) {
		Random random = new Random();
		int password = random.nextInt(100000000);
		boolean check = false;
		try (Connection connection = DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement(
				"INSERT INTO softdoc_staff(softdoc_no,employee_id,NAME,email,mobile,joining_date,activation_date,designation,department,ROLE,password)VALUES(?,?,?,?,?,?,?,?,?,?,?);")) {

			preparedStatement.setString(1, userprofile.getSoftdocno());
			preparedStatement.setString(2, userprofile.getEmployeeid());
			preparedStatement.setString(3, userprofile.getName());
			preparedStatement.setString(4, userprofile.getEmail());
			preparedStatement.setLong(5, userprofile.getMobile());

			final String OLD_FORMAT = "yyyy-MM-dd";
			final String NEW_FORMAT = "dd MMM yyyy";
			SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
			Date d = sdf.parse(userprofile.getJoiningdate());
			sdf.applyPattern(NEW_FORMAT);
			String newDateString = sdf.format(d);
			preparedStatement.setString(6, newDateString);
	        
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd MMM yyyy");
			String date = simpleDateFormat.format(new Date()); 
			preparedStatement.setString(7,date);
			preparedStatement.setString(8, userprofile.getDesignation());
			preparedStatement.setString(9, userprofile.getDepartment());
			preparedStatement.setString(10, userprofile.getRole());
			preparedStatement.setInt(11, password);
			check = preparedStatement.executeUpdate() > 0;

			if (check) {
				// Email sending and receving
				
                 				
				 if(userprofile.getRole().equals("store")) {  
				   new com.softdocadmin.email.EmailClient().email(
						"Your Softdoc account is ready!", "<br> Hello "+ userprofile.getName() +"<br>"
								+ "Your Softdoc account has been created. Please make a note of your Login ID and password below: <br>"
								+  "Login -"+userprofile.getEmail()+"<br>"
	 				           	+  "Password -"+password+"<br>"
	 				            +  "*It is highly recommended that you change your password immediately on first login to protect your data \r\n" + 
	 				           	   "and privacy. Please do not share your password with anybody.* <br>"
	 				            +  "You can access your account by clicking on the following link: <br>"
	 				            +  "https://softdoc-262410.appspot.com/subadminstore/index.jsp <br>"
	 				            +  "You can download our App for Android by clicking on the following link: <br>"
	 				            +  "https://drive.google.com/open?id=18ZjTmTNk76islyG22gXbAb5o11IF73OB <br>"  
	 				            +  "Welcome to the Softdoc Family! <br>"	  
 				           		+  "Regards,<br>"
				           	    +  "Team Softdoc<br><br>"
				           	    +  "Welcome to the softdoc Family !<br>"
				           		,userprofile.getEmail());
				     }else if(userprofile.getRole().equals("indexing")) {
				    	 
				    	 new com.softdocadmin.email.EmailClient().email(
									"Your Softdoc account is ready!", "<br> Hello "+ userprofile.getName() +"<br>"
											+ "Your Softdoc account has been created. Please make a note of your Login ID and password below: <br>"
											+  "Login -"+userprofile.getEmail()+"<br>"
				 				           	+  "Password -"+password+"<br>"
				 				            +  "*It is highly recommended that you change your password immediately on first login to protect your data \r\n" + 
				 				           	   "and privacy. Please do not share your password with anybody.* <br>"
				 				            +  "You can access your account by clicking on the following link: <br>"
				 				            +  "https://softdoc-262410.appspot.com/subadminindexing/index.jsp <br>"
				 				            +  "Welcome to the Softdoc Family! <br>"	  
			 				           		+  "Regards,<br>"
							           	    +  "Team Softdoc<br><br>"
							           	    +  "*This is a system generated email. Please do not reply to this email.* <br>"
							           		,userprofile.getEmail());
							      
				     }else if(userprofile.getRole().equals("quality")) {
				    	 
				    	 new com.softdocadmin.email.EmailClient().email(
									"Your Softdoc account is ready!", "<br> Hello "+ userprofile.getName() +"<br>"
											+ "Your Softdoc account has been created. Please make a note of your Login ID and password below: <br>"
											+  "Login -"+userprofile.getEmail()+"<br>"
				 				           	+  "Password -"+password+"<br>"
				 				            +  "*It is highly recommended that you change your password immediately on first login to protect your data \r\n" + 
				 				           	   "and privacy. Please do not share your password with anybody.* <br>"
				 				            +  "You can access your account by clicking on the following link: <br>"
				 				            +  "https://softdoc-262410.appspot.com/subadminindexing/index.jsp <br>"
				 				            +  "Welcome to the Softdoc Family! <br>"	  
			 				           		+  "Regards,<br>"
							           	    +  "Team Softdoc<br><br>"
							           	    +  "*This is a system generated email. Please do not reply to this email.* <br>"
							           		,userprofile.getEmail());
				
				     }
				 
				 if(check)
				 {
					 
					  
			    	 new com.softdocadmin.email.EmailClient().email(
								"A new  Softdoc SubAdmin account has been created!", "<br> Hello "+ userprofile.getAdmin_name() +"<br>"
										+ "A new User account has been created under your Softdoc Admin account.  <br>"
										+  "Please note the following details: <br>"
										+  "Softdoc Client ID:"+userprofile.getSoftdocno()+"<br>"
			 				           	+  "Employee ID:"+userprofile.getEmployeeid()+"<br>"
			 				            +  "Employee Name:"+userprofile.getName()+"<br>"
			 				           	+  "Email ID:"+userprofile.getEmail()+"<br>"
			 				            +  "Role :"+userprofile.getRole()+"<br>"
			 				           	+  "If you have not performed this action, please login to your account and revoke access of the above user. It is" + 
			 				           	   "also recommended to change your password immediately. <br>"
			 				            +  "Regards,<br>"
						           	    +  "Team Softdoc<br><br>"
						           	    +  "*This is a system generated email. Please do not reply to this email.* <br>"
						           		,userprofile.getEmailsession());
			
					 
					 
					 
				 }
				
				
				  // logfile
				new Logfile().logfile(userprofile.getEmailsession(), "Has been create Subadmin",
						userprofile.getIdsession(), "admin");
				
				 try(PreparedStatement preparedStat = connection
							.prepareStatement("INSERT INTO `subadminsequence`(`id`) VALUES (?)");) {
						  preparedStat.setInt(1,password);
						  boolean serial=preparedStat.executeUpdate()>0;
					}
					catch(Exception exception)
					{
						exception.printStackTrace();
					}
					

			}

		} catch (SQLException sqlexception) {
			sqlexception.printStackTrace();
		} catch (Exception exception) {
			exception.printStackTrace();
		}

		return check;
	}

	// customerlocation
	public boolean customerlocation(LocationCustomer location) {
		boolean check = false;
		String companyname = location.getCompany_name();
		
		int frequency = location.getFrequency();
		
		String update = null;
		String equalcompanyname = null;
		String customer_id=null;
		int location_id=0;
		
		try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection.prepareStatement(
				"INSERT INTO `customer_location` (`address_line_one`, `address_line_two`, `city`, `pincode`, `date`, `pickup_frequency`, `loc_person_name`, `loc_person_mobile`, `loc_person_email`, `loc_per_designation`,`company_name`,company_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?)");) {

			preparedStatement.setString(1, location.getAddresslineone());
			preparedStatement.setString(2, location.getAddresslinetwo());
			preparedStatement.setString(3, location.getCity());
			preparedStatement.setInt(4, location.getPincode());			
		 	preparedStatement.setString(5, location.getDate());
			preparedStatement.setInt(6, location.getFrequency());
			preparedStatement.setString(7, location.getName());
			preparedStatement.setString(8, location.getMobile());
			preparedStatement.setString(9, location.getEmail());
			preparedStatement.setString(10, location.getDesignation());
			preparedStatement.setString(11, companyname);
			preparedStatement.setInt(12, location.getCompany_id());

			check = preparedStatement.executeUpdate() > 0;
		} catch (SQLException sqlexception) {

		} catch (Exception exception) {
			exception.printStackTrace();
		}

		if(check)
		{	
			try(Connection connection = DBConnection.openConnection();PreparedStatement preparedStat = connection
					.prepareStatement("SELECT * FROM `customer_location` order by id desc limit 1")){
			ResultSet resultset = preparedStat.executeQuery();
			if (resultset.next()) {		
				location_id=resultset.getInt("id");
			  }		
			}
		    catch (SQLException sqlexception) {

			} catch (Exception exception) {
				exception.printStackTrace();
			}			
			
		}
			// logfile
		if (check) {

			new Logfile().logfile(location.getEmailsession(), "Add location of Customer", location.getIdsession(),
					"admin");

		}

		try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStat = connection
				.prepareStatement("SELECT * FROM `customer_details` WHERE id='" + location.getCompany_id() + "'")) {

			ResultSet resultset = preparedStat.executeQuery();
			if (resultset.next()) {
				//String simpledat = resultset.getString("joining_date");
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				Date myDate = formatter.parse(location.getDate());
				Calendar c = Calendar.getInstance();
				c.setTime(myDate);
				c.add(Calendar.DATE, frequency);
				update = formatter.format(c.getTime());
				equalcompanyname = resultset.getString("company_name");
                customer_id=resultset.getString("id");			
			}

		} catch (SQLException sqlexception) {
			sqlexception.printStackTrace();
		} catch (Exception exception) {
			exception.printStackTrace();
		}

		try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStat = connection
				.prepareStatement("INSERT INTO `scheduling`(`company_name`,`pickup_date` , `company_id` , `status` , `loc_id`) VALUES ('" + equalcompanyname
						+ "','" + update + "','"+customer_id+"','store','"+location_id+"')")) {
			int schedule = preparedStat.executeUpdate();
			
		} catch (Exception exception) {
			System.out.println(exception);
		}

		return check;

	}

	

	public boolean changepassword(UserProfile userprofile) {
		boolean check = false;
		try (Connection connection=DBConnection.openConnection();Statement  statement = connection
				.createStatement();) {
			ResultSet resultset = statement.executeQuery("SELECT `password` FROM `softdoc_staff` WHERE id='" + userprofile.getIdsession() +"'");
			if (resultset.next()) {
			
			   String password = resultset.getString("password");
			   if (password.equals(userprofile.getPassword())) {
				    
				    String confirm = userprofile.getConfirm();
				     try (Connection connect=StoreDBConnection.openConnection(); PreparedStatement preparedStatement = connect
							.prepareStatement("UPDATE `softdoc_staff` SET `password` ='" + confirm +"' WHERE `id`='"+ userprofile.getIdsession() +"'");) {
				    	check = preparedStatement.executeUpdate() > 0;
						if (check) {
							new Logfile().logfile(userprofile.getEmail(), "changepassword by  softdocadmin",
									userprofile.getIdsession(), "admin");
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

	
	
	
	// subadmindelete
	public boolean subadmindelete(UserProfile userprofile) {
		boolean check = false;
		
		try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
				.prepareStatement("UPDATE `softdoc_staff` SET `leaving_date`=?,`flag`=1 WHERE `id`='"+userprofile.getId()+"'");) {
               
			 long timeNow = Calendar.getInstance().getTimeInMillis();
		     java.sql.Timestamp ts = new java.sql.Timestamp(timeNow);
		     preparedStatement.setTimestamp(1, ts);
			 check = preparedStatement.executeUpdate() > 0;

		} catch (SQLException sqlexception) {
			sqlexception.printStackTrace();
		} catch (Exception exception) {
			exception.printStackTrace();
		}

		// logfile
		if (check) {
			new Logfile().logfile(userprofile.getEmailsession(), "Has been delete softadmin",
					userprofile.getIdsession(), "admin");
		}
		return check;
	}

	// subadminupdate
	public boolean subadminupdate(UserProfile userprofile) {
		boolean check = false;
		int id = userprofile.getId();
		try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection.prepareStatement(
				"UPDATE `softdoc_staff` SET  `softdoc_no` = ? , `employee_id` = ? , `name` = ?, `email` = ? ,`mobile`=? , `joining_date` = ? , `designation`=?,`department` = ?, `role` = ? WHERE `id`='"
						+ id + "'");) {

			preparedStatement.setString(1, userprofile.getSoftdocno());
			preparedStatement.setString(2, userprofile.getEmployeeid());
			preparedStatement.setString(3, userprofile.getName());
			preparedStatement.setString(4, userprofile.getEmail());
			preparedStatement.setLong(5, userprofile.getMobile());
			preparedStatement.setString(6, userprofile.getJoiningdate());
			preparedStatement.setString(7, userprofile.getDesignation());
			preparedStatement.setString(8, userprofile.getDepartment());
			preparedStatement.setString(9, userprofile.getRole());
			check = preparedStatement.executeUpdate() > 0;

		} catch (SQLException sqlexception) {
			sqlexception.printStackTrace();
		} catch (Exception exception) {
			exception.printStackTrace();
		}

		// logfile
		if (check) {
			new Logfile().logfile(userprofile.getEmailsession(), "Has been update Subadmin", userprofile.getIdsession(),
					"admin");

		}

		return check;
	}

	// complainlist
	public boolean complainlist(ComplainList complaintlist) {
		boolean check = false;
		int rand_integer = ThreadLocalRandom.current().nextInt(100000);
		String customerid = "COM" + rand_integer;

		try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection.prepareStatement(
				"INSERT INTO `complain_list` (`customer_id`, `complain_id`, `department`, `situation`, `area_of_issue`, `comment`) VALUES (? , ?, ?, ?, ?, ?)");) {
			preparedStatement.setInt(1, complaintlist.getId());
			preparedStatement.setString(2, customerid);
			preparedStatement.setString(3, complaintlist.getDepartment());
			preparedStatement.setString(4, complaintlist.getSituation());
			preparedStatement.setString(5, complaintlist.getAreaofissue());
			preparedStatement.setString(6, complaintlist.getDescription());
			check = preparedStatement.executeUpdate() > 0;

			// logfile
			if (check) {

				new Logfile().logfile(complaintlist.getEmailsession(), "complaint by subadmin", complaintlist.getId(),
						"admin");
			}

		} catch (SQLException sqlexception) {
			sqlexception.printStackTrace();
		} catch (Exception exception) {
			exception.printStackTrace();
		}

		return check;
	}

	public boolean complainlistupdate(ComplainList complaintlist) {

		boolean check = false;
		String complainid = complaintlist.getComplainid();
	
		try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
				.prepareStatement("UPDATE `complain_list` SET `status`=? WHERE `complain_id`='" + complainid + "'");) {

			preparedStatement.setString(1, complaintlist.getStatus());
			check = preparedStatement.executeUpdate() > 0;
		} catch (SQLException sqlexception) {
			sqlexception.printStackTrace();
		} catch (Exception exception) {
			exception.printStackTrace();
		}

		// logfile
		if (check) {
			new Logfile().logfile(complaintlist.getEmailsession(), "complaint status update by softdoc Admin",
					complaintlist.getIdsession(), "admin");
		}

		return check;

	}
	
	
	
	public boolean uploadbill(Uploadingbill uploadingbill)
	{
		boolean check=false;
		int id=uploadingbill.getId();
		String uploadbilling=uploadingbill.getUploadingbill();
		String billing_report=uploadingbill.getBilling_report();
	
	    try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
				.prepareStatement("update document_info SET bill_report='"+billing_report+"' , payment_status='billed' WHERE company_id='"+id+"' and billing_month='"+uploadbilling+"'");) {
			
			check = preparedStatement.executeUpdate() > 0;
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
	
	public boolean  complainlistremark(ComplainList complaintlist)
	{
	    boolean check=false;
	    int id = complaintlist.getId();
	    
	    System.out.println(complaintlist.getRemark());
	    
		try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
				.prepareStatement("UPDATE `complain_list` SET `remark`=? WHERE `id`='"+ id + "'");) {

			preparedStatement.setString(1, complaintlist.getRemark());
			check = preparedStatement.executeUpdate() > 0;
		} catch (SQLException sqlexception) {
			sqlexception.printStackTrace();
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		// logfile
		if (check) {
			new Logfile().logfile(complaintlist.getEmailsession(), "remark update by admin",
					complaintlist.getIdsession(), "admin");
		}
	    return check;
	}
	public boolean paymentstatus(Uploadingbill uploadingbill)
	{
		boolean check=false;
		int id=uploadingbill.getId();
		
		
		String billing=uploadingbill.getBilling();
		String month=uploadingbill.getMonth();
		String email=uploadingbill.getEmail();
		int sessionid=uploadingbill.getIdsession();
		try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
				.prepareStatement("update document_info SET payment_paid='"+billing+"' WHERE company_id='"+id+"' and  billing_month='"+month+"'");) {
			check = preparedStatement.executeUpdate() > 0;
			if (check) {
				new Logfile().logfile(email, "payment status change by softdoc admin",
						sessionid, "admin");
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
	
	public boolean uploadphoto(UserProfile userprofile) {
		boolean check=false;
		try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection.prepareStatement(
				"UPDATE `softdoc_staff` SET `profile_photo`='"+userprofile.getUpload()+"' WHERE `id`='"
						+ userprofile.getIdsession() + "' and `role`='admin'");) {
					check = preparedStatement.executeUpdate()>0;
			if (check) {
				new Logfile().logfile(userprofile.getEmailsession(), "softdocadmin has been update photo", userprofile.getIdsession(), "admin");
			}
		} catch (SQLException sqlexception) {
			sqlexception.getMessage();
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return check;
	}
	
	  public boolean deleteLocation(LocationCustomer locationCustomer){
			boolean check = false;
			try (Connection connection=DBConnection.openConnection();PreparedStatement preparedStatement = connection
					.prepareStatement("delete from customer_location where id='"+locationCustomer.getId()+"'");) {
				check = preparedStatement.executeUpdate() > 0;
				if (check) {
					 PreparedStatement deletelocation = connection
							.prepareStatement("delete from scheduling where loc_id='"+locationCustomer.getId()+"'");
					 boolean check2 = deletelocation.executeUpdate() > 0;
					 new Logfile().logfile(locationCustomer.getEmail(), "softdocadmin delete location", locationCustomer.getIdsession(), "admin");
				}
			} catch (SQLException sqlexception) {
				sqlexception.printStackTrace();
			} catch (Exception exception) {
				exception.printStackTrace();
			}
	       return check;
		}
	

	  public boolean updatelocation(LocationCustomer location) {
			boolean check = false;
			
			String update="";
			String companyname = location.getCompany_name();
			try (Connection connection=DBConnection.openConnection();PreparedStatement preparedStatement = connection.prepareStatement(
					"update customer_location set `address_line_one`=? ,`address_line_two`=? ,`city`=?,`pincode`=?, `date`=?,`pickup_frequency`=? , `loc_person_name`=?,`loc_person_mobile`=? , `loc_person_email`=? , `loc_per_designation`=? , `company_name`=? where id='"+location.getId()+"'");){

				preparedStatement.setString(1, location.getAddresslineone());
				preparedStatement.setString(2, location.getAddresslinetwo());
				preparedStatement.setString(3, location.getCity());
				preparedStatement.setInt(4, location.getPincode());				
				preparedStatement.setString(5, location.getDate());
				preparedStatement.setInt(6, location.getFrequency());
				preparedStatement.setString(7, location.getName());
				preparedStatement.setString(8, location.getMobile());
				preparedStatement.setString(9, location.getEmail());
				preparedStatement.setString(10, location.getDesignation());
				preparedStatement.setString(11, companyname);
				check = preparedStatement.executeUpdate() > 0;
				
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				Date myDate = formatter.parse(location.getDate());
				Calendar c = Calendar.getInstance();
				c.setTime(myDate);
				c.add(Calendar.DATE, location.getFrequency());
				update = formatter.format(c.getTime());
			
				PreparedStatement preparedStat = connection.prepareStatement("UPDATE scheduling SET pickup_date='"+update+"' WHERE loc_id='"+location.getId()+"'");
				int schedule = preparedStat.executeUpdate();
				if(check) {
					new Logfile().logfile(location.getEmail(), "softdocadmin update location", location.getIdsession(), "admin");
				}
				
			 }catch (SQLException sqlexception) {				
				 sqlexception.printStackTrace();	
			} catch (Exception exception) {
				exception.printStackTrace();
			}
			
			return check;

		}

	  
}
