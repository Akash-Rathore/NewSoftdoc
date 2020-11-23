package com.subadminstoreModal;

public class StoreFile {

	private int id;
	private String email;
	private String file_no;
	
	public StoreFile(int id,String email,String file_no)
	{
		this.id=id;
		this.email=email;
		this.file_no=file_no;
		
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
	public String getFile_no() {
		return file_no;
	}
	public void setFile_no(String file_no) {
		this.file_no = file_no;
	}
	
	
}
