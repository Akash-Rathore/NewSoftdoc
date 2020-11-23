package com.subadminqualityModal;

public class Quality {

	private int id;
	private String status ;
	private String questone;
	private String questtwo;
	private String questthree;
	private String questfour;
	private String questfive;
	private String questsix;
	private String questseven;
	private String remarks;
	private String file_no;
	private String document_no;
	
	public Quality(String file_no,String document_no,String questone,String questtwo,String questthree,String status,String remarks)
	{
		
		this.questone=questone;
		this.questtwo=questtwo;
		this.questthree=questthree;
		this.status=status;
		this.remarks=remarks;
		this.file_no=file_no;
		this.document_no=document_no;
	}
	
	public String getFile_no() {
		return file_no;
	}

	public void setFile_no(String file_no) {
		this.file_no = file_no;
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

	public String getQuestone() {
		return questone;
	}

	public void setQuestone(String questone) {
		this.questone = questone;
	}

	public String getQuesttwo() {
		return questtwo;
	}

	public void setQuesttwo(String questtwo) {
		this.questtwo = questtwo;
	}

	public String getQuestthree() {
		return questthree;
	}

	public void setQuestthree(String questthree) {
		this.questthree = questthree;
	}

	public String getQuestfour() {
		return questfour;
	}

	public void setQuestfour(String questfour) {
		this.questfour = questfour;
	}

	public String getQuestfive() {
		return questfive;
	}

	public void setQuestfive(String questfive) {
		this.questfive = questfive;
	}

	public String getQuestsix() {
		return questsix;
	}

	public void setQuestsix(String questsix) {
		this.questsix = questsix;
	}

	public String getQuestseven() {
		return questseven;
	}

	public void setQuestseven(String questseven) {
		this.questseven = questseven;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getDocument_no() {
		return document_no;
	}

	public void setDocument_no(String document_no) {
		this.document_no = document_no;
	}

}
