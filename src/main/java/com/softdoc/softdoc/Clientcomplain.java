package com.softdoc.softdoc;

public class Clientcomplain {

	private Integer id;
	private String complain_id;
	private String comment;
	private String status;
	private String code;
	private String message;
	private String name;
	private String department;
	private String username;
	private String attachement;
	private String title;
	private String description;
	private String documentnumberref;
	private String category;
	private String customer_id;
	
	
	public Clientcomplain()
	{
		
	}
	
	public Clientcomplain(String code,String message)
	{
        this.code=code;
        this.message=message;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getComplain_id() {
		return complain_id;
	}
	public void setComplain_id(String complain_id) {
		this.complain_id = complain_id;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAttachement() {
		return attachement;
	}
	public void setAttachement(String attachement) {
		this.attachement = attachement;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDocumentnumberref() {
		return documentnumberref;
	}
	public void setDocumentnumberref(String documentnumberref) {
		this.documentnumberref = documentnumberref;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}

	public String getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	
	
}
