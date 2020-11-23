package com.uploadfile;

import com.google.cloud.storage.Acl;
import com.google.cloud.storage.Acl.Role;
import com.google.cloud.storage.Acl.User;
import com.google.cloud.storage.BlobId;
import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.joda.time.DateTime;
import org.joda.time.DateTimeZone;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

public class UploadFile {
	
	 private static Storage storage = null;

	  // [START init]
	  static{
	       
		  storage = StorageOptions.getDefaultInstance().getService();
	  }
	  // [END init]

	  // [START uploadFile]
	  public String uploadFile(Part filePart, final String bucketName) throws IOException {
		   
		   
		  
		    final String filespace = filePart.getSubmittedFileName();
		    String fileName = filespace.replaceAll("\\s", ""); 
		    //The InputStream is closed by default, so we don't need to close it here
		    //Read InputStream into a ByteArrayOutputStream.
		    InputStream is = filePart.getInputStream();
		    ByteArrayOutputStream os = new ByteArrayOutputStream();
		    byte[] readBuf = new byte[4096];
		    while (is.available() > 0) {
		     
		      int bytesRead = is.read(readBuf);
		      os.write(readBuf, 0, bytesRead);
		    
		    }
		     BlobInfo blobInfo =storage.create(BlobInfo.newBuilder(bucketName  ,  fileName).setAcl(new ArrayList<>(Arrays.asList(Acl.of(User.ofAllUsers(), Role.READER)))).build(),
		     os.toByteArray());
	        // return the public download link
		    return blobInfo.getMediaLink();
	  }
	  	
	  public String getImageUrl(HttpServletRequest req, HttpServletResponse resp, final String bucket) throws IOException, ServletException {
				
		      
		        Part filePart = req.getPart("attachment");
		        final String fileName = filePart.getSubmittedFileName();
				String imageUrl = req.getParameter("imageUrl");
				//Check extension of file
				if (fileName != null && !fileName.isEmpty() && fileName.contains(".")) {
				final String extension = fileName.substring(fileName.lastIndexOf('.') + 1);
				String[] allowedExt = {"jpg", "jpeg", "png", "gif", "pdf","doc","zip","ppt","xls"};
				for (String s : allowedExt) {
				if (extension.equals(s)){
				   
					return this.uploadFile(filePart, bucket);
				
				}
			 }
			   throw new ServletException("file must be an image");
		  }
				return imageUrl;
	   }
               //[END getImageUrl]
}    


