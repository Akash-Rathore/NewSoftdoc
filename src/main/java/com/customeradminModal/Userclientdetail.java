package com.customeradminModal;

public class Userclientdetail {
	
	
	
	    private int id;
	    private String username;
	    private String password;
	    private String name;
	    private String designation;
	    private int mobile;
	    private String email;
	    private String location;
	    private int customer_id;
	    private String created_on;
	    private String modified_on;
	    private String deleteViewEdit;
	    //This is for  clientdetail variable
	    private String softdocno;
		private String employeeid;
		private String joiningdate;
		private String activationdate;
		private String department;
		private String selectdepartment;
	    //password change 
		private String newpassword;
		private String confirm;
		private String sessionemail;
		private int sessionid;
		private String customer_name;
		private String industry;
		
		
		
		
		public Userclientdetail(String email,int customer_id)
		{
			this.email=email;
			this.customer_id=customer_id;
		}
		
		public Userclientdetail(String email,int customer_id,int id)
		{
			this.id=id;
			this.email=email;
			this.customer_id=customer_id;
		}
		
		public Userclientdetail(String softdocno,String employeeid,String name,String email,String joiningdate,String activationdate,String department,String designation,String location,String selectdepartment,int customer_id,String sessionemail,String customer_name,String industry)
		{
		    this.softdocno=softdocno;
		    this.employeeid=employeeid;
		    this.name=name;
		    this.email=email;
		    this.joiningdate=joiningdate;
		    this.activationdate=activationdate;
		    this.department=department;
		    this.designation=designation;
		    this.location=location;
		    this.selectdepartment=selectdepartment;
		    this.customer_id=customer_id;
			this.sessionemail=sessionemail;
			this.customer_name=customer_name;
			this.industry=industry;
	   }
		
	

		public Userclientdetail(int id,String softdocno,String employeeid,String name,String email,String joiningdate,String activationdate,String department,String designation,String location,String selectdepartment,String sessionemail,int sessionid)
		{
			this.id=id;
		    this.softdocno=softdocno;
		    this.employeeid=employeeid;
		    this.name=name;
		    this.email=email;
		    this.joiningdate=joiningdate;
		    this.activationdate=activationdate;
		    this.department=department;
		    this.designation=designation;
		    this.location=location;
		    this.selectdepartment=selectdepartment;
			this.sessionemail=sessionemail;
			this.sessionid=sessionid;
		}
	
		public Userclientdetail(int id,String sessionemail,int sessionid)
		{
			this.id=id;
			this.sessionemail=sessionemail;
			this.sessionid=sessionid;
		}
	


		public Userclientdetail() {
			// TODO Auto-generated constructor stub
		}



		public int getSessionid() {
			return sessionid;
		}



		public void setSessionid(int sessionid) {
			this.sessionid = sessionid;
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
		public int getMobile() {
			return mobile;
		}
		public void setMobile(int mobile) {
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

		public String getSelectdepartment() {
			// TODO Auto-generated method stub
			return selectdepartment;
		}
		public void setSelectdepartment(String selectdepartment) {
			this.selectdepartment = selectdepartment;
		}
		public int getCustomer_id() {
			return customer_id;
		}
		public void setCustomer_id(int customer_id) {
			this.customer_id = customer_id;
		}
		public String getSessionemail() {
			return sessionemail;
		}

		public void setSessionemail(String sessionemail) {
			this.sessionemail = sessionemail;
		}

		public String getCustomer_name() {
			return customer_name;
		}

		public void setCustomer_name(String customer_name) {
			this.customer_name = customer_name;
		}



		public String getCreated_on() {
			return created_on;
		}

		public void setCreated_on(String created_on) {
			this.created_on = created_on;
		}

		public String getModified_on() {
			return modified_on;
		}

		public void setModified_on(String modified_on) {
			this.modified_on = modified_on;
		}

		public String getDeleteViewEdit() {
			return deleteViewEdit;
		}

		public void setDeleteViewEdit(String deleteViewEdit) {
			this.deleteViewEdit = deleteViewEdit;
		}

		public String getIndustry() {
			return industry;
		}

		public void setIndustry(String industry) {
			this.industry = industry;
		}

		
		
}
