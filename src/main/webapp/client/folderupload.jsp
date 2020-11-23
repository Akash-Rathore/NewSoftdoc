<%@include file="include/session.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="include/head.jsp"%>       

<style>

  h5{
       margin-bottom:25px;
       text-decoration:underline;
    }    



    #loader {
  height: 100% !important;
  overflow: visible;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  z-index: 9999999;
  background: rgba(255,255,255,.5);
  text-align: center;
}

#loader svg{

  position: fixed;
  top:50%;
  left: 50%;
  transform: translate(-50%,-50%);

}







.loader{
     
    display:none;
      
   }
   
     .logoClient{
      
      width:55px !important;
      height:50px !important;
      
      
      }
</style>
<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
</head>

<body class="theme-light-blue">
   
    <!-- Overlay For Sidebars -->
    <div class="overlay"></div>
    <!-- #END# Overlay For Sidebars -->
   
    <!-- Top Bar -->
    
        <!-- Top Bar -->
    
    <nav class="navbar">
	<div class="container-fluid"  style="background:#fff;">
		<div class="navbar-header">
			<a href="javascript:void(0);" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar-collapse"
				aria-expanded="false"></a> <a href="javascript:void(0);"
				class="bars"></a> <a class="image" href="index.jsp"><img
				src="../images/logo5.png" class="logoClient" alt="User" /></a>
		</div>
		<div class="collapse navbar-collapse" id="navbar-collapse" style="background:#fff;">
			<ul class="nav navbar-nav navbar-right">
			    <%@include file="include/message.jsp"%>
			    <%@include file="include/notification.jsp"%>
				<%@include file="include/profile-pic.jsp"%>
			</ul>
		</div>
  
    </div>
	     <div class="container-fluid" style="height: 38px; background: #6c757d;">
	   
	          <div style="position:relative;padding-left:242px;">
                  <input type="text" name="" value="" style="display:none;position:inherit ; top:-9px ;width: 400px !important; border: 2px solid #6c757d; border-radius: 25px;padding-left:10px; " placeholder="Search in Softdoc Cloud" />
                  <a href="search.jsp" style="padding-left:130px;position:inherit;top:-9px;color:#fff;">Advanced Search</a>
                  <!--  <li class="dropdown" style="position:absolute;top:-1px;right:116px;">
                        <a href="javascript:void(0);"  class="dropdown-toggle" style="color:#fff;" data-toggle="dropdown" role="button">
                             <i class="material-icons" style="font-size:32px;font-weight:bold;">+</i>
                        </a>
                        <ul class="dropdown-menu">
                                  <ul class="menu" style="overflow:hidden">
                                    <li>
                                        <a href="javascript:void(0);" class="add_folder">
                                            <div class="menu-info">
                                                <h4>Add Folder</h4>
                                            </div>
                                        </a>
                                    </li>
                                 </ul> <ul class="menu" style="overflow:hidden">
                                    <li>
                                        <a href="uploaddocument.jsp">
                                            <div class="menu-info">
                                                <h4>Add Document</h4>
                                            </div>
                                        </a>
                                    </li>
                                 </ul> 
                         </ul>
                    </li> -->
       
                  
                  
