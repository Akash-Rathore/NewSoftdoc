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
    
    
   </style>

</head>

<body class="theme-light-blue">
    
    <!-- Overlay For Sidebars -->
    <div class="overlay"></div>
    <!-- #END# Overlay For Sidebars -->
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
                  <a href="javascript:void(0);"  class="removeStar" style="text-decoration:none;color:#fff;padding-left:621px;"><span class="material-icons" style="font-size:32px;font-weight:bold;">grade</span></a>
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
                            
                                 <h2>
                                    
                                 </h2>
                             
                             <div class="row">
                                <div class="">
                                    <h2 class="col-md-4 col-lg-4 col-xs-12 pull-left">
                                        <div class="m-t-10">
                                        </div>
                                    </h2>
                                    <div class="col-md-7 col-lg-7 col-xs-12 pull-right accessCutomerTable">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-hover" id="star_folder">
                                <thead>
                                    <tr>
                                       <th><input type='checkbox' onClick="toggle(this)" name='folder_document' value=''  id="folder_star"/><label for="folder_star"></label></th>
                                       <th>File Name</th>
                                       <th>Document No.</th>
                                       <th>Document Type</th>
                                       <th>Starred On </th>
                <!--                   <th>Last Modified</th>
                                       <th>Last Modified By</th>
                 -->                </tr>
                                </thead>
                                <tbody>
                           
                           
                                </tbody>
                            </table>
                            </div>
                        </div>
                    </div>
                </div>
                
                               <!--  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header  margin0">
                            
                                 <h2>
                                    
                                 </h2>
                             
                             <div class="row">
                                <div class="">
                                    <h2 class="col-md-4 col-lg-4 col-xs-12 pull-left">
                                        <div class="m-t-10">
                                        </div>
                                    </h2>
                                    <div class="col-md-7 col-lg-7 col-xs-12 pull-right accessCutomerTable">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                <thead>
                                    <tr>
                                       <th><input type='checkbox'  name='star_document' value=''  id="star"/><label for="star"></label></th>
                                       <th>File Name</th>
                                       <th>Document Type</th>
                                       <th>Document Type</th>
                                       <th>Starred On </th>
                                       <th>Last Modified</th>
                                       <th>Last Modified By</th>
                                    </tr>
                                </thead>
                                <tbody>
                           
                           
                                </tbody>
                            </table>
                            </div>
                        </div>
                    </div>
                </div> -->
            </div>
            
        </div>
    </section>
   <%@include file="include/loader.jsp"%>
   <%@include file="include/script.jsp"%>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
   <!--  <script src="https://cdn.datatables.net/buttons/1.6.0/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.0/js/buttons.flash.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.0/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.0/js/buttons.print.min.js"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script>
       
       $(document).ready(function() {
         
 	   $("#star_folder").dataTable( {
 		   
 		    "lengthMenu":[25,50],
             "pageLength":25,
   		    "searching":false,
 	        "bProcessing": false,
 	        "bServerSide": false,
 	        "sort": "position",
 	        "sAjaxSource": "../clientprocess?action=starDocument",
 	        "aoColumns": [
 	        	
 	            { "mData": "delete_checkbox" },
 	        	{ "mData": "filename" },
 	           // { "mData": "folder_name" },
 	            { "mData": "document_no"},
 	            { "mData": "documenttype" },
 	            { "mData": "star_date" },
 	          //  { "mData": "modify_date" },
 	          //  { "mData": "modify_name" },
 	            
 	        ]
 	    } );

 	} );
    
   
    
      function toggle(source) {
  	  var checkboxes = document.getElementsByName('star_document');
  	  
  	  for(var i=0, n=checkboxes.length;i<n;i++) {
  		    checkboxes[i].checked = source.checked;
  		}
  	}
    
    
    
    
       $(document).on('click','.removeStar' , function(){
        
    	   Swal.fire({
       		title: 'Are you sure?',
               text: "Remove Star",
               icon: 'warning',
               showCancelButton: true,
               cancelButtonText: 'No',
               confirmButtonColor:'#6c757d',
               cancelButtonColor: '#d33',
               confirmButtonText: 'Yes'
       		}).then((result) => {
       		  if (result.value) {
       			  
       			var checked = new Array();
  		        $("#star_folder input[type=checkbox]:checked").each(function () {
  		        	checked.push(this.value);
  		        });
  		        
  		        if (checked.length > 0) { 
  		        
  		            $('#loader').show();
  		        	$.ajax({
          	            url: "../clientprocess?action=removestar",
          	            type: "post",
          	            dataType:"json",
          	            data:{"document_info_id":checked.join(":")},
          	            success: function(data)
          	            {
          	            	
          	               if(data.status)
          	               {
     	     	    		  Swal.fire({
    	     	    			  position: 'center',
    	     	    			  icon: 'success',
    	     	    			  title: 'Remove Star',
    	     	    			  timer: 3500
    	     	    			})
    	     	    			setTimeout(function(){location.reload();},3000);	
          	               }
          	               else
          	               {
          	            	  Swal.fire({
    	     	    			  position:'center',
    	     	    			  icon: 'error',
    	     	    			  title: 'Something is wrong',
    	     	    			  timer: 3500
    	     	    			})   
          	               }
          	             $('#loader').hide();
          	           },
          	  	    error:function(e)
          	  	    {
          	  	    	console.log("error in pages");
          	  	    }
          	     }); 
       		    	
  		       }
       	    	
       	    }
       })
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
