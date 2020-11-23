<%@include file="include/session.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="include/head.jsp"%>
    <link rel="stylesheet" type="text/css"  href="//cdn.datatables.net/1.10.0/css/jquery.dataTables.css">
    <style type="text/css">
    
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
    
    
    </style>
 </head>
<body class="theme-light-blue">
    <%@include file="include/loader.jsp"%>
    <!-- Overlay For Sidebars -->
    <div class="overlay"></div>
    <!-- #END# Overlay For Sidebars -->
    <!-- Top Bar -->
       <%@include file="include/navbar.jsp"%>
    <!-- #Top Bar -->
    <section>
        <!-- Left Sidebar -->
       <%@include file="include/sidebar.jsp" %>
        <!-- #END# Left Sidebar -->
    </section>
    <section class="content">
        <div class="container-fluid">
            <div class="block-header">
            </div>
            <div class="row" style="margin-left:-148px !important;margin-right:-27px;">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                         <div class="body">
                              <div class="row">
                                   <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
		                               <!--   
		                               <div class="form-group" style="position:absolute;top:90px;">
		                                    <label for="NameSurname" class="col-sm-4 control-label">Usage as On</label>
		                                    <div class="col-sm-8">
		                                        <div class="form-line">
		                                           <input type="date" class="form-control"  name="cloudDateSelector"  value=""  onchange="useOfCloud(this)" >
                                                </div>
		                                    </div>
		                                </div> -->
                                   </div>
                                   <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 offset-lg-2 offset-md-2">
			                         <h6 style="font-size:19px;">Cloud Usage</h6>
		                              <div style="height:200px;text-align:center;position:relative;display: flex;flex-direction: column;align-items: center;justify-content: center;">
		                                 <div id="chartCloud" style="height: 150px; width: 100%;"></div>
		                                 <div style="width:100%;position: absolute;bottom:0px;text-align: center;">
		                                   <!--  <a href="#">Increase Storage</a> -->
		                                 </div>
		                              </div>
		                           </div>
                              </div>
                              <div class="table-responsive">
                                <table class="table  dashboard-task-infos display nowrap" style="width:100%" id="cloudRecord">
                                    <thead>
                                        <tr>
                                            <th>Department</th>
                                            <th>File No.</th>
                                            <th>File Name</th>
                                            <th>Created On</th>
                                            <th>Doc. No.</th>
                                            <th>Doc. Type</th>
                                            <th>Size(in MB)</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
        
    </section>

    <%@include file="include/footer.jsp"%>
    <script src="../js/canvasjs.min.js"></script>
    <script type="text/javascript"  src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
	
	<script>
    


	
	function useOfCloud(data)
	{
  	    	   
  	    	 $('#cloudRecord').DataTable().destroy();
  	    	 $('#cloudRecord tbody').empty();
  	    	 $('#cloudRecord').DataTable( {
  	    	       
  	    	      "lengthMenu":[25,50],
  	    	            "pageLength":25,
  	    	   		    "searching":false,
  	    	   	        "bProcessing": false,
  	    	   	        "bServerSide": false,
  	    	   	        "sort": "position",
  	    	   	        "ajax":{
		  	    	   	       url:"./customerprocess?action=cloudRecord",
		  	    	  	       type:"POST",
		  	    	  	       dataType:"json",
		  	    	  	       data:{"cloudate":data.value},
  	    	   	        },
  	    	   	        "aoColumns": [
  	    	   	            
  	    	   	        	{ "mData": "department" },
  	    	   	            { "mData": "file_no" },
  	    	   	            { "mData": "file_name" },
  	    	   	            { "mData": "created_no" },
  	    	   	            { "mData": "document_no" },
  	    	   	            { "mData": "document_type" },
  	    	   	            { "mData": "size" },
  	    	   	            
  	    	   	        ]
  	    	});
	
	}
	
	
	  $(document).ready(function() {
		  
			$("#cloudRecord").dataTable( {
   		    "lengthMenu":[25,50],
            "pageLength":25,
   		    "searching":false,
   	        "bProcessing": false,
   	        "bServerSide": false,
   	        "sort": "position",
   	        "sAjaxSource": "./customerprocess?action=cloudRecord",
   	        "aoColumns": [
   	            
   	        	{ "mData": "department" },
   	            { "mData": "file_no" },
   	            { "mData": "file_name" },
   	            { "mData": "created_no" },
   	            { "mData": "document_no" },
   	            { "mData": "document_type" },
   	            { "mData": "size" },
   	            
   	        ]
   	     } );
   	   
  });

	
	
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
     	        			indexLabel: "{label } {y} GB",
     	        			dataPoints: [
     	        			
     	        				{ y: value.cloud_size , label: "Used" },
      	    					{ y: value.storageData  , label: "Free Space" },
      	    					
     	        				
     	        			]
     	        		}]
     	        	});
     	        	chart.render();

	    	         });
     	        	
     	           $('#loader').hide();
     	    		 
     	      },
     	      error:function(e)
     	      {
     	    	  console.log("error in pages");
     	     }
        
       });
        	
        	
      }
  
        
    </script>
    
</body>
</html>
