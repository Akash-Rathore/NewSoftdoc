package com.softdocadmin.loginService;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ViewServlet")
public class ViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 	
		 
		 String upload=request.getParameter("path");
		 
		 Path source = Paths.get(upload);
	     response.setContentType("text/html");  
	     PrintWriter out = response.getWriter(); 
	     File f=new File(upload);
		 String filename =f.getName();
		 String filepath = "C:/images/";   
		 String name =f.getName().substring(f.getName().lastIndexOf("/") + 1,f.getName().length());
		 response.setContentType(Files.probeContentType(source));
		 response.setHeader("Content-Disposition","inline; filename=\"" + filename + "\"");
	     FileInputStream fileInputStream = new FileInputStream(filepath + name);  
		 int i;   
		 while ((i=fileInputStream.read()) != -1) {  
		   out.write(i);   
		 }   
		 fileInputStream.close();   
	   	 out.close();
		 
		
	 }
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
