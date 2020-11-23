<%@include file="include/session.jsp"%>
<%@ page import="java.math.RoundingMode"%>
<%@ page import="java.text.DecimalFormat"%>

<!DOCTYPE html>
<html>
<head>
<%@include file="include/head.jsp"%>
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

.loader {
	display: none;
}
</style>


</head>
<body class="theme-light-blue">

  <%@include file="include/loader.jsp"%>

	<!-- Overlay For Sidebars -->
	<div class="overlay"></div>
	<!-- #END# Overlay For Sidebars -->
	<!-- Top Bar -->
	<%@include file="include/navbar.jsp"%>
	<section>
		<!-- Left Sidebar -->
		<%@include file="include/sidebar.jsp"%>
		<!-- #END# Left Sidebar -->
	</section>
	<section class="content">
		<div class="container-fluid">
			<div class="block-header">
				<h2></h2>
			</div>
			<div class="row"
				style="margin-left: -148px !important; margin-right: -27px;">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="card">
						<div class="body mrgnbtm">
							<div class="row clearfix">
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<div class="row">
										<div class="col-lg-5 col-md-5 col-sm-5 col-xs-5 offset-md-1">
											<h6 style="font-size: 19px;">Cloud Usage</h6>
											<div
												style="height: 200px; text-align: center; position: relative; display: flex; flex-direction: column; align-items: center; justify-content: center;">
												<div id="chartCloud" style="height: 150px; width: 100%;"></div>
												<div
													style="width: 100%; position: absolute; bottom: 0px; text-align: center;">
													<!-- <a href="#" data-toggle="modal" data-target="#exampleModal">Increase
														Storage</a> -->
												</div>
											</div>
										</div>
										<div class="col-lg-5 col-md-5 col-sm-5 col-xs-5 offset-md-1">
											<h6 style="font-size: 19px;">Users</h6>
											<div
												style="height: 200px; text-align: center; position: relative; display: flex; flex-direction: column; justify-content: center; align-items: center;">
												<div id="chartUser" style="height: 150px; width: 100%;"></div>
												<div
													style="width: 100%; position: absolute; bottom: 0px; text-align: center;">
													<!-- <a href="#" data-toggle="modal" data-target="#increaseuser">Increase
														Users</a> -->
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 offset-lg-2">
									<h6 style="font-size: 19px;">For Your Action</h6>
									<div
										style="height: 25vh; border: 1px solid #000; overflow-y: scroll;" id="html_data">
										
										
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Increase
						Storage</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="Email" class="col-sm-3 control-label">Current
							Limit</label>
						<div class="col-sm-9">
							<div class="form-line">
								<input type="email" class="form-control" name="current_limit"
									value="" placeholder="Current Limit">
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="Email" class="col-sm-3 control-label">Required</label>
						<div class="col-sm-9">
							<div class="form-line">
								<input type="text" class="form-control" name="required"
									placeholder="In GB" value="" />
							</div>
						</div>
					</div>


					<div class="form-group">
						<label for="Email" class="col-sm-3 control-label"> <label
							class="container"> <input type="checkbox"
								name="vardepartment" value=""> <span class="checkmark"></span>
						</label>
						</label>
						<div class="col-sm-9">
							<a href="#">Accept Terms & Condition </a>
						</div>
					</div>
				</div>
				<div class="modal-footer"
					style="text-align: center; margin-top: 120px;">
					<button type="button" class="btn btn-primary">Submit</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="increaseuser" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Increase
						Users</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="Email" class="col-sm-4 control-label">Current
							Limit</label>
						<div class="col-sm-8">
							<div class="form-line">
								<input type="email" class="form-control" name="current_limit"
									value="" placeholder="Current Limit">
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="Email" class="col-sm-4 control-label">Additional Required</label>
						<div class="col-sm-8">
							<div class="form-line">
								<input type="text" class="form-control" name="required"
									placeholder="Additional Required" value=""/>
							</div>
						</div>
					</div>


					<div class="form-group">
						<label for="Email" class="col-sm-4 control-label"> <label
							class="container"> <input type="checkbox"
								name="vardepartment" value=""> <span class="checkmark"></span>
						</label>
						</label>
						<div class="col-sm-8">
							<a href="#">Accept Terms & Condition </a>
						</div>
					</div>
				</div>
				<div class="modal-footer"
					style="text-align: center; margin-top: 120px;">
					<button type="button" class="btn btn-primary">Submit</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
				</div>
			</div>
		</div>
	</div>
	
	   
  <div class="modal fade request-access-department-modal"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
            <div class="row">
                        <div class="form-group">
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
          <div class="form-group">
			 <label  class="col-sm-4 control-label">Rejection Remarks</label>
				  <div class="col-sm-8">
					     <div class="form-line">
					          <input type="hidden" name=""  id="access_request_id" value=""/>
							 <textarea  placeholder="Rejection Remarks" id="reject_remarks" class="form-control"  name="rejection_remarks"></textarea>
					     </div>
				 </div>
		  </div> 
      </div>
	     <div class="modal-footer" style="text-align:center;margin-top:30px;">
	     
	        <div class="modal-footer" style="text-align:center;margin-top:30px;">
	          <button type="button" data-status="approve" onclick="accessRequestFrom(this)" class="btn" style="width:120px;border:1px solid #6c757d;color: #f8fcff;background: #6c757d;">APPROVE</button>      
	          <button type="button" data-status="reject"  onclick="accessRequestFrom(this)" class="btn" style="width:120px;border:1px solid #f91010;color: #f8fcff;background: #f91010;">REJECT</button>
	       </div>
	     
	     </div>
	 </form> 
    </div>
  </div>
