package com.customeradmin.connection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class DBConnection 
{ 
    private static final String url ="jdbc:mysql://localhost:3306/softdoc";
    private static final String driver ="com.mysql.jdbc.Driver";
	private static final String username ="root";
	private static final String password="";
	private static Connection connection = null;
	
		public static Connection openConnection() 
		{
		
		
            try 
            {
            	Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection("jdbc:mysql:///softdoc?cloudSqlInstance=softdoc-262410:asia-northeast1:softdocsql&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false&user=root&password=softdoc123");
            
            
            }
            catch (ClassNotFoundException e)
            {
                e.printStackTrace();
            }
            catch (SQLException e) {
                e.printStackTrace();
            } 
            return connection;
        } 
	
}
