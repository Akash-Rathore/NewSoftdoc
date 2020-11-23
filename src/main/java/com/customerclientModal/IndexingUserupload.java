
package com.customerclientModal;

public class IndexingUserupload 
{
    private int id;
    private	int companyid;
    private String departmentname;
    private String documentupload;
    private double size;
    private int count;
    private int random;
    private String editupload;
    private int editid;
    private String filename;
    private String file_no;
    private String remark;
    private String file;
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
    private int validation;
    private String email;
    private String upload_id;
    private String document_no;
    private int did;
    private int document_info_id;
    private String document_status;
    private String attachment_count;
    private String client_name;
    private String currentDate;
    private String documentType1;
    private String documentType2;
    private String documentType3;
    private String documentType4;
    private String documentType5;
    private String documentType6;
    private String folder_name;
    private String folder_description;
    private String employee_name;
    private String emp_email_id;
    private String imageupload;
    private String file_description;
    private String access_level;
    private Integer other_client;
    private Integer client_id;
    private String modify_date;
    private String modify_name;
    private String details;
    private String action;
    private String folder_view_link;
    private String delete_checkbox;
    private String Version;
    private String comments;
    private String lock;
    private String attachment_name;
    private String trash_date;
    private String trash_client_name;
    private String restore_date;
    private String restore_client_name;
    private String star_date;
    private String request_access;
    private String request_date;
    private String approval_status;
    private String request_type;
	private String employee_email_id;
	private String industry;
    
	


	public IndexingUserupload(int companyid , String documentupload,double size,String file_no,String filename, String documenttype, String employecode,String employename,String joiningdate,String vendorcode, String vendorname,String invoicedate,String customercode,String customername,String invoicenumber,int validation,int id,String email,String client_name, String documentType1 , String documentType2 , String documentType3 , String documentType4 , String documentType5 , String documentType6,int document_info_id)
    {
    	  this.companyid=companyid;
    	  this.documentupload=documentupload;
    	  this.size=size;
    	  this.random=random;
    	  this.filename=filename;
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
          this.file_no=file_no;
          this.validation=validation;
    	  this.email=email;
    	  this.id=id;
    	  this.client_name=client_name;
    	  this.documentType1=documentType1;
          this.documentType2=documentType2;
          this.documentType3=documentType3;
          this.documentType4=documentType4;
          this.documentType5=documentType5;
          this.documentType6=documentType6;
          this.document_info_id=document_info_id;
    }
	
	
	public IndexingUserupload(int companyid , String file_no , String documenttype , String employecode,String employename,String joiningdate,String vendorcode, String vendorname,String invoicedate,String customercode,String customername,String invoicenumber , int id,String email,String client_name, String documentType1 , String documentType2 , String documentType3 , String documentType4 , String documentType5 , String documentType6,int document_info_id)
  	{
    	  this.companyid=companyid;
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
          this.file_no=file_no;
    	  this.email=email;
    	  this.id=id;
    	  this.client_name=client_name;
    	  this.documentType1=documentType1;
          this.documentType2=documentType2;
          this.documentType3=documentType3;
          this.documentType4=documentType4;
          this.documentType5=documentType5;
          this.documentType6=documentType6;
          this.document_info_id=document_info_id;
    }
	
	
	
	public IndexingUserupload(int companyid , String documentupload,double size,String file_no,String filename, String documenttype, String employecode,String employename,String joiningdate,String vendorcode, String vendorname,String invoicedate,String customercode,String customername,String invoicenumber,String file,int validation,int id,String email,String client_name, String documentType1 , String documentType2 , String documentType3 , String documentType4 , String documentType5 , String documentType6,String folder_name,String folder_description)
    {
    	  this.companyid=companyid;
    	  this.departmentname=departmentname;
    	  this.documentupload=documentupload;
    	  this.size=size;
    	  this.random=random;
    	  this.filename=filename;
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
          this.file_no=file_no;
          this.file=file;
    	  this.validation=validation;
    	  this.email=email;
    	  this.id=id;
    	  this.client_name=client_name;
    	  this.documentType1=documentType1;
          this.documentType2=documentType2;
          this.documentType3=documentType3;
          this.documentType4=documentType4;
          this.documentType5=documentType5;
          this.documentType6=documentType6;
          this.folder_name=folder_name;
          this.folder_description=folder_description;
          
    }
	
