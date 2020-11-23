<%@include file="include/session.jsp"%>
<!DOCTYPE html>
<html>
<head>
   <%@include file="include/head.jsp"%>
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
    
       .fa{
            font-size:18px !important;
            color: yellow;
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
    
    
    fieldset { 
  display: block;
  padding-left: 2px;
  padding-right: 2px;
  border: 1px solid grey;
}

    .container {
  display: block;
  position: relative;
  padding-left: 35px;
  margin-bottom: 12px;
  cursor: pointer;
  font-size: 16px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* Hide the browser's default checkbox */
.container input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  height: 0;
  width: 0;
}

/* Create a custom checkbox */
.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 25px;
  width: 25px;
  background-color: #eee;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
  background-color: #ccc;
}

/* When the checkbox is checked, add a blue background */
.container input:checked ~ .checkmark {
  background-color: #2196F3;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the checkmark when checked */
.container input:checked ~ .checkmark:after {
  display: block;
}

/* Style the checkmark/indicator */
.container .checkmark:after {
  left: 9px;
  top: 5px;
  width: 5px;
  height: 10px;
  border: solid white;
  border-width: 0 3px 3px 0;
  -webkit-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  transform: rotate(45deg);
}
    
    .bootstrap-select {
    box-shadow: none !important;
    /* border-bottom: 1px solid #ddd !important; */
    -webkit-border-radius: 0;
    -moz-border-radius: 0;
    -ms-border-radius: 0;
    border-radius: 0;
  }
    
  .btn:not(.btn-link):not(.btn-circle) {
  }
.btn:not(.btn-link):not(.btn-circle) {
    /* box-shadow: 0 2px 5px rgba(0, 0, 0, 0.16), 0 2px 10px rgba(0, 0, 0, 0.12); */
    /* -webkit-border-radius: 2px; */
    -moz-border-radius: 2px;
    -ms-border-radius: 2px;
    /* border-radius: 2px; */
    /* border: none; */
    /* font-size: 13px; */
    /* outline: none; */
}
   </style>

</head>

<body class="theme-light-blue">
    <div class="overlay"></div>
           <%@include file="include/navbar.jsp"%>
    <section>
           <%@include file="include/sidebar.jsp"%>
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
                        <div class="header  margin0">
                             <h2>Access Requested by you</h2>
                            <div class="row">
                            </div>
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-hover" id="requestByYou">
                                <thead>
                                    <tr>
                                        <th>Date</th>
                                        <th>Requestor</th>
                                        <th>Email</th>
                                        <th>Request Type</th>
                                        <th>Status</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                               
                                </tbody>
                            </table>
                           </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
      <section class="content">
        <div class="container-fluid">
            <div class="block-header">
                <h2>
                   
                </h2>
           </div>
            <div class="row" style="margin-right: -35px !important;margin-left: -156px !important;margin-top: -114px !important;">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header  margin0">
                               <h2>Access Requested from you</h2>
                            <div class="row">
                            </div>
                           
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-hover" id="requestByFrom">
                                <thead>
                                    <tr>
                                        <th>Date</th>
                                        <th>Requestor</th>
                                        <th>Email</th>
                                        <th>Request Type</th>
                                        <th>Status</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                               
                                </tbody>
                            </table>
                           </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
   
   
   <!--Start File Level Access  -->
  <div class="modal fade request-access-file-modal"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel" style="text-align:center;">Request For Access</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form class="request-access-form">
      <div class="modal-body">
           <div class="table-responsive">
            <table class="table table-hover">
             <thead>
                 <tr>
                     <th>File Name</th>
                     <th>File Department</th>
                     <th>Created By</th>
                     <th>Created On</th>
                 </tr>
              </thead>
              <tbody class="html_file">
             
             </tbody>
           </table>
          </div>
		
      </div>
	      <div class="modal-footer">
	      </div>
	 </form> 
    </div>
  </div>
</div> 
 <!--End File Level Access  -->
 
 
 
  <!--Start Department Level Access  -->
  <div class="modal fade request-access-department-modal"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header" >
        <h5 class="modal-title" id="exampleModalLabel" style="text-align:center;">Request For Access</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form>
      <div class="modal-body">
         <!-- <div class="form-group" style="text-align:center;font-size:16px;margin-bottom:8px;font-family:cursive;">
			 <span> Akash Rathore has requested access to the following Department</span>
		  </div>  -->
		      <div class="row">
                        <div class="form-group">
                        <!--  <label  class="col-sm-3 control-label" style="margin-bottom:0px !important;font-size:20px;">Department</label>
                         -->
                         
                            <div class="col-sm-3">
                                <label  class="control-label">Department</label>
                            </div>
                            <div class="col-sm-3">
                                <label  class="control-label">Read</label>
                           </div>
                           <div class="col-sm-3">
                                <label  class="control-label">Write</label>
                            </div>
                           <div class="col-sm-3">
                                <label  class="control-label">Dept. Admin</label>
                           </div>
                       </div>
                       <div class="html_department">
                       
                       </div>
                  </div>   
      </div>
	     <div class="modal-footer">
	  </div>
	 </form> 
    </div>
  </div>
</div> 
 
 <!--End Department Level Access  -->
 <div class="modal fade request-access-from-file-modal"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel" style="text-align:center;">Request For Access</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form class="request-access-form">
      <div class="modal-body">
       <!--   <div class="form-group" style="text-align:center;font-size:16px;margin-bottom:8px;font-family:cursive;">
			 <span> Akash Rathore has requested access to the following File</span>
		  </div>  -->
		   <div class="table-responsive">
            <table class="table table-hover">
             <thead>
                 <tr>
                     <th>File Name</th>
                     <th>File Department</th>
                     <th>Created By</th>
                     <th>Created On</th>
                 </tr>
              </thead>
              <tbody id="requestByFromFileAccept">
             
             </tbody>
           </table>
          </div>
		  <div class="form-group">
			 <label  class="col-sm-2 control-label">Rejection Remarks</label>
				  <div class="col-sm-10">
					     <div class="form-line">
					         <input type="hidden" name=""  id="access_request_id" value=""/>
							 <textarea  placeholder="Rejection Remarks" class="form-control" id="reject_remarks" name="rejection_remarks"></textarea>
					     </div>
				 </div>
		  </div> 
      </div>
	      <div class="modal-footer" style="text-align:center;margin-top:30px;">
	         <button type="button" data-status="approve" onclick="accessRequestFrom(this)" class="btn" style="width:120px;border:1px solid #6c757d;color: #f8fcff;background: #6c757d;">APPROVE</button>      
	         <button type="button" data-status="reject"  onclick="accessRequestFrom(this)" class="btn" style="width:120px;border:1px solid #f91010;color: #f8fcff;background: #f91010;">REJECT</button>
	      </div>
	 </form> 
    </div>
  </div>
</div>
 
   
  <!--   
  <div class="modal fade request-access-department-modal"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header" style="margin-bottom:-34px;">
        <h5 class="modal-title" id="exampleModalLabel" style="text-align:center;">Request For Access</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form class="request-access-form">
      <div class="modal-body">
         <div class="form-group" style="text-align:center;font-size:16px;margin-bottom:8px;font-family:cursive;">
			 <span> Akash Rathore has requested access to the following Department</span>
		  </div> 
		      <div class="row">
                        <div class="form-group">
                         <label  class="col-sm-3 control-label" style="margin-bottom:0px !important;font-size:20px;">Department</label>
                        
                         
                            <div class="col-sm-3">
                                <label  class="control-label">Department</label>
                            </div>
                            <div class="col-sm-3">
                                <label  class="control-label">Read</label>
                           </div>
                           <div class="col-sm-3">
                                <label  class="control-label">Write</label>
                            </div>
                           <div class="col-sm-3">
                                <label  class="control-label">Dept. Admin</label>
                           </div>
                       </div>
                        <div class="form-group">
                                   <label  class="col-sm-3 control-label" style="margin-bottom:0px !important;font-family: emoji;">Sales</label>
                                  
                            <div class="col-sm-3">
                                 <select class="form-control" name="department">
                                    <option value="Hr">Hr</option>
                                    <option value="Sales">Sales</option>
                                 </select>
                            </div>  
	                        <div class="col-sm-3">
	                             <input type='checkbox'  name='access_right_0' value=":Read" id="dept"/><label for="dept"></label>
				             </div>
	                         <div class="col-sm-3">
	                              <input type='checkbox'  name='access_right_0' value=":Write" id="dept_1"/><label for="dept_1"></label>
				             </div>
	                         <div class="col-sm-3">
	                              <input type='checkbox'  name='access_right_0' value=":Dept_Admin" id="dept_2"/><label for="dept_2"></label>
				             </div>
                        
                        </div>
                 </div>   
                       
                       
		  
		  <div class="form-group">
			 <label  class="col-sm-4 control-label">Rejection Remarks</label>
				  <div class="col-sm-8">
					     <div class="form-line">
							 <textarea  placeholder="Rejection Remarks" class="form-control"  name="rejection_remarks"></textarea>
					     </div>
				 </div>
		  </div> 
      </div>
	     <div class="modal-footer" style="text-align:center;margin-top:30px;">
	         <button type="submit" class="btn" style="width:120px;border:1px solid #6c757d;color: #f8fcff;background: #6c757d;">Submit</button>      
	         <button type="button" class="btn" style="width:120px;border:1px solid #6c757d;color: #f8fcff;background: #6c757d;" data-dismiss="modal">Return</button>
	     </div>
	 </form> 
    </div>
  </div>
</div> --> 
   
   
   <%@include file="include/loader.jsp"%>
   <%@include file="include/script.jsp"%>
    <script src="../js/canvasjs.min.js"></script>
    <script type="text/javascript" src="//cdn.datatables.net/1.10.0/js/jquery.dataTables.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script>
   	


    function accessRequestFrom(data){
    	
    	var status=data.getAttribute("data-status");
    	var request_access_id=$('#access_request_id').val();
    	var reject_remarks=$('#reject_remarks').val();
    	var data={ "status":status , "request_access_id":request_access_id , "reject_remarks":reject_remarks}
    	console.log(data);
    	
      $('#loader').show();
  	  $.ajax({
      	
      	    url:"../clientprocess?action=updateRemarksRequestAccess",
 	        type:"post" ,
 	        dataType:"json",
 	        data:data ,
 	        success: function(result)
 	        {
 	        	
 	        	 console.log(result.status);
 	        	
 	        	 if(result.status){
 	        		 
 	        		 Swal.fire({
	  	    			  position: 'center',
	  	    			  icon: 'success',
	  	    			  title: 'Success',
	  	    			  showConfirmButton: false,
	  	    			  timer: 3000
	  	    			})
	  	    			
	  	    			$('#reject_remarks').val('');
 	        		 
 	        	 }else{
 	        	
 	        		 Swal.fire({
	   	    			  icon:'error',
	   	    			  title:'wrong',
	   	    			  text:"Something went Wrong",
	   	    			  footer:'',
	   	    			  timer:3000
	   	    			}) 
 	        		 
 	        	 } 
 	        	$('#loader').hide();
 	        	 
 	        	 
 	        },
	  	    error:function(e)
	  	    {
	  	        $('#loader').hide();
	  	    	console.log("error in pages");
	  	    } 
	     
       });
    	
    }
    
    
    
    $("input:checkbox").on('click', function() {
        
  	  var $box = $(this);
        if($box.is(":checked")) {
  	    
      	var group = "input:checkbox[name='" + $box.attr("name") + "']";
  	    $(group).prop("checked", false);
  	    $box.prop("checked", true);
  	  
        } else {
  		  
  	     $box.prop("checked", false);
  	  
  	  } 
  
  });
  
    
    
    
    
$(document).on('click' , '.request-access-from-file' , function(){
 	    
      	  var id=$(this).data('id');
    	  var req=$(this).data('req');
      	  
      	  $('#loader').show();
    	  $.ajax({
        	
        	url:"../clientprocess?action=requestByFromFileAccept",
   	        type:"post",
   	        dataType:"json",
   	        data:{"document_info_id":$(this).data('id')},
   	        success: function(data)
   	        {
   	        
   	        	   var obj = JSON.parse(JSON.stringify(data.requestByFromFileAccept));
     	           var html_file="";
   	        	   $.each(obj ,  function( key, value ) {
   	        		   
     	        	   html_file +='<tr>'
     	        	   html_file +='<td>'+value.file_name+'</td>'
     	        	   html_file +='<td>'+value.department+'</td>'
     	        	   html_file +='<td>'+value.employee_name+'</td>'
     	               html_file +='<td>'+value.upload_date+'</td>'
     	               html_file +='</tr>'
     	           
   	        	   });
   	        	
   	        	   
   	        	   $('#access_request_id').val(req);
   	        	   $('#loader').hide();
   	        	   $('#requestByFromFileAccept').html(html_file);
   	        	   $('.request-access-from-file-modal').modal('show');   
   	         
   	        },
	  	    error:function(e)
	  	    {
	  	        $('#loader').hide();
	  	    	console.log("error in pages");
	  	    } 
	     
        }); 
           
    });     
    
    
    
    $(document).on('click' , '.request-access-file' , function(){
 	    
    	var id=$(this).data('id');
    	
    	  $('#loader').show();
    	   $.ajax({
        	
        	url:"../clientprocess?action=accessRequestedYou",
   	        type:"post",
   	        dataType:"json",
   	        data:{"request_id":$(this).data('id')},
   	        success: function(data)
   	        {
   	        
   	        	   var obj = JSON.parse(JSON.stringify(data.accessRequestedYou));
     	           var html_file="";
   	        	   $.each(obj ,  function( key, value ) {
     	        	   html_file +='<tr>'
     	        	   html_file +='<td>'+value.file_name+'</td>'
     	        	   html_file +='<td>'+value.department+'</td>'
     	        	   html_file +='<td>'+value.client_name+'</td>'
     	               html_file +='<td>'+value.upload_date+'</td>'
     	               html_file +='</tr>'
     	           });
   	        	 
   	        	   $('#loader').hide();
   	        	   $('.html_file').html(html_file);
   	        	   $('.request-access-file-modal').modal('show');   
   	         
   	        },
	  	    error:function(e)
	  	    {
	  	        $('#loader').hide();
	  	    	console.log("error in pages");
	  	    } 
	     
        }); 
           
    });     
    
    
    
    $(document).on('click' , '.request-access-department' , function(){
 	    
        var id=$(this).data('id');
      
        $('#loader').show();
        $.ajax({
        	
        	url:"../clientprocess?action=accessRequestedYou",
   	        type:"post",
   	        dataType:"json",
   	        data:{"request_id":$(this).data('id')},
   	        success: function(data)
   	        {
   	        	
   	           var access_level=""	
   	           var obj = JSON.parse(JSON.stringify(data.accessRequestedYou));
   	           $.each(obj ,  function( key, value ) {
   	        	  access_level=value.access_level;
   	           });
   	          
   	           
   	           var html_department="";  
   	          
   	           $.each(JSON.parse(access_level) ,  function( key, value ) {
   	        	  
   	        	        html_department +=' <div class="form-group">'
		   	          //  html_department +=' <div class="col-sm-3">'
		   	            html_department +=' <div class="col-sm-3"><select class="form-control" name=""><option value="Hr">'+value.department+'</option><select></div>'    	  
		   	    //      html_department +='<div class="col-sm-3">' 
		   	            
		   	            if(value.access_level =='Read'){
		   	            	html_department +='<div class="col-sm-3"><input type="checkbox"  name="ccess_right_0" value=":Read"  checked/><label for="dept"></label></div>'
		 		   	    }else{
		   	            	html_department +='<div class="col-sm-3"><input type="checkbox"  name="ccess_right_0" value=":Read"   /><label for="dept"></label></div>'
		 		   	    }
		   	           
		   	           if(value.access_level =='Write'){
		   	             html_department +='<div class="col-sm-3"><input type="checkbox"  name="ccess_right_0" value=":Write"  checked/><label for="dept"></label></div>'
		   		       }else{
		   	            html_department +='<div class="col-sm-3"><input type="checkbox"  name="ccess_right_0" value=":Write"  /><label for="dept"></label></div>'
		  		       } 
		   	           
		   	           if(value.access_level =='Dept_Admin'){
		   	        	 html_department +='<div class="col-sm-3"><input type="checkbox"  name="ccess_right_0" value=":Dept_Admin" checked/><label for="dept"></label></div>'
					   }else{
		   	        	 html_department +='<div class="col-sm-3"><input type="checkbox"  name="ccess_right_0" value=":Dept_Admin" /><label for="dept"></label></div>'
		   	           }
		   	           html_department +='</div>';
		            	  
 	           });

   	           $('#loader').hide();
			   $('.html_department').html(html_department);	 
   	           $('.request-access-department-modal').modal('show');
   	         
   	        },
	  	    error:function(e)
	  	    {
	  	        $('#loader').hide();
	  	    	console.log("error in pages");
	  	    } 
	     
        }); 
        
     //  
  }); 
    
    
    
    
    $("#requestByYou").dataTable( {
		   
    	"lengthMenu":[25,50],
        "pageLength":25,
		"searching":false,
        "bProcessing": false,
        "bServerSide": false,
        "sort": "position",
        "sAjaxSource": "../clientprocess?action=requestByYou",
         "aoColumns": [

	        	{ "mData": "request_date" }, 
	            { "mData": "employee_name" },
	            { "mData": "employee_email_id" },
	            { "mData": "request_type" },
	            { "mData": "approval_status" },
	            { "mData": "details"},
	            
	        ]
	    } ); 

    
    $("#requestByFrom").dataTable( {
		   
    	"lengthMenu":[25,50],
        "pageLength":25,
		"searching":false,
        "bProcessing": false,
        "bServerSide": false,
        "sort": "position",
        "sAjaxSource": "../clientprocess?action=requestByFrom",
         "aoColumns": [

	        	{ "mData": "request_date" }, 
	            { "mData": "employee_name" },
	            { "mData": "employee_email_id" },
	            { "mData": "request_type" },
	            { "mData": "approval_status" },
	            { "mData": "details"},
	            
	        ]
	    } ); 
    
    
    
    
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
