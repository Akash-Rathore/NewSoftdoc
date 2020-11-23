package com.customerclientModal;

public class Briefcase {

	private Integer id;
	private String email;
	private String upload;
	private String upload_date;
	private String details;
	private String delete_checkbox;
	private Integer client_id;
	private double size;
	
	public Briefcase() {
		
	}
	
    public Briefcase(Integer id , String email) {
    	this.id=id;
    	this.email=email;
    }
	
      public Briefcase(Integer id , String email , Integer client_id ){
	
    	this.id=id;
    	this.email=email;
    	this.client_id=client_id;
   
      }
    
    public Briefcase(Integer id , String email , String upload, double size){
		
    	this.id=id;
    	this.email=email;
    	this.upload=upload;
    	this.size=size;
    	
	}
	

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUpload() {
		return upload;
	}
	public void setUpload(String upload) {
		this.upload = upload;
	}
	public String getUpload_date() {
		return upload_date;
	}
	public void setUpload_date(String upload_date) {
		this.upload_date = upload_date;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public String getDelete_checkbox() {
		return delete_checkbox;
	}

	public void setDelete_checkbox(String delete_checkbox) {
		this.delete_checkbox = delete_checkbox;
	}

	public Integer getClient_id() {
		return client_id;
	}

	public void setClient_id(Integer client_id) {
		this.client_id = client_id;
	}

	public double getSize() {
		return size;
	}

	public void setSize(double size) {
		this.size = size;
	}
	
	
	
	
}
