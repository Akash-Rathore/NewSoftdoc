package com.customerclientModal;

public class ComplainList 
{
   private String title; 
   private String attachment;
   private String documentnumberref;
   private String description;
   private String category;
   private String email;
   private int id;
   private int customer_id;
   

   public ComplainList(String title,String attachment,String documentnumberref,String description,int id,String category,String email,int customer_id)
   {
	    this.title=title;
	    this.attachment=attachment;
	    this.documentnumberref=documentnumberref;
	    this.description=description;
	    this.id=id;
	    this.category=category;
	    this.email=email;
	    this.customer_id=customer_id;
	    
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

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public int getCustomer_id() {
	return customer_id;
}

public void setCustomer_id(int customer_id) {
	this.customer_id = customer_id;
}


}
