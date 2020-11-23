<%@include file="include/session.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="include/head.jsp"%>
<link rel="stylesheet" type="text/css"  href="//cdn.datatables.net/1.10.0/css/jquery.dataTables.css">
</head>
<body class="theme-light-blue">
	<!-- Overlay For Sidebars -->
	<div class="overlay"></div>
	<!-- #END# Overlay For Sidebars -->
	<nav class="navbar">
		<div class="container-fluid" style="background: #fff;">
			<div class="navbar-header">
				<a href="javascript:void(0);" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar-collapse"
					aria-expanded="false"></a> <a href="javascript:void(0);"
					class="bars"></a> <a class="image" href="index.jsp"><img
					src="../images/logo5.png" class="logoClient" alt="User" /></a>
			</div>
			<div class="collapse navbar-collapse" id="navbar-collapse"
				style="background: #fff;">
				<ul class="nav navbar-nav navbar-right">
					<%-- <%@include file="include/message.jsp"%> --%>
					<%@include file="include/notification.jsp"%>
					<%@include file="include/profile-pic.jsp"%>
				</ul>
			</div>


		</div>
		<div class="container-fluid" style="height: 38px;background: #6c757d;display: flex; flex-direction: column;justify-content: center;align-items: flex-end;">
		  <a href="create_clients.jsp" style="text-decoration:none;color:#fff;position:absolute;right:128px;"><span style="font-size: 35px;font-weight:bold;">+</span></a>
		</div>
		<div class="container-fluid"
			style="position: fixed; bottom: 0; width: 100%; height: 37px; background: #6c757d; display: flex; flex-direction: row; justify-content: space-between; align-items: center;">
			<div>
				<a href="condition.jsp" style="color: #fff; text-decoration: none;">Terms
					& Conditions</a>
			</div>
			<div style="color: #fff;">
				<a href="#" style="color: #fff; text-decoration: none;">Copyright @. All Right Reserved.</a>
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
				<!-- <h2>
                  //  User Details
                </h2> -->
			</div>
			<div class="row"
				style="margin-left: -148px !important; margin-right: -27px;">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="card">
						<div class="body">
							<div class="table-responsive">
								<table class="table table-hover" id="clientRecord">
									<thead>
										<tr>
											<th>Softdoc ID</th>
											<th>Employee ID</th>
											<th>Employee Name</th>
											<th>Email</th>
											<th>Designation</th>
											<th>Departments</th>
											<th>Created On</th>
											<th>Modified On</th>
											<th width="200px">Action</th>
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
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script type="text/javascript">
   $(document).on('click','.delete',function(){
 	  
	    let id=$(this).data('id');
	    
	    console.log(id);
	    
	    let element = $(this);
	    Swal.fire({
	    	  title: 'Are you sure?',
	    	  text: " You will not be able to revert this action",
	    	  icon: 'warning',
	    	  showCancelButton: true,
	    	  cancelButtonText: ' No ',
	    	  confirmButtonColor: '#3085d6',
	    	  cancelButtonColor: '#d33',
	    	  confirmButtonText: ' Yes '
	    	}).then((result) => {
	    	  if (result.value) {
	    	  
	    		  $.ajax({
	          	        url:"./customerprocess?action=customerclientdetaildelete&id="+id,
	          	        type:"POST",
	          	        dataType:"json",
	          	        success:function(data,textStatus,jqXHR)
	          	        {
	          	      	   if(data.status)
	          	      	   {
	          	      		   console.log(data);
	          	      
	          	      		   if(data.status){
		          	      			Swal.fire({
		          	      			     position:'center',
		          	      		         icon: 'success',
		          	      		         title: 'User Deleted',
		          	      		         timer: 3500
		          	      		         
		          	      		    });
		          	      	       $(element).parents('tr').remove();
		          	      	      
	          	              	}
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
  </script>
	<script type="text/javascript"
		src="//cdn.datatables.net/1.10.0/js/jquery.dataTables.js"></script>
	<script>
          
      $(document).ready(function() {
            
    	   $("#clientRecord").dataTable( {
    		    "lengthMenu":[25,50],
                "pageLength":25,
      		    "searching":false,
    	        "bProcessing": false,
    	        "bServerSide": false,
    	        "sort": "position",
    	        "sAjaxSource": "./customerprocess?action=clienRecord",
    	        "aoColumns": [
    	            
    	        	{ "mData": "softdocno" },
    	            { "mData": "employeeid" },
    	            { "mData": "name" },
    	            { "mData": "email" },
    	            { "mData": "designation" },
    	            { "mData": "department" },
    	            { "mData": "joiningdate" },
    	            { "mData": "activationdate" },
    	            { "mData": "deleteViewEdit" },
    	            
    	        ]
    	    } );

    	} );
 
     </script>
</body>
</html>
