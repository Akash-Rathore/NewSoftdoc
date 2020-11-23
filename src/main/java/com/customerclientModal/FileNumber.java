package com.customerclientModal;

public class FileNumber{
	 
	private  String filenoOfClient ;
	private  String filename ;
	private  String description ; 
	private  String department ;
	private int id;
	private String email;
	private int customer_id;
	private String client_name;
	private String folder_name;
	private String folder_description;
	private String folder_user_name;
	private String folder_access_level;
    private Integer document_info_id;	
	
	
	public FileNumber(){
		
	}
	
    public FileNumber(int id , String email , String client_name , String folder_name , int customer_id,String folder_user_name,String folder_access_level,Integer document_info_id){
    	
    	this.id=id;
    	this.email=email;
    	this.client_name=client_name;
    	this.folder_name=folder_name;
    	this.customer_id=customer_id;
    	this.folder_user_name=folder_user_name;
    	this.folder_access_level=folder_access_level;
    	this.document_info_id=document_info_id;
   	    
	}
    
    
    
    public FileNumber(int id , String email , String client_name , String folder_name , int customer_id){
    	
    	this.id=id;
    	this.email=email;
    	this.client_name=client_name;
    	this.folder_name=folder_name;
    	this.customer_id=customer_id;
    	
	}
    
	
    public	FileNumber(String filenoOfClient , String filename,String description,String department,int id,String email,int customer_id,String client_name){
		
		this.filenoOfClient=filenoOfClient;
		this.filename=filename;
		this.description=description;
		this.department=department;
		this.id=id;
		this.email=email;
		this.customer_id=customer_id;
		this.client_name=client_name;
	}
	
	public String getFilenoOfClient() {
		return filenoOfClient;
	}
	public void setFilenoOfClient(String filenoOfClient) {
		this.filenoOfClient = filenoOfClient;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
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

	public int getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}

	public String getClient_name() {
		return client_name;
	}

	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}

	public String getFolder_name() {
		return folder_name;
	}

	public void setFolder_name(String folder_name) {
		this.folder_name = folder_name;
	}

	public String getFolder_description() {
		return folder_description;
	}

	public void setFolder_description(String folder_description) {
		this.folder_description = folder_description;
	}

	public String getFolder_user_name() {
		return folder_user_name;
	}

	public void setFolder_user_name(String folder_user_name) {
		this.folder_user_name = folder_user_name;
	}


	public Integer getDocument_info_id() {
		return document_info_id;
	}

	public void setDocument_info_id(Integer document_info_id) {
		this.document_info_id = document_info_id;
	}

	public String getFolder_access_level() {
		return folder_access_level;
	}

	public void setFolder_access_level(String folder_access_level) {
		this.folder_access_level = folder_access_level;
	}

   
	
	
	
}