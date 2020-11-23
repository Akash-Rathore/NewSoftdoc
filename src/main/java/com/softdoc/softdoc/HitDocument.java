package com.softdoc.softdoc;

public class HitDocument {

	private Integer documentinfo_id;
	private String code;
	private String message;
    private String itemType;
    private String boundType;
    private String id;
    private String channelId;
    
    
	
	public HitDocument()
	{
		
	}
	
	public HitDocument(String code,String message)
	{
		this.code=code;
		this.message=message;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Integer getDocumentinfo_id() {
		return documentinfo_id;
	}

	public void setDocumentinfo_id(Integer documentinfo_id) {
		this.documentinfo_id = documentinfo_id;
	}


	public String getItemType() {
		return itemType;
	}

	public void setItemType(String itemType) {
		this.itemType = itemType;
	}

	public String getBoundType() {
		return boundType;
	}

	public void setBoundType(String boundType) {
		this.boundType = boundType;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getChannelId() {
		return channelId;
	}

	public void setChannelId(String channelId) {
		this.channelId = channelId;
	}
	
	
	
}
