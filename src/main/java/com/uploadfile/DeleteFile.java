package com.uploadfile;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.Part;

import org.joda.time.DateTime;
import org.joda.time.DateTimeZone;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import com.google.cloud.storage.Acl;
import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;
import com.google.cloud.storage.Acl.Role;
import com.google.cloud.storage.Acl.User;
import com.google.cloud.storage.BlobId;

public class DeleteFile {

	 private static Storage storage = null;

	  // [START init]
	  static{
	       
		  storage = StorageOptions.getDefaultInstance().getService();
	  }
	  // [END init]
	 
	  //=============================Delete File from bucket inside of gcloud===================================
	  public boolean deletefile_name(String bucketName,String file) throws IOException {
		   
		     File file_path = new File(file);
		     String fileName=file_path.getName();
		     String file_name="";
		     for (int i=0; i<=fileName.length()-1; i++) {  
	            
	        	if(fileName.charAt(i) == '?') { 
	            
	        		 break;
	            
	        	}
	            else
	            {
	            	 file_name +=fileName.charAt(i);
	            }
	       }  
		    
		    BlobId b = BlobId.of(bucketName, file_name);
		    boolean deleted = storage.delete(b);
	        return deleted;
	  }
	
	//=============================Delete File from bucket inside of gcloud===================================
	
}
