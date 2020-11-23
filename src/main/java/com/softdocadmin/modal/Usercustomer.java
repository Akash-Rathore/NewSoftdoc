package com.softdocadmin.modal;

public class Usercustomer {
	private int id;
	private String email;
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
	private int idsession;
	private String customeradmincode;
	private String pan_text;
	//update points 
	private String serviceType;
	private String storageData;
	private String noOfUsers;
	private String planStarDate;
	private String planEndDate;

	public int getIdsession() {
		return idsession;
	}

	public void setIdsession(int idsession) {
		this.idsession = idsession;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	private long mobile;
	private String depart_info;
	private int dpi;
	private String colour;
	private String gst_certificate;
	private String pan;
	private String tan_att;
	private String signed_contract;
	private String questionnaire;
	private String others;

	public Usercustomer(String gst_certificate, String pan, String tan_att, String signed_contract,
			String questionnaire, String others) {
		this.gst_certificate = gst_certificate;
		this.pan = pan;
		this.tan_att = tan_att;
		this.signed_contract = signed_contract;
		this.questionnaire = questionnaire;
		this.others = others;
	}

	public Usercustomer(String customer_number, String company_name, String billing_address_first,
			String billing_address_sec, String city, String state, int pincode, String company_pan, String gstin,
			String tan, String type, String industry, String company_per_name, String company_per_designation,
			String company_per_email, long mobile, String depart_info, int dpi, String colour, String gst_certificate,
			String pan, String tan_att, String signed_contract, String questionnaire, String others, int id,
			String email,String pan_tex,String serviceType ,String storageData,String noOfUsers,String planStarDate,String planEndDate) {

		this.customer_number = customer_number;
		this.company_name = company_name;
		this.billing_address_first = billing_address_first;
		this.billing_address_sec = billing_address_sec;
		this.city = city;
		this.state = state;
		this.pincode = pincode;
		this.company_pan = company_pan;
		this.gstin = gstin;
		this.tan = tan;
		this.type = type;
		this.industry = industry;
		this.company_per_name = company_per_name;
		this.company_per_designation = company_per_designation;
		this.company_per_email = company_per_email;
		this.mobile = mobile;
		this.depart_info = depart_info;
		this.dpi = dpi;
		this.colour = colour;
		this.gst_certificate = gst_certificate;
		this.pan = pan;
		this.tan_att = tan_att;
		this.signed_contract = signed_contract;
		this.questionnaire = questionnaire;
		this.others = others;
		this.id = id;
		this.email = email;
		this.pan_text=pan_tex;
		this.serviceType=serviceType;
		this.storageData=storageData;
		this.noOfUsers=noOfUsers;
		this.planEndDate=planEndDate;
		this.planStarDate=planStarDate;

	}

	public Usercustomer(int id, String customer_number, String company_name, String billing_address_first,
			String billing_address_sec, String city, String state, int pincode, String company_pan, String gstin,
			String tan, String type, String industry, String company_per_name, String company_per_designation,
			String company_per_email, long mobile, String depart_info, int dpi, String colour, String gst_certificate,
			String pan, String tan_att, String signed_contract, String questionnaire, String others, int idsession,
			String email,String pan_text,String serviceType ,String storageData,String noOfUsers,String planStarDate,String planEndDate)

	{

		this.id = id;
		this.customer_number = customer_number;
		this.company_name = company_name;
		this.billing_address_first = billing_address_first;
		this.billing_address_sec = billing_address_sec;
		this.city = city;
		this.state = state;
		this.pincode = pincode;
		this.company_pan = company_pan;
		this.gstin = gstin;
		this.tan = tan;
		this.type = type;
		this.industry = industry;
		this.company_per_name = company_per_name;
		this.company_per_designation = company_per_designation;
		this.company_per_email = company_per_email;
		this.mobile = mobile;
		this.depart_info = depart_info;
		this.dpi = dpi;
		this.colour = colour;
		this.gst_certificate = gst_certificate;
		this.pan = pan;
		this.tan_att = tan_att;
		this.signed_contract = signed_contract;
		this.questionnaire = questionnaire;
		this.others = others;
		this.idsession = idsession;
		this.email = email;
		this.pan_text=pan_text;
		this.serviceType=serviceType;
		this.storageData=storageData;
		this.noOfUsers=noOfUsers;
		this.planEndDate=planEndDate;
		this.planStarDate=planStarDate;

	}

	/*
	 * public Usercustomer(int id,String customer_number,String company_name,String
	 * billing_address_first,String billing_address_sec,String city,String state,int
	 * pincode,String company_pan,String gstin,String tan,String type,String
	 * industry,String company_per_name,String company_per_designation,String
	 * company_per_email,int mobile,String depart_info,int dpi,String colour,String
	 * gst_certificate,String pan,String tan_att,String signed_contract,String
	 * questionnaire,String others) {
	 * 
	 * }
	 */

	public Usercustomer(int id, int idsession, String email) {
		this.id = id;
		this.idsession = idsession;
		this.email = email;
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

	public long getMobile() {
		return mobile;
	}

	public void setMobile(long mobile) {
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

	public String getPan_text() {
		return pan_text;
	}

	public void setPan_text(String pan_text) {
		this.pan_text = pan_text;
	}

	public String getCustomeradmincode() {
		return customeradmincode;
	}

	public void setCustomeradmincode(String customeradmincode) {
		this.customeradmincode = customeradmincode;
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
	
}