	public IndexingUserupload(int companyid,String departmentname,String documentupload,double size,String file_no,String filename, String documenttype, String employecode,String employename,String joiningdate,String vendorcode, String vendorname,String invoicedate,String customercode,String customername,String invoicenumber,String file,int validation,String email,int id,String upload_id)
    {
    	  this.companyid=companyid;
    	  this.departmentname=departmentname;
    	  this.documentupload=documentupload;
    	  this.size=size;
    	  this.random=random;
    	  this.filename=filename;
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
          this.file_no=file_no;
          this.file=file;
    	  this.validation=validation;
    	  this.email=email;
    	  this.id=id;
    	  this.upload_id=upload_id;
          
    }
	
	public IndexingUserupload(String employecode,String employename,String joiningdate,String vendorcode, String vendorname,String invoicedate,String customercode,String customername,String invoicenumber,String email,int id,int document_info_id,String file,double size,String document_status , String attachment_count,String client_name, String documentType1 , String documentType2 , String documentType3 , String documentType4 , String documentType5 , String documentType6)
    {
     
          this.employecode=employecode;
          this.employename=employename;
          this.joiningdate=joiningdate;
          this.vendorcode=vendorcode;
          this.vendorname=vendorname;
          this.invoicedate=invoicedate;
          this.customercode=customercode;
          this.customername=customername;
          this.invoicenumber=invoicenumber;
          this.email=email;
          this.id=id;
          this.file=file;
          this.size=size;
          this.document_status=document_status;
          this.document_info_id=document_info_id;
          this.attachment_count=attachment_count;
          this.client_name=client_name;
          this.documentType1=documentType1;
          this.documentType2=documentType2;
          this.documentType3=documentType3;
          this.documentType4=documentType4;
          this.documentType5=documentType5;
          this.documentType6=documentType6;
    }
	
	
	
	
	
	public IndexingUserupload(String employecode,String employename,String joiningdate,String vendorcode, String vendorname,String invoicedate,String customercode,String customername,String invoicenumber,String email,int id,int document_info_id,String file,double size,String client_name, String documentType1 , String documentType2 , String documentType3 , String documentType4 , String documentType5 , String documentType6)
    {
     
          this.employecode=employecode;
          this.employename=employename;
          this.joiningdate=joiningdate;
          this.vendorcode=vendorcode;
          this.vendorname=vendorname;
          this.invoicedate=invoicedate;
          this.customercode=customercode;
          this.customername=customername;
          this.invoicenumber=invoicenumber;
          this.email=email;
          this.id=id;
          this.file=file;
          this.size=size;
       // this.document_status=document_status;
          this.document_info_id=document_info_id;
      //  this.attachment_count=attachment_count;
          this.client_name=client_name;
          this.documentType1=documentType1;
          this.documentType2=documentType2;
          this.documentType3=documentType3;
          this.documentType4=documentType4;
          this.documentType5=documentType5;
          this.documentType6=documentType6;
    }
	
	
	public IndexingUserupload(String employecode,String employename,String joiningdate,String vendorcode, String vendorname,String invoicedate,String customercode,String customername,String invoicenumber , String email , int id , String document_status,int document_info_id,String documentType1,String documentType2,String documentType3,String documentType4,String documentType5,String documentType6)
    {
     
          this.employecode=employecode;
          this.employename=employename;
          this.joiningdate=joiningdate;
          this.vendorcode=vendorcode;
          this.vendorname=vendorname;
          this.invoicedate=invoicedate;
          this.customercode=customercode;
          this.customername=customername;
          this.invoicenumber=invoicenumber;
          this.email=email;
          this.id=id;
          this.document_status=document_status;
          this.document_info_id=document_info_id;
          this.documentType1=documentType1;
          this.documentType2=documentType2;
          this.documentType3=documentType3;
          this.documentType4=documentType4;
          this.documentType5=documentType5;
          this.documentType6=documentType6;
   
    }
	
	
	public IndexingUserupload(int id,int did,String email)
    {
    	 this.id=id;
    	 this.email=email;
    	 this.did=did;
    	 
    
    }
	
	
	
	

	public IndexingUserupload(String email , int id , int companyid)
    {
		 this.email=email;
    	 this.id=id;
    	 this.companyid=companyid;
    }
	
	public IndexingUserupload(String email , int id , int companyid ,String departmentname)
    {
		 this.email=email;
    	 this.id=id;
    	 this.companyid=companyid;
    	 this.departmentname=departmentname;
    }
	
	 public IndexingUserupload(int id,String email,int did,String currentDate)
	    {
	    	 this.id=id;
	    	 this.email=email;
	    	 this.did=did;
	    	 this.currentDate=currentDate;
	    
	    }
	
	
    public IndexingUserupload(int id,String email,int did,String currentDate , String client_name)
    {
    	 this.id=id;
    	 this.email=email;
    	 this.did=did;
    	 this.currentDate=currentDate;
    	 this.client_name=client_name;
    
    }
    
    public IndexingUserupload(int id , String email, int document_info_id)
    {
    	 this.id=id;
    	 this.email=email;
         this.document_info_id=document_info_id;
         
    }
    
    
    public IndexingUserupload(int id , int document_info_id, String email,String industry)
    {
    	 this.id=id;
    	 this.email=email;
         this.document_info_id=document_info_id;
         this.industry=industry;
    }
    
    public IndexingUserupload(int id , String email,String client_name , int document_info_id)
    {
    	 this.id=id;
    	 this.email=email;
    	 this.client_name=client_name;
         this.document_info_id=document_info_id;
    }
    
    public IndexingUserupload(int id,String email,String currentDate)
    {
    	 this.id=id;
    	 this.email=email;
    	 this.currentDate=currentDate;
    
    }
    
    public IndexingUserupload(int id,String file_no)
    {
    	 this.id=id;
    	 this.file_no=file_no;
    }
	
    
	public IndexingUserupload(String file_no,String email,int id)
    {
    	 this.file_no=file_no;
    	 this.email=email;
    	 this.id=id;
    }
    public IndexingUserupload(String file_no,String document_no,String remark,String email,int id)
    {
    	 this.file_no=file_no;
    	 this.document_no=document_no;
    	 this.remark=remark;
    	 this.email=email;
    	 this.id=id;
    
    }
   
	public IndexingUserupload(int editid,String editupload,double size)
    {
    	 this.editupload=editupload;
    	 this.editid=editid;
    	 this.size=size;
    }
    
    
    
    public IndexingUserupload() {
		// TODO Auto-generated constructor stub
	}


    public IndexingUserupload(int document_info_id,int client_id,int companyid) {
		this.document_info_id=document_info_id;
		this.client_id=client_id;
		this.companyid=companyid;
    } 
    

    public IndexingUserupload(int document_info_id,int client_id,int companyid,String email) {
		this.document_info_id=document_info_id;
		this.client_id=client_id;
		this.companyid=companyid;
		this.email=email;
    } 
    


	public int getEditid() {
		return editid;
	}

	public void setEditid(int editid) {
		this.editid = editid;
	}

	
    public int getRandom() {
		return random;
	}
	public void setRandom(int random) {
		this.random = random;
	}

	public double getSize() {
		return size;
	}
	public void setSize(double size) {
		this.size = size;
	}
	public String getDepartmentname() {
		return departmentname;
	}
	public void setDepartmentname(String departmentname) {
		this.departmentname = departmentname;
	}
	public String getDocumentupload() {
		return documentupload;
	}
	public void setDocumentupload(String documentupload) {
		this.documentupload = documentupload;
    }
	 public int getCount() {
			return count;
     }
	 public void setCount(int count) {
			this.count = count;
	 }
	 public int getCompanyid() {
			return companyid;
	 }
	 public void setCompanyid(int companyid) {
			this.companyid = companyid;
	 }
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public String getEditupload() {
		return editupload;
	}

