package com.customerclientModal;

public class Comments {

	private Integer id;
	private Integer client_id;
	private Integer document_info_id;
	private String send;
	private String receive;
	private String date_time;
	private String email;
	private String employee_name;
	private String imageupload;
	private String comment_reply;
	private Integer comments_id;
	private String reply_date_time;
    private	String reply_employee_name;
    private	String reply_imageupload;
    private boolean reply_condition;		
	
	
	public Comments() {
	
		
	}
	public Comments(Integer client_id , String email , Integer document_info_id , String send) {
		
		this.client_id=client_id;
		this.email=email;
		this.document_info_id=document_info_id;
		this.send=send;
	
	}
	
    public Comments(Integer client_id , String email , String comment_reply , Integer comments_id) {
		
			this.client_id=client_id;
			this.email=email;
			this.comment_reply=comment_reply;
			this.comments_id=comments_id;
	
	}
	
    public Comments(Integer client_id , String email , Integer document_info_id) {
		
		this.client_id=client_id;
		this.email=email;
		this.document_info_id=document_info_id;
	
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
	public Integer getDocument_info_id() {
		return document_info_id;
	}
	public void setDocument_info_id(Integer document_info_id) {
		this.document_info_id = document_info_id;
	}
	public String getSend() {
		return send;
	}
	public void setSend(String send) {
		this.send = send;
	}
	public String getReceive() {
		return receive;
	}
	public void setReceive(String receive) {
		this.receive = receive;
	}
	public String getDate_time() {
		return date_time;
	}
	public void setDate_time(String date_time) {
		this.date_time = date_time;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmployee_name() {
		return employee_name;
	}
	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}
	public String getImageupload() {
		return imageupload;
	}
	public void setImageupload(String imageupload) {
		this.imageupload = imageupload;
	}
	public String getComment_reply() {
		return comment_reply;
	}
	public void setComment_reply(String comment_reply) {
		this.comment_reply = comment_reply;
	}
	public Integer getComments_id() {
		return comments_id;
	}
	public void setComments_id(Integer comments_id) {
		this.comments_id = comments_id;
	}
	public String getReply_date_time() {
		return reply_date_time;
	}
	public void setReply_date_time(String reply_date_time) {
		this.reply_date_time = reply_date_time;
	}
	public String getReply_employee_name() {
		return reply_employee_name;
	}
	public void setReply_employee_name(String reply_employee_name) {
		this.reply_employee_name = reply_employee_name;
	}
	public String getReply_imageupload() {
		return reply_imageupload;
	}
	public void setReply_imageupload(String reply_imageupload) {
		this.reply_imageupload = reply_imageupload;
	}
	public boolean isReply_condition() {
		return reply_condition;
	}
	public void setReply_condition(boolean reply_condition) {
		this.reply_condition = reply_condition;
	}
	
	
	
	
}
