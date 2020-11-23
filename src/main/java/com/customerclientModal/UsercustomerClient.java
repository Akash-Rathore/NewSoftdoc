package com.customerclientModal;

public class UsercustomerClient {
	
	    private Integer id;
	    private String username;
	    private String password;
	    private String name;
	    private String designation;
	    private String mobile;
	    private String email;
	    private String location;
	    //password change 
		private String newpassword;
		private String confirm;
		private String upload;
		private String access_info;
		private String department;
		private Integer customer_id;
		private String search_box;
		private String role;
		
		
		
	
		public UsercustomerClient() {
			
	 
	   }
		
		public UsercustomerClient( String email, int customer_id , int id) {
	
			    this.id = id;
				this.email = email;
				this.customer_id=customer_id;
		 
		 }
	
		public UsercustomerClient(String email, int customer_id , int id,String search_box) {
			
		    this.id = id;
			this.email = email;
			this.customer_id=customer_id;
			this.search_box=search_box;
	 
	  }
		
		 public UsercustomerClient(int id, String email,String upload) {
				
				this.id = id;
				this.email = email;
				this.upload=upload;
		 	}
			
		
		 public UsercustomerClient(String username,String password,String name,String designation,String mobile,String email,String location,int id,String access_info)
		 {
			this.username=username;
			this.password=password;
			this.name=name;
			this.designation=designation;
			this.mobile=mobile;
			this.email=email;
			this.location=location;
			this.id=id;
			this.access_info=access_info;
	    }
		 
		 
		 public UsercustomerClient(String password,String newpassword,String confirm,String email,int id)
		  {
		  	 this.password=password;
		  	 this.newpassword=newpassword;
		  	 this.confirm=confirm;
		  	 this.email=email;
		  	 this.id=id;
		  } 
		 
		
		
		

		public String getMobile() {
			return mobile;
		}


		public void setMobile(String mobile) {
			this.mobile = mobile;
		}


		
		public Integer getId() {
			return id;
		}

		public void setId(Integer id) {
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
		public String getUpload() {
			return upload;
		}
		public void setUpload(String upload) {
			this.upload = upload;
		}

		public String getAccess_info() {
			return access_info;
		}

		public void setAccess_info(String access_info) {
			this.access_info = access_info;
		}

		public String getDepartment() {
			return department;
		}

		public void setDepartment(String department) {
			this.department = department;
		}

		public Integer getCustomer_id() {
			return customer_id;
		}

		public void setCustomer_id(Integer customer_id) {
			this.customer_id = customer_id;
		}

		public String getSearch_box() {
			return search_box;
		}

		public void setSearch_box(String search_box) {
			this.search_box = search_box;
		}

		public String getRole() {
			return role;
		}

		public void setRole(String role) {
			this.role = role;
		}

	

		
		
}
