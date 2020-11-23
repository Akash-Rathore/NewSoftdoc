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
       
       .loader{
     
       display:none;
      
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
            <div class="row" style="margin-right: -35px !important;margin-left: -156px !important;">
                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
                    <div class="card">
                        <div class="header  margin0">
                             <h2>Recent</h2>
                            <div class="row">
                            </div>
                           
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-hover" id="dashboraddocument">
                                <thead>
                                    <tr>
                                        <th>File Name</th>
                                        <th>Doc. No.</th>
                                        <th>Doc. Type</th>
                                        <th>Last Accessed On</th>
                                    </tr>
                                </thead>
                                <tbody>
                               
                                </tbody>
                            </table>
                           </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                    <div class="card">
                        <div class="header  margin0">
                             <h2> My Briefcase </h2>
                        </div>
                        <div class="body" style="height:180px !important;">
                            	<div id="chartCloud" style="height: 150px; width: 100%;"></div>
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
                <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
                    <div class="card">
                        <div class="header  margin0">
                            <div class="row">
								<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 offset-lg-2">
									<h6 style="font-size: 19px;">For Your Action</h6>
										<div style="height: 25vh; border: 1px solid #000; overflow-y: scroll;" id="html_data">
										  
										</div>
								</div>
						    </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
   
   <%@include file="include/script.jsp"%>
    <script src="../js/canvasjs.min.js"></script>
    <script type="text/javascript" src="//cdn.datatables.net/1.10.0/js/jquery.dataTables.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script>
   
    window.onload = function() {
    	
    	
    	$.ajax({
 	       url:"../clientprocess?action=briefcaseSize",
 	       type:"POST",
 	       dataType:"json",
 	       success:function(data,textStatus,jqXHR)
 	       {
 	    	    console.log(data.size);
 	      
    	
    	
    	
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
  					
  					{ y: data.size , label: "Used" },
  					{ y: 5 , label: "Free Space" },
  					
  				]
  			}]
  		});
  		chart.render(); 
  		
  		
 	      },
	       error:function(e)
	       {
	    	  console.log("error in pages");
	      }
  
     });		
  		
 }
    
    
    
    $("#dashboraddocument").dataTable( {
		   
    	"lengthMenu":[25,50],
        "pageLength":25,
		"searching":false,
        "bProcessing": false,
        "bServerSide": false,
        "sort": "position",
        "sAjaxSource": "../clientprocess?action=dashboarddocument",
         "aoColumns": [

	        	{ "mData": "filename" }, 
	            { "mData": "document_no" },
	            { "mData": "documenttype" },
	            { "mData": "upload_id" },
	            
	        ]
	    } ); 
   
    $.ajax({
    	
    	    url: "../clientprocess?action=dashboardRequestAccess",
	        type: "post",
	        dataType:"json",
	        success: function(data)
	        {
	             
	             var obj = JSON.parse(JSON.stringify(data.requestAccess));
	        	 
	             var html_data="";
	             $.each(obj,  function( key, value ) {
	            	 html_data +='<p style="font-size:18px;">'+value.request_access+'</p>';
	        	 });
	        	 $('#html_data').html(html_data);
	             
	        },
  	        error:function(e)
   	        {
   	    	  console.log("error in pages");
   	     	 
   	        }
      
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
    
   /*  $(document).on('click' , '.notification' , function(event){
   	 event.preventDefault();
   	 
   	 $.ajax({
      	
      	    url:"../clientprocess?action=notification",
   	        type:"post",
   	        dataType:"json",
   	        success: function(data)
   	        {
   	        	
   	             console.log(data.notification);
   	             
   	             var obj = JSON.parse(JSON.stringify(data.notification));
	        	 var html_data ='<ul class="dropdown-menu"><li class="header">NOTIFICATIONS</li>';
	             $.each(obj,  function( key, value ) {
	            	 html_data +='<ul class="menu" style="overflow:hidden">'
	            	 html_data +='<li>'
	                 html_data +='<a href="javascript:void(0);">'
	            	 html_data +='<div class="icon-circle bg-light-green">'
	                 html_data +='<i class="material-icons">person_add</i>'
	                 html_data +='</div>'
	                 html_data +='<div class="menu-info">'
	                 html_data +='<h4>'+value.new_message+'</h4>'
	              //   html_data +='<p>'+value.email+'</p>'
	               //  html_data +='<p><i class="material-icons">access_time</i>'+value.date_time+'</p>'
	                 html_data +='</div>'
	                 html_data +='</a>'
	                 html_data +='</li>'
	                 html_data +='</ul></ul>'
	            });
	             
	             console.log(html_data);
	             
	        	 $('.notification').html(html_data);
	             
            
   	        },
    	    error:function(e)
    	    {
    	         console.log("error in pages");
    	    }  
       
       }); 
      

   });  */
  
   </script>
</body>
</html>
