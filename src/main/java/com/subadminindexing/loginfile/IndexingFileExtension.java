package com.subadminindexing.loginfile;

import java.io.File;

public class IndexingFileExtension {
	
	
	   public  String getFileExtension(File file) {
	        String extension = "";
	 
	        try {
	            if (file != null && file.exists()) {
	                String name = file.getName();
	                extension = name.substring(name.lastIndexOf("."));
	            }
	        } catch (Exception e) {
	            extension = "";
	        }
	 
	        return extension;
	 
	    }

}
