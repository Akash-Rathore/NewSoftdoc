package com.customeradmin.email;

import java.sql.PreparedStatement;
import java.util.Calendar;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.net.URL;
import java.sql.Connection;
import com.customeradmin.connection.DBConnection;
import com.kenai.jffi.Closure.Buffer;

public class Logfile {

	
	
	   
	   
	  	public void logfile(String email,String action,int user_id,String role)
	   { 
	  		 //loginTime
	 	   long timeNow = Calendar.getInstance().getTimeInMillis();
	 	   java.sql.Timestamp timestamp = new java.sql.Timestamp(timeNow);

          try{
        	  
        	  
        	   URL url_name=new URL("https://softdoc-262410.appspot.com");
        	   BufferedReader sc=new BufferedReader(new InputStreamReader(url_name.openStream()));
        	   String ip=sc.readLine().trim();
        	   
        	   //IP address of system 
     	       InetAddress localhost = InetAddress.getLocalHost(); 
     	       Connection connection=DBConnection.openConnection();
     	       PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO `logfile`(`loginid`, `ip`, `logintime`, `action`, `user_id`, `role`) VALUES ('"+email+"','"+localhost.getHostAddress()+"','"+timestamp+"','"+action+"','"+user_id+"','"+role+"')");
        	   int logfile=preparedStatement.executeUpdate();
        	   
        	
         }
        catch(Exception exception)
        {
           System.out.println("error message in profile");	
        }
	}
	
}
