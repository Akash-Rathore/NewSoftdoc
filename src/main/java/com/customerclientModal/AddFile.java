package com.customerclientModal;

public class AddFile {

	private Integer id;
	private Integer client_id;
	private String client_email;
	private Integer customer_id;
	private String file_name;
	private String file_department;
	private String file_description;
	private String file_access_level;
	private String file_user_name_id;
	private String action;
	private String detail;
	private Integer document_info_id;
	private String client_name;
	
	
	public AddFile(Integer client_id , String client_email, Integer customer_id , String file_name , String file_department , String file_description , String file_access_level , String file_user_name_id,String client_name)
	{
		
		this.client_id=client_id;
		this.client_email=client_email;
		this.customer_id=customer_id;
		this.file_name=file_name;
		this.file_department=file_department;
		this.file_description=file_description;
		this.file_access_level=file_access_level;
		this.file_user_name_id=file_user_name_id;
		this.client_name=client_name;
		
	}
	
	public AddFile(String file_name , String file_description , String file_access_level , String file_user_name_id , Integer document_info_id , Integer client_id , String client_name)
	{
		
		this.file_name=file_name;
		this.file_description=file_description;
		this.file_access_level=file_access_level;
		this.file_user_name_id=file_user_name_id;
		this.document_info_id=document_info_id;
		this.client_id=client_id;
		this.client_name=client_name;
	}
	
	
	
	public AddFile(Integer client_id , String client_email, Integer customer_id  , String file_access_level , String file_user_name_id,String client_name ,Integer document_info_id)
	{
		
		this.client_id=client_id;
		this.client_email=client_email;
		this.customer_id=customer_id;
		this.file_access_level=file_access_level;
		this.file_user_name_id=file_user_name_id;
		this.client_name=client_name;
		this.document_info_id=document_info_id;
		
	}
	
	
	public AddFile(Integer id,String client_email,Integer customer_id,String file_department) {
	
		this.id=id;
		this.client_email=client_email;
		this.customer_id=customer_id;
		this.file_department=file_department;
		
	}

	public AddFile() {
		// TODO Auto-generated constructor stub
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getClient_id() {
		return client_id;
	}
	public void setClient_id(Integer client_id) {
		this.client_id = client_id;
	}
	public String getClient_email() {
		return client_email;
	}
	public void setClient_email(String client_email) {
		this.client_email = client_email;
	}
	public Integer getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(Integer customer_id) {
		this.customer_id = customer_id;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getFile_department() {
		return file_department;
	}
	public void setFile_department(String file_department) {
		this.file_department = file_department;
	}
	public String getFile_description() {
		return file_description;
	}
	public void setFile_description(String file_description) {
		this.file_description = file_description;
	}
	public String getFile_access_level() {
		return file_access_level;
	}
	public void setFile_access_level(String file_access_level) {
		this.file_access_level = file_access_level;
	}
	

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getFile_user_name_id() {
		return file_user_name_id;
	}

	public void setFile_user_name_id(String file_user_name_id) {
		this.file_user_name_id = file_user_name_id;
	}

	

	public String getClient_name() {
		return client_name;
	}

	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}

	public Integer getDocument_info_id() {
		return document_info_id;
	}

	public void setDocument_info_id(Integer document_info_id) {
		this.document_info_id = document_info_id;
	}

	
	
	
	
	
}
