package com.customeradmin.email;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Calendar;

import com.customeradmin.connection.DBConnection;

public class Logfile3 {

	
	public void logfile(int user_id , int company_id , String email , String action ,String role,String filenumber,String document_no)
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
	       PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO logfile(loginid, ip , logintime , action ,  user_id ,  role , company_id ,  file_no, document_no) VALUES ('"+email+"','"+localhost.getHostAddress()+"','"+timestamp+"','"+action+"','"+user_id+"','"+role+"','"+company_id+"','"+filenumber+"','"+document_no+"')");
  	       
	       
	       
	       int logfile=preparedStatement.executeUpdate();
  	       System.out.println(logfile);
  	   
  	
		   }
		  catch(Exception exception)
		  {
		     System.out.println("error message in");	
		  }

	   }
	
	
	
}
