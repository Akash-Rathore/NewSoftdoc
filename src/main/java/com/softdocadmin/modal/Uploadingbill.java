package com.softdocadmin.modal;

public class Uploadingbill {

	private String uploadingbill;
    private int id;
    private String billing_report;
	private String month;
	private String billing;
	private int idsession;
    private String email;
    
    
    
    

    public Uploadingbill(int id,String billing,String month,String email,int idsession)
	{
		this.id=id;
		this.billing=billing;
		this.month=month;
		this.email=email;
		this.idsession=idsession;
	}
    
    
    
	public Uploadingbill(String uploadingbill,int id,String billing_report)
	{
		this.uploadingbill=uploadingbill;
		this.id=id;
		this.billing_report=billing_report;
	}
	
	public String getBilling_report() {
		return billing_report;
	}

	public void setBilling_report(String billing_report) {
		this.billing_report = billing_report;
	}

	public String getUploadingbill() {
		return uploadingbill;
	}

	public void setUploadingbill(String uploadingbill) {
		this.uploadingbill = uploadingbill;
	}
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getBilling() {
		return billing;
	}

	public void setBilling(String billing) {
		this.billing = billing;
	}

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
  
}
