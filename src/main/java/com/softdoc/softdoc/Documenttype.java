package com.softdoc.softdoc;

public class Documenttype {

	private String documenttype;
	private String documenttype1;
	
	private String code;
	private String message;
	private String department;
	
	public Documenttype()
	{
		
	}
	public Documenttype(String documenttype,String code,String message)
	{
		this.documenttype=documenttype;
		this.code=code;
		this.message=message;
		
	}
	public Documenttype(String documenttype,String documenttype1,String code,String message)
	{
		this.documenttype=documenttype;
		this.documenttype1=documenttype1;
		this.code=code;
		this.message=message;
	}
	
	public String getDocumenttype() {
		return documenttype;
	}
	public void setDocumenttype(String documenttype) {
		this.documenttype = documenttype;
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
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}

	public String getDocumenttype1() {
		return documenttype1;
	}

	public void setDocumenttype1(String documenttype1) {
		this.documenttype1 = documenttype1;
	}
	
	
	
}
