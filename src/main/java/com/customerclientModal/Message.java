package com.customerclientModal;

public class Message {
	
	private Integer id;
	private Integer client_id;
	private String new_message;
	private String date_time;
	private Integer client_chat_id;
	private String email;
	private String name;
	private String image_upload;
	private String client_own_chat;
	private String direction_rule;
	private String attachement;
	private Integer customer_id;
	
	
	
	
    public Message(String new_message , Integer customer_id ,Integer client_chat_id,String image_upload){
		
		this.customer_id=customer_id;
		this.new_message=new_message;
		this.client_chat_id=client_chat_id;
		this.image_upload=image_upload;
	}
	
	
	public Message(Integer client_id,String new_message,Integer client_chat_id,String image_upload , Integer customer_id){
		
		this.client_id=client_id;
		this.new_message=new_message;
		this.client_chat_id=client_chat_id;
		this.image_upload=image_upload;
		this.customer_id=customer_id;
	}
	
	public Message(Integer customer_id,Integer client_chat_id,String email){
		
		this.customer_id=customer_id;
		this.client_chat_id=client_chat_id;
		this.email=email;
		
	}
   
	public Message(Integer client_id,Integer client_chat_id,Integer customer_id){
	
		this.client_id=client_id;
		this.client_chat_id=client_chat_id;
		this.customer_id=customer_id;
		
	}
	
	public Message(Integer client_id, String email , Integer customer_id){
		
		this.client_id=client_id;
		this.email=email;
		this.customer_id=customer_id;
		
	}
	
	public Message() {
		// TODO Auto-generated constructor stub
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getClient_id() {
		return client_id;
	}
	public void setClient_id(Integer client_id) {
		this.client_id = client_id;
	}
	public String getNew_message() {
		return new_message;
	}
	public void setNew_message(String new_message) {
		this.new_message = new_message;
	}
	public String getDate_time() {
		return date_time;
	}
	public void setDate_time(String date_time) {
		this.date_time = date_time;
	}

	public Integer getClient_chat_id() {
		return client_chat_id;
	}

	public void setClient_chat_id(Integer client_chat_id) {
		this.client_chat_id = client_chat_id;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getImage_upload() {
		return image_upload;
	}


	public void setImage_upload(String image_upload) {
		this.image_upload = image_upload;
	}


	public String getClient_own_chat() {
		return client_own_chat;
	}


	public String getAttachement() {
		return attachement;
	}


	public void setAttachement(String attachement) {
		this.attachement = attachement;
	}


	public void setClient_own_chat(String client_own_chat) {
		this.client_own_chat = client_own_chat;
	}


	public String getDirection_rule() {
		return direction_rule;
	}


	public void setDirection_rule(String direction_rule) {
		this.direction_rule = direction_rule;
	}


	public Integer getCustomer_id() {
		return customer_id;
	}


	public void setCustomer_id(Integer customer_id) {
		this.customer_id = customer_id;
	}
	
	

}
