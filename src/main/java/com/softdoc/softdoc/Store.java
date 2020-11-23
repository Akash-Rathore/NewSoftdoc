package com.softdoc.softdoc;

import java.util.List;

//import javax.xml.bind.annotation.XmlRootElement;
//@XmlRootElement
//import org.codehaus.jackson.annotate.JsonProperty;
public class Store {

	private int id;
	private String title;
	private String description;
	private String name;
	
	private String type;
	private String pickup_date;
	private String company_number;
	private String location;
	private int pincode;
	private String company_per_name;
	private String mobile;

	private String company_name;
	private List<Login> login;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;

	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public List<Login> getLogin() {
		return login;
	}

	public void setLogin(List<Login> login) {
		this.login = login;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getPickup_date() {
		return pickup_date;
	}

	public void setPickup_date(String pickup_date) {
		this.pickup_date = pickup_date;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getCompany_number() {
		return company_number;
	}

	public void setCompany_number(String company_number) {
		this.company_number = company_number;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getPincode() {
		return pincode;
	}

	public void setPincode(int pincode) {
		this.pincode = pincode;
	}

	public String getCompany_per_name() {
		return company_per_name;
	}

	public void setCompany_per_name(String company_per_name) {
		this.company_per_name = company_per_name;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

}
