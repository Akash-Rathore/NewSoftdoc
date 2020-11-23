package com.subadminindexingModal;

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
    private String documentType1;
    private String documentType2;
    private String documentType3;
    private String documentType4;
    private String documentType5;
    private String documentType6;
    
    
    
    
    
	
	public IndexingUserupload(int companyid,String departmentname,String documentupload,double size,String file_no,String filename, String documenttype, String employecode,String employename,String joiningdate,String vendorcode, String vendorname,String invoicedate,String customercode,String customername,String invoicenumber,String file,int validation,String email,int id,String documentType1,String documentType2,String documentType3,String documentType4,String documentType5,String documentType6)
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
    	  this.documentType1=documentType1;
    	  this.documentType2=documentType2;
    	  this.documentType3=documentType3;
    	  this.documentType4=documentType4;
    	  this.documentType5=documentType5;
    	  this.documentType6=documentType6;
    	 
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
	
	public IndexingUserupload(String employecode,String employename,String joiningdate,String vendorcode, String vendorname,String invoicedate,String customercode,String customername,String invoicenumber,String email,int id,int document_info_id,String file,double size,String document_status , String attachment_count,String documentType1,String documentType2,String documentType3,String documentType4,String documentType5,String documentType6)
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
	
	
	
    public IndexingUserupload(int id,String email,int did)
    {
    	 this.id=id;
    	 this.email=email;
    	 this.did=did;
    
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
	
   
	
}
