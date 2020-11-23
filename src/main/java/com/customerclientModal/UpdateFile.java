package com.customerclientModal;

public class UpdateFile {

	private int id;
	private String email;
	private String document_id;
	private String FileName;
	private String FileDescribtion;
	private String folderName;
	private String folderDescription;
	private Integer document_info_id;
	private String access_level;
	private String file_user_name;
	
	public UpdateFile() {
		
		
	}
	
    public UpdateFile(int id,String email,String document_id,String FileName,String FileDescribtion) {
		
    	this.id=id;
    	this.email=email;
    	this.document_id=document_id;
    	this.FileName=FileName;
    	this.FileDescribtion=FileDescribtion;
		
	 }

     public UpdateFile(String email , Integer document_info_id , String folderName ,String access_level, String file_user_name) {
		
    	this.email=email;
        this.document_info_id=document_info_id;      	
    	this.folderName=folderName;
    	this.access_level=access_level;
    	this.file_user_name=file_user_name;
	
	 }
    
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDocument_id() {
		return document_id;
	}

	public void setDocument_id(String document_id) {
		this.document_id = document_id;
	}

	public String getFileName() {
		return FileName;
	}

	public void setFileName(String fileName) {
		FileName = fileName;
	}

	public String getFileDescribtion() {
		return FileDescribtion;
	}

	public void setFileDescribtion(String fileDescribtion) {
		FileDescribtion = fileDescribtion;
	}

	public String getFolderName() {
		return folderName;
	}

	public void setFolderName(String folderName) {
		this.folderName = folderName;
	}

	public String getFolderDescription() {
		return folderDescription;
	}

	public void setFolderDescription(String folderDescription) {
		this.folderDescription = folderDescription;
	}

	public Integer getDocument_info_id() {
		return document_info_id;
	}

	public void setDocument_info_id(Integer document_info_id) {
		this.document_info_id = document_info_id;
	}

	

	public String getFile_user_name() {
		return file_user_name;
	}

	public void setFile_user_name(String file_user_name) {
		this.file_user_name = file_user_name;
	}

	public String getAccess_level() {
		return access_level;
	}

	public void setAccess_level(String access_level) {
		this.access_level = access_level;
	}
	
     
    
    
    }
