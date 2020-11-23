package com.customeradminModal;

public class CustomerComplainList 
{
   private String title; 
   private String attachment;
   private String documentnumberref;
   private String description;
   private String category;
   private int id;
   private String status;
   private String email;
   private String complain_id;
   private String remark;
   private int sessionid;
   
   
   
   public CustomerComplainList(String remark,int id,String email,int sessionid)
   {
	   this.remark=remark;
	   this.id=id;
	   this.email=email;
	   this.sessionid=sessionid;
   }
   public CustomerComplainList(int id,String status,String email,String complain_id) {
   
	   this.id=id;
	   this.status=status;
	   this.email=email;
	   this.complain_id=complain_id;
	   
   }
   public CustomerComplainList(String title,String attachment,String documentnumberref,String description,int id,String category)
   {
	    this.title=title;
	    this.attachment=attachment;
	    this.documentnumberref=documentnumberref;
	    this.description=description;
	    this.id=id;
	    this.category=category;
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

public String getCategory() {
	return category;
}

public void setCategory(String category) {
	this.category = category;
}

public String getTitle() {
	return title;
}

public void setTitle(String title) {
	this.title = title;
}

public String getAttachment() {
	return attachment;
}

public void setAttachment(String attachment) {
	this.attachment = attachment;
}

public String getDocumentnumberref() {
	return documentnumberref;
}

public void setDocumentnumberref(String documentnumberref) {
	this.documentnumberref = documentnumberref;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getComplain_id() {
	return complain_id;
}
public void setComplain_id(String complain_id) {
	this.complain_id = complain_id;
}
public String getRemark() {
	return remark;
}
public void setRemark(String remark) {
	this.remark = remark;
}
public int getSessionid() {
	return sessionid;
}
public void setSessionid(int sessionid) {
	this.sessionid = sessionid;
}


}
