package com.subadminstoreDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.softdocadmin.email.Logfile;
import com.subadminstore.connection.StoreDBConnection;
import com.subadminstore.loginfile.StoreLogfile;
import com.subadminstoreModal.StoreFile;
import com.subadminstoreModal.UserProfileStore;
import com.superadmin.loginfile.SuperLogfile;
import com.superadminModal.UserProfile;

public class SubadminStoreDAO {

	Connection connection;

	public SubadminStoreDAO() {
		connection = StoreDBConnection.openConnection();
	}


	public int updateprofile(UserProfileStore user) {
		int rowUpdated = 0;
		String email = user.getEmail();
		
		try (Connection connection = StoreDBConnection.openConnection();PreparedStatement preparedStatement = connection.prepareStatement(
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
				StoreLogfile logfile = new StoreLogfile();
				logfile.logfile(email, "Subadmin Store has been update profile", user.getId(), "store");

			}
		} catch (SQLException sqlexception) {
			sqlexception.getMessage();
		} catch (Exception exception) {
			exception.printStackTrace();
		}

		return rowUpdated;
	}
	

	
	
	public boolean changepassword(UserProfileStore userProfileStore) {
		boolean check = false;
		try (Connection connection = StoreDBConnection.openConnection();Statement  statement = connection
				.createStatement();) {
			ResultSet resultset = statement.executeQuery("SELECT `password` FROM `softdoc_staff` WHERE id='" +userProfileStore.getId() + "'");
			if (resultset.next()) {
			
			    String password = resultset.getString("password");
				if (password.equals(userProfileStore.getPassword())) {
				   String confirm = userProfileStore.getConfirm();
				    try (PreparedStatement preparedStatement = connection
							.prepareStatement("UPDATE `softdoc_staff` SET `password` ='" + confirm + "' WHERE `id`='"
									+userProfileStore.getId() + "' and role='store'");) {
						check = preparedStatement.executeUpdate() > 0;
						if (check) {
							StoreLogfile logfile = new StoreLogfile();
							logfile.logfile(userProfileStore.getEmail(), "Change password by subadmin store", userProfileStore.getId(), "store");

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
  
	
	
	public boolean uploadphoto(UserProfileStore UserProfileStore) {
		boolean check=false;
		try (Connection connection = StoreDBConnection.openConnection();PreparedStatement preparedStatement = connection.prepareStatement(
				"UPDATE `softdoc_staff` SET `profile_photo`='"+UserProfileStore.getUpload()+"' WHERE `id`='"
						+ UserProfileStore.getId() + "' and `role`='store'");) {
					check = preparedStatement.executeUpdate()>0;
			if (check) {
				new Logfile().logfile(UserProfileStore.getEmail(), "subadmin store has been update photo", UserProfileStore.getId(), "store");
			}
		} catch (SQLException sqlexception) {
			sqlexception.getMessage();
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return check;
	}
	
	
	
	public boolean sendindexing(StoreFile storefile)
	{
		boolean check=false;
		String file_no=storefile.getFile_no();
		try(Connection connection = StoreDBConnection.openConnection();PreparedStatement preparedStatement = connection.prepareStatement("UPDATE document_info SET status = 'indexing' WHERE file_no ='"+file_no+"'");) 
		{
		    check = preparedStatement.executeUpdate()>0;
		    if (check) {
				new Logfile().logfile(storefile.getEmail(), "subadmin store send to indexing Team", storefile.getId(), "store");
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
	
	
	
}