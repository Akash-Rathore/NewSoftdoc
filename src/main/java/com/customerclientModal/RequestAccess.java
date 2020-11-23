package com.customerclientModal;

public class RequestAccess {
	
	private  Integer id;
	private  Integer document_info_id;
	private  String access_level;
	private Integer client_id;
	private String email;
	private  String file_name;
	private String department;
	private String upload_date;
	private String client_name; 
	private String access_level_dept;
	private String details;
	private String request_date;
	private String employee_name;
	private String employee_email_id;
	private String request_type;
	private String approval_status;
	private String remarks;
	private String status;

	
	
	public RequestAccess(Integer client_id, String email ,Integer id, String reject_remarks,String status) {
		
		this.client_id=client_id;
		this.email=email;
		this.id=id;
		this.remarks=reject_remarks;
		this.status=status;
		
		
	}

	
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public RequestAccess(Integer client_id,Integer document_info_id,String access_level,String email) {
		
		this.client_id=client_id;
		this.document_info_id=document_info_id;
		this.access_level=access_level;
		this.email=email;
		
	}

     public RequestAccess(Integer document_info_id , String email ,Integer client_id ) {
		
		this.document_info_id=document_info_id;
		this.client_id=client_id;
		this.email=email;
		
	}
	
    public RequestAccess(Integer client_id , String access_level , String email) {
		
		this.client_id=client_id;
		this.access_level=access_level;
		this.email=email;
		
	}
    
    public RequestAccess(Integer id, Integer client_id , String email) {
		
    	this.id=id;
  		this.client_id=client_id;
  		this.email=email;
  		
  	}

    
     public RequestAccess(Integer client_id , String email) {
		
    	this.client_id=client_id;
  		this.email=email;
  		
  	}
    
	public RequestAccess() {
		// TODO Auto-generated constructor stub
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public Integer getDocument_info_id() {
		return document_info_id;
	}


	public void setDocument_info_id(Integer document_info_id) {
		this.document_info_id = document_info_id;
	}


	public String getAccess_level() {
		return access_level;
	}


	public void setAccess_level(String access_level) {
		this.access_level = access_level;
	}


	public Integer getClient_id() {
		return client_id;
	}


	public void setClient_id(Integer client_id) {
		this.client_id = client_id;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getUpload_date() {
		return upload_date;
	}

	public void setUpload_date(String upload_date) {
		this.upload_date = upload_date;
	}

	public String getClient_name() {
		return client_name;
	}

	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}

	public String getAccess_level_dept() {
		return access_level_dept;
	}

	public void setAccess_level_dept(String access_level_dept) {
		this.access_level_dept = access_level_dept;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public String getRequest_date() {
		return request_date;
	}

	public void setRequest_date(String request_date) {
		this.request_date = request_date;
	}

	public String getEmployee_name() {
		return employee_name;
	}

	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}

	public String getEmployee_email_id() {
		return employee_email_id;
	}

	public void setEmployee_email_id(String employee_email_id) {
		this.employee_email_id = employee_email_id;
	}

	public String getRequest_type() {
		return request_type;
	}

	public void setRequest_type(String request_type) {
		this.request_type = request_type;
	}

	public String getApproval_status() {
		return approval_status;
	}

	public void setApproval_status(String approval_status) {
		this.approval_status = approval_status;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	
	

}
