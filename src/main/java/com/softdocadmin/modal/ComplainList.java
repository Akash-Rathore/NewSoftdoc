package com.softdocadmin.modal;

public class ComplainList {
	private String department;
	private String situation;
	private String areaofissue;
	private String description;
	private int id;
	private String status;
	private int idsession;
	private String emailsession;
    private String complainid;
	private String remark;
    
    
    
    public ComplainList(String remark,int id,String emailsession,int idsession)
	{
		 this.remark=remark;
		 this.id=id;
		 this.emailsession=emailsession;
		 this.idsession=idsession;
	}
    
    
    public ComplainList(String complainid, String status, String emailsession, int idsession) {

		this.complainid =complainid;
		this.status = status;
		this.idsession = idsession;
		this.emailsession = emailsession;
	}

	public ComplainList(String department, String situation, String areaofissue, String description, int id,
			String emailsession) {
		this.department = department;
		this.situation = situation;
		this.areaofissue = areaofissue;
		this.description = description;
		this.id = id;
		this.emailsession=emailsession;

	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getSituation() {
		return situation;
	}

	public void setSituation(String situation) {
		this.situation = situation;
	}

	public String getAreaofissue() {
		return areaofissue;
	}

	public void setAreaofissue(String areaofissue) {
		this.areaofissue = areaofissue;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

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

	public String getComplainid() {
		return complainid;
	}

	public void setComplainid(String complainid) {
		this.complainid = complainid;
	}


	public String getRemark() {
		return remark;
	}


	public void setRemark(String remark) {
		this.remark = remark;
	}

}
