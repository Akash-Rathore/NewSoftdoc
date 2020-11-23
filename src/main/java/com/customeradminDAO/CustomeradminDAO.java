package com.customeradminDAO;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.concurrent.ThreadLocalRandom;

import javax.json.JsonException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import java.util.Date;
import java.util.List;
import java.util.Random;
import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import com.customeradmin.connection.DBConnection;
import com.customeradmin.email.EmailClient;
import com.customeradminModal.Cloud;
import com.customeradminModal.CustomerComplainList;
import com.customeradminModal.Userclientdetail;
import com.customeradminModal.Usercustomer;
import com.customerclientModal.Message;
import com.customerclientModal.RequestAccess;
import com.customerclientModal.UsercustomerClient;
import com.google.gson.Gson;

public class CustomeradminDAO {

	public CustomeradminDAO() {

	}

	// updateprofileDAO
	public boolean updateprofile(Usercustomer usercustomer) {
		boolean check = false;
		String email = usercustomer.getCompany_per_email();
		int id = usercustomer.getId();
		try (Connection connection = DBConnection.openConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(
						"UPDATE `customer_details` SET `company_per_name`=?,`company_per_designation`=?,`mobile`=? WHERE `id`='"+id+"'");) {

			
			preparedStatement.setString(1, usercustomer.getCompany_per_name());
			preparedStatement.setString(2, usercustomer.getCompany_per_designation());
			preparedStatement.setLong(3, usercustomer.getMobile());
			check = preparedStatement.executeUpdate() > 0;
			// This is for logfile
			if (check) {
				new com.customeradmin.email.Logfile().logfile(email, "update profile by customer admin",
						usercustomer.getId(), "customeradmin");

			}

		} catch (SQLException sqlexception) {
			sqlexception.printStackTrace();
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return check;
	}

	public boolean clientdetail(Userclientdetail userclientdetail) {
		Random random = new Random();
		int password = random.nextInt(100000000);
		boolean check = false;
		
		// select count(customer_id)as count  from client_details where customer_id=1 group by customer_id;
		// select noofusers from customer_details where id=1;
		int clientcount=0;
	  	int noofusers=0;
		try(Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement1 = connection.prepareStatement(
				"select count(customer_id)as count  from client_details where customer_id='"+userclientdetail.getCustomer_id()+"' and  flag='0' group by customer_id");
				) {
			   ResultSet resultset1=preparedStatement1.executeQuery(); 
			   if(resultset1.next())
			   {
				  clientcount=resultset1.getInt("count");
			   }
			
			
		}
		catch(Exception exception)
		{
		   exception.printStackTrace();
		}
		
		try(Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement2 = connection.prepareStatement("select noofusers from customer_details where id='"+userclientdetail.getCustomer_id()+"' and flag='0'");) {
			  ResultSet resultset2=preparedStatement2.executeQuery();
			  if(resultset2.next())
			  {
				  noofusers=resultset2.getInt("noofusers");
			  }
		}
		catch(Exception exception)
		{
			 exception.printStackTrace();
		}
		
		
		if(noofusers >clientcount) {
		
		try(Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO `client_details` (`softdoc_id`, `employee_id`, `employee_name`, `emp_email_id`, `joining_date`, `activation_date`, `department`, `designation`, `location`, `selectdepartment`,`customer_id`,`password`,industry) VALUES (?, ?, ?, ? , ? , ? , ?, ?, ?, ?,?,?,?)");)
		{
			preparedStatement.setString(1, userclientdetail.getSoftdocno());
			preparedStatement.setString(2, userclientdetail.getEmployeeid());
			preparedStatement.setString(3, userclientdetail.getName());
			preparedStatement.setString(4, userclientdetail.getEmail());

			final String OLD_FORMAT = "yyyy-MM-dd";
			final String NEW_FORMAT = "dd MMM yyyy";
			SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
			Date d = sdf.parse(userclientdetail.getJoiningdate());
			sdf.applyPattern(NEW_FORMAT);
			String newDateString = sdf.format(d);
			preparedStatement.setString(5, newDateString);

			// activation date
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd MMM yyyy");
			String date = simpleDateFormat.format(new Date());
			preparedStatement.setString(6, date);
			preparedStatement.setString(7, userclientdetail.getSelectdepartment());
			preparedStatement.setString(8, userclientdetail.getDesignation());
			preparedStatement.setString(9, userclientdetail.getLocation());
			preparedStatement.setString(10, userclientdetail.getDepartment());
			preparedStatement.setInt(11, userclientdetail.getCustomer_id());
			preparedStatement.setInt(12, password);
			preparedStatement.setString(13, userclientdetail.getIndustry());
			
			check = preparedStatement.executeUpdate() > 0;
			if (check) {

				try {
					new EmailClient().email("Your Softdoc account is ready!", "<br> Hello " + userclientdetail.getName()
							+ ",<br>" + "Your Account for Softdoc client portal  &  Application is created.<br>"
							+ "Your Softdoc Admin account has been created. Please make a note of your Login ID and password below:<br> Login-" + userclientdetail.getEmail() + "<br>" + "Password-" + password + "<br>"
							+ "*It is highly recommended that you change your password immediately on first login to protect \r\n"  
							+ "your data and privacy. Please do not share your password with anybody.*"  
							+ "You can access your account by clicking on the following link: <br>"
							+ "https://softdoc-262410.appspot.com/customer/<br>"
							+ "Feel free to reach out to us at info@softdoc.co.in for any queries/clarifications.<br>" 
							+ "Welcome to the Softdoc Family!<br><br>"
							+ "Regards,<br>"
							+ "Team Softdoc<br><br>"
							+ "*This is a system generated email. Please do not reply to this email.*", 
							userclientdetail.getEmail());
				} catch (Exception exception) {
					exception.printStackTrace();
				}

				if (check) {
					try {
						new EmailClient().email("A new Softdoc User account has been created!", "<br> Hello"
								+ userclientdetail.getCustomer_name() + ",<br>"
								+ "A new User account has been created under your Softdoc Admin account. <br>"
								+ "Please note the following details:<br>"

								+ "Softdoc Client ID:" + userclientdetail.getSoftdocno() + "<br>" + "Employee ID:"
								+ userclientdetail.getEmployeeid() + "<br>" + "Employee Name:"
								+ userclientdetail.getName() + "<br>" + "Email ID:" + userclientdetail.getEmail()
								+ "<br>" + "Access to:"
								+ "If you have not performed this action, please login to your account and revoke access of the above user. It is"
								+ "also recommended to change your password immediately.<br>"
								+ "Please note that user accounts may be charged as per the terms agreed with you. <br>"
								+ "Feel free to reach out to us at  info@softdoc.co.in for any queries/clarifications. <br><br>"
								+ "Regards,<br>" + "Team Softdoc<br>"
								+ "*This is a system generated email. Please do not reply to this email.*",
								userclientdetail.getSessionemail());
					} catch (Exception exception) {
						exception.printStackTrace();
					}
				}

				
				
				  PreparedStatement preparedStatement4 = connection.
				  prepareStatement("select id from client_details order by id desc limit 1");
				  ResultSet resultset4=preparedStatement4.executeQuery(); 
				  resultset4.next();
				  int user_id=resultset4.getInt("id");
				  
				  new com.customeradmin.email.Logfile2().logfile(user_id ,
				  userclientdetail.getCustomer_id() , userclientdetail.getSessionemail(),
				  "User Created", "customeradmin");
				 
			 }
		 
	      

		} catch (SQLException sqlexception) {
			sqlexception.printStackTrace();
		} catch (Exception exception) {
			exception.printStackTrace();
		}

	   }
		
		return check;
		
	
	
	}

	// clientdetaildelete
	public boolean clientdetaildelete(Userclientdetail userclientdetail) {
		boolean check = false;
		try (Connection connection = DBConnection.openConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("UPDATE `client_details` SET flag=1 , deleted_on=? WHERE id='"
								+ userclientdetail.getId() + "'");) {

			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss");
			LocalDateTime now = LocalDateTime.now();
			preparedStatement.setString(1, dtf.format(now));

			check = preparedStatement.executeUpdate() > 0;

			// This is for logfile
			if (check) {
				new com.customeradmin.email.Logfile2().logfile(userclientdetail.getId(),userclientdetail.getCustomer_id(),userclientdetail.getSessionemail(),
						"User Deleted", "customeradmin");

			}

		} catch (SQLException sqlexception) {
			sqlexception.printStackTrace();
		} catch (Exception exception) {
			exception.printStackTrace();
		}

		return check;
	}

	// clientdetailupdate
	public boolean clientdetailupdate(Userclientdetail userclientdetail) {
		boolean check = false;
		int id = userclientdetail.getId();
		try (Connection connection = DBConnection.openConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(
						"UPDATE `client_details` SET `softdoc_id` = ?, `employee_id` = ?, `employee_name` = ?, `emp_email_id` = ?, `joining_date` = ?, `activation_date` = ?, `department` = ?, `designation` = ?, `location` = ?, `selectdepartment` = ? WHERE `id`='"
								+ id + "'");) {
			preparedStatement.setString(1, userclientdetail.getSoftdocno());
			preparedStatement.setString(2, userclientdetail.getEmployeeid());
			preparedStatement.setString(3, userclientdetail.getName());
			preparedStatement.setString(4, userclientdetail.getEmail());
			preparedStatement.setString(5, userclientdetail.getJoiningdate());
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd MMM yyyy");
			String date = simpleDateFormat.format(new Date());
			preparedStatement.setString(6, date);
			preparedStatement.setString(7, userclientdetail.getSelectdepartment());
			preparedStatement.setString(8, userclientdetail.getDesignation());
			preparedStatement.setString(9, userclientdetail.getLocation());
			preparedStatement.setString(10, userclientdetail.getDepartment());
			check = preparedStatement.executeUpdate() > 0;
			if (check) {
				new com.customeradmin.email.Logfile2().logfile(id, userclientdetail.getSessionid() , userclientdetail.getSessionemail() , "User Modified" , "customeradmin");
			}
		} catch (SQLException sqlexception) {
			sqlexception.printStackTrace();
		} catch (Exception exception) {
			exception.printStackTrace();
		}

		return check;
	}

	// complainlist
	public boolean complainlist(CustomerComplainList complaintlist) {
		boolean check = false;
		int rand_integer = ThreadLocalRandom.current().nextInt(100000);
		String customerid = "COM" + rand_integer;

		try (Connection connection = DBConnection.openConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(
						"INSERT INTO `complain_list` (`customer_id`, `complain_id`, `attachment`, `title`, `area_of_issue`, `documentnumberref`,`category`,`date`) VALUES (? , ?, ?, ?, ?, ?,?,?)");) {
			preparedStatement.setInt(1, complaintlist.getId());
			preparedStatement.setString(2, customerid);
			preparedStatement.setString(3, complaintlist.getAttachment());
			preparedStatement.setString(4, complaintlist.getTitle());
			preparedStatement.setString(5, complaintlist.getDescription());
			preparedStatement.setString(6, complaintlist.getDocumentnumberref());
			preparedStatement.setString(7, complaintlist.getCategory());
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			preparedStatement.setTimestamp(8, timestamp);
			check = preparedStatement.executeUpdate() > 0;

		} catch (SQLException sqlexception) {
			sqlexception.printStackTrace();
		} catch (Exception exception) {
			exception.printStackTrace();
		}

		return check;
	}

	// changepassword
	public boolean changepassword(Usercustomer usercustomer) {

		boolean check = false;
		try (Connection connection = DBConnection.openConnection();
				Statement statement = connection.createStatement();) {
			ResultSet resultset = statement.executeQuery(
					"SELECT `password` FROM `customer_details` WHERE `id`='" + usercustomer.getId() + "'");
			if (resultset.next()) {

				String password = resultset.getString("password");
				if (password.equals(usercustomer.getPassword())) {
					String confirm = usercustomer.getConfirm();
					try (Connection connect = DBConnection.openConnection();
							PreparedStatement preparedStatement = connect
									.prepareStatement("UPDATE `customer_details` SET `password` = '" + confirm
											+ "' WHERE `id`= '" + usercustomer.getId() + "'");) {
						check = preparedStatement.executeUpdate() > 0;
						if (check) {
							new com.customeradmin.email.Logfile().logfile(usercustomer.getCompany_per_email(),
									"password change by customeradmin", usercustomer.getId(), "customeradmin");

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

	// complainlist is update
	public boolean complainupdate(CustomerComplainList customercomplainlist) {

		boolean check = false;
		String complainid = customercomplainlist.getComplain_id();

		try (Connection connection = DBConnection.openConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(
						"UPDATE `complain_list` SET `status`=? WHERE `complain_id`='" + complainid + "'");) {

			preparedStatement.setString(1, customercomplainlist.getStatus());
			check = preparedStatement.executeUpdate() > 0;
			new com.customeradmin.email.Logfile().logfile(customercomplainlist.getEmail(),
					"complain status change by compalin ", customercomplainlist.getId(), "customeradmin");

		} catch (SQLException sqlexception) {
			sqlexception.printStackTrace();
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return check;

	}

	// complainlist of remark
	public boolean complainremark(CustomerComplainList customercomplainlist) {
		boolean check = false;
		int id = customercomplainlist.getId();
		try (Connection connection = DBConnection.openConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("UPDATE `complain_list` SET `remark`=? WHERE `id`='" + id + "'");) {

			preparedStatement.setString(1, customercomplainlist.getRemark());
			check = preparedStatement.executeUpdate() > 0;
			new com.customeradmin.email.Logfile().logfile(customercomplainlist.getEmail(),
					"customeradmin fill the remark", customercomplainlist.getSessionid(), "customeradmin");

		} catch (SQLException sqlexception) {
			sqlexception.printStackTrace();
		} catch (Exception exception) {
			exception.printStackTrace();
		}

		return check;
	}

	public boolean uploadphoto(Usercustomer usercustomer) {
		boolean check = false;
		try (Connection connection = DBConnection.openConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("UPDATE `customer_details` SET `profile_photo`='" + usercustomer.getUpload()
								+ "' WHERE `id`='" + usercustomer.getId() + "'");) {
			check = preparedStatement.executeUpdate() > 0;
			if (check) {

				new com.customeradmin.email.Logfile().logfile(usercustomer.getEmail(),
						"customeradmin update profile photo", usercustomer.getId(), "customeradmin");
			}
		} catch (SQLException sqlexception) {
			sqlexception.getMessage();
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return check;
	}


	     public List<Userclientdetail> clienRecord(Userclientdetail userclientdetail)
	     {
	    	  List<Userclientdetail> list=new ArrayList<Userclientdetail>();
	    	  try(Connection connection=DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("SELECT `id`,`softdoc_id`, `employee_id`, `employee_name`, `emp_email_id`, `joining_date`, `activation_date`, `department`, `designation`, `location`, `department` FROM `client_details` where `customer_id`='"+userclientdetail.getCustomer_id()+"' and flag=0 order by id desc");)
			  {
	    		   ResultSet resultSet=preparedStatement.executeQuery(); 
			       while(resultSet.next())
	    		   {
			    	
			    	   String create_edit="<a  href='./customerprocess?action=editclient&id="+resultSet.getInt("id")+"'><i class='material-icons'>edit</i></a>";
				       String create_view="<a  href='./customerprocess?action=viewclient&id="+resultSet.getInt("id")+"'><i class='material-icons'>remove_red_eye</i></a>";
				       String create_delete="<a href='javascript:void(0);'  class='delete'  data-id='"+resultSet.getInt("id")+"'><i class='material-icons'>delete</i></a>";
				       
			    	   Userclientdetail Userclientdetail1 = new Userclientdetail();
			    	   Userclientdetail1.setDeleteViewEdit(create_edit+create_view+create_delete); 
			    	   Userclientdetail1.setSoftdocno(resultSet.getString("softdoc_id"));
			    	   Userclientdetail1.setEmployeeid(resultSet.getString("employee_id")); 
			    	   Userclientdetail1.setName(resultSet.getString("employee_name")); 
			    	   Userclientdetail1.setEmail(resultSet.getString("emp_email_id")); 
			    	   Userclientdetail1.setDesignation(resultSet.getString("designation")); 
			    	   
			    	   
			    	   
			    	   JSONParser jsonParser = new JSONParser();
					   JSONArray jsonArray = (JSONArray) jsonParser.parse(resultSet.getString("department"));
					   JSONObject access_level1 = null;
                       String department="";
                       for(Object object : jsonArray) {
                    	   
							      access_level1 = (JSONObject) object;
							      String access_level=(String)access_level1.get("access_level");
						          String departmentMulti=(String)access_level1.get("department");
						          department +=departmentMulti+":"+access_level+",";
							     
						  }
			    	   
                       Userclientdetail1.setDepartment(department); 
			    	   Userclientdetail1.setJoiningdate(resultSet.getString("joining_date")); 
			    	   Userclientdetail1.setActivationdate(resultSet.getString("activation_date")); 
			    	   list.add(Userclientdetail1);
	    			   
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
	    
	
	     public List<Userclientdetail> editclient(Userclientdetail userclientdetail)
	     {
	    	  List<Userclientdetail> list=new ArrayList<Userclientdetail>();
	    	  try(Connection connection=DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("SELECT id , `softdoc_id`, `employee_id`, `employee_name`, `emp_email_id`, `joining_date`, `activation_date`, `department`, `designation`, `location` FROM `client_details`  WHERE  id='"+userclientdetail.getId()+"'");)
			  {
	    		   ResultSet resultSet=preparedStatement.executeQuery(); 
			       while(resultSet.next())
	    		   {
			    	
			    	   
			    	   Userclientdetail Userclientdetail1 = new Userclientdetail();
			    	   Userclientdetail1.setId(resultSet.getInt("id"));
			    	   Userclientdetail1.setSoftdocno(resultSet.getString("softdoc_id"));
			    	   Userclientdetail1.setEmployeeid(resultSet.getString("employee_id")); 
			    	   Userclientdetail1.setName(resultSet.getString("employee_name")); 
			    	   Userclientdetail1.setEmail(resultSet.getString("emp_email_id")); 
			    	   Userclientdetail1.setDesignation(resultSet.getString("designation")); 
			    	   Userclientdetail1.setDepartment(resultSet.getString("department")); 
			    	   Userclientdetail1.setJoiningdate(resultSet.getString("joining_date")); 
			    	   Userclientdetail1.setLocation(resultSet.getString("location")); 
			    	   list.add(Userclientdetail1);
	    			   
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
	     
	    
	     public List<Userclientdetail> viewclient(Userclientdetail userclientdetail)
	     {
	    	  List<Userclientdetail> list=new ArrayList<Userclientdetail>();
	    	  try(Connection connection=DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("SELECT id , `softdoc_id`, `employee_id`, `employee_name`, `emp_email_id`, `joining_date`, `activation_date`, `department`, `designation`, `location` FROM `client_details`  WHERE  id='"+userclientdetail.getId()+"'");)
			  {
	    		   ResultSet resultSet=preparedStatement.executeQuery(); 
			       while(resultSet.next())
	    		   {
			    	
			    	   
			    	   Userclientdetail Userclientdetail1 = new Userclientdetail();
			    	   Userclientdetail1.setId(resultSet.getInt("id"));
			    	   Userclientdetail1.setSoftdocno(resultSet.getString("softdoc_id"));
			    	   Userclientdetail1.setEmployeeid(resultSet.getString("employee_id")); 
			    	   Userclientdetail1.setName(resultSet.getString("employee_name")); 
			    	   Userclientdetail1.setEmail(resultSet.getString("emp_email_id")); 
			    	   Userclientdetail1.setDesignation(resultSet.getString("designation")); 
			    	   Userclientdetail1.setDepartment(resultSet.getString("department")); 
			    	   Userclientdetail1.setJoiningdate(resultSet.getString("joining_date")); 
			    	   Userclientdetail1.setLocation(resultSet.getString("location")); 
			    	   list.add(Userclientdetail1);
	    			   
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
	     
	     
	   
	     
	    
	     public List<Cloud> cloudRecord(Cloud cloud)
	     {
	    	 
	    	  List<Cloud> list=new ArrayList<Cloud>();
	    	  try(Connection connection=DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("SELECT  file_name , document_type,upload_date, document_no , file_no , SUM(ROUND(size , 2)) AS size  ,  department FROM document_info WHERE company_id='"+cloud.getCustomer_id()+"' AND STATUS='quality_approved' AND upload_date LIKE '%"+cloud.getCloud_date()+"%' AND document_no IS NOT NULL GROUP BY file_no");)
			  {
	    		   ResultSet resultSet=preparedStatement.executeQuery(); 
			       while(resultSet.next())
	    		   {
			    	
			    	   
			    	   Cloud cloud1=new Cloud();
			    	   cloud1.setDepartment(resultSet.getString("department"));
			    	   cloud1.setFile_no(resultSet.getString("file_no"));
			    	   if(resultSet.getString("file_name")!=null) {
			    		   
			    		   cloud1.setFile_name(resultSet.getString("file_name"));
			    		   final String OLD = "yyyy-MM-dd";
	        			   final String NEW = "dd MMM yyyy";
	        			   SimpleDateFormat simpleDateFormat = new SimpleDateFormat(OLD);
	                       Date date = simpleDateFormat.parse(resultSet.getString("upload_date"));
	                       simpleDateFormat.applyPattern(NEW);
	        			   cloud1.setCreated_no(simpleDateFormat.format(date));
					       cloud1.setDocument_no(resultSet.getString("document_no"));
				    	   cloud1.setDocument_type(resultSet.getString("document_type"));
				    	   cloud1.setSize(resultSet.getString("size")+" MB");
				    	   list.add(cloud1);
		    		
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

	 
	     public List<Cloud> trackingRecord(Cloud cloud)
	     {
	    	  List<Cloud> list=new ArrayList<Cloud>();
	    	  try(Connection connection=DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("SELECT  department , file_no , upload_date  FROM `document_info` where company_id='"+cloud.getCustomer_id()+"' group by file_no order by id desc");)
			  {
	    		   ResultSet resultSet=preparedStatement.executeQuery(); 
			       while(resultSet.next())
	    		   {
			    	
			    	   Cloud cloud1=new Cloud();
			    	   cloud1.setFile_no(resultSet.getString("file_no"));
				       cloud1.setDepartment(resultSet.getString("department"));
				       final String OLD = "yyyy-MM-dd";
        			   final String NEW = "dd MMM yyyy";
        			   SimpleDateFormat simpleDateFormat = new SimpleDateFormat(OLD);
                       Date date = simpleDateFormat.parse(resultSet.getString("upload_date"));
                       simpleDateFormat.applyPattern(NEW);
        			   cloud1.setPickup_date(simpleDateFormat.format(date));
				       cloud1.setTracking("Active");
				       list.add(cloud1);
			    			   
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
	     
	  
	  
	     public List<Usercustomer> profileRecord(Usercustomer usercustomer)
	     {
	    	  List<Usercustomer> list=new ArrayList<Usercustomer>();
	    	  try(Connection connection=DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("SELECT  password , company_per_name , company_per_designation , company_per_email , mobile , customer_number , profile_photo FROM customer_details WHERE id ='"+usercustomer.getId()+"'");)
			  {
	    		   ResultSet resultSet=preparedStatement.executeQuery(); 
			       while(resultSet.next())
	    		   {
			    
			    	   
			    	   Usercustomer usercustomer1=new Usercustomer();
			    	   usercustomer1.setCompany_per_name(resultSet.getString("company_per_name"));
			    	   usercustomer1.setCompany_per_designation(resultSet.getString("company_per_designation"));
			    	   usercustomer1.setMobile(resultSet.getLong("mobile"));
			    	   usercustomer1.setCustomer_number(resultSet.getString("customer_number"));
			    	   usercustomer1.setUpload(resultSet.getString("profile_photo"));
			    	   usercustomer1.setEmail(resultSet.getString("company_per_email"));
			    	   list.add(usercustomer1);
	    			   
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
	     
	     
	     public List<Usercustomer> profileCompleteDetails(Usercustomer usercustomer)
	     {
	    	  List<Usercustomer> list=new ArrayList<Usercustomer>();
	    	  try(Connection connection=DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("SELECT `customer_number`, `company_name`, `billing_address_first`, `billing_address_sec`, `city`, `state`, `pincode`, `company_pan`, `gstin`, `tan`, `type`, `industry`, `company_per_name`, `company_per_designation`, `company_per_email`, `mobile`, `depart_info`, `dpi`, `colour`,`gst_certificate`,`pan`,`tan_att`,`signed_contract`,`questionnaire`,`others` , `pan_text` , servicetype , storagedata , noofusers , planstardate , planenddate , subscription_type FROM `customer_details` WHERE id='"+usercustomer.getId()+"'");)
			  {
	    		   ResultSet resultSet=preparedStatement.executeQuery(); 
			       while(resultSet.next())
	    		   {
			    	
			    	   Usercustomer usercustomer1=new Usercustomer();
			    	   usercustomer1.setCustomer_number(resultSet.getString("customer_number"));
			    	   usercustomer1.setCompany_name(resultSet.getString("company_name"));
			    	   usercustomer1.setBilling_address_first(resultSet.getString("billing_address_first"));
			    	   usercustomer1.setBilling_address_sec(resultSet.getString("billing_address_sec"));
			    	   usercustomer1.setCity(resultSet.getString("city"));
			    	   usercustomer1.setState(resultSet.getString("state"));
			    	   usercustomer1.setPincode(resultSet.getInt("pincode"));
			    	   usercustomer1.setPan(resultSet.getString("company_pan"));
			    	   usercustomer1.setTan(resultSet.getString("tan"));
			    	   usercustomer1.setGstin(resultSet.getString("gstin"));
			    	   usercustomer1.setType(resultSet.getString("type"));
			    	   usercustomer1.setIndustry(resultSet.getString("industry"));
			    	   usercustomer1.setBilling_address_first(resultSet.getString("billing_address_first"));
			    	   usercustomer1.setBilling_address_sec(resultSet.getString("billing_address_sec"));
			    	   usercustomer1.setCompany_per_name(resultSet.getString("company_per_name"));
			    	   usercustomer1.setCompany_per_designation(resultSet.getString("company_per_designation"));
			    	   usercustomer1.setCompany_per_email(resultSet.getString("company_per_email"));
			    	   usercustomer1.setMobile(resultSet.getLong("mobile"));
			    	   usercustomer1.setDepart_info(resultSet.getString("depart_info"));
			    	   usercustomer1.setColour(resultSet.getString("colour"));
			    	   usercustomer1.setGst_certificate(resultSet.getString("gst_certificate"));
			    	   usercustomer1.setPan(resultSet.getString("pan"));
			    	   usercustomer1.setTan_att(resultSet.getString("tan_att"));
			    	   usercustomer1.setSigned_contract(resultSet.getString("signed_contract"));
			    	   usercustomer1.setQuestionnaire(resultSet.getString("questionnaire"));
			    	   usercustomer1.setPan_text(resultSet.getString("pan_text"));
			    	   usercustomer1.setServiceType(resultSet.getString("servicetype"));
			    	   usercustomer1.setStorageData(resultSet.getString("storagedata"));
			    	   usercustomer1.setNoOfUsers(resultSet.getString("noofusers"));
			    	   usercustomer1.setPlanStarDate(resultSet.getString("planstardate"));
			    	   usercustomer1.setPlanEndDate(resultSet.getString("planenddate"));
			    	   usercustomer1.setSubscription_type(resultSet.getString("subscription_type"));
			    	   list.add(usercustomer1);
	    			   
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
	     
	     
	     
	     public List<Usercustomer> DashboardDetails(Usercustomer usercustomer)
	     {
	    	  List<Usercustomer> list=new ArrayList<Usercustomer>();
	    	  try(Connection connection=DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("SELECT count(id) as Number FROM `client_details` where `customer_id`='"+usercustomer.getId()+"' and  flag=0");)
			  {
	    		   ResultSet resultSet=preparedStatement.executeQuery(); 
			       if(resultSet.next())
	    		   {
			    	
			    	   Usercustomer usercustomer1=new Usercustomer();
				       PreparedStatement preparedStatementcloud = connection.prepareStatement("SELECT Sum(size) as size FROM `document_info` where company_id='"+usercustomer.getId()+"' and status='quality_approved'");
			    	   ResultSet resultSetcloud=preparedStatementcloud.executeQuery(); 
			    	   resultSetcloud.next();  
			    	   
			    	   PreparedStatement preparedStatementtotal = connection.prepareStatement("select noofusers , storagedata from customer_details where id='"+usercustomer.getId()+"'");
			    	   ResultSet resultSettotal=preparedStatementtotal.executeQuery(); 
			    	   resultSettotal.next();  
			    	   
			    	   usercustomer1.setTotalUser(resultSettotal.getString("noofusers"));
			    	   usercustomer1.setStorageData(resultSettotal.getString("storagedata"));
			    	   
			    	   DecimalFormat df = new DecimalFormat("0.00");
			    	   usercustomer1.setNoOfUsers(resultSet.getString("Number"));
			    	   usercustomer1.setCloud_size(df.format(resultSetcloud.getFloat("size")/1000));
			    	   list.add(usercustomer1);
	    			   
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
	     
	     
	     
	     public List<Usercustomer> dashboardRequestAccessDepartment(Usercustomer usercustomer)
		 {
		    	  
		    	  List<Usercustomer> list=new ArrayList<Usercustomer>();
		    	  try(Connection connection=DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("select req.id as id , employee_name  ,  DATE_FORMAT(request_date , '%d %b %Y') as request_date , req.access_level  from requestaccess as req , client_details as cd  where req.client_id=cd.id and cd.customer_id='"+usercustomer.getId()+"' and req.flag=0 and document_info_id is null");)
				  {
		    		   ResultSet resultSet=preparedStatement.executeQuery(); 
				       while(resultSet.next())
		    		   {
				    	
				    	   Usercustomer usercustomer1=new Usercustomer();
				    	   JSONParser jsonParser = new JSONParser();
						   JSONArray jsonArray = (JSONArray) jsonParser.parse(resultSet.getString("access_level"));
						   JSONObject access_level1 = null;
	                       String department="";
	                       for(Object object : jsonArray) {
	                    	   
								      access_level1 = (JSONObject) object;
								      String access_level=(String)access_level1.get("access_level");
							          String departmentMulti=(String)access_level1.get("department");
							          department +=departmentMulti+":"+access_level+",";
								     
							  }
				    	   
	                       usercustomer1.setId(resultSet.getInt("id"));
	                       String request_name=resultSet.getString("employee_name");
				           usercustomer1.setDepartment_details(""+request_name+" has requested access to "+department+"  on "+resultSet.getString("request_date")+"");   	   
				    	   list.add(usercustomer1);
		    			   
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
		   
	    
	     
	     public List<Usercustomer> DashboardDepartmentAccess(Usercustomer usercustomer)
		 {
		    	  
		    	  List<Usercustomer> list=new ArrayList<Usercustomer>();
		    	  try(Connection connection=DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("select  access_level  from requestaccess  where id='"+usercustomer.getRequest_access_id()+"' and document_info_id is null");)
				  {
		    		   ResultSet resultSet=preparedStatement.executeQuery(); 
				       if(resultSet.next())
		    		   {
				    	
				    	   
				    	   Usercustomer usercustomer1=new Usercustomer();
				    	   usercustomer1.setDepartment_details(resultSet.getString("access_level"));   	   
				    	   list.add(usercustomer1);
		    			   
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
		
	     
	     public boolean AcceptAndRejectDepartment(Usercustomer usercustomer)
		 {
	    	 
	    	
	    	 
		          boolean check=true; 	  
		    	  try(Connection connection=DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("select  client_id , access_level  from requestaccess  where id='"+usercustomer.getRequest_access_id()+"' and document_info_id is null");)
				  {
		    		   ResultSet resultSet=preparedStatement.executeQuery(); 
				       if(resultSet.next())
		    		   {
				    	
				    	   
				    	          JSONParser jsonParser1 = new JSONParser();
								  JSONArray jsonArray1=(JSONArray)jsonParser1.parse(resultSet.getString("access_level"));
						
								  
								
			    	    		  String department="";
				    	   		  PreparedStatement preparedStatement2 = connection
									.prepareStatement(" select department  from client_details where id='"+resultSet.getInt("client_id")+"'");
								    ResultSet resultSet2=preparedStatement2.executeQuery();
									if(resultSet2.next()) {
										department=resultSet2.getString("department");	
									}
				    	   


					    	        JSONParser jsonParser2 = new JSONParser();
									JSONArray jsonArray2=(JSONArray)jsonParser1.parse(department);
									jsonArray1.addAll(jsonArray2); 
								
								if(usercustomer.getStatus().equalsIgnoreCase("approve")) {	
									 PreparedStatement preparedStatement3 = connection.prepareStatement("update client_details set department='"+jsonArray1.toJSONString()+"' where id='"+resultSet.getInt("client_id")+"'");
									 check = preparedStatement3.executeUpdate() > 0;
							   	}	
									PreparedStatement preparedStatement4 = connection.prepareStatement("update requestaccess set remarks='"+usercustomer.getReject_remarks()+"' , approval_status='"+usercustomer.getStatus()+"' ,  flag=1 where id='"+usercustomer.getRequest_access_id()+"'");
									check = preparedStatement4.executeUpdate() > 0;


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
	     
	     
	     
	        public List<Usercustomer> fetchName(Usercustomer usercustomerClient)
		    {   
		    	
		    	  List<Usercustomer> list=new ArrayList<Usercustomer>();
		    	  try(Connection connection=DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("SELECT  employee_name , id  , imageupload , emp_email_id  FROM `client_details` WHERE `customer_id`='"+usercustomerClient.getId()+"' and flag='0'");)
				  {
		    		   ResultSet resultSet=preparedStatement.executeQuery(); 
				       while(resultSet.next())
		    		   {
				    	    Usercustomer usercustomerClient1=new Usercustomer();
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

	 		  
	 		 public List<Message> fetchClientMessage(Message message) {

	 			    List<Message> list=new ArrayList<Message>();
					try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
							.prepareStatement("select id , attachment , message , customer_admin_id , DATE_FORMAT(date_time ,'%d %b %Y') AS date_time , DATE_FORMAT(date_time ,'%r') AS time from client_message where (customer_admin_id ='"+message.getCustomer_id()+"' and send_id='"+message.getClient_chat_id()+"') OR (customer_admin_id ='"+message.getClient_chat_id()+"' and send_id='"+message.getCustomer_id()+"')");) {
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
								 
								 
								 
								
						  		if(message.getCustomer_id()==resultSet.getInt("customer_admin_id")){
				
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
							  		message1.setClient_id(resultSet.getInt("customer_admin_id"));
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
	 		 
	 		public boolean client_message(Message client_message) {
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
		   	 
		
	 		public List<Usercustomer> suggestionName(Usercustomer usercustomerClient)
		    {   
		    	
		    	  
		    	  List<Usercustomer> list=new ArrayList<Usercustomer>();
		    	  try(Connection connection=DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("SELECT  employee_name , id  , imageupload , emp_email_id  FROM `client_details` WHERE `customer_id`='"+usercustomerClient.getId()+"' and  employee_name LIKE '%"+usercustomerClient.getSearch_box()+"%' and flag='0'");)
				  {
		    		   ResultSet resultSet=preparedStatement.executeQuery(); 
				       while(resultSet.next())
		    		   {
				    	    Usercustomer usercustomerClient1=new Usercustomer();
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
		    		
	 		
	     
}
