package com.superadminModal;

public class FileNumber {

	private int id;
	private String email;
	private String FileNumber;
	
	
	public FileNumber(String FileNumber,String email,int id)
	{
		this.FileNumber=FileNumber;
		this.email=email;
		this.id=id;
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
	public String getFileNumber() {
		return FileNumber;
	}
	public void setFileNumber(String fileNumber) {
		FileNumber = fileNumber;
	}
	
}
