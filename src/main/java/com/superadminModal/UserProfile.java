package com.superadminModal;

public class UserProfile {
	protected int id;
	protected String username;
	protected String password;
	protected String name;
	protected String designation;
	protected long mobile;
	protected String email;
	protected String location;
	// This is for subadmine variable
	protected String softdocno;
	protected String employeeid;
	protected String joiningdate;
	protected String activationdate;
	protected String department;
	protected String role;
	// password change
	protected String newpassword;
	protected String confirm;
	protected String upload;

	public UserProfile() {

	}

	 public UserProfile(int id, String email,String upload) {
			
			this.id = id;
			this.email = email;
			this.upload=upload;
	 	}
	
	public UserProfile(String email, String password) {
		this.email = email;
		this.password = password;
	}

	public UserProfile(int id) {
		this.id = id;
	}

	public UserProfile(String password, String confirm, String email,int id) {
		
		this.password = password;
		this.confirm = confirm;
		this.email = email;
		this.id=id;
	}

	public String getNewpassword() {
		return newpassword;
	}

	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}

	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}

	public UserProfile(String softdocnum, String employeeid, String name, String email, long mobile, String joiningdate,
			String activationdate, String designation, String department, String role) {

		this.softdocno = softdocnum;
		this.employeeid = employeeid;
		this.name = name;
		this.email = email;
		this.mobile = mobile;
		this.joiningdate = joiningdate;
		this.activationdate = activationdate;
		this.designation = designation;
		this.department = department;
		this.role = role;
	}

	public UserProfile(int id, String softdocnum, String employeeid, String name, String email, long mobile,
			String joiningdate, String activationdate, String designation, String department, String role) {

		this.id = id;
		this.softdocno = softdocnum;
		this.employeeid = employeeid;
		this.name = name;
		this.email = email;
		this.mobile = mobile;
		this.joiningdate = joiningdate;
		this.activationdate = activationdate;
		this.designation = designation;
		this.department = department;
		this.role = role;
	}

	public UserProfile(String username, String password, String name, String designation, long mobile, String email,
			String location,int id) {

		this.username = username;
		this.password = password;
		this.name = name;
		this.designation = designation;
		this.mobile = mobile;
		this.email = email;
		this.location = location;
		this.id=id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public long getMobile() {
		return mobile;
	}

	public void setMobile(long mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getSoftdocno() {
		return softdocno;
	}

	public void setSoftdocno(String softdocno) {
		this.softdocno = softdocno;
	}

	public String getEmployeeid() {
		return employeeid;
	}

	public void setEmployeeid(String employeeid) {
		this.employeeid = employeeid;
	}

	public String getJoiningdate() {
		return joiningdate;
	}

	public void setJoiningdate(String joiningdate) {
		this.joiningdate = joiningdate;
	}

	public String getActivationdate() {
		return activationdate;
	}

	public void setActivationdate(String activationdate) {
		this.activationdate = activationdate;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getUpload() {
		return upload;
	}

	public void setUpload(String upload) {
		this.upload = upload;
	}

}
