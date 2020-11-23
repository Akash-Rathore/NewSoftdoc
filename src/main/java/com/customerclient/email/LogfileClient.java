package com.customerclient.email;

import java.sql.PreparedStatement;
import java.util.Calendar;
import java.net.InetAddress;
import java.sql.Connection;
import com.customerclient.connection.DBConnection;

public class LogfileClient {

	
	
	   
	   
	  	public void logfile(String email,String action,int user_id,String role)
	   { 
	  		 //loginTime
	 	   long timeNow = Calendar.getInstance().getTimeInMillis();
	 	   java.sql.Timestamp timestamp = new java.sql.Timestamp(timeNow);

          try{
        	   //IP address of system 
     	       InetAddress localhost = InetAddress.getLocalHost(); 
     	       Connection connection=DBConnection.openConnection();
        	   PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO `logfile`(`loginid`, `ip`, `logintime`, `action`, `user_id`, `role`) VALUES ('"+email+"','"+localhost.getHostAddress().trim()+"','"+timestamp+"','"+action+"','"+user_id+"','"+role+"')");
        	   int logfile=preparedStatement.executeUpdate();
        	   
        	
         }
        catch(Exception exception)
        {
           System.out.println("error message in profile");	
        }
	}
	
}
