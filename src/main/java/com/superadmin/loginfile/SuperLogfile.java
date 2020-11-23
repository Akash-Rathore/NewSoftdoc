package com.superadmin.loginfile;
import java.sql.PreparedStatement;
import java.util.Calendar;

import com.superadmin.connection.DBConnection;

import java.net.InetAddress;
import java.sql.Connection;

public class SuperLogfile {

	
	
	   
	   
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
