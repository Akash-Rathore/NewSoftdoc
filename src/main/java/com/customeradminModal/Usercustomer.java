package com.customeradminModal;

import com.customerclientModal.UsercustomerClient;

public class Usercustomer {
	private int id;
	private String customer_number;
	private String company_name;
	private String billing_address_first;
	private String billing_address_sec;
	private String city;
	private String state;
	private int pincode;
	private String company_pan;
	private String gstin;
	private String tan;
	private String type;
	private String industry;
	private String company_per_name;
	private String company_per_designation;
	private String company_per_email;
	private Long mobile;
	private String depart_info;
	private int dpi;
	private String colour;
	private String gst_certificate;
	private String pan;
	private String tan_att;
	private String signed_contract;
	private String questionnaire;
	private String others;

	private String username;
	private String location;
	private String password;
	// change password
	private String newpassword;
	private String confirm;
	private String email;
	private String upload;
	private int sessionid;
	private String pan_text;
	// update points
	private String serviceType;
	private String storageData;
	private String noOfUsers;
	private String planStarDate;
	private String planEndDate;
	private String subscription_type;
	private String cloud_size;
	private String totalUser;
	private String department_details;
	private int request_access_id;
	private String status;
	private String reject_remarks;
	private String name;
	private String search_box;
	
	// UsercustomerClient usercustomerClient=new UsercustomerClient(email,companyid ,id,search_box);
	 
	
	public Usercustomer(int id, String email) {

		this.id = id;
		this.email = email;
	}

	
	public Usercustomer(String email,int id,String search_box) {
		
		this.id = id;
		this.email = email;
		this.search_box=search_box;
	}
	
	
	public Usercustomer(int id , int request_access_id , String email ,String status ,String reject_remarks) {

		this.id = id;
		this.request_access_id=request_access_id;
		this.email = email;
		this.status=status;
		this.reject_remarks=reject_remarks;
	
	}
	
	public Usercustomer(int id , int request_access_id , String email) {

		this.id = id;
		this.request_access_id=request_access_id;
		this.email = email;
	
	}
	
	public String getTotalUser() {
		return totalUser;
	}

	public void setTotalUser(String totalUser) {
		this.totalUser = totalUser;
	}

	public Usercustomer(int id, String email, String upload) {

		this.id = id;
		this.email = email;
		this.upload = upload;
	}

	public Usercustomer(int id, String email, int sessionid) {

		this.id = id;
		this.email = email;
		this.sessionid = sessionid;
	}

