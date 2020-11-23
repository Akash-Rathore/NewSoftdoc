
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
                <h2>
                
                </h2>
            </div>
            
            <div class="row" style="margin-left:-148px !important;margin-right:-27px;">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header  margin0">
                            
                            <div class="row">
                                <!-- <div class="">
                                    <h2 class="col-md-4 col-lg-4 col-xs-12 pull-left">
                                        <div class="m-t-10">
                                             File Storage
                                        </div>
                                    </h2>
                                 
                                </div> -->
                            </div>
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table  dashboard-task-infos display nowrap" style="width:100%" id="trackingRecord">
                                    <thead>
                                        <tr>
                                            <th>File No.</th>
                                            <th>Department</th>
                                            <th>Pickup Date</th>
                                         <!--    <th>Pickup Form No.</th> -->
                                            <th>Tracking</th>
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
    <%@include file="include/footer.jsp"%>
    <script type="text/javascript" src="//cdn.datatables.net/1.10.0/js/jquery.dataTables.js"></script>
	<script>
      $(document).ready(function() {
            
    	   $("#trackingRecord").dataTable( {
    		    "lengthMenu":[25,50],
                "pageLength":25,
      		    "searching":false,
    	        "bProcessing": false,
    	        "bServerSide": false,
    	        "sort": "position",
    	        "sAjaxSource": "./customerprocess?action=trackingRecord",
    	        "aoColumns": [
    	            
    	        	{ "mData": "file_no" },
    	            { "mData": "department" },
    	            { "mData": "pickup_date" },
    	            //{ "mData": "pickup_from_no" },
    	            { "mData": "tracking" },
    	            
    	            
    	        ]
    	    } );

    	} );
 
     </script>
    
</body>
</html>
