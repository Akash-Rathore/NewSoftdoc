package com.softdocadmin.modal;

public class LocationCustomer {

	private int id;
	private String addresslineone;
	private String addresslinetwo;
	private String city;
	private int pincode;
	private String date;
	private int frequency;
	private String name;
	private String mobile;
	private String email;
	private String designation;
	private String company_name;
	private int idsession;
	private String emailsession;
    private int company_id;
	
	public int getIdsession() {
		return idsession;
	}

	public void setIdsession(int idsession) {
		this.idsession = idsession;
	}

	public String getEmailsession() {
		return emailsession;
	}

	public void setEmailsession(String emailsession) {
		this.emailsession = emailsession;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public LocationCustomer(String addresslineone, String addresslinetwo, String city, int pincode, String date,
			int frequency, String name, String mobile, String email, String designation, String company_name,
			String emailsession, int idsession,int company_id) {
		this.addresslineone = addresslineone;
		this.addresslinetwo = addresslinetwo;
		this.city = city;
		this.pincode = pincode;
		this.date = date;
		this.frequency = frequency;
		this.name = name;
		this.mobile = mobile;
		this.email = email;
		this.designation = designation;
		this.company_name = company_name;
		this.emailsession = emailsession;
		this.idsession = idsession;
		this.company_id=company_id;
	}

	
	
	
	public LocationCustomer(int id,String addresslineone, String addresslinetwo, String city, int pincode, String date,
			int frequency, String name, String mobile, String email, String designation, String company_name,
			String emailsession, int idsession) {
		this.id=id;
		this.addresslineone = addresslineone;
		this.addresslinetwo = addresslinetwo;
		this.city = city;
		this.pincode = pincode;
		this.date = date;
		this.frequency = frequency;
		this.name = name;
		this.mobile = mobile;
		this.email = email;
		this.designation = designation;
		this.company_name = company_name;
		this.emailsession = emailsession;
		this.idsession = idsession;
	}

	
	
	
	 public LocationCustomer(int id, String email,int idsession) {
			
			this.id = id;
			this.email = email;
			this.idsession=idsession;
		}
	
	public String getAddresslineone() {
		return addresslineone;
	}

	public void setAddresslineone(String addresslineone) {
		this.addresslineone = addresslineone;
	}

	public String getAddresslinetwo() {
		return addresslinetwo;
	}

	public void setAddresslinetwo(String addresslinetwo) {
		this.addresslinetwo = addresslinetwo;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public int getPincode() {
		return pincode;
	}

	public void setPincode(int pincode) {
		this.pincode = pincode;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getFrequency() {
		return frequency;
	}

	public void setFrequency(int frequency) {
		this.frequency = frequency;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getMobile() {
		// TODO Auto-generated method stub
		return mobile;
	}

	public int getCompany_id() {
		return company_id;
	}

	public void setCompany_id(int company_id) {
		this.company_id = company_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
    
}
