package com.customerclientModal;

public class ViewDocument {
	
	
	    private String documenttype;
	    private String employecode;
	    private String employename;
	    private String joiningdate;
	    private String vendorcode;
	    private String vendorname;
	    private String invoicedate;
	    private String customercode;
	    private String customername;
	    private String invoicenumber;
	    private String employee_name;
	    private String empemail_id;
	    private String location;
	    private String file;
	    private String department;
	    private String star;
	    private String attachement;
	    private int id;
	    private String document_no;
	    private String file_no;
	    private String document_size;
	    private String upload_date;
	    private String remove_star;
	    private String email;
	    private String invoicedateend;
	    private String invoicedateendsec;
	    private int did;
	    private String documentType1;
	    private String documentType2;
	    private String documentType3;
	    private String documentType4;
	    private String documentType5;
	    private String documentType6;
	    private int document_info_id;
	    private String createdStart;
		private String createdEnd; 
		private String file_name;
		 
	    
	    
	    
	    
	    public ViewDocument()
	    {
	    	
	    }
	    
	    
	    public ViewDocument(String email ,int id ,int document_info_id)
	    {
	    	
	    	
	    	this.email=email;
	    	this.id=id;
	    	this.document_info_id=document_info_id;
	    }
	    
	    public ViewDocument(String remove_star,String email ,int id)
	    {
	    	
	    	this.remove_star=remove_star;
	    	this.email=email;
	    	this.id=id;
	    	
	    }
	    public ViewDocument(int id,String star,int did,String email)
	    {
	       this.id=id;
	       this.star=star;
	       this.did=did;
	       this.email=email;
	    }
	    
	    public ViewDocument(int id , int did , String email)
	    {
	       this.id=id;
	       this.did=did;
	       this.email=email;
	    }
	    
	    public ViewDocument(int id,String email , int document_info_id)
	    {
	        this.id=id;
	        this.email=email;
	        this.document_info_id=document_info_id;
	        this.employee_name=employee_name;
	    }
	    
	    
	    public ViewDocument(int id,String email ,String employee_name , int document_info_id)
	    {
	        this.id=id;
	        this.email=email;
	        this.document_info_id=document_info_id;
	        this.employee_name=employee_name;
	    }
	    
	    
	    public ViewDocument(String documenttype,String employecode,String employename,String joiningdate,String vendorcode,String vendorname,String invoicedate,String customercode,String customername,String invoicenumber,int id,String department,String invoicedateend , String invoicedateendsec,String documentType1,String documentType2,String documentType3,String documentType4,String documentType5,String documentType6, String createdStart , String createdEnd)
	    {
	       
	    	this.documenttype=documenttype;
	    	this.employecode=employecode;
	    	this.employename=employename;
	    	this.joiningdate=joiningdate;
	    	this.vendorcode=vendorcode;
	    	this.vendorname=vendorname;
	    	this.invoicedate=invoicedate;
	    	this.customercode=customercode;
	    	this.customername=customername;
	    	this.invoicenumber=invoicenumber;
	    	this.id=id;
	    	this.department=department;
	    	this.invoicedateend=invoicedateend;
	        this.invoicedateendsec=invoicedateendsec;
	        this.documentType1=documentType1;
	        this.documentType2=documentType2;
	        this.documentType3=documentType3;
	        this.documentType4=documentType4;
	        this.documentType5=documentType5;
	        this.documentType6=documentType6;
	        this.createdStart=createdStart;
	        this.createdEnd=createdEnd;
	    	
	    }
	    
		public String getDocumenttype() {
			return documenttype;
		}
		public void setDocumenttype(String documenttype) {
			this.documenttype = documenttype;
		}
		public String getEmployecode() {
			return employecode;
		}
		public void setEmployecode(String employecode) {
			this.employecode = employecode;
		}
		public String getEmployename() {
			return employename;
		}
		public void setEmployename(String employename) {
			this.employename = employename;
		}
		public String getJoiningdate() {
			return joiningdate;
		}
		public void setJoiningdate(String joiningdate) {
			this.joiningdate = joiningdate;
		}
		public String getVendorcode() {
			return vendorcode;
		}
		public void setVendorcode(String vendorcode) {
			this.vendorcode = vendorcode;
		}
		public String getVendorname() {
			return vendorname;
		}
		public void setVendorname(String vendorname) {
			this.vendorname = vendorname;
		}
		public String getInvoicedate() {
			return invoicedate;
		}
		public void setInvoicedate(String invoicedate) {
			this.invoicedate = invoicedate;
		}
		public String getCustomercode() {
			return customercode;
		}
		public void setCustomercode(String customercode) {
			this.customercode = customercode;
		}
		public String getCustomername() {
			return customername;
		}
		public void setCustomername(String customername) {
			this.customername = customername;
		}
		public String getInvoicenumber() {
			return invoicenumber;
		}
		public void setInvoicenumber(String invoicenumber) {
			this.invoicenumber = invoicenumber;
		}

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getEmployee_name() {
			return employee_name;
		}

