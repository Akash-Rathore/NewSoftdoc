package com.softdoc.softdoc;

import java.util.List;

public class Filenumber {
	
	private Integer id;
  //===================================	
	private String code;
	private String message;
	private String attachement;
	private String showfile;
	private String star;
	private String serial_number;
	private String customer_num;
	private String company_name;
	private String colour;
	private String  dpi;
	private String department;
	private String documenttype;
	private String documenttype1;
	//===================create file number  =========================
	private String filenumber;
	private String mobile;
	private String images;
	private String pickup_date;
	private String company_id;
	private String return_date;
	//=====================star=======================================
	private String return_no;
	private String return_contact;
	private String return_images;
    private Integer scan;
    
    
    private String employee_code;
    private String employee_name;
    private String dataofjoining;
    //===========//==============
    private String invoice_date;
    private String invoice_number;
    private String vendor_code;
    private String vendor_name;
	//==========//=============
    private String customer_code;
    private String customer_name;
    private String document_no;
    private String upload_date;
    private List<Department> department_info;
    
    
	
	public String getDataofjoining() {
		return dataofjoining;
	}

	public String getEmployee_code() {
		return employee_code;
	}

	public void setEmployee_code(String employee_code) {
		this.employee_code = employee_code;
	}

	public String getEmployee_name() {
		return employee_name;
	}

	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}

	public void setDataofjoining(String dataofjoining) {
		this.dataofjoining = dataofjoining;
	}

	public String getCustomer_name() {
		return customer_name;
	}

	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}

	public Filenumber()
	{
		
	}
	
	public Filenumber(Integer id,String pickup_date,String customer_num,String company_name,Integer scan,String serial_number,String code,String message,List<Department> department_info)
	{
         this.id=id;
         this.pickup_date=pickup_date;
         this.customer_num=customer_num;
         this.company_name=company_name;
         this.serial_number=serial_number;
		 this.code=code;
		 this.message=message;
		 this.scan=scan;
		 this.department_info=department_info;
	}
	public Filenumber(String code,String message)
	{
		this.code=code;
		this.message=message;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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
	public String getFilenumber() {
		return filenumber;
	}
	public void setFilenumber(String filenumber) {
		this.filenumber = filenumber;
	}
	public String getAttachement() {
		return attachement;
	}
	public void setAttachement(String attachement) {
		this.attachement = attachement;
	}
	public String getShowfile() {
		return showfile;
	}
	public void setShowfile(String showfile) {
		this.showfile = showfile;
	}
	public String getStar() {
		return star;
	}
	public void setStar(String star) {
		this.star = star;
	}
	public String getPickup_date() {
		return pickup_date;
	}
	public void setPickup_date(String pickup_date) {
		this.pickup_date = pickup_date;
	}
	public String getSerial_number() {
		return serial_number;
	}
	public void setSerial_number(String serial_number) {
		this.serial_number = serial_number;
	}
	public String getCustomer_num() {
		return customer_num;
	}
	public void setCustomer_num(String customer_num) {
		this.customer_num = customer_num;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getColour() {
		return colour;
	}
	public void setColour(String colour) {
		this.colour = colour;
	}
	public String getDpi() {
		return dpi;
	}
	public void setDpi(String dpi) {
		this.dpi = dpi;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getDocumenttype() {
		return documenttype;
	}
	public void setDocumenttype(String documenttype) {
		this.documenttype = documenttype;
	}
	public String getDocumenttype1() {
		return documenttype1;
	}
	public void setDocumenttype1(String documenttype1) {
		this.documenttype1 = documenttype1;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getImages() {
		return images;
	}
	public void setImages(String images) {
		this.images = images;
	}
	public String getCompany_id() {
		return company_id;
	}
	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}

	public String getReturn_date() {
		return return_date;
	}

	public void setReturn_date(String return_date) {
		this.return_date = return_date;
	}
	//===========================//================

	public String getReturn_no() {
		return return_no;
	}

	public void setReturn_no(String return_no) {
		this.return_no = return_no;
	}

	public String getReturn_contact() {
		return return_contact;
	}

	public void setReturn_contact(String return_contact) {
		this.return_contact = return_contact;
	}

	public String getReturn_images() {
		return return_images;
	}

	public void setReturn_images(String return_images) {
		this.return_images = return_images;
	}

	public Integer getScan() {
		return scan;
	}

	public void setScan(Integer scan) {
		this.scan = scan;
	}

	public String getCustomer_code() {
		return customer_code;
	}

	public void setCustomer_code(String customer_code) {
		this.customer_code = customer_code;
	}

	public String getInvoice_date() {
		return invoice_date;
	}

	public void setInvoice_date(String invoice_date) {
		this.invoice_date = invoice_date;
	}

	public String getInvoice_number() {
		return invoice_number;
	}

	public void setInvoice_number(String invoice_number) {
		this.invoice_number = invoice_number;
	}

	public String getVendor_code() {
		return vendor_code;
	}

	public void setVendor_code(String vendor_code) {
		this.vendor_code = vendor_code;
	}

	public String getVendor_name() {
		return vendor_name;
	}

	public void setVendor_name(String vendor_name) {
		this.vendor_name = vendor_name;
	}

	public String getDocument_no() {
		return document_no;
	}

	public void setDocument_no(String document_no) {
		this.document_no = document_no;
	}

	public String getUpload_date() {
		return upload_date;
	}

	public void setUpload_date(String upload_date) {
		this.upload_date = upload_date;
	}

	public List<Department> getDepartment_info() {
		return department_info;
	}

	public void setDepartment_info(List<Department> department_info) {
		this.department_info = department_info;
	}
	
    
   
	
}