</div>
   
	
  	<%@include file="include/footer.jsp"%>
  	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script src="../js/canvasjs.min.js"></script>
	<script>
	
	
	
	
	
	
	
	
	
    function accessRequestFrom(data){
    	
    	var status=data.getAttribute("data-status");
    	var request_access_id=$('#access_request_id').val();
    	var reject_remarks=$('#reject_remarks').val();
    	var data={ "status":status , "request_access_id":request_access_id , "reject_remarks":reject_remarks}
    	console.log(data);
    	
      $('#loader').show();
  	  $.ajax({
      	
      	    url:"./customerprocess?action=AcceptAndRejectDepartment",
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
 	        		    setTimeout(function(){location.reload();},3000);
 	        		 
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
	
	
window.onload = function() {

	
	
	$.ajax({
	       url:"./customerprocess?action=dashboard",
	       type:"POST",
	       dataType:"json",
	       beforeSend:function(){
	    	   $('#loader').show();
	       },
	       success:function(data,textStatus,jqXHR)
	       {
	    	       
	    	         var obj = JSON.parse(data.data);
	    	         $.each(obj, function( key, value ) {
					   console.log(value.cloud_size);
					   console.log(value.noOfUsers);
	    	         var chart = new CanvasJS.Chart("chartCloud", {
      	    			theme: "light2",
      	    			animationEnabled: true,
      	    			title: {
      	    				text: "Softdoc Cloud"
      	    			},
      	    			data: [{
      	    				type: "pie",
      	    				startAngle: 25,
      	    				toolTipContent: "<b>{label}</b>: {y} %",
      	    				indexLabelFontSize: 14,
      	    				indexLabel: "{label } {y} GB",
      	    				dataPoints: [
      	    					{ y: value.cloud_size , label: "Used" },
      	    					{ y: value.storageData  , label: "Free Space" },
      	    					
      	    				]
      	    			}]
      	    		});
      	    		chart.render(); 
      	    		

      	    	var chartUser = new CanvasJS.Chart("chartUser", {
      	    	theme: "light2", // "light1", "light2", "dark1", "dark2"
      	    	animationEnabled: true,
      	    	title: {
      	    		text: "Softdoc Users"
      	    	},
      	    	data: [{
      	    		type: "pie",
      	    		startAngle: 25,
      	    		toolTipContent: "<b>{label}</b>: {y} %",
      	    		indexLabelFontSize: 14,
      	    		indexLabel: "{label } {y}",
      	    		dataPoints: [
      	    			{ y: value.noOfUsers  , label: "User" },
      	    			{ y: value.totalUser  , label: "Remaining User" },
      	    			
      	    		]
      	    	}]
      	    	});
      	    	chartUser.render(); 
      	    	         
	    	  });         
	    	            
	    	            $('#loader').hide();
  	  	       
	   	    		 
	      },
	      error:function(e)
	      {
	    	  console.log("error in pages");
	     }
   
  });
	
	
	
	
	$.ajax({
	       
		   url:"./customerprocess?action=dashboardRequestAccessDepartment",
	       type:"POST",
	       dataType:"json",
	       success:function(data,textStatus,jqXHR)
	       {
	    	     console.log(data.requestDepartment);
	    	     
                 var obj = JSON.parse(JSON.stringify(data.requestDepartment));
	        	 var html_data="";
	             $.each(obj,  function( key, value ) {
	            	 html_data +='<a href="javascript.void(0);" class="accept-reject-department-request" data-id='+value.id+'><p style="font-size:18px;background:#6c757d;color:#fff;text-decoration:none;">'+value.department_details+'</p></a>';
	        	 });
	        	 $('#html_data').html(html_data);
	        	 
	       },
		   error:function(e)
		   {
		    	  console.log("error in pages");
		   }
	  });

}



$(document).on('click' , '.accept-reject-department-request' , function(event){
	 event.preventDefault();
	 
    var id=$(this).data('id');
    console.log(id);
    $('#loader').show();
    $.ajax({
    	
    	    url:"./customerprocess?action=dashboarddepartmentaccess",
	        type:"post",
	        dataType:"json",
	        data:{"request_access_id":$(this).data('id')},
	        success: function(data)
	        {
	        	
	        	
	        	console.log(data);
	        	
	           var department_details=""	
	           var obj = JSON.parse(JSON.stringify(data.DashboardDepartmentAccess));
	           $.each(obj ,  function( key, value ) {
	        	   department_details=value.department_details;
	           });
	          
	           
	           var html_department="";  
	           $.each(JSON.parse(department_details) ,  function( key, value ) {
	        	  
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

	           $('#access_request_id').val(id);
	           $('#loader').hide();
		       $('.html_department').html(html_department);	 
		       $('.request-access-department-modal').modal('show'); 
	          
	        },
  	        error:function(e)
  	       {
  	         console.log("error in pages");
  	      } 
     
    }); 
    
 
}); 






 </script>
</body>

</html>
