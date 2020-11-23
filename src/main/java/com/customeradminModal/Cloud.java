package com.customeradminModal;

public class Cloud {
	
	private Integer id;
	private String email;
	private String file_no;
	private String file_name;
	private String created_no;
	private String document_no;
	private String document_type;
	private String department;
	private String size;
	private int customer_id;
	
	//this is for tracking purpose 
	private String pickup_date;
	private String pickup_from_no;
	private String tracking;
	//cloud date
	private String cloud_date;
	
	public Cloud(String email, int customer_id,String cloud_date) {
		this.email=email;
		this.customer_id=customer_id;
		this.cloud_date=cloud_date;
	}

	
	public Cloud(String email, int customer_id) {
		this.email=email;
		this.customer_id=customer_id;
	}
	
	public Cloud() {
		// TODO Auto-generated constructor stub
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getFile_no() {
		return file_no;
	}
	public void setFile_no(String file_no) {
		this.file_no = file_no;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getCreated_no() {
		return created_no;
	}
	public void setCreated_no(String created_no) {
		this.created_no = created_no;
	}
	public String getDocument_no() {
		return document_no;
	}
	public void setDocument_no(String document_no) {
		this.document_no = document_no;
	}
	public String getDocument_type() {
		return document_type;
	}
	public void setDocument_type(String document_type) {
		this.document_type = document_type;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
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
	public String getPickup_date() {
		return pickup_date;
	}
	public void setPickup_date(String pickup_date) {
		this.pickup_date = pickup_date;
	}
	public String getPickup_from_no() {
		return pickup_from_no;
	}
	public void setPickup_from_no(String pickup_from_no) {
		this.pickup_from_no = pickup_from_no;
	}
	public String getTracking() {
		return tracking;
	}
	
	public void setTracking(String tracking) {
		this.tracking = tracking;
	}
	
	public String getCloud_date() {
		return cloud_date;
	}
	
	public void setCloud_date(String cloud_date) {
		this.cloud_date = cloud_date;
	}
	
	
}
