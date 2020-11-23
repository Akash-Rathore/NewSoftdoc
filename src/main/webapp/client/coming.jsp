
<%@include file="include/session.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="include/head.jsp"%>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />    
<style>

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
       <%@ include file="include/navbar.jsp"%>
    <!-- #Top Bar -->
    <section>
        <!-- Left Sidebar -->
             <%@ include file="include/sidebar.jsp"%>
        <!-- #END# Left Sidebar -->
    </section>
    <section class="content">
        <div class="container-fluid">
            <div class="block-header">
                <h2>
                     
                </h2>
            </div>
              <div class="row" style="margin-left:-148px !important;margin-right:-27px;">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="body mrgnbtm" style="height:330px !important;">
                          <form class="form-horizontal" id="userclient">
                               
                                    <div class="row">
		                                  <h5 style="margin-left:14px !important;">Feature Name</h5>
		                                    <div class="col-sm-8">
		                                       <p>	This is the dummy feature description which will be shown to User			</p>
		                                    </div>
		                                   <div class="col-sm-2">
		                                       <button type="button"  style="border:none;background-color:#fff"> <span class="material-icons">thumb_up_alt</span></button>
		                                    </div>
		                                    <div class="col-sm-2">
		                                      <button type="button"  style="border:none;background-color:#fff"> <span class="material-icons">thumb_down_alt</span></button>
		                                    </div>
                                    </div>
                                     <div class="row">
		                                  <h5 style="margin-left:14px !important;">Feature Name</h5>
		                                    <div class="col-sm-8">
		                                       <p>	This is the dummy feature description which will be shown to User			</p>
		                                    </div>
		                                   <div class="col-sm-2">
		                                       <button type="button" style="border:none;background-color:#fff"> <span class="material-icons">thumb_up_alt</span></button>
		                                    </div>
		                                    <div class="col-sm-2">
		                                       <button type="button" style="border:none;background-color:#fff"> <span class="material-icons">thumb_down_alt</span></button>
		                                    </div>
                                    </div>
                                    <div class="row">
		                                  <h5 style="margin-left:14px !important;">Feature Name</h5>
		                                    <div class="col-sm-8">
		                                       <p>	This is the dummy feature description which will be shown to User			</p>
		                                    </div>
		                                   <div class="col-sm-2">
		                                       <button type="button"  style="border:none;background-color:#fff"> <span class="material-icons">thumb_up_alt</span></button>
		                                    </div>
		                                    <div class="col-sm-2">
		                                             <button type="button"  style="border:none;background-color:#fff"> <span class="material-icons">thumb_down_alt</span></button>
		                                    </div>
                                    </div>
                                   
                                   <div class="row">
                                   
                                      <!-- <a href="#" style="float:right;" data-toggle="modal" data-target="#exampleModal">
                                         Something missing? Tell us about it		 
                                      </a>
                                        -->
                                   </div>
                               
                                
                            </form>
                        </div>
                    </div>
                </div>
            </div>
          </div>
           
       
       
 <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"> Something missing? Tell us about it	</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
                        <div class="form-group">
                  <label for="Email" class="col-sm-3 control-label">Feature Name</label>
                  <div class="col-sm-9">
                    <div class="form-line">
                      <input type="email" class="form-control" id="Email" name="email"  value="" placeholder="Feature Name" >
                    </div>
                  </div>
                </div>

                <div class="form-group">
                  <label for="Email" class="col-sm-3 control-label">Description</label>
                  <div class="col-sm-9">
                    <div class="form-line">
                      <textarea type="text" class="form-control"  name="Description" placeholder="Description" value=""></textarea>
                    </div>
                  </div>
                </div>

                <div class="form-group">
                  <label for="Email" class="col-sm-3 control-label">Mobile No.</label>
                  <div class="col-sm-9">
                    <div class="form-line">
                      <input type="text" class="form-control" name="mobile_no" placeholder="mobile No." />
                    </div>
                  </div>
                </div>

                <div class="form-group">
                  <label for="Email" class="col-sm-3 control-label">
                      <label class="container">
                           <input type="checkbox" name="vardepartment" value="">
                           <span class="checkmark"></span>
                        </label>
                  </label>
                  <div class="col-sm-9">
                       <a href="#">Accept Terms & Condition </a>
                  </div>
                </div>
      </div>
      <div class="modal-footer" style="text-align:center;margin-top:120px;">
        <button type="button" class="btn btn-primary">Submit</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
      </div>
    </div>
  </div>
</div>         
              
     
    </section>
   <%@include file="include/script.jsp"%>
   <script src="include/custom-script.js"></script>  
   <script>
   
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