	public void setEditupload(String editupload) {
		this.editupload = editupload;
	}
	public String getFilename() {
			return filename;
	}
	public void setFilename(String filename){
			this.filename = filename;
	}
	public String getFile_no() {
			return file_no;
    }
	public void setFile_no(String file_no) {
			this.file_no = file_no;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
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
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public int getValidation() {
		return validation;
	}
	public void setValidation(int validation) {
		this.validation = validation;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String getUpload_id() {
		return upload_id;
	}

	public void setUpload_id(String upload_id) {
		this.upload_id = upload_id;
	}

	public String getDocument_no() {
		return document_no;
	}

	public void setDocument_no(String document_no) {
		this.document_no = document_no;
	}

	public int getDid() {
		return did;
	}

	public void setDid(int did) {
		this.did = did;
	}

	public int getDocument_info_id() {
		return document_info_id;
	}

	public void setDocument_info_id(int document_info_id) {
		this.document_info_id = document_info_id;
	}

	public String getDocument_status() {
		return document_status;
	}

	public void setDocument_status(String document_status) {
		this.document_status = document_status;
	}

	
	public String getAttachment_count() {
		return attachment_count;
	}

	public void setAttachment_count(String attachment_count) {
		this.attachment_count = attachment_count;
	}

	public String getClient_name() {
		return client_name;
	}

	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}

	public String getCurrentDate() {
		return currentDate;
	}

	public void setCurrentDate(String currentDate) {
		this.currentDate = currentDate;
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


	public String getModify_name() {
		return modify_name;
	}


	public void setModify_name(String modify_name) {
		this.modify_name = modify_name;
	}


	public String getFolder_name() {
		return folder_name;
	}


	public void setFolder_name(String folder_name) {
		this.folder_name = folder_name;
	}


	public String getFolder_description() {
		return folder_description;
	}


	public void setFolder_description(String folder_description) {
		this.folder_description = folder_description;
	}


	public String getEmployee_name() {
		return employee_name;
	}


	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}


	public String getEmp_email_id() {
		return emp_email_id;
	}


	public void setEmp_email_id(String emp_email_id) {
		this.emp_email_id = emp_email_id;
	}


	public String getImageupload() {
		return imageupload;
	}


	public void setImageupload(String imageupload) {
		this.imageupload = imageupload;
	}


	public String getFile_description() {
		return file_description;
	}


	public void setFile_description(String file_description) {
		this.file_description = file_description;
	}


	public String getAccess_level() {
		return access_level;
	}


	public void setAccess_level(String access_level) {
		this.access_level = access_level;
	}


	public Integer getOther_client() {
		return other_client;
	}


	public void setOther_client(Integer other_client) {
		this.other_client = other_client;
	}


	public Integer getClient_id() {
		return client_id;
	}


	public void setClient_id(Integer client_id) {
		this.client_id = client_id;
	}


	public String getModify_date() {
		return modify_date;
	}


	public void setModify_date(String modify_date) {
		this.modify_date = modify_date;
	}


	public String getDetails() {
		return details;
	}


	public void setDetails(String details) {
		this.details = details;
	}


	public String getAction() {
		return action;
	}


	public void setAction(String action) {
		this.action = action;
	}


	public String getFolder_view_link() {
		return folder_view_link;
	}


	public void setFolder_view_link(String folder_view_link) {
		this.folder_view_link = folder_view_link;
	}


	public String getDelete_checkbox() {
		return delete_checkbox;
	}


	public void setDelete_checkbox(String delete_checkbox) {
		this.delete_checkbox = delete_checkbox;
	}


	public String getVersion() {
		return Version;
	}


	public void setVersion(String version) {
		Version = version;
	}


	public String getComments() {
		return comments;
	}


	public void setComments(String comments) {
		this.comments = comments;
	}


	public String getLock() {
		return lock;
	}


	public void setLock(String lock) {
		this.lock = lock;
	}


	public String getAttachment_name() {
		return attachment_name;
	}


	public void setAttachment_name(String attachment_name) {
		this.attachment_name = attachment_name;
	}


	public String getTrash_date() {
		return trash_date;
	}


	public void setTrash_date(String trash_date) {
		this.trash_date = trash_date;
	}


	public String getTrash_client_name() {
		return trash_client_name;
	}


	public void setTrash_client_name(String trash_client_name) {
		this.trash_client_name = trash_client_name;
	}


	public String getRestore_date() {
		return restore_date;
	}


	public void setRestore_date(String restore_date) {
		this.restore_date = restore_date;
	}


	public String getRestore_client_name() {
		return restore_client_name;
	}


	public void setRestore_client_name(String restore_client_name) {
		this.restore_client_name = restore_client_name;
	}


	public String getStar_date() {
		return star_date;
	}


	public void setStar_date(String star_date) {
		this.star_date = star_date;
	}


	public String getRequest_access() {
		return request_access;
	}


	public void setRequest_access(String request_access) {
		this.request_access = request_access;
	}


	public String getRequest_date() {
		return request_date;
	}


	public void setRequest_date(String request_date) {
		this.request_date = request_date;
	}


	public String getApproval_status() {
		return approval_status;
	}


	public void setApproval_status(String approval_status) {
		this.approval_status = approval_status;
	}


	public String getRequest_type() {
		return request_type;
	}


	public void setRequest_type(String request_type) {
		this.request_type = request_type;
	}


	public String getEmployee_email_id() {
		return employee_email_id;
	}


	public void setEmployee_email_id(String employee_email_id) {
		this.employee_email_id = employee_email_id;
	}


	public String getIndustry() {
		return industry;
	}


	public void setIndustry(String industry) {
		this.industry = industry;
	}
    	
   
	
	
	
}