		public void setEmployee_name(String employee_name) {
			this.employee_name = employee_name;
		}

		public String getEmpemail_id() {
			return empemail_id;
		}

		public void setEmpemail_id(String empemail_id) {
			this.empemail_id = empemail_id;
		}

		public String getLocation() {
			return location;
		}

		public void setLocation(String location) {
			this.location = location;
		}

		public String getFile() {
			return file;
		}

		public void setFile(String file) {
			this.file = file;
		}

		public String getDepartment() {
			return department;
		}

		public void setDepartment(String department) {
			this.department = department;
		}

		public String getStar() {
			return star;
		}

		public void setStar(String star) {
			this.star = star;
		}

		public String getAttachement() {
			return attachement;
		}

		public void setAttachement(String attachement) {
			this.attachement = attachement;
		}
		public String getDocument_no() {
			return document_no;
		}
		public void setDocument_no(String document_no) {
			this.document_no = document_no;
		}
		
		public String getFile_no() {
			return file_no;
		}
		public void setFile_no(String file_no) {
			this.file_no = file_no;
		}
		
		public String getDocument_size() {
			return document_size;
		}
		
		public void setDocument_size(String document_size) {
			this.document_size = document_size;
		}
		
		public String getUpload_date() {
			return upload_date;
		}
		
		public void setUpload_date(String upload_date) {
			this.upload_date = upload_date;
		}

		public String getRemove_star() {
			return remove_star;
		}

		public void setRemove_star(String remove_star) {
			this.remove_star = remove_star;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getInvoicedateend() {
			return invoicedateend;
		}

		public void setInvoicedateend(String invoicedateend) {
			this.invoicedateend = invoicedateend;
		}

		public String getInvoicedateendsec() {
			return invoicedateendsec;
		}

		public void setInvoicedateendsec(String invoicedateendsec) {
			this.invoicedateendsec = invoicedateendsec;
		}

		public int getDid() {
			return did;
		}

		public void setDid(int did) {
			this.did = did;
		}

		public String getDocumentType1() {
			return documentType1;
		}

		public void setDocumentType1(String documentType1) {
			this.documentType1 = documentType1;
		}

		public String getDocumentType2() {
			return documentType2;
		}

		public void setDocumentType2(String documentType2) {
			this.documentType2 = documentType2;
		}

		public String getDocumentType3() {
			return documentType3;
		}

		public void setDocumentType3(String documentType3) {
			this.documentType3 = documentType3;
		}

		public String getDocumentType4() {
			return documentType4;
		}

		public void setDocumentType4(String documentType4) {
			this.documentType4 = documentType4;
		}

		public String getDocumentType5() {
			return documentType5;
		}

		public void setDocumentType5(String documentType5) {
			this.documentType5 = documentType5;
		}

		public String getDocumentType6() {
			return documentType6;
		}

		public void setDocumentType6(String documentType6) {
			this.documentType6 = documentType6;
		}

		public int getDocument_info_id() {
			return document_info_id;
		}

		public void setDocument_info_id(int document_info_id) {
			this.document_info_id = document_info_id;
		}


		public String getCreatedStart() {
			return createdStart;
		}


		public void setCreatedStart(String createdStart) {
			this.createdStart = createdStart;
		}


		public String getCreatedEnd() {
			return createdEnd;
		}


		public void setCreatedEnd(String createdEnd) {
			this.createdEnd = createdEnd;
		}


		public String getFile_name() {
			return file_name;
		}


		public void setFile_name(String file_name) {
			this.file_name = file_name;
		}
		
		
		
}
