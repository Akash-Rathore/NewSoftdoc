<%@include file="include/session.jsp" %>
<%@page import="java.sql.Statement"%>
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
                    <!-- <li class="pull-right"><a href="javascript:void(0);" class="js-right-sidebar" data-close="true"><i class="material-icons">more_vert</i></a></li> -->
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
                                <a href="location.jsp?id=<%=request.getParameter("did")%>" class="btn btn-primary">Back</a>      
                            </h2>
                           <div class="row">
                                <div class="col-md-11">
                                </div>
                            </div>
                            
                        </div>
                        
                        <div class="body mrgnbtm">
                          <%
                                                                   try(Connection connection=StoreDBConnection.openConnection();
                                                                		   Statement statment=connection.createStatement();
                                                                             )
                                                                   {
                                                 	                     ResultSet resultset=statment.executeQuery("SELECT * FROM customer_location WHERE id='"+request.getParameter("id")+"'");
                                                                         if(resultset.next())
                                                                         {
                                %>
                                   <form  action="../Process?action=editlocation" method="POST" class="form-horizontal form-submit">
                                    
                                    <div class="form-group">
		                                    <label for="NameSurname" class="col-sm-3 control-label">Company Name</label>
		                                    <div class="col-sm-9">
		                                        <div class="form-line">
		                                        	 <input type="text" class="form-control"  name="company_name" value="<%=resultset.getString("company_name")%>" readonly>
		                                             <input type="hidden" class="form-control"  name="id" value="<%=resultset.getString("id")%>">
		                                             <input type="hidden" class="form-control"  name="company_id" value="<%=resultset.getString("company_id")%>">
		                                             
		                                        </div>
		                                    </div>
		                           </div>
                                   <div class="form-group">
                                      <label for="NameSurname" class="col-sm-3 control-label">Address Line1<span style="color:red; font-size:18px;">*</span></label>
                                      <div class="col-sm-9">
                                         <div class="form-line">
                                            <input type="text"  class="form-control"  name="addresslineone" placeholder="Address Line1" value="<%=resultset.getString("address_line_one")%>">
                                         </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email"  class="col-sm-3 control-label">Address Line2</label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text" class="form-control"  name="addresslinetwo" placeholder="Address Line2" value="<%=resultset.getString("address_line_two")%>">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">City<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text"   class="form-control"  name="city" placeholder="City" value="<%=resultset.getString("city")%>">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Pincode<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="number"  oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                                    maxlength = "8"  class="form-control"  name="pincode" placeholder="Pincode" value="<%=resultset.getString("pincode")%>">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Start Date<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="date" class="form-control"  name="date" placeholder="Start Date" value="<%=resultset.getString("date")%>">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-3 control-label">Pickup Frequency<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <select class="form-control show-tick" name="pickupfrequency">
                                            
                                               <%if("7".equals(resultset.getString("pickup_frequency"))){ %>
                                              
                                                        <option value="7">Weekly</option>
                                                        <option value="14">Fortnightly</option>
                                                        <option value="30">Monthly</option>
                                                        <option value="90">Quarterly</option>  
                                              
                                              <%}else if("14".equals(resultset.getString("pickup_frequency"))){ %>
                                               
                                                        <option value="14">Fortnightly</option>
                                                        <option value="7">Weekly</option>
                                                        <option value="30">Monthly</option>
                                                        <option value="90">Quarterly</option>
                                               
                                               <%}else if("30".equals(resultset.getString("pickup_frequency"))){%>
                                                        
                                                        <option value="30">Monthly</option>
                                                        <option value="7">Weekly</option>
                                                        <option value="14">Fortnightly</option>
                                                        <option value="90">Quarterly</option>  
                                               <% 
                                                 }else if("90".equals(resultset.getString("pickup_frequency"))){
                                               %> 
                                                      <option value="90">Quarterly</option>
                                                      <option value="7">Weekly</option>
                                                      <option value="14">Fortnightly</option>
                                                      <option value="30">Monthly</option>
                                                               
                                              <%}%>  
                                               
                                              </select>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row"><center><strong><h5>Location Contact Person</h5></strong></center></div>
                                
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Name<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text"  class="form-control"  name="locpersonname" placeholder="Contact Person Name" value="<%=resultset.getString("loc_person_name")%>">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Mobile<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="number" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                                    maxlength = "10" class="form-control"  name="locpersonmobile" placeholder="Contact Person Mobile" value="<%=resultset.getString("loc_person_mobile")%>">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Email<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="email" class="form-control"  name="locpersonemail" placeholder="Contact Person Email" value="<%=resultset.getString("loc_person_email")%>" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-3 control-label">Designation<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-9">
                                        <div class="form-line">
                                            <input type="text" class="form-control"  name="locpersiondesignation" placeholder="Contact Person Designation" value="<%=resultset.getString("loc_per_designation")%>">
                                        </div>
                                    </div>
                                </div>
                                <div class="row clearfix">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> 
                                        <button type="submit" class="btn btn-primary"  id="preloader" style="float: right; margin-right: 3px;">Submit</button>
                                        <div class="loader">
                                             <img src="../images/preloader.gif"  alt="" style="float: right; margin-right: 3px;width: 50px;height:50px;">
                                        </div>
                                    </div>
                                </div>
                            </form>
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
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
     <%@include file="include/script.jsp"%>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script> 
     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
     <script src="include/custom-script.js"></script>  
     <script type="text/javascript">
       $(document).on('submit', '.form-submit', function (e) {
    	    e.preventDefault();
    	    
    	     var form=$(this);
	    	 var formdata=new FormData($(form)[0]);
	    	 var data={};
	         formdata.forEach(function(value,key)
	    	 {
	    		 data[key]=value;
	    	 });
	        
	         var location_id=data.company_id;
	         
	         
	         
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
	         
	         
	         Swal.fire({
	        	  title: 'Are you sure',
	        	  text: "you want to make changes ?",
	        	  icon: 'warning',
	        	  showCancelButton: true,
	        	  cancelButtonText: ' No ',
	        	  confirmButtonColor: '#3085d6',
	        	  cancelButtonColor: '#d33',
	        	  confirmButtonText: 'Yes'
	        	}).then((result) => {
	        	  if (result.value) {
	        	       $.ajax({
	           	        url: $(form).attr('action'),
	           	        type: $(form).attr('method'),
	           	        dataType:'json',
	           	        data:data,
	           	        beforeSend:function(){
	 			    	   $('#preloader').hide(); 
		    	           $('.loader').show();
		    	        },
	           	        success: function (data) {
	           	       	if(data.status)
	       	    	         {
	       	     	    		Swal.fire({
	       	     	    			
	       	     	    			  position: 'top-end',
	       	     	    			  icon: 'success',
	       	     	    			  title: 'Changes saved',
	       	     	    			  showConfirmButton: false,
	       	     	    			  timer: 3000
	       	     	    			})
	       	     	    		$('.loader').hide();
	       	     	    	    $('#preloader').show();
	       	     	    	    
	       	     	    	    
		     	    		    setTimeout(function(){
			     	    		   window.location.href="location.jsp?id="+location_id;
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
		       	     	    		
	       	    	    			
	       	    	    	  }
	           	        	
	           	        },
	           	        error: function (err) {
	           	            console.log(err);
	           	        }
	           	    });
	       		  }
	        	})
    	
             });
  </script>  
</body>
</html>