	public Usercustomer(String password, String newpassword, String confirm, String company_per_email, int id) {
		this.password = password;
		this.newpassword = newpassword;
		this.confirm = confirm;
		this.company_per_email = company_per_email;
		this.id = id;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Usercustomer(String gst_certificate, String pan, String tan_att, String signed_contract,
			String questionnaire, String others) {
		this.gst_certificate = gst_certificate;
		this.pan = pan;
		this.tan_att = tan_att;
		this.signed_contract = signed_contract;
		this.questionnaire = questionnaire;
		this.others = others;
	}

	public Usercustomer(String username, String password, String company_per_name, String company_per_designation,
			Long mobile, String company_per_email, String location, int id) {
		this.username = username;
		this.password = password;
		this.company_per_name = company_per_name;
		this.company_per_designation = company_per_designation;
		this.mobile = mobile;
		this.company_per_email = company_per_email;
		this.location = location;
		this.id = id;
	}

	

	public Usercustomer() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCustomer_number() {
		return customer_number;
	}

	public void setCustomer_number(String customer_number) {
		this.customer_number = customer_number;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getBilling_address_first() {
		return billing_address_first;
	}

	public void setBilling_address_first(String billing_address_first) {
		this.billing_address_first = billing_address_first;
	}

	public String getBilling_address_sec() {
		return billing_address_sec;
	}

	public void setBilling_address_sec(String billing_address_sec) {
		this.billing_address_sec = billing_address_sec;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getPincode() {
		return pincode;
	}

	public void setPincode(int pincode) {
		this.pincode = pincode;
	}

	public String getCompany_pan() {
		return company_pan;
	}

	public void setCompany_pan(String company_pan) {
		this.company_pan = company_pan;
	}

	public String getGstin() {
		return gstin;
	}

	public void setGstin(String gstin) {
		this.gstin = gstin;
	}

	public String getTan() {
		return tan;
	}

	public void setTan(String tan) {
		this.tan = tan;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getIndustry() {
		return industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}

	public String getCompany_per_name() {
		return company_per_name;
	}

	public void setCompany_per_name(String company_per_name) {
		this.company_per_name = company_per_name;
	}

	public String getCompany_per_designation() {
		return company_per_designation;
	}

	public void setCompany_per_designation(String company_per_designation) {
		this.company_per_designation = company_per_designation;
	}

	public String getCompany_per_email() {
		return company_per_email;
	}

	public void setCompany_per_email(String company_per_email) {
		this.company_per_email = company_per_email;
	}

	public Long getMobile() {
		return mobile;
	}

	public void setMobile(Long mobile) {
		this.mobile = mobile;
	}

	public String getDepart_info() {
		return depart_info;
	}

	public void setDepart_info(String depart_info) {
		this.depart_info = depart_info;
	}

	public int getDpi() {
		return dpi;
	}

	public void setDpi(int dpi) {
		this.dpi = dpi;
	}

	public String getColour() {
		return colour;
	}

	public void setColour(String colour) {
		this.colour = colour;
	}

	public String getGst_certificate() {
		return gst_certificate;
	}

	public void setGst_certificate(String gst_certificate) {
		this.gst_certificate = gst_certificate;
	}

	public String getPan() {
		return pan;
	}

	public void setPan(String pan) {
		this.pan = pan;
	}

	public String getTan_att() {
		return tan_att;
	}

	public void setTan_att(String tan_att) {
		this.tan_att = tan_att;
	}

	public String getSigned_contract() {
		return signed_contract;
	}

	public void setSigned_contract(String signed_contract) {
		this.signed_contract = signed_contract;
	}

	public String getQuestionnaire() {
		return questionnaire;
	}

	public void setQuestionnaire(String questionnaire) {
		this.questionnaire = questionnaire;
	}

	public String getOthers() {
		return others;
	}

	public void setOthers(String others) {
		this.others = others;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUpload() {
		return upload;
	}

	public void setUpload(String upload) {
		this.upload = upload;
	}

	public int getSessionid() {
		return sessionid;
	}

	public void setSessionid(int sessionid) {
		this.sessionid = sessionid;
	}

	public String getServiceType() {
		return serviceType;
	}

	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}

	public String getStorageData() {
		return storageData;
	}

	public void setStorageData(String storageData) {
		this.storageData = storageData;
	}

	public String getNoOfUsers() {
		return noOfUsers;
	}

	public void setNoOfUsers(String noOfUsers) {
		this.noOfUsers = noOfUsers;
	}

	public String getPlanStarDate() {
		return planStarDate;
	}

	public void setPlanStarDate(String planStarDate) {
		this.planStarDate = planStarDate;
	}

	public String getPlanEndDate() {
		return planEndDate;
	}

	public void setPlanEndDate(String planEndDate) {
		this.planEndDate = planEndDate;
	}

	public String getPan_text() {
		return pan_text;
	}

	public void setPan_text(String pan_text) {
		this.pan_text = pan_text;
	}

	public String getSubscription_type() {
		return subscription_type;
	}

	public void setSubscription_type(String subscription_type) {
		this.subscription_type = subscription_type;
	}

	public String getCloud_size() {
		return cloud_size;
	}

	public void setCloud_size(String cloud_size) {
		this.cloud_size = cloud_size;
	}

	public String getDepartment_details() {
		return department_details;
	}

	public void setDepartment_details(String department_details) {
		this.department_details = department_details;
	}

	public int getRequest_access_id() {
		return request_access_id;
	}

	public void setRequest_access_id(int request_access_id) {
		this.request_access_id = request_access_id;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getReject_remarks() {
		return reject_remarks;
	}


	public void setReject_remarks(String reject_remarks) {
		this.reject_remarks = reject_remarks;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getSearch_box() {
		return search_box;
	}


	public void setSearch_box(String search_box) {
		this.search_box = search_box;
	}

	
	
	
}
