package com.superadminDAO;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;

import com.softdocadmin.email.Logfile;
import com.superadmin.connection.DBConnection;
import com.superadmin.loginfile.SuperLogfile;
import com.superadminModal.ComplainList;
import com.superadminModal.FileNumber;
import com.superadminModal.UserProfile;
import com.uploadfile.DeleteFile;

public class SuperDAO {

	Connection connection;

	public SuperDAO() {
		connection = DBConnection.openConnection();
	}
	// update profile of superadmin
	public int updateprofile(UserProfile user) {
		int rowUpdated = 0;
		String email = user.getEmail();
		try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection.prepareStatement(
				"UPDATE `softdoc_staff` SET `username`=?,`password`=?,`name`=?,`designation`=?,`mobile`=?,`location`=? WHERE `id`='"
						+ user.getId() + "'");) {
			preparedStatement.setString(1, user.getUsername());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.setString(3, user.getName());
			preparedStatement.setString(4, user.getDesignation());
			preparedStatement.setLong(5, user.getMobile());
			preparedStatement.setString(6, user.getLocation());
			rowUpdated = preparedStatement.executeUpdate();
			if (rowUpdated > 0) {

				new SuperLogfile().logfile(email, "update profile by superadmin", user.getId(), "superadmin");
			}

		} catch (SQLException sqlexception) {
			sqlexception.getMessage();
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return rowUpdated;
	}

	public boolean complainlistupdate(ComplainList complaintlist) {

		boolean check = false;
		int id = complaintlist.getId();
		try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
				.prepareStatement("UPDATE `complain_list` SET `status`=? WHERE `customer_id`='" + id + "'");) {

			preparedStatement.setString(1, complaintlist.getStatus());
			check = preparedStatement.executeUpdate() > 0;
		} catch (SQLException sqlexception) {
			sqlexception.printStackTrace();
		} catch (Exception exception) {
			exception.printStackTrace();
		}

		// logfile
		if (check) {
			new SuperLogfile().logfile(complaintlist.getEmailsession(), "complaint status update by superadmin",
					complaintlist.getIdsession(), "superadmin");
		}

		return check;

	}
	
	public boolean  complainlistremark(ComplainList complaintlist)
	{
	    boolean check=false;
	    int id = complaintlist.getId();
		try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
				.prepareStatement("UPDATE `complain_list` SET `remark`=? WHERE `customer_id`='" + id + "'");) {

			preparedStatement.setString(1, complaintlist.getRemark());
			check = preparedStatement.executeUpdate() > 0;
		} catch (SQLException sqlexception) {
			sqlexception.printStackTrace();
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		// logfile
		if (check) {
			new SuperLogfile().logfile(complaintlist.getEmailsession(), "remark update by superadmin",
					complaintlist.getIdsession(), "superadmin");
		}
	    return check;
	}
	
	
	//change password of profile
	//change password of profile
		public boolean superpassword(UserProfile userprofile) {
			boolean check = false;
			try (Connection connection = DBConnection.openConnection();Statement  statement = connection
					.createStatement();) {
				ResultSet resultset = statement.executeQuery("SELECT `password` FROM `softdoc_staff` WHERE id='" +userprofile.getId() + "'");
				if (resultset.next()) {
				
				    String password = resultset.getString("password");
					if (password.equals(userprofile.getPassword())) {
					   String confirm = userprofile.getConfirm();
					    try (PreparedStatement preparedStatement = connection
								.prepareStatement("UPDATE `softdoc_staff` SET `password` ='" + confirm + "' WHERE `id`='"
										+userprofile.getId() + "' and `role`='superadmin'");) {
							check = preparedStatement.executeUpdate() > 0;
							if (check) {
								new SuperLogfile().logfile(userprofile.getEmail(), "change password by superadmin",
										userprofile.getId(), "superadmin");
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
	//=======================//===================================
		public boolean uploadphoto(UserProfile userprofile) {
			boolean check=false;
			try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection.prepareStatement(
					"UPDATE `softdoc_staff` SET `profile_photo`='"+userprofile.getUpload()+"' WHERE `id`='"
							+ userprofile.getId() + "' and `role`='superadmin'");) {
						check = preparedStatement.executeUpdate()>0;
				if (check) {
					new SuperLogfile().logfile(userprofile.getEmail(), "superadmin has been update photo",
							userprofile.getId(), "superadmin");
				}
			} catch (SQLException sqlexception) {
				sqlexception.getMessage();
			} catch (Exception exception) {
				exception.printStackTrace();
			}
			return check;
		}
    //===================================file_number==================
		public boolean fileNumberDelete(FileNumber filenumber) {
			boolean check = false;
			
			
			try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
					.prepareStatement("select file from document_info where file_no ='"+filenumber.getFileNumber()+"'");) {
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
   				 
                 } 
		      
			   }catch (SQLException sqlexception) {
				sqlexception.printStackTrace();
			
		        } catch (Exception exception) {
				exception.printStackTrace();
			  }
			
			try (Connection connection = DBConnection.openConnection();PreparedStatement preparedStatement = connection
					.prepareStatement("delete from document_info where file_no='"+filenumber.getFileNumber()+"'");) {
				check = preparedStatement.executeUpdate() > 0;
				if (check) {
					new SuperLogfile().logfile(filenumber.getEmail(), "superadmin delete file",
							filenumber.getId(), "superadmin");
				}
			
			} catch (SQLException sqlexception) {
				sqlexception.printStackTrace();
			} catch (Exception exception) {
				exception.printStackTrace();
			}
	       return check;
		}
		
		
}