package com.subadminqualityDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import com.softdocadmin.email.Logfile;
import com.softdocindexing.connection.IndexingDBConnection;
import com.subadminindexing.loginfile.IndexingLogfile;
import com.subadminindexingModal.IndexingUserProfile;
import com.subadminquality.connection.QualityDBConnection;
import com.subadminquality.loginfile.QualityLogfile;
import com.subadminqualityModal.Quality;
import com.subadminqualityModal.QualityUserProfile;
import com.subadminstoreModal.UserProfileStore;

public class QualitySubadminStoreDAO {

	Connection connection;

	public QualitySubadminStoreDAO() {
		connection = QualityDBConnection.openConnection();
	}

	
	public int updateprofile(QualityUserProfile user) {
		int rowUpdated = 0;
		String email = user.getEmail();
		try (Connection connection = QualityDBConnection.openConnection();PreparedStatement preparedStatement = connection.prepareStatement(
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
				 QualityLogfile logfile=new QualityLogfile();
       	         logfile.logfile(email,"Subadmin Quality has been update profile",user.getId(),"quality");
			}  
		} catch (SQLException sqlexception) {
			sqlexception.getMessage();
		} catch (Exception exception) {
			exception.printStackTrace();
		}

		return rowUpdated;
	}
	

	
	
	
	
	public boolean qualityquestion(Quality quality)
	{
		boolean check=false;
		
		String file_no=quality.getFile_no();
		String document_no=quality.getDocument_no();
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate localDate = LocalDate.now();
	    //dtf.format(localDate)
	    
		
		
		try (Connection connection = QualityDBConnection.openConnection();PreparedStatement preparedStatement = connection.prepareStatement("UPDATE `document_info` SET `questionone`=?,`questiontwo`=?,`questionthree`=?,`status`=?,`remarks`=? , history_quality='history_quality' , approved_date='"+dtf.format(localDate)+"'  WHERE `document_no`='"+document_no+"' and file_no='"+file_no+"'")) 
	    {
		     preparedStatement.setString(1,quality.getQuestone());
		     preparedStatement.setString(2,quality.getQuesttwo());
		     preparedStatement.setString(3,quality.getQuestthree());
		     preparedStatement.setString(4,quality.getStatus());
		     preparedStatement.setString(5,quality.getRemarks());
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
	
	
	
	
	public boolean changepassword(QualityUserProfile qualityUserProfile) {
		boolean check = false;
		try (Connection connection = IndexingDBConnection.openConnection();Statement  statement = connection
				.createStatement();) {
			ResultSet resultset = statement.executeQuery("SELECT `password` FROM `softdoc_staff` WHERE id='" +qualityUserProfile.getId() + "'");
			if (resultset.next()) {
			
			    String password = resultset.getString("password");
				if (password.equals(qualityUserProfile.getPassword())) {
				   String confirm = qualityUserProfile.getConfirm();
				    try (Connection connect = IndexingDBConnection.openConnection();PreparedStatement preparedStatement = connect
							.prepareStatement("UPDATE `softdoc_staff` SET `password` ='" + confirm + "' WHERE `id`='"
									+qualityUserProfile.getId() + "' and role='quality'");) {
						check = preparedStatement.executeUpdate() > 0;
						if (check) {
							
			       	         QualityLogfile logfile=new QualityLogfile();
			       	         logfile.logfile(qualityUserProfile.getEmail(),"Subadmin Quality change password",qualityUserProfile.getId(),"quality");
						
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
	
	
	
	
	public boolean uploadphoto(QualityUserProfile qualityUserProfile) {
		boolean check=false;
		
		
		try (Connection connection = QualityDBConnection.openConnection();PreparedStatement preparedStatement = connection.prepareStatement(
				"UPDATE `softdoc_staff` SET `profile_photo`='"+qualityUserProfile.getUpload()+"' WHERE `id`='"
						+ qualityUserProfile.getId() + "' and `role`='quality'");) {
					check = preparedStatement.executeUpdate()>0;
			if (check) {
				new Logfile().logfile(qualityUserProfile.getEmail(), "subadmin quality has been update photo", qualityUserProfile.getId(), "quality");
			}
		} catch (SQLException sqlexception) {
			sqlexception.getMessage();
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return check;
	}
	
}