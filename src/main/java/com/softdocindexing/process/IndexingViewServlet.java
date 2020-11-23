package com.softdocindexing.process;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class IndexingViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public IndexingViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 	
		 String upload=request.getParameter("path");
	     //getContentType of file
		 Path source = Paths.get(upload);
	     response.setContentType("text/html");  
	     PrintWriter out = response.getWriter(); 
	     File f=new File(upload);
		 String filename =f.getName();
		// String filepath = "";//C:/images/   
		 String name =f.getName().substring(f.getName().lastIndexOf("/") + 1,f.getName().length());
		 response.setContentType(Files.probeContentType(source));
		 response.setHeader("Content-Disposition","inline; filename=\"" + filename + "\"");
	     FileInputStream fileInputStream = new FileInputStream(upload);  
		 int i;   
		 while ((i=fileInputStream.read()) != -1) {  
		   out.write(i);   
		 }   
		 fileInputStream.close();   
	   	 out.close();
     }
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    doGet(request, response);
	}

}
