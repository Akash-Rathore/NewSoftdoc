<%@include file="include/session.jsp"%>
<!DOCTYPE html>
<html>
<head>
   <%@include file="include/head.jsp"%>
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
    
    
   
    
    
    
 .drop-zone {
    max-width: 100%;
    height: 116px;
    padding: 25px;
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
    font-family: "Quicksand", sans-serif;
    font-weight: 300;
    font-size: 15px;
    cursor: pointer;
    color: #cccccc;
    border: 4px dashed #6c757d;
    border-radius: 14px;
}

.drop-zone--over {
  border-style: solid;
}

.drop-zone__input {
  display: none !important;
}

    
.drop-zone__thumb {
    width: 100%;
    height: 100%;
    border-radius: 6px;
    overflow: hidden;
    background-color: #fff;
    background-size: cover;
    position: relative;
    text-align: center;
}

.drop-zone__thumb::after {
    content: attr(data-label);
    position: absolute;
    bottom: 15px;
    left: 0px;
    width: 100%;
    padding: 5px 0;
    color: #6c757d;
    font-size: 14px;
    text-align: center;
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
    
    
       .fa{
            font-size:18px !important;
            color: yellow;
       }  
       
       .loader{
     
       display:none;
      
      }
    
       
         input[type=checkbox] {
    display:none;
 }

input[type=checkbox] + label
{
background: #fff;
 	height: 16px;
width: 16px;
display:inline-block;
padding: 0 0 0 0px;
}

input[type=checkbox]:checked + label
{
background: #fff;
text-decoration: line-through;
height: 16px;
width: 16px;
display:inline-block;
padding: 0 0 0 0px;
}

input[type=checkbox]:checked + label + label {
    text-decoration: line-through;
}


label p {
  display: inline block;
}


[type="checkbox"] + label:before, [type="checkbox"]:not(.filled-in) + label:after {
    content: '';
    position: absolute;
    top: -2px;
    left: -2px;
    width: 18px;
    height: 18px;
    z-index: 0;
    border: 2px solid #5a5a5a;
    border-radius: 1px;
    margin-top: 2px;
    transition: .2s;
}


[type="checkbox"]:checked + label:before {
    top: -9px;
    left: -2px;
    width: 11px;
    height: 19px;
}
    
  [type="checkbox"]:checked + label:before {
    border-top: 2px solid transparent;
    border-left: 2px solid transparent;
    border-right: 2px solid #4caf50;
    border-bottom: 2px solid #4caf50;
 }  
    
    
    .btn{
     
     width:120px;
     border:1px solid #6c757d;
     color: #f8fcff;
     background: #6c757d;
    
    }
    
    .btn:hover{
    
    color:#fff;
    
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
                  <a href="#" onclick="addFile()" style="text-decoration:none;color:#fff;padding-left:232px;"><i class='material-icons' style='color:#fff ; border-radius:13px;'></i></a>
                  <li class="dropdown" style="position:absolute;top:-1px;right:116px;">
                        <a href="javascript:void(0);"  class="dropdown-toggle" style="color:#fff;" data-toggle="dropdown" role="button">
                             <i class="material-icons" style="font-size:32px;font-weight:bold;">+</i>
                        </a>
                        <ul class="dropdown-menu">
                                  <ul class="menu" style="overflow:hidden">
                                    <li>
                                        <a href="javascript:void(0);" class="upload_file_briefcase">
                                            <div class="menu-info">
                                                <h4>Upload File</h4>
                                            </div>
                                        </a>
                                    </li>
                                 </ul>
                                 <!--  <ul class="menu" style="overflow:hidden">
                                    <li>
                                        <a href="javascript:void(0);" class="add_folder_briefcase">
                                            <div class="menu-info">
                                                <h4>Add Folder</h4>
                                            </div>
                                        </a>
                                    </li>
                                 </ul>  -->
                         </ul>
                    </li>
       
                  
                  
<!--              <a href="#"  style="text-decoration:none;color:#fff;padding-left:309px;"><span style="font-size:32px;font-weight:bold;">+</span></a>
 -->              <a href="javascript:void(0);"  class="delete-briefcase-attachment" style="text-decoration:none;color:#fff;padding-left:573px;"><span style="font-size:32px;font-weight:bold;"><i class="material-icons">delete</i></span></a>
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
            <!-- <div class="row" style="margin-right: -35px !important;margin-left: -156px !important;">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header  margin0">
                             <h2></h2>
                        </div>
                        <div class="body">
             
                            <div class="table-responsive">
                                <table class="table table-hover" id="briefcase-table">
                                <thead>
                                    <tr>
                                        <th><input type='checkbox' onClick="toggle(this)" name='briefcase' value=''  id="briefcase"/><label for="briefcase"></label></th>
                                        <th>Folders</th>
                                        <th>Created On</th>
                                        <th>Last Modified On</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                               
                                </tbody>
                            </table>
                           </div>
                        </div>
                    </div>
                </div>
            </div> -->
            <div class="row" style="margin-right: -28px !important;margin-left: -156px !important;">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header  margin0">
                             <h2></h2>
                        </div>
                        <div class="body">
             
                            <div class="table-responsive">
                                <table class="table table-hover" id="briefcase-table-upload">
                                <thead>
                                    <tr>
                                         
                                         <th><input type='checkbox' onClick="toggleTwo(this)" name='briefcase_upload' value=''  id="briefcase_upload_"/><label for="briefcase_upload_"></label></th>
                                         <th>Attachment</th>
                                         <th>Created On</th>
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
     
      <!-- Add Folder start  -->
     <div class="modal fade" id="add_folder_briefcase" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title"  id="exampleModalLabel" style="text-align:center;text-decoration: underline;">Add Folder</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			  <form class="add-folder-briefcase-form">		
				<div class="modal-body">
				 <div class="container-fluid">
				   <div class="row">
				       <div class="form-group">
                        <label for="NameSurname" class="col-sm-2 control-label">Name</label>
                        <div class="col-sm-10">
                             <div class="form-line">
								<input type="text" class="form-control"  name="folder_name"
									value="" placeholder="Folder Name">
							</div>
                        </div>
                    </div>
               
                  </div>
				  </div>
		
				<div class="modal-footer" style="text-align:center;">
					<button type="submit" class="btn">Submit</button>
					<button type="button" class="btn" data-dismiss="modal">Cancel</button>
				</div>
			  </div>
		   </form> 	
		  </div>
		</div>
	</div>
	
	
	
	 <div class="modal fade" id="upload_file_briefcase" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title"  id="exampleModalLabel" style="text-align:center;text-decoration: underline;">Upload File</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			  <form class="briefcase-upload-form">		
				<div class="modal-body">
				 <div class="container-fluid">
				   <div class="row">
				       <div class="form-group">
                        <label for="NameSurname" class="col-sm-2 control-label">Attachment</label>
                        <div class="col-sm-10">
                             <div class="drop-zone">
                                  <span class="drop-zone__prompt">Drop file here or click to upload</span>
								  <input type="file"  class="drop-zone__input"  name="upload_briefcase"
									value="" placeholder="">
							</div>
                        </div>
                    </div>
               
               
                  </div>
				  </div>
		
				<div class="modal-footer" style="text-align:center;">
					<button type="submit" class="btn" >Submit</button>
					<button type="button" class="btn" data-dismiss="modal">Cancel</button>
				</div>
			  </div>
		   </form> 	
		  </div>
		</div>
	</div>
	
   <%@include file="include/loader.jsp"%>
   <%@include file="include/script.jsp"%>  
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
   <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
   
   <script>
 
   
   document.querySelectorAll(".drop-zone__input").forEach((inputElement) => {
	   const dropZoneElement = inputElement.closest(".drop-zone");

	   dropZoneElement.addEventListener("click", (e) => {
	     inputElement.click();
	   });

	   inputElement.addEventListener("change", (e) => {
	     if (inputElement.files.length) {
	       updateThumbnail(dropZoneElement, inputElement.files[0]);
	     }
	   });

	   dropZoneElement.addEventListener("dragover", (e) => {
	     e.preventDefault();
	     dropZoneElement.classList.add("drop-zone--over");
	   });

	   ["dragleave", "dragend"].forEach((type) => {
	     dropZoneElement.addEventListener(type, (e) => {
	       dropZoneElement.classList.remove("drop-zone--over");
	     });
	   });

	   dropZoneElement.addEventListener("drop", (e) => {
	     e.preventDefault();

	     if (e.dataTransfer.files.length) {
	       inputElement.files = e.dataTransfer.files;
	       updateThumbnail(dropZoneElement, e.dataTransfer.files[0]);
	     }

	     dropZoneElement.classList.remove("drop-zone--over");
	   });
	 });

	 /**
	  * Updates the thumbnail on a drop zone element.
	  *
	  * @param {HTMLElement} dropZoneElement
	  * @param {File} file
	  */
	 function updateThumbnail(dropZoneElement, file) {
	   let thumbnailElement = dropZoneElement.querySelector(".drop-zone__thumb");

	   // First time - remove the prompt
	   if (dropZoneElement.querySelector(".drop-zone__prompt")) {
	     dropZoneElement.querySelector(".drop-zone__prompt").remove();
	   }

	   // First time - there is no thumbnail element, so lets create it
	   if (!thumbnailElement) {
	     thumbnailElement = document.createElement("div");
	     thumbnailElement.classList.add("drop-zone__thumb");
	     dropZoneElement.appendChild(thumbnailElement);
	   }

	   thumbnailElement.dataset.label = file.name;

	   // Show thumbnail for image files
	   if (file.type.startsWith("image/")) {
	     const reader = new FileReader();

	     reader.readAsDataURL(file);
	     reader.onload = () => {
	       thumbnailElement.style.backgroundImage = `url('${reader.result}')`;
	     };
	   } else {
	     thumbnailElement.style.backgroundImage = null;
	   }
	 }

   
   
   
   
   $(document).on('click' , '.add_folder_briefcase' , function(){
	   $('#add_folder_briefcase').modal('show');
    }); 
   
  
   
   $(document).on('click' , '.upload_file_briefcase' , function(){
	   $('#upload_file_briefcase').modal('show');
    }); 
   
   
   $(document).on('click' , '.delete-briefcase-attachment' , function(event){
	   event.preventDefault();
   
 	   var checked = new Array();
       $("#briefcase-table-upload input[type=checkbox]:checked").each(function () {
       	  checked.push(this.value);
       });
       
       console.log(checked.join(":"));
       if (checked.length > 0) { 
      	
    	   var checked_details=checked.join(":");
    	   
    	   console.log(checked_details);
    	   
    	   Swal.fire({
    	   		title: 'Are you sure?',
    	           text: "Delete Attachment",
    	           icon: 'warning',
    	           showCancelButton: true,
    	           cancelButtonText: 'No',
    	           confirmButtonColor: '#3085d6',
    	           cancelButtonColor: '#d33',
    	           confirmButtonText: 'Yes'
    	   		}).then((result) => {
    	   		  if (result.value) {
    	   
    	   			$.ajax({
    	 	            url: "../clientprocess?action=upload_file_briefcase",
    	 	            type: "post",
    	 	            dataType:"json",
    	 	            data:{"document_info_id":checked_details},
    		            success: function(data)
    	 	            {
    	 	            	
    	 	               if(data.status)
    	 	               {
    	 	            	
    	 	           	       Swal.fire({
    	    	    			  position:'center',
    	    	    			  icon: 'success',
    	    	    			  title: 'Success',
    	    	    			  timer: 3500
    	    	    			})
    	    	    			 setTimeout(function(){location.reload();},3500);
    	    	           }
    	 	               else
    	 	               {
    	 	            	  Swal.fire({
    	    	    			  position: 'center',
    	    	    			  icon: 'warning',
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
    	   
       } 
   
  });
   
   
  
   
   
  /*  $(document).on('submit' , '.add-folder-briefcase-form' , function(event){
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
	        url:"../clientprocess?action=briefcaseaddfolder",
	        type:"post",
	        dataType:"json",
	        data:data,
	        success: function(data)
	        {
	        	console.log(data.status);
	              
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
	        	    setTimeout(function(){location.reload();},3000);

	   
	        },
	  	    error:function(e)
	  	    {
	  	    	console.log("error in pages");
	  	    	 $('#loader').hide();
	  	    }
	     
       }); 
        
   });  */
   
   
   
   
   
   
   
   
   
   
  
   
   
  
   function toggle(source) {
 	  
 	  var checkboxes = document.getElementsByName('briefcase');
 	  for(var i=0, n=checkboxes.length;i<n;i++) {
 		    checkboxes[i].checked = source.checked;
 		}
 	
  }
 
  
   function toggleTwo(source) {
 	  
 	  var checkboxes = document.getElementsByName('briefcase_upload');
 	  for(var i=0, n=checkboxes.length;i<n;i++) {
 		    checkboxes[i].checked = source.checked;
 		}
 	
 }
   
   
 
   
   $(document).on('submit', '.briefcase-upload-form', function (e) {
	     e.preventDefault();
	     
	     var form = $('.briefcase-upload-form')[0];
	     var data = new FormData(form);

	     $('#loader').show();
	     $.ajax({
	            
	    	    type: "POST",
	            enctype: 'multipart/form-data',
	            url:"../clientprocess?action=uploadBriefcase",
	            data: data,
	            processData: false,
	            contentType: false,
	            cache: false,
	            timeout: 600000,
	            success: function (data)
	            {
	            	 var result = JSON.parse(data);
	         	    
	              if(result.status){
	  	    		  Swal.fire({
	  	    			  position: 'center',
	  	    			  icon: 'success',
	  	    			  title: 'Success',
	  	    			  showConfirmButton: false,
	  	    			  timer: 2000
	  	    			})
	  	    			
	  	    			$('#loader').hide();
	  	    			//$('.form-upload').trigger("reset");	
	  	    		     setTimeout(function(){location.reload();},3500);
	  	    	    }
	  	    	    else
	  	    	   {
	  	    		   Swal.fire({
	   	    			  icon:'error',
	   	    			  title:'wrong',
	   	    			  text:"Something went Wrong",
	   	    			  footer:'',
	   	    			  timer:3000
	   	    			}) 
	   	    	   }
	            },
	            error: function (e) {

	              console.log("error");

	          }
	     });

	    
	 });
   
   
   
   
 $(document).ready(function() {
       
  	   $("#briefcase-table").dataTable( {
  		   
  		    "lengthMenu":[25,50],
              "pageLength":25,
    		    "searching":false,
  	        "bProcessing": false,
  	        "bServerSide": false,
  	        "sort": "position",
  	        "sAjaxSource": "../clientprocess?action=briefcase",
  	        "aoColumns": [
  	        	
  	            { "mData": "delete_checkbox" },
  	            { "mData": "folder_name" },
  	            { "mData": "upload_id" },
  	            { "mData": "modify_date" },
	            { "mData": "action"}
  	            
  	        ]
  	    } );
  	   
  	   
  	 $("#briefcase-table-upload").dataTable( {
		   
		    "lengthMenu":[25,50],
           "pageLength":25,
 		    "searching":false,
	        "bProcessing": false,
	        "bServerSide": false,
	        "sort": "position",
	        "sAjaxSource": "../clientprocess?action=fetchuploadBriefcase",
	        "aoColumns": [
	        	
	            { "mData": "delete_checkbox" },
	            { "mData": "upload" },
	            { "mData": "upload_date" },
	            { "mData": "details" }
	        
	            
	        ]
	    } );

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