<!--              <a href="#"  style="text-decoration:none;color:#fff;padding-left:309px;"><span style="font-size:32px;font-weight:bold;">+</span></a>
 -->               <a href="#"  style="text-decoration:none;color:#fff;padding-left:148px;"><span style="font-size:32px;font-weight:bold;"><i class="material-icons"></i></span></a>
	          </div>
	       
        </div>
		<div class="container-fluid"
			style="position: fixed; bottom: 0; width: 100%; height: 37px; background: #6c757d; display: flex; flex-direction: row; justify-content: space-between; align-items: center;">
			<div>
				<a href="condition.jsp" style="color: #fff; text-decoration: none;">Term
					& Condition</a>
			</div>
			<div style="color: #fff;">
				<a href="#" style="color: #fff; text-decoration: none;">Copyright ©. All Right Reserved.</a>
			</div>
			<div style="color: #fff;">
				<!-- <a href="condition.jsp"
					style="color: #fff; padding-right: 40px; text-decoration: none;"></a> --> <a href="policy.jsp" style="color: #fff; text-decoration: none;">Privacy
					Policy</a>
			</div>
		</div>
    </nav>
    
    <!-- #Top Bar -->
    <section>
        <!-- Left Sidebar -->
           <%@include file="include/sidebar.jsp"%>
        <!-- #END# Left Sidebar -->
       
    </section>

    <section class="content">
        <div class="container-fluid">
            <div class="block-header">
                <h2>
                    
                </h2>
            </div>
            <div class="row" style="margin-right: -29px !important;margin-left: -156px !important;">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                              
                            </h2>
                        </div>
                        <div class="body mrgnbtm">
                            <form  id="fileUploadForm" method="post" class="form-horizontal"  enctype="multipart/form-data">
                                
                                
                                
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Select Document Type</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                                <div class="form-line documentType" >
                                                
                                               
                                                </div>
                                        </div>
                                    </div>
                                </div>
                            
                              <div id="document_inner">
                              </div>  
                              <div id="employee_inner">
                              </div> 
                              <div id="ven_reg_inner">
                              </div> 
                              <div id="purchase_inner">
                              </div> 
                              <div id="salesinner">
                              </div> 
                              <div id="cus_reg_inner">
                              </div> 
                              
                                <!-- end Sales & Marketing -->
                              <div id="challeninner">
                              </div>
                               <div id="challeninner">
                              </div>
                              <div id="taxauditinner">
                              </div>
                              <div id="powerinner">
                              </div>
                              <div id="noticeinner">
                              </div>
                              <div id="submissioninner">
                              </div>
                              <div id="returninner">
                              </div>
                              <div id="assessmentinner">
                              </div>
                              <div id="engagementinner">
                              </div>
                              <div id="confirmationinner">
                              </div>
                              <div id="generalinner">
                              </div>
                              <div id="minutesinner">
                              </div>
                              <div id="workinner">
                              </div>
                              <div id="financialsinner">
                              </div>
                              <div id="engegementinner">
                              </div>
                              <div id="indirectchalleninner">
                              </div>
                              <div id="indirectgstrinner">
                              </div>
                              <div id="indirectinvoceinner">
                              </div>
                              <div id="gstr3returninner">
                              </div>
                              <div id="inputdetailinner">
                              </div>
                              <div id="ewaybillinner">
                              </div>
                              <div id="refundformsinner">
                              </div>
                              <div id="debit_creditinner">
                              </div>
                              <div id="employee_documents">
                              </div>
                              <div id="employee_other">
                              </div>
                              <div id="employee_salary">
                              </div>
                              <div id="contract">
                              </div>          
                              <div id="registration">
                              </div>          
                              <div id="purchase(goods)">
                              </div>          
                              <div id="purchase(services)">
                              </div>
                              <div id="sale(goods)">
                              </div>          
                              <div id="sale(services)">
                              </div>          
                              <div id="audit_report">
                              </div>                  
                              <div id="balance_sheet">
                              </div> 
                                           
                        <div class="form-group">
                          <label for="NameSurname" class="col-sm-2 control-label">Attachment Name</label>
                          <div class="col-sm-8 table-responsive">
                              <table class="table table-bordered table-hover"  id="documentuploading">
                               <thead>
                               </thead>
                               <tbody>
                                   
                               </tbody>
                              </table>
                          </div>
                           <div class="col-sm-2">
                               <button class="addmore" style="border:none;background-color:#fff;font-size:42px;font-weight:bold;color:#6c757d;" type="button"> + </button>
                           </div>    
                         </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label"> </label>
                                    <div class="col-sm-10">
                                </div>
                                </div>
                                 <div class="form-group">
                                    <div class="col-sm-12" style="text-align:center;">
                                        <button type="submit" style="width:120px;border:1px solid #6c757d;color: #f8fcff;background: #6c757d;" class="btn" id="btnSubmit">Submit</button>
                                         <button type="Reset" class="btn" style="width:120px;border:1px solid #6c757d;color: #f8fcff;background: #6c757d;">Return</button>
                                    </div>
                                </div>
                           </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <%@include file="include/loader.jsp"%>
    <%@include file="include/script.jsp"%>   
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script> 
    <script src="include/custom-script.js"></script>  
    
   <script type="text/javascript">
    $(document).ready(function () {

    	$("#btnSubmit").click(function (event) {
        	event.preventDefault();
            
        	var form = $('#fileUploadForm')[0];
            var data = new FormData(form);
            
            $('#loader').show();
            $.ajax({
                type: "POST",
                enctype: 'multipart/form-data',
                url: "../clientprocess?action=folderupload",
                data: data,
                processData: false,
                contentType: false,
                cache: false,
                timeout: 600000,
                success: function (data){

                 var result = JSON.parse(data);
                 if(result.status)
                   {
                     Swal.fire({
                      position: 'center',
                      icon: 'success',
                      title: 'Document Created',
                      timer: 3500
                    })   
            
                    
                     document.getElementById("fileUploadForm").reset();
                     
                     var url = window.location.href;
                     var res = url.split("?");
                     var  document_info_id = res[1]; 
                     setTimeout(function(){
	     	    		 window.location.href="folder-view.jsp?"+document_info_id;
	     	         })	
                    
                  
                 }
                 else
                 {
                    Swal.fire({
                    icon:'error',
                    title:'Attachment Missing',
                    text:"wrong",
                    footer:'',
                    timer:3000
                    }) 
                }
                 $('#loader').hide();   
                   
                },
                error: function (e) {

                   $('#loader').hide();   
                   console.log("ERROR : ", e);
                   
                }
            });

        });

    });
   </script>
    
 <script>
 
 
 
 
 $(".fileSize").on('change', function() {
	  var totalSize = 0;

	  $(".fileSize").each(function() {
	    for (var i = 0; i < this.files.length; i++) {
	      totalSize += this.files[i].size;
	    }
	  });
	  
	console.log('testing purpose only');
	  

 });

 
 
 
 var i=$('table#documentuploading tr').length;
 
 $(".addmore").on('click',function(){
  html = '<tr>';
  html+= '<td><span class="file-size"></span></td>'; 
  html+= '<td><input type="file" name="multidocument['+i+']" id="multidocument_'+i+'" class="fileSize"></td>';
  html+= '<td><button class="delete-appended-row btn btn-danger" type="button">Remove Attachment</button></td>';
  html+= '</tr>';
  $('table#documentuploading').append(html);
  i++;
});
 
 
  //===============//=========================================
	$(document).on('click','.delete-appended-row',function(){
		 $(this).parent().parent().remove();
	});
 //==============//============================================	
	
	 
	 
   function documentType(docType)
   {
	
	   $('.remove').remove();
	   if(docType.value=='Customer Registration'){
		   
		  
		   
		   
		     var field_name = [ "Customer Code" , "Customer Name" ];
	         var type=["text","text"];
	         var name=["customercode" , "customername"];
			 var html_data="";
			 for(var num=0;num<=field_name.length-1;num++)
			 {
				 html_data +='<div class="form-group remove">'
			     html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     html_data +='<div class="col-sm-10">'
			     html_data +='<div class="form-line">'
			     html_data +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
			     html_data +='</div>'
			     html_data +='</div>'
			     html_data +='</div>'
			 }
			 document.getElementById("cus_reg_inner").innerHTML=html_data;
			    
		   
		   
	   
	   }else if(docType.value=='Sales'){
		 
		   
             var field_name = ["Invoice Date" , "Invoice Number" , "Customer Code", "Customer Name" ];
	         var type=["date","text" ,"text","text"];
	         var name=["invoicedatesec","invoicenumbersec" ,"customercodesec" , "customernamesec"];
			 var html_data="";
			 for(var num=0;num<=field_name.length-1;num++)
			 {
				 html_data +='<div class="form-group remove">'
			     html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     html_data +='<div class="col-sm-10">'
			     html_data +='<div class="form-line">'
			     html_data +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
			     html_data +='</div>'
			     html_data +='</div>'
			     html_data +='</div>'
			 }
			 document.getElementById("salesinner").innerHTML=html_data;
			   
		
	   }else if(docType.value=='Vendor Registration'){
			 
             var field_name = ["Vendor Code" , "Vendor Name"];
	         var type=["text","text"];
	         var name=["vendorcode","vendorname"];
			 var html_data="";
			 for(var num=0;num<=field_name.length-1;num++)
			 {
				 html_data +='<div class="form-group remove">'
			     html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     html_data +='<div class="col-sm-10">'
			     html_data +='<div class="form-line">'
			     html_data +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
			     html_data +='</div>'
			     html_data +='</div>'
			     html_data +='</div>'
			 }
			 document.getElementById("ven_reg_inner").innerHTML=html_data;
		 
	   }else if(docType.value=='Purchase'){
			
		 
		   
             var field_name = ["Invoice Date" , "Invoice Number" , "Vendor Code", "Vendor Name" ];
	         var type=["date","text" ,"text","text"];
	         var name=["invoicedate","invoicenumber" ,"vendorcodesec" , "vendornamesec"];
			 var html_data="";
			 for(var num=0;num<=field_name.length-1;num++)
			 {
				 html_data +='<div class="form-group remove">'
			     html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     html_data +='<div class="col-sm-10">'
			     html_data +='<div class="form-line">'
			     html_data +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
			     html_data +='</div>'
			     html_data +='</div>'
			     html_data +='</div>'
			 }
			 document.getElementById("purchase_inner").innerHTML=html_data;
		 
	   }else if(docType.value=='Employee OutBoarding'){
			
		 
             var field_name = ["Employee Code" , "Employee Name" , "Date Of Joining" ];
	         var type=["text" , "text" , "date"];
	         var name=["employecode" ,"employename" , "joiningdate"];
			 var html_data="";
			 for(var num=0;num<=field_name.length-1;num++)
			 {
				 html_data +='<div class="form-group remove">'
			     html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     html_data +='<div class="col-sm-10">'
			     html_data +='<div class="form-line">'
			     html_data +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
			     html_data +='</div>'
			     html_data +='</div>'
			     html_data +='</div>'
			 }
			 document.getElementById("employee_inner").innerHTML=html_data;
		 
	   }else if(docType.value=='Challen'){
			
			 
			 var field_name = ["Tax Type", "Challen Date", "Challen","challan.AM" ,"BSR Code"];
	         var type=["text","date","text","text","text"];
	         var name=["documentType1","documentType2","documentType3","documentType4","documentType5"];
			 var challen="";
			 for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			 document.getElementById("challeninner").innerHTML=challen;
		 
		
			 
	   }else if(docType.value=='Tax Audit Report'){
			
			 
		     var field_name = ["Financial Year", "Assessment Year", "Date","Membership No." ,"Firm Name/Reg No.","UDIN"];
	         var type=["text","text","date","text","text","text"];
	         var name=["documentType1","documentType2","documentType3","documentType4","documentType5","documentType6"];
			 var challen="";
			 for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			 
			document.getElementById("taxauditinner").innerHTML=challen;
		 
		
			 
	   }else if(docType.value=='Power of Attorney'){
			
			 
		   var field_name = ["Date", "AY / FY", "Signatory"];
	        var type=["date","text","text"];
	        var name=["documentType1","documentType2","documentType3"];
		    var challen="";
			 for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			 
			document.getElementById("powerinner").innerHTML=challen;
		  
		  
		 
		
			 
	   }else if(docType.value=='Notice'){
			
			 
		   var field_name = ["Financial Year", "Assessment Year", "Date","Section","DIN","CIN"];
	         var type=["text","text","date","text","text","text"];
	         var name=["documentType1","documentType2","documentType3","documentType4","documentType5","documentType6"];
			 var challen="";
			 for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			 document.getElementById("noticeinner").innerHTML=challen;
		 
			 
	   }else if(docType.value=='Submission'){
			
			 
		     var field_name = ["Financial Year", "Assessment Year", "Submission Date","Order Reference / Notice Reference"];
	         var type=["text","text","date","text"];
	         var name=["documentType1","documentType2","documentType3","documentType4"];
			 var challen="";
			 for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			 document.getElementById("submissioninner").innerHTML=challen;
		  
		 
			 
	   }else if(docType.value=='Assessment Order'){
			
			 
		     var field_name = ["Financial Year", "Assessment Year", "Date","Section","Jurisdiction","Document Indentification No.(DIN)"];
	         var type=["text","text","date","text","text","text"];
	         var name=["documentType1","documentType2","documentType3","documentType4","documentType5","documentType6"];
			 var challen="";
			 for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			 document.getElementById("assessmentinner").innerHTML=challen;
			 
	   }else if(docType.value=='Income Tax Return'){
			
			 
		     var field_name = ["Financial Year", "Assessment Year", "Date of Filling","ITR Form No/ACR.No"];
	         var type=["text","text","date","text"];
	         var name=["documentType1","documentType2","documentType3","documentType4"];
			 var challen="";
			 for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			 document.getElementById("returninner").innerHTML=challen;
			 
	   }else if(docType.value=='Engagement Letter:'){
			
			 
		     var field_name = ["Date", "Period", "Authorization"];
	         var type=["date","text","text"];
	         var name=["documentType1","documentType2","documentType3"];
			 var challen="";
			 for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			 document.getElementById("engagementinner").innerHTML=challen;
			 
	   }else if(docType.value=='Challen:'){
			
			 
		     var field_name = ["Tax Type", "Challen Date", "Challen No.","Period / A4 /F4","BSR code"];
	         var type=["text","date","text","text","text"];
	         var name=["documentType1" , "documentType2" , "documentType3","documentType4","documentType5"];
			 var challen="";
			 for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			 document.getElementById("indirectchalleninner").innerHTML=challen;
			 
	   }else if(docType.value=='GSTR-1 Returns'){
			
			 
		     var field_name = ["Legal / Trade Name", "Month / Year", "GSTN","Authorization"];
	         var type=["text","date","text","text"];
	         var name=["documentType1" , "documentType2" , "documentType3","documentType4"];
			 var challen="";
			 for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			 document.getElementById("indirectgstrinner").innerHTML=challen;
			 
	   }else if(docType.value=='Invoice / Docs - Output'){
			
		   
		   
		     var field_name = ["Doc / Invoice No.", "Date", "GSTN","Name of Party"];
	         var type=["text","date","text","text"];
	         var name=["documentType1" , "documentType2" , "documentType3","documentType4"];
			 var challen="";
			 for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			 document.getElementById("indirectinvoceinner").innerHTML=challen;
			
		   
		    
	   }else if(docType.value=='STR-3B Returns'){
			
		   
		   
		     var field_name = ["Legal / Trade Name", "Tax period", "GSTN","Authorized Sign"];
	         var type=["text","date","text","text"];
	         var name=["documentType1" , "documentType2" , "documentType3","documentType4"];
			 var challen="";
			 for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			 document.getElementById("gstr3returninner").innerHTML=challen;
		
			
		   
		    
	   }else if(docType.value=='Input Detail/Docs/Invoices'){
			
		   
		   
		     var field_name = ["Invoice No.", "Date", "GSTN","Name of Party"];
	         var type=["text","date","text","text"];
	         var name=["documentType1" , "documentType2" , "documentType3","documentType4"];
			 var challen="";
			 for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			 document.getElementById("inputdetailinner").innerHTML=challen;
		    
	   }else if(docType.value=='Refund Forms RFD OS/01A'){
			
		   
		    var field_name = ["Legal/Trade Name", "Tax Period", "GSTN","Authorized Sign"];
	        var type=["text", "date" , "text" , "text"];
	        var name=["documentType1" , "documentType2" , "documentType3","documentType4"];
			var challen="";
			 for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			 document.getElementById("refundformsinner").innerHTML=challen;
		
			 
	   }else if(docType.value=='E-way Bill'){
			
		   
		   var field_name = ["E-way Bill No.", "Date of Generation", "Name of Generation","NSN Code","GSTN of Supplier","Vehicle No."];
	        var type=["text","date","text","text","text","text"];
	        var name=["documentType1" , "documentType2" , "documentType3","documentType4","documentType5","documentType6"];
			 var challen="";
			 for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			 document.getElementById("ewaybillinner").innerHTML=challen;
		     
		
			 
	   }else if(docType.value=='Refund Forms RFD OS/01A'){
			
		   
		   var field_name = ["Legal/Trade Name", "Tax Period", "GSTN","Authorized Sign"];
	        var type=["text", "date" , "text" , "text"];
	        var name=["documentType1" , "documentType2" , "documentType3","documentType4"];
			 var challen="";
			 for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			 document.getElementById("refundformsinner").innerHTML=challen;
		     
		
			 
	   }else if(docType.value=='Debit / Credit Note'){
			
		   
		      var field_name = ["GSTN Of Supplier", "Serial Number", "Date of Issue","Authorization"];
	          var type=["text", "text" , "date" , "text"];
	          var name=["documentType1" , "documentType2" , "documentType3","documentType4"];
			  var challen="";
			 
			 for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			 document.getElementById("debit_creditinner").innerHTML=challen;
		
		     
		
			 
	   }else if(docType.value=='Confirmations'){
			
		   
		     var field_name = ["Confirmation Type", "Company / Bank Name", "Date"];
	         var type=["text","text","date"];
	         var name=["documentType1" , "documentType2" , "documentType3"];
			 var challen="";
			 for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			 document.getElementById("confirmationinner").innerHTML=challen;
			 
	   }else if(docType.value=='General'){
			
		   
		     var field_name = ["Name", "Description", "Date"];
	         var type=["text","text","date"];
	         var name=["documentType1" , "documentType2" , "documentType3"];
			 var challen="";
			 for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			 document.getElementById("generalinner").innerHTML=challen;
			 
	   }else if(docType.value=='Minutes'){
			
		   
		      var field_name = ["Period", "Meeting Type", "Meeting Date"];
	          var type=["text","text","date"];
	         var name=["documentType1" , "documentType2" , "documentType3"];
			 var challen="";
			 for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			 document.getElementById("minutesinner").innerHTML=challen;
		    
	   }else if(docType.value=='Workpaper'){
			
		   
		     var field_name = ["Audit Period", "Workpaper Name", "Description"];
	         var type=["text","text","text"];
	         var name=["documentType1" , "documentType2" , "documentType3"];
			 var challen="";
			 for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			 document.getElementById("workinner").innerHTML=challen;
		
		    
	   }else if(docType.value=='Financials'){
			
		   
		     var field_name = ["Financial Year", "Signing Date", "UDIN"];
	         var type=["text","date","text"];
	         var name=["documentType1" , "documentType2" , "documentType3"];
			 var challen="";
			 for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			 document.getElementById("financialsinner").innerHTML=challen;
		
		    
	   }else if(docType.value=='Engagement Letter'){
			
		   
		     var field_name = ["Financial Year", "Signing Date", "UDIN"];
	         var type=["text","date","text"];
	         var name=["documentType1" , "documentType2" , "documentType3"];
			 var challen="";
			 for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			 document.getElementById("financialsinner").innerHTML=challen;
		
		    
			    
	   }else if(docType.value=='Employee Documents'){
			
		   
		     var field_name = ["Employee ID", "Employee Name", "Hiring Date"];
	         var type=["text","text","text"];
	         var name=["documentType1" , "documentType2" , "documentType3"];
			 var challen="";
			 for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			 document.getElementById("employee_documents").innerHTML=challen;
		
		    
	   }else if(docType.value=='Other'){
			
		   
		     var field_name = ["Document Name", "Description"];
	         var type=["text", "text"];
	         var name=["documentType1" , "documentType2"];
			 var challen="";
			 for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			 document.getElementById("employee_other").innerHTML=challen;
		
		    
	   }else if(docType.value=='Salary Regsiter'){
			
		   
		     var field_name = ["Period", "Description"];
	         var type=["text", "text"];
	         var name=["documentType1" , "documentType2"];
			 var challen="";
			 for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			 document.getElementById("employee_salary").innerHTML=challen;
		
		    
	   }else if(docType.value=='Contract'){
			
		   
		     var field_name = ["Contract Date", "Party" , "Description"];
	         var type=["date" , "text" , "text"];
	         var name=["documentType1" , "documentType2" , "documentType3"];
			 var challen="";
			 for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			 document.getElementById("contract").innerHTML=challen;
		
		    
	   }else if(docType.value=='Registration'){
			
		   
		     var field_name = ["Registration Type", "Registration Date" , "Description"];
	         var type=["text" , "date" , "text"];
	         var name=["documentType1" , "documentType2" , "documentType3"];
			 var challen="";
			 for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			 document.getElementById("registration").innerHTML=challen;
		
		    
	   }else if(docType.value=='Purchase(Goods)'){
			
		   
		     var field_name = ["Invoice Date", "Invoice Number" , "Description" , "Vendor Code" , "Vendor Name" , "Voucher Number"];
	         var type=["date" , "text" , "text" , "text" , "text" , "text"];
	         var name=["documentType1" , "documentType2" , "documentType3" , "documentType4" , "documentType5" , "documentType6"];
			 var challen="";
			 for(var num=0;num<=field_name.length-1;num++)
			 {
				 challen +='<div class="form-group remove">'
			     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
			     challen +='<div class="col-sm-10">'
			     challen +='<div class="form-line">'
			     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
		         challen +='</div>'
			     challen +='</div>'
			     challen +='</div>'
			 }
			 document.getElementById("purchase(goods)").innerHTML=challen;
		
		    
	    } else if(docType.value=='Purchase(Services)'){
					
				   
			     var field_name = ["Invoice Date", "Invoice Number" , "Description" , "Vendor Code" , "Vendor Name" , "Voucher Number"];
		         var type=["date" , "text" , "text" , "text" , "text" , "text"];
		         var name=["documentType1" , "documentType2" , "documentType3" , "documentType4" , "documentType5" , "documentType6"];
				 var challen="";
				 for(var num=0;num<=field_name.length-1;num++)
				 {
					 challen +='<div class="form-group remove">'
				     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
				     challen +='<div class="col-sm-10">'
				     challen +='<div class="form-line">'
				     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
			         challen +='</div>'
				     challen +='</div>'
				     challen +='</div>'
				 }
				 document.getElementById("purchase(services)").innerHTML=challen;
			
			    
		   }else if(docType.value=='Sale(Goods)'){
				
			   
			     var field_name = ["Invoice Date", "Invoice Number" , "Description" , "Customer Code" , "Customer Name"];
		         var type=["date" , "text" , "text" , "text" , "text" , "text"];
		         var name=["documentType1" , "documentType2" , "documentType3" , "documentType4" , "documentType5" , "documentType6"];
				 var challen="";
				 for(var num=0;num<=field_name.length-1;num++)
				 {
					 challen +='<div class="form-group remove">'
				     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
				     challen +='<div class="col-sm-10">'
				     challen +='<div class="form-line">'
				     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
			         challen +='</div>'
				     challen +='</div>'
				     challen +='</div>'
				 }
				 document.getElementById("sale(goods)").innerHTML=challen;
			
			    
		   }else if(docType.value=='Sale(Services)'){
				
			   
			     var field_name = ["Invoice Date", "Invoice Number" , "Description" , "Customer Code" , "Customer Name"];
		         var type=["date" , "text" , "text" , "text" , "text" , "text"];
		         var name=["documentType1" , "documentType2" , "documentType3" , "documentType4" , "documentType5" , "documentType6"];
				 var challen="";
				 for(var num=0;num<=field_name.length-1;num++)
				 {
					 challen +='<div class="form-group remove">'
				     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
				     challen +='<div class="col-sm-10">'
				     challen +='<div class="form-line">'
				     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
			         challen +='</div>'
				     challen +='</div>'
				     challen +='</div>'
				 }
				 document.getElementById("sale(services)").innerHTML=challen;
			
			    
				    
		   }else if(docType.value=='Audit Report'){
				
			   
			     var field_name = ["Financial Year", "Period" , "Auditor Name" , "Sign Date"];
		         var type=["text" , "text" , "text" , "date"];
		         var name=["documentType1" , "documentType2" , "documentType3" , "documentType4"];
				 var challen="";
				 for(var num=0;num<=field_name.length-1;num++)
				 {
					 challen +='<div class="form-group remove">'
				     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
				     challen +='<div class="col-sm-10">'
				     challen +='<div class="form-line">'
				     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
			         challen +='</div>'
				     challen +='</div>'
				     challen +='</div>'
				 }
				 document.getElementById("audit_report").innerHTML=challen;
			
			    
		   }else if(docType.value=='Balance Sheet'){
				
			   
			     var field_name = ["Financial Year", "Period" , "Description"];
		         var type=["text" , "text" , "text"];
		         var name=["documentType1" , "documentType2" , "documentType3"];
				 var challen="";
				 for(var num=0;num<=field_name.length-1;num++)
				 {
					 challen +='<div class="form-group remove">'
				     challen +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
				     challen +='<div class="col-sm-10">'
				     challen +='<div class="form-line">'
				     challen +='<input type="'+type[num]+'" value="" name="'+name[num]+'" class="form-control show-tick">'
			         challen +='</div>'
				     challen +='</div>'
				     challen +='</div>'
				 }
				 document.getElementById("balance_sheet").innerHTML=challen;
			
			    
		   }                                                                     
                                                    
	                        
	  
	 
	   
   }
	 


 
 
 
 
 
   var url = window.location.href;
   var res = url.split("?");
   var  document_info_id = res[1];
   var document_inner="<input type='hidden' name='document_info_id'  value='"+document_info_id+"'/>";
   document.getElementById("document_inner").innerHTML = document_inner; 
	
	
	
  $(document).ready(function() {
    
	  
	  $('#loader').show();
	  $.ajax({
  		   url:"../clientprocess?action=fetchdocumenttype",
  		   type:"POST",
  		   dataType:"json",
  		   data:{"document_info_id":document_info_id},
  		   success:function(data,textStatus,jqXHR)
  		   {
  			    
  			    
  			    var obj = JSON.parse(data.document_type);
  			    
  			    console.log(obj);
  			    
  			    var documentType="";
  			    $.each(obj ,  function( key, value ) {
  			    	documentType=value.documenttype;
  			    });
  			 
                var arr=documentType.split(",");
  			    var doc_type  = '<select class="form-control show-tick " onchange="documentType(this)" name="documenttype"><option class="form-control show-tick" value="">Select DocumentType</option>'
  			    for(var i=0;i<arr.length;i++)
  			    { 
  			    	doc_type +='<option class="form-control show-tick" value="'+arr[i]+'">'+arr[i]+'</option>'
  			    }
  			        doc_type +='</select>'; 
  			     $('.documentType').html(doc_type);
  			     $('#loader').hide();	 
  			    
  			    
  		   },
  		   error:function(e)
  		   {
  			  $('#loader').hide();	 
			  console.log("error in pages");
  		   }

  		});    
	  
	
  });
	
	
	
	
  function notification(){
  	
  	
  	
  	$.ajax({
        	
    	    url:"../clientprocess?action=notification",
 	        type:"post",
 	        dataType:"json",
 	        success: function(data)
 	        {
 	        	
 	             console.log(data.notification);
 	             
 	             var obj = JSON.parse(JSON.stringify(data.notification));
	        	 var html_data ='<li class="header">NOTIFICATIONS</li>';
	             $.each(obj,  function( key, value ) {
	            	 html_data +='<ul class="menu" style="overflow:hidden">'
	            	 html_data +='<li>'
	                 html_data +='<a href="javascript:void(0);">'
	            	 html_data +='<div class="icon-circle bg-light-green">'
	                 if(value.image_upload){
	                	 html_data +='<img src="'+value.image_upload+'" width="35" height="40">'
	     	      	  }else{
	                	 html_data +='<img src="https://cdn.iconscout.com/icon/free/png-512/avatar-380-456332.png" alt="client_logo" width="35" height="35">'
	      	         }
	            	 //html_data +='<i class="material-icons">person_add</i>'
	                 html_data +='</div>'
	                 html_data +='<div class="menu-info">'
	                 html_data +='<h4>'+value.new_message+'</h4>'
	                 html_data +='<p>'+value.email+'</p>'
	                 html_data +='<p><i class="material-icons">access_time</i>'+value.date_time+'</p>'
	                 html_data +='</div>'
	                 html_data +='</a>'
	                 html_data +='</li>'
	                 html_data +='</ul>'
	            });
	             
	             console.log(html_data);
	             
	        	 $('.notification').html(html_data);
	             
          
 	        },
  	    error:function(e)
  	    {
  	         console.log("error in pages");
  	    }  
     
  }); 
  	
  	
}
  
  
 
setTimeout(notification , 3000); 


</script>
</body>
</html>