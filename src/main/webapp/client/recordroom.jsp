<%@include file="include/session.jsp"%>
<!DOCTYPE html>
<html>
<head>
   <%@include file="include/head.jsp"%>
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
    
    
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
    
    
       .fa{
            font-size:18px !important;
            color: yellow;
       }  
       
       .loader{
     
       display:none;
      
      }
    
    
   </style>

</head>

<body class="theme-light-blue">
   
     
    <!-- Overlay For Sidebars -->
    <div class="overlay"></div>
    <!-- #END# Overlay For Sidebars -->
    
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
                  <a href="#" onclick="addFile()" style="text-decoration:none;color:#fff;padding-left:714px;"><span style="font-size:32px;font-weight:bold;">+</span></a>
	          </div>
	    
	    </div>
		<div class="container-fluid"
			style="position: fixed; bottom: 0; width: 100%; height: 37px; background: #6c757d; display: flex; flex-direction: row; justify-content: space-between; align-items: center;">
			<div>
				<a href="condition.jsp" style="color: #fff; text-decoration: none;">Terms
					& Conditions</a>
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
                        <div class="header  margin0">
                             <h2></h2>
                        </div>
                        <div class="body">
             
                            <div class="table-responsive">
                                <table class="table table-hover" id="fileNameRecord">
                                <thead>
                                    <tr>
                                        <th>File Name</th>
                                        <th>Department</th>
                                        <th>File Description</th>
                                        <th></th>
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
     
     <div class="modal fade" id="fileAdd" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog  modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" style="text-align:center;" id="exampleModalLabel">+ Add File</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			  <form class="form-submit">		
				<div class="modal-body">
				 <div class="container-fluid">
				   <div class="row">
				       <div class="form-group">
                        <label  class="col-sm-2 control-label">Department</label>
                        <div class="col-sm-10">
                            <div class="form-line department">
                               
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
						<label  class="col-sm-2 control-label">Name
							</label>
						<div class="col-sm-10">
							<div class="form-line">
								<input type="text" class="form-control" name="file_name"
									value="" placeholder="Name">
							</div>
						</div>
					</div> 
				   <div class="form-group">
						<label for="Email" class="col-sm-2 control-label">Description
							</label>
						<div class="col-sm-10">
							<div class="form-line">
								<textarea type="text" class="form-control" name="file_description"
									 placeholder="Description"></textarea>
							</div>
						</div>
					</div>
				 	<div class="form-group">
                          <div class="col-sm-10 table-responsive" style="margin-top:20px">
                              <table class="table table-bordered table-hover"  id="documentuploading">
                               <thead>
                               </thead>
                               <tbody>
                                   
                               </tbody>
                              </table>
                          </div>
                           <div class="col-sm-2">
                               <button class="addmore btn"  style="margin-top:20px;width:120px;border:1px solid #6c757d;color: #f8fcff;background: #6c757d;" type="button" >+ Add People </button>
                            </div>    
                    </div> 
                       <div class="form-group" style="margin-top:95px;">
						<div class="col-sm-12">
							<h5 style="margin-top:24px;">
							  Note: If no users are selected, all users with access to the selected department will be able to Write/ Read the file as per their respective system rights
							</h5>
						</div>
					</div>
				   </div>
				  </div>
		
				<div class="modal-footer" style="text-align:center;">
					<button type="submit" class="btn" style="width:120px;border:1px solid #6c757d;color: #f8fcff;background: #6c757d;">Submit</button>
					<button type="button" class="btn" style="width:120px;border:1px solid #6c757d;color: #f8fcff;background: #6c757d;" data-dismiss="modal">Cancel</button>
				</div>
			  </div>
		   </form> 	
		  </div>
		</div>
	</div>
   
   
   
   <div class="modal fade" id="edit-file-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog  modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" style="text-align:center;" id="exampleModalLabel">+ Edit File</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			  <form class="form-update">		
				<div class="modal-body">
				 <div class="container-fluid">
				   <div class="row">
				       <div class="form-group">
                        <label  class="col-sm-2 control-label">Department</label>
                        <div class="col-sm-10">
                            <div class="form-line">
                              <div class="form-line">
								<input type="text" id="dept" class="form-control" name="dept"
									value="" readonly/>
								<input type="hidden" name="document_info_id" id="document_info_id"/> 	
									
							</div>   
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
						<label  class="col-sm-2 control-label">Name
							</label>
						<div class="col-sm-10">
							<div class="form-line">
								<input type="text" class="form-control" id="file_name" name="file_name"
									value="" placeholder="Name">
							</div>
						</div>
					</div> 
				   <div class="form-group">
						<label for="Email" class="col-sm-2 control-label">Description
							</label>
						<div class="col-sm-10">
							<div class="form-line">
								<textarea type="text" class="form-control" id="description" name="file_description"
									 placeholder="Description"></textarea>
							</div>
						</div>
					</div>
				 <!-- 	<div class="form-group">
                          <div class="col-sm-10 table-responsive" style="margin-top:20px">
                              <table class="table table-bordered table-hover">
                               <thead>
                               </thead>
                               <tbody class="html_editfile">
                                   
                               </tbody>
                              </table>
                          </div>
                           <div class="col-sm-2">
                               <button class="addmore" class="btn btn-primary" style="margin-top:20px;" type="button" >+ Add People </button>
                            
                           </div>    
                    </div>  -->
                    <div class="form-group">
                          <div class="col-sm-10 table-responsive" style="margin-top:20px">
                              <table class="table table-bordered table-hover"  id="documentuploading">
                               <thead>
                               </thead>
                               <tbody class="html_editfile">  
                                   
                               </tbody>
                              </table>
                          </div>
                           <div class="col-sm-2">
                               <button class="addmore btn"  style="margin-top:20px;width:120px;border:1px solid #6c757d;color: #f8fcff;background: #6c757d;" type="button" >+ Add People </button>
                            </div>    
                    </div>
                    <div class="form-group" style="margin-top:95px;">
						<div class="col-sm-12">
							<h5 style="margin-top:24px;">
							  Note: If no users are selected, all users with access to the selected department will be able to Write/ Read the file as per their respective system rights
							</h5>
						</div>
					</div>
				   </div>
				  </div>
		
				<div class="modal-footer" style="text-align:center;">
					<button type="submit" class="btn"  style="width:120px;border:1px solid #6c757d;color: #f8fcff;background: #6c757d;">Submit</button>
					<button type="button" class="btn" style="width:120px;border:1px solid #6c757d;color: #f8fcff;background: #6c757d;" data-dismiss="modal">Cancel</button>
				</div>
			  </div>
		   </form> 	
		  </div>
		</div>
	</div>
   <!-- Request Access -->
   
 <div class="modal fade" id="request_access" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Request Access</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form class="request-access-form">
      <div class="modal-body request-access-modal-html">
        
      </div>
	      <div class="modal-footer">
	        <button type="submit" class="btn btn-primary">Submit</button>      
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Return</button>
	      </div>
	 </form> 
    </div>
  </div>
</div>
   
  
  <!--Details  -->
  <div class="modal fade details-modal"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel" style="text-align:center;">Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form class="request-access-form">
      <div class="modal-body">
          
          <div class="form-group">
			 <label  class="col-sm-4 control-label">Permissions</label>
					<div class="col-sm-8">
						 <div class="form-line">
							 <input type="text" class="form-control" id="permission" name="file_name" value="" placeholder="" readonly>
						</div>
					</div>
		  </div>
		  
		  <div class="form-group">
			 <label  class="col-sm-4 control-label">File No.</label>
					<div class="col-sm-8">
					     <div class="form-line">
							 <input type="text" class="form-control"  id="file_no" name="file_name" value="" placeholder="" readonly>
					     </div>
					</div>
		  </div>
		   
		  <!-- <div class="form-group">
			 <label  class="col-sm-4 control-label">File No.</label>
					<div class="col-sm-8">
					     <div class="form-line">
							 <input type="text" class="form-control"  name="file_name" value="" placeholder="Name">
					     </div>
					</div>
		  </div> -->
		  
		  <div class="form-group">
			 <label  class="col-sm-4 control-label">Created By</label>
					<div class="col-sm-8">
					     <div class="form-line">
							 <input type="text" class="form-control"  id="client_name" name="file_name" value="" placeholder="" readonly>
					     </div>
					</div>
		  </div>
		  
		  <div class="form-group">
			 <label  class="col-sm-4 control-label">Created On</label>
					<div class="col-sm-8">
					     <div class="form-line">
							 <input type="text" class="form-control" id="upload_date" name="file_name" value="" placeholder="" readonly>
					     </div>
					</div>
		  </div>
		  
		  <!-- <div class="form-group">
			 <label  class="col-sm-4 control-label">Accessed By</label>
					<div class="col-sm-8">
					     <div class="form-line">
							 <input type="text" class="form-control"  name="file_name" value="" placeholder="" readonly>
					     </div>
					</div>
		  </div>
		  
		  <div class="form-group">
			 <label  class="col-sm-4 control-label">Accessed On</label>
					<div class="col-sm-8">
					     <div class="form-line">
							 <input type="text" class="form-control"  name="file_name" value="" placeholder="" readonly>
					     </div>
					</div>
		  </div> -->
		  
		  <div class="form-group">
			 <label  class="col-sm-4 control-label">Modified By</label>
					<div class="col-sm-8">
						 <div class="form-line">
							 <input type="text" class="form-control" id="modify_name" name="file_name" value="" placeholder="" readonly>
					     </div>   
					</div>
		  </div>
		 
		 <div class="form-group">
			 <label  class="col-sm-4 control-label">Modified On</label>
					<div class="col-sm-8">
						 <div class="form-line">
							 <input type="text" class="form-control" id="modify_date" name="file_name" value="" placeholder="" readonly>
					     </div>   
					</div>
		  </div>
		  
      </div>
	      <div class="modal-footer">
	        <!-- <button type="submit" class="btn btn-primary">Submit</button>      
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Return</button> -->
	      </div>
	 </form> 
    </div>
  </div>
