package com.softdoc.softdoc;

public class Picklogin {
	
	private int  id;
	private String  code;
	private String email;
	private String password;
	private String message;
	private String name;
	private String customer_id;
	
	
	
	public Picklogin()
	{
		
 	}
	public Picklogin(int id,String code)
	{
		this.id=id;
		this.code=code;
 	}
	public Picklogin(int id,String code,String message)
	{
		this.id=id;
		this.code=code;
		this.message=message;
 	}

	
	public Picklogin(int id,String code,String email,String message,String name,String customer_id)
	{
		this.id=id;
		this.code=code;
		this.email=email;
		this.message=message;
		this.name=name;
		this.customer_id=customer_id;
	}

	public Picklogin(int id,String code,String email,String message,String name)
	{
		this.id=id;
		this.code=code;
		this.email=email;
		this.message=message;
		this.name=name;
		
	}
	
	public Picklogin(String code,String message)
	{
		this.code=code;
		this.message=message;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	
	

}
