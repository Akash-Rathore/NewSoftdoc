package com.softdoc.softdoc;

import java.util.List;

public class Login {

	private int id;
	private String name;
	private String mobile;
	private String softdoc_no;
	private String location;
    private String password;
    private String email;
    private String message;
    private String status;
    private String condition;
    
    
    
    
    public Login()
    {
    	
    }
    

    public Login(String email,String password)
    {
    	this.email=email;
    	this.password=password;
    }
    
    public Login(int id,String status,String message,String name,String email,String mobile,String softdoc_no,String location)
    {
    	this.id=id;
    	this.status=status;
    	this.message=message;
    	this.name=name;
    	this.email=email;
    	this.mobile=mobile;
    	this.softdoc_no=softdoc_no;
    	this.location=location;
    	
    }
    
    public Login(int id,String status,String message)
    {
    	this.id=id;
    	this.status=status;
    	this.message=message;
    }
    
    
    public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;

	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
   
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
    
	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getSoftdoc_no() {
		return softdoc_no;
	}

	public void setSoftdoc_no(String softdoc_no) {
		this.softdoc_no = softdoc_no;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	@Override
	public String toString() {
		return "Login [name=" + name + ", password=" + password + ", email=" + email + "]";
	}

	

	
	
}