</div> 
   <%@include file="include/loader.jsp"%>
   <%@include file="include/script.jsp"%>
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
   <script type="text/javascript"
		src="//cdn.datatables.net/1.10.0/js/jquery.dataTables.js"></script>
   
   <script>
   
   $(document).on('click' , '.request-access-modal' , function(event){
	       event.preventDefault();
	
		            var request= '<div class="form-group">'
				        +'<label for="NameSurname" class="col-sm-4 control-label">Request Access</label>'
				        +'<div class="col-sm-8">'
				        +'<div class="form-line">'
				        +'<input type="hidden" name="document_info_id" value="'+$(this).data('id')+'">'
				        +'<select class="form-control show-tick" name="request_access">'         
				        +'<option value="">Select</option>'          
				        +'<option value="Read">Read</option>'
				        +'<option value="Write">Write</option>'
				        +'</select></div></div></div>';
				        $('.request-access-modal-html').html(request);
	                    $('#request_access').modal('show');
	});
   
  
   $(document).on('click' , '.details' , function(event){
       event.preventDefault();
       
       $('#loader').show();
       $.ajax({
    	   
	        url: "../clientprocess?action=fileDetails",
	        type: "post",
	        dataType:"json",
	        data:{"document_info_id":$(this).data('id')},
	        success: function(data)
	        {
	        	
	        	 var obj = JSON.parse(JSON.stringify(data.filedetals));
	        	 
	        	 var access_level="";
	        	 var upload_date="";
	        	 var file_no="";
	        	 var modify_date="";
	        	 var modify_name="";
	        	 var client_name="";
	         	 
	        	 $.each(obj,  function( key, value ) {
	        		 
	        		 access_level=value.access_level;
	        		 upload_date=value.currentDate;
	        		 file_no=value.file_no;
	        		 modify_date=value.modify_date;
	        		 
	        		 
	        		
                     if(value.client_name === undefined ){
	        		 }else{
	        			 client_name=value.client_name;
		        	 }
	                 
                     if(value.modify_date === undefined ){
	        		 }else{
	        			 modify_date=value.modify_date;
		    		 }
	        		 
	                 if(value.modify_name === undefined ){
	        		 }else{
	        			 modify_name=value.modify_name;
		    		 } 
	        		 
	        	 });
	        	
	         	   $('#loader').hide();
	               $('#permission').val(access_level);
	 			   $('#upload_date').val(upload_date);
	 			   $('#file_no').val(file_no);
	 			   $('#modify_date').val(modify_date);
	 			   $('#modify_name').val(modify_name);
	 			   $('#client_name').val(client_name);
	 			   $('.details-modal').modal('show');
	        	 
	           
	        	          	
	        },
 	        error:function(e)
 	       {
 	    	 console.log("error in pages");
 	       }
    
      }); 
  });
   
   
   
   $(document).on('submit' , '.request-access-form' , function(event){
       event.preventDefault();
       
       var form=$(this);
       var formdata=new FormData($(form)[0]);
       var data={};
       formdata.forEach(function(value,key)
       {
    		  data[key]=value;
       }); 

       $('#loader').show();
       $.ajax({
	        url:"../clientprocess?action=requestaccess",
	        type:"post",
	        dataType:"json",
	        data:data,
	        success: function(data)
	        {
	              
	        	    if(data.status)
				    {
				      
				    	  Swal.fire({
		  	    			  position: 'center',
		  	    			  icon: 'success',
		  	    			  title: 'Success',
		  	    			  showConfirmButton: false,
		  	    			  timer: 3500
		  	    			})
		  	    			 $('#loader').hide();	
				    	    
				    }
				    else
				    {
				      	
				    	 Swal.fire({
		   	    			  icon:'error',
		   	    			  title:'Somethind went Wrong',
		   	    			  text:"Something went Wrong",
		   	    			  footer:'',
		   	    			  timer:3500
		   	    			}) 
				    	
		   	    		 $('#loader').hide();
				    }
	              
       
	        },
	  	    error:function(e)
	  	    {
	  	    	console.log("error in pages");
	  	    	 $('#loader').hide();
	  	    }
	     
       }); 	
       
       
   
   });
   
   
    
 $(document).on('keyup' , '.search-suggestion' , function(){
	     
	   var id=$(this).attr("id");
	   
	   
	   console.log(id);
	   $.ajax({
	        url: "../clientprocess?action=suggestionName",
	        type: "post",
	        dataType:"json",
	        data:{"search_box":$(this).val()},
	        success: function(data)
	        {
	        	
	            var obj = JSON.parse(JSON.stringify(data.name));
	            
	            console.log(obj);
	            
	            var details='';
 			      $.each(obj,  function( key, value ) {
 			    	  if(value.upload === undefined){
 			    		 details +='<div class="search addmore"><div class="append-search"  style="position:relative;border-left: 1px solid #e6e5e5;border-right: 1px solid #e6e5e5;border-bottom: 1px solid #e6e5e5;"><img src="https://cdn.iconscout.com/icon/free/png-512/avatar-380-456332.png" alt="client_logo" width="35" height="35"><span style="padding-left:22px;position:absolute;top:1px;left:63px;">'+value.name+'</span><input type="hidden" name="file_user_name['+i+']" value="'+value.id+'"><span style="padding-left:19px;position:absolute;top:18px;">'+value.email+'</span></div></div>'; 
 					  }else{
 			    		 details +='<div class="search addmore"><div class="append-search"  style="position:relative;border-left: 1px solid #e6e5e5;border-right: 1px solid #e6e5e5;border-bottom: 1px solid #e6e5e5;"><img src="'+value.upload+'" alt="client_logo" width="35" height="35"><span style="padding-left:22px;position:absolute;top:1px;left:63px;">'+value.name+'</span><input type="hidden" name="file_user_name['+i+']" value="'+value.id+'"><span style="padding-left:19px;position:absolute;top:18px;">'+value.email+'</span></div></div>'; 
 					  }
 			      });
 			      $('.search-box').html(details);
	        },
	  	    error:function(e)
	  	    {
	  	    	console.log("error in pages");
	  	    }
	     }); 
 
  });
   
  
 
 $(document).ready(function() {
         
 	   $("#fileNameRecord").dataTable( {
 		   
 		    "lengthMenu":[25,50],
             "pageLength":25,
   		    "searching":false,
 	        "bProcessing": false,
 	        "bServerSide": false,
 	        "sort": "position",
 	        "sAjaxSource": "../clientprocess?action=fetchfilename",
 	        "aoColumns": [
 	            
 	        	{ "mData": "file_name" },
 	            { "mData": "file_department" },
 	            { "mData": "file_description" },
 	            { "mData": "detail" },
 	            { "mData": "action" },
 	            
 	        ]
 	    } );

 	} );

   
   
   $(document).on('click' , '.edit-addfile' , function(){
	     var id=$(this).data('id');
	     
	     $('#loader').show();
	     $.ajax({
 	        url: "../clientprocess?action=editAddFile",
	        type: "post",
	        dataType:"json",
	        data:{"document_info_id":$(this).data('id')},
	        success: function(data)
	        {
	        	
	        	var editfile=JSON.parse(data.editfile);
	        	console.log(editfile);
	        	
	        	 
	        	var html_editfile='';
	        	let i=0;
	        	var dept="";
	        	var file_name="";
	        	var description="";
	        	var document_info_id="";
	        	$('.remove').remove();
	        	$.each(editfile ,  function( key, value ) {
   			    	
 			    	dept=value.departmentname;
 			    	file_name=value.filename
 			    	description=value.file_description;
 			    	document_info_id=value.id;
 			    	
 			    	if(value.employee_name){
 			    	
 				    html_editfile +='<tr class="remove">';
 			    	if(value.imageupload === undefined){
 				    	html_editfile +='<td style="width:300px;"><div style="position:relative;" ><img src="https://cdn.iconscout.com/icon/free/png-512/avatar-380-456332.png" alt="client_logo" width="35" height="35"><span style="padding-left:21px;position:absolute;top:-5px;left:63px;">'+value.employee_name+'</span><input type="hidden" name="file_user_name['+i+']" value="'+value.other_client+'"><span style="padding-left:19px;position:absolute;top:18px;">'+value.emp_email_id+'</span></div></td>';
 			        }else{
 			        	
 			        	html_editfile +='<td style="width:300px;"><div style="position:relative;" ><img src="'+value.imageupload+'" alt="client_logo" width="35" height="35"><span style="padding-left:21px;position:absolute;top:-5px;left:63px;">'+value.employee_name+'</span><input type="hidden" name="file_user_name['+i+']" value="'+value.other_client+'"><span style="padding-left:19px;position:absolute;top:18px;">'+value.emp_email_id+'</span></div></td>';
 		 			}
 			    	if(value.access_level =='Read'){
 			    		html_editfile +='<td><select class="form-control show-tick" name="file_access_level['+i+']"><option value="Read">Read</option><option value="Write">Write</option></select></td>';
 			    	}else if(value.access_level =='Write'){
 			    		html_editfile +='<td><select class="form-control show-tick" name="file_access_level['+i+']"><option value="Write">Write</option><option value="Read">Read</option></select></td>';
 	 				}
 			    	html_editfile +='<td><button class="delete-appended-row btn btn-danger" type="button">Remove</button></td>';
 			    	html_editfile += '</tr>';
 			    	
 			    	}else{
 			    	
 			    		
 			    	}
 			    	
 			    	i++;
				});
 				
	        	console.log(editfile);
	        	
	          
 			   $('#loader').hide();
 			   $('#document_info_id').val(document_info_id);
 			   $('#dept').val(dept);
 			   $('#file_name').val(file_name);
 			   $('#description').val(description);
			   $('.html_editfile').append(html_editfile);
			   $('#edit-file-modal').modal('show');
 	        
	        },
 	  	    error:function(e)
 	  	    {
 	  	        $('#loader').hide();
 	  	    	console.log("error in pages");
 	  	    }
 	     }); 
   
   });
   
  
   
   $(document).on('click' , '.delete-file' , function(){
	   
   	var today = new Date();
       var dd = String(today.getDate()).padStart(2, '0');
       var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
       var yyyy = today.getFullYear();
       today = yyyy + '-' + mm + '-' + dd ;
   	
   	var id=$(this).data('id');
   	let element = $(this);
   	Swal.fire({
   		title: 'Are you sure?',
           text: "The File including all Folders and Documents created within will be moved to Trash for a period of 30 days, after which they will be permanently deleted",
           icon: 'warning',
           showCancelButton: true,
           cancelButtonText: 'No',
           confirmButtonColor: '#3085d6',
           cancelButtonColor: '#d33',
           confirmButtonText: 'Yes'
   		}).then((result) => {
   		  if (result.value) {
   	 	   
   				$.ajax({
         	            url: "../clientprocess?action=deletefile",
         	            type: "post",
         	            dataType:"json",
         	            data:{"document_info_id":$(this).data('id'),"currentDate":today},
         	            success: function(data)
         	            {
         	            	
         	               if(data.status)
         	               {
         	            	
         	            	  $(element).hide();
    	     	    		  Swal.fire({
   	     	    			  position:'center',
   	     	    			  icon: 'success',
   	     	    			  title: 'Success Trash',
   	     	    			  timer: 3500
   	     	    			})
   	     	    			
   	     	    		 $(element).parents('tr').remove();
   	     	    			
         	               }
         	               else
         	               {
         	            	  Swal.fire({
   	     	    			  position: 'center',
   	     	    			  icon: 'error',
   	     	    			  title: 'Something is wrong',
   	     	    			  timer: 3500
   	     	    			})   
   	     	    			
   	     	    	     }
         	              
         	             
         	           },
         	  	    error:function(e)
         	  	    {
         	  	    	console.log("error in pages");
         	  	    }
         	     }); 
    
   			  
   		  }
   		})
         	  
 	  }); 
   
   
   
   let name_data ='';
   
     function addFile()
     {
    	 
    	 
    	  $.ajax({
   		   url:"../clientprocess?action=fetchdepartment",
   		   type:"POST",
   		   dataType:"json",
   		   beforeSend:function(){
	    	  
   			   $('#loader').show();
	       
   		   },
   		   success:function(data,textStatus,jqXHR)
   		   {
   			    console.log(data.name);
   			    console.log(data.department);
   			    var dept_info=data.department;
   			    var arr=dept_info.split(",");
   			    var obj = JSON.parse(data.name);
   			    
   			    $('.remove').remove();
   			    $.each(obj,  function( key, value ) {
   			    	name_data +='<option class="form-control show-tick" value="'+value.id+'">'+value.name+'</option>'; 
				});
	    
   			    
   			    
    	    	var selectDept  = '<select class="form-control show-tick " name="file_department" ><option class="form-control show-tick" value="">Select Department</option>'
   			    for(var i=0;i<arr.length-1;i++)
   			    { 
   			    	selectDept +='<option class="form-control show-tick" value="'+arr[i]+'">'+arr[i]+'</option>'
   			    }
   			        selectDept +='</select>';
   			 
			    
   			 $('.department').html(selectDept);
   			 $('#fileAdd').modal('show');
   			 $('#loader').hide();
   			 
   		   },
   		   error:function(e)
   		   {
   			 $('#loader').hide();
   			  console.log("error in pages");
   		   }

   		});    
    
     }

     
    
   
  // var i=$('table.documentuploading tr').length;
   
   
   var i=0;
   $(".addmore").on('click' , function(){
	   
      $('.search-box').remove();
	  i=$('#documentuploading> tbody > tr').length;
	html = '<tr class="remove">';
    html+= '<td><input type="text"  name="file_user_name['+i+']"  placeholder="Search User Name"  class="form-control show-tick search-suggestion" value=""><a href="javascript:void(0);" style="text-decoration: none;color:#4c4a4a;"><div class="search-box" style="overflow:auto;position:fixed;width:33.54%;z-index:9999;background:#fff;left:40px;"></div></a></td>';
    html+= '<td style="width:232px;"><select style="width:184px;" class="form-control show-tick" name="file_access_level['+i+']"><option value="">Access Level</option><option value="Read">Read</option><option value="Write">Write</option></select></td>';
    html+= '<td style="width:141px;"><button class="delete-appended-row btn btn-danger" type="button">Remove</button></td>';
    html+= '</tr>';
    $('table#documentuploading').append(html);
   });
    
  $(document).on('click','.delete-appended-row',function(){
  		 $(this).parent().parent().remove();
  });
 
  
  
  $(document).on('click', 'div.search', function (e) {
	   event.preventDefault();
	   
	   
	    $(this).parent().parent().siblings().remove();
	    var selected_data=$(this).html();
	    $(this).parent().parent().parent().append(selected_data);
	    $('.search-box').remove();
	    
	  
  }); 
  
  
  
  
  $(document).on('submit', '.form-submit', function (e) {
	 	   event.preventDefault();
	       
	 	   var form=$(this);
	       var formdata=new FormData($(form)[0]);
	       var data={};
	       formdata.forEach(function(value,key)
	       {
	    		  data[key]=value;
	       }); 
	       
	       console.log(data.file_department);
	       var department=data.file_department;
	       
	       var access_level=department.split(":");
	       if(access_level[1]=="Read"){
	    	   
	    	   console.log("Read");
	    	   return false;
	       }
	       
	       
	       
	        $('#loader').show();
	        $.ajax({
			   
			   url:"../clientprocess?action=addfile",
			   type:"POST",
			   dataType:"json",
			   data,
			   success:function(data,textStatus,jqXHR)
			   {
				    console.log(data);
				    if(data.status)
				    {
				      
				    	  Swal.fire({
		  	    			  position: 'center',
		  	    			  icon: 'success',
		  	    			  title: 'Success',
		  	    			  showConfirmButton: false,
		  	    			  timer: 3500
		  	    			})
		  	    			 $('#loader').hide();	
				    	     $('.form-submit').trigger("reset"); 
				    }
				    else
				    {
				      	
				    	 Swal.fire({
		   	    			  icon:'error',
		   	    			  title:'Somethind went Wrong',
		   	    			  text:"Something went Wrong",
		   	    			  footer:'',
		   	    			  timer:3500
		   	    			}) 
				    	
		   	    		 $('#loader').hide();
				    }
				    setTimeout(function(){location.reload();},3000);

				    
			   },
			   error:function(e)
			   {
				   $('#loader').hide();
				  console.log("error in pages");
			   }

			});   
	
	 });      

   $(document).on('submit', '.form-update', function (e) {
	  
	  event.preventDefault();
      var form=$(this);
      var formdata=new FormData($(form)[0]);
      var data={};
      formdata.forEach(function(value,key)
      {
   		  data[key]=value;
      }); 
      
        
      $('#loader').show();
       $.ajax({
		   
		   url:"../clientprocess?action=updateaddfile",
		   type:"POST",
		   dataType:"json",
		   data,
		   success:function(data,textStatus,jqXHR)
		   {
			    console.log(data);
			    if(data.status)
			    {
			      
			    	  Swal.fire({
	  	    			  position: 'center',
	  	    			  icon: 'success',
	  	    			  title: 'Success',
	  	    			  showConfirmButton: false,
	  	    			  timer: 3500
	  	    			})
	  	    			 $('#loader').hide();	
			    	   //  $('.form-submit').trigger("reset"); 
			    }
			    else
			    {
			      	
			    	 Swal.fire({
	   	    			  icon:'error',
	   	    			  title:'Somethind went Wrong',
	   	    			  text:"Something went Wrong",
	   	    			  footer:'',
	   	    			  timer:3500
	   	    			}) 
			    	
	   	    		 $('#loader').hide();
			    }
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
