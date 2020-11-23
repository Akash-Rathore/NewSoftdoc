<%@include file="include/session.jsp" %>
<!DOCTYPE html>
<html>
<head>

    <%@include file="include/head.jsp" %>
     <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
     <style>
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
        <div class="container-fluid">
            <div class="navbar-header">
                <a href="javascript:void(0);" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false"></a>
                <a href="javascript:void(0);" class="bars"></a>
                <a class="navbar-brand" href="index.jsp">SOFTDOC ADMIN</a>
            </div>
            <div class="collapse navbar-collapse" id="navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <!-- Notifications -->
                    <%@include file="include/notification.jsp" %>
                    <!-- #END# Notifications -->                    
                </ul>
            </div>
        </div>
    </nav>
    <!-- #Top Bar -->
    <section>
        <!-- Left Sidebar -->
             <%@include file="include/leftsidebar.jsp" %> 
        <!-- #END# Left Sidebar -->
    </section>
     <section class="content">
        <div class="container-fluid">
            <div class="block-header">
                <h2>
                    Location
                </h2>
            </div>
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                Add Location
                            </h2>
                           <div class="row">
                                <div class="col-md-11">
                                    <div style="float:right">
                                  	 </div>
                                </div>
                            </div>
                            
                        </div>
                        
                        <div class="body mrgnbtm">
                            <form  method="post" id="customerlocation" class="form-horizontal">
                            <%
                                                                   int loc_id = Integer.parseInt(request.getParameter("id")); 
                                                                   try( Connection connection=StoreDBConnection.openConnection();
                                                                		   PreparedStatement  preparedStatement=connection.prepareStatement("SELECT  `company_name`  FROM `customer_details` WHERE id = '"+loc_id+"'");
                                                                             )
                                                                   {
                                                 	                     ResultSet resultset=preparedStatement.executeQuery();
                                                                         if(resultset.next())
                                                                         {
                                %>   
                                        <div class="form-group">
		                                    <label for="NameSurname" class="col-sm-3 control-label">Company Name</label>
		                                    <div class="col-sm-9">
		                                        <div class="form-line">
		                                        	<input type="text" class="form-control" id="NameSurname" name="company_name" value="<%=resultset.getString("company_name") %>" readonly>
		                                        	<input type="hidden" class="form-control"  name="company_id" value="<%=loc_id%>">
		                                        </div>
		                                    </div>
		                                </div>
                                
                                 <%
                                                }
                                              }
                                             catch(SQLException sqlexception)
                                             {
                                	                sqlexception.printStackTrace();
                                             }
                                            catch(Exception exception)
                                            {
                                	           exception.printStackTrace();
                                            }
                                        %>
                                
                                
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-3 control-label">Address Line1<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text"  class="form-control"  name="addresslineone" placeholder="Address Line1" value="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email"  class="col-sm-3 control-label">Address Line2</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text" class="form-control"  name="addresslinetwo" placeholder="Address Line2" value="" >
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">City<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text"   class="form-control"  name="city" placeholder="City" value="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Pincode<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="number"  oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                                    maxlength = "8"  class="form-control"  name="pincode" placeholder="Pincode" value="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Start Date<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="date" class="form-control"  name="date" placeholder="Start Date" value="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-3 control-label">Pickup Frequency<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <select class="form-control show-tick" name="pickupfrequency">
                                                <option value="">Select</option>
                                                <option value="7">Weekly</option>
                                                <option value="14">Fortnightly</option>
                                                <option value="30">Monthly</option>
                                                <option value="90">Quarterly</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row"><center><strong><h5>Location Contact Person</h5></strong></center></div>
                                
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Name<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text"  class="form-control"  name="locpersonname" placeholder="Contact Person Name" value="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Mobile<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="number" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                                    maxlength = "10" class="form-control"  name="locpersonmobile" placeholder="Contact Person Mobile" value="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Email<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="email" class="form-control"  name="locpersonemail" placeholder="Contact Person Email" value="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Designation<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text" class="form-control"  name="locpersiondesignation" placeholder="Contact Person Designation" value="">
                                        </div>
                                    </div>
                                </div>
                                <div class="row clearfix">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> 
                                        <button type="submit" class="btn btn-primary" id="preloader" style="float: right; margin-right: 3px;">Submit</button>
                                          <div class="loader">
                                              <img src="../images/preloader.gif"   style="float: right;width: 50px;height:50px;margin-right: 3px;">
                                          </div>  
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
     <%@include file="include/script.jsp" %>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script> 
     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
     <script src="include/custom-script.js"></script>  
     <script type="text/javascript">
       $('#customerlocation').submit(function(e){
	      e.preventDefault();
	         
	      
	         var form=$(this);
	    	 var formdata=new FormData($(form)[0]);
	    	 var data={};
	         formdata.forEach(function(value,key)
	    	 {
	    		 data[key]=value;
	    	 });
	    	 
	         console.log(data);
	         if(data.addresslineone=='')
	         {
	    		 error("Please fill the addressline one");
	             return false;
	    	 }
	         else if(data.city=='')
	         {
	    		 error("Please fill the city name");
	             return false;
	    	 }
	         else if(data.pincode=='')
	         {
	    		 error("Please fill the pincode");
	             return false;
	    	 }
	         else if(data.date=='')
	         {
	    		 error("Please fill the start date");
	             return false;
	    	 }
	         else if(data.pickupfrequency=='')
	         {
	    		 error("Please fill the Pickup Frequency");
	             return false;
	    	 }
	         else if(data.locpersonname=='')
	         {
	    		 error("Please fill the Contact person name");
	             return false;
	    	 }
	         else if(data.locpersonmobile=='')
	         {
	    		 error("Please fill the Contact person mobile");
	             return false;
	    	 }
	         else if(data.locpersonemail=='')
	         {
	    		 error("Please fill the Contact person Email");
	             return false;
	    	 }
	         else if(data.locpersiondesignation=='')
	         {
	    		 error("Please fill the contact person designation");
	             return false;
	    	 }
	      
	       $.ajax({
	    	       
	    	       url:"../Process?action=customerlocation",
	    	       type:"POST",
	    	       dataType:"json",
	    	       data:$("#customerlocation").serialize(),
	    	       beforeSend:function(){
		      	      
	    	    	   $('#preloader').hide(); 
	    	           $('.loader').show();
	    	          
			  	   },
	    	       success:function(data,textStatus,jqXHR)
	    	       {
	    	    	 console.log(data);
	     	    	 if(data.status)
	    	         {
	     	    		
	     	    		Swal.fire({
	     	    			   position: 'top-end',
	     	    			   icon: 'success',
	     	    			   title: 'New Location Created',
	     	    			   showConfirmButton: false,
	     	    			   timer: 3000
	     	    			})
	     	    			$('.loader').hide();
	       	     	    	$('#preloader').show();
	       	     	    	
	       	     	    	document.getElementById("customerlocation").reset();
	     	    		    var location_id = window.location.href;
	     	    		    var res = location_id.split("=");
	     	    		    var  loc = res[1];
	     	    		    setTimeout(function(){
		     	    		   window.location.href="location.jsp?id="+loc;
		     	    	   })	
	     	    		 
	     	    		
	     	    	  }
	    	    	  else 
	    	    	  {
	    	    		   Swal.fire({
	    	    			  icon:'error',
	    	    			  title:'Some thing is wrong',
	    	    			  text:"wrong",
	    	    			  footer:'',
	    	    			  timer:3000
	    	    			}) 
	    	    		   $('.loader').hide();
	       	     	       $('#preloader').show();
	       	     	
	    	    			//setTimeout(function(){location.reload();},2500);
	    	    	  }    
	    	      },
	    	    error:function(e)
	    	    {
	    	    	//console.log("error in pages");
	    	    	Swal.fire({
  	    			   icon:'error',
  	    			   title:'Some thing is wrong',
  	    			   footer:'',
  	    			   timer:3000
  	    			}) 
  	    		  	
	    	    }
	       
	      });
   });
</script>  
</body>
</html>
