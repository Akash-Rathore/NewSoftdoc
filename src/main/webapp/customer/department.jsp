<%@include file="include/session.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="include/head.jsp"%>
   
  <style type="text/css">
    
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

.indexInformation{

  width:30%;

}
</style>
    
</head>
<body class="theme-light-blue">
    <!-- Overlay For Sidebars -->
    <div class="overlay"></div>
    <!-- #END# Overlay For Sidebars -->
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
               
            </div>
            <div class="row"  style="margin-left:-148px !important;margin-right:-27px;">
                <!-- Latest Social Trends -->
                <!-- #END# Latest Social Trends -->
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header  margin0">
                            <div class="row" >
                                <div class="">
                                    <h2 class="col-md-4 col-lg-4 col-xs-12 pull-left">
                                        <div class="m-t-10">
                                            Department
                                        </div>
                                    </h2>
                                </div>
                            </div>
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Department</th>
                                        <th>Document Type</th>
                                        <th>Index Information</th>
                                    </tr>
                                </thead>
                                <tbody>
                                  
                                  <%
                                   
                                   String department=(String)session.getAttribute("depart_info");
                                   String industry=(String)session.getAttribute("customer_industry");
                                   String single_department[]=department.split(",");
                                   for(int i=0;i<single_department.length;i++){
                                	   
                                	   %>
                                	   
                                	 <%if((single_department[i].equalsIgnoreCase("Accounts & Finance") && industry.equalsIgnoreCase("Services-Others")) || (single_department[i].equalsIgnoreCase("Accounts & Finance") && industry.equalsIgnoreCase("FMCG")) || (single_department[i].equalsIgnoreCase("Accounts & Finance") && industry.equalsIgnoreCase("Manufacturing"))){%>
                                	  <tr>
                                          <td><button type="button" class="btn department" data-id=<%=i %> data-dept=Accounts & Finance style="width:138px !important;background:#6c757d;color:white !important;">Accounts & Finance</button></td>
                                          <td class="documentType" style="width:30%;"></td>
                                          <td class="indexInformation"></td>
                                      </tr>
                                      
                                      <%}else if((single_department[i].equalsIgnoreCase("Administration") && industry.equalsIgnoreCase("FMCG")) || (single_department[i].equalsIgnoreCase("Administration") && industry.equalsIgnoreCase("Manufacturing"))){%>
                                	  <tr>
                                          <td><button type="button" class="btn department" data-id=<%=i %> data-dept=Administration style="width:138px !important;background:#6c757d;color:white !important;">Administration</button></td>
                                          <td class="documentType" style="width:30%;"></td>
                                          <td class="indexInformation"></td>
                                      </tr> 
                                	   <%}else if(single_department[i].equalsIgnoreCase("Assets") && industry.equalsIgnoreCase("Manufacturing") ){%>
                                      <tr>
                                          <td><button type="button" class="btn department" data-id=<%=i %> data-dept=Assets style="width:138px !important;background:#6c757d;color:white !important;">Assets</button></td>
                                          <td class="documentType" style="width:30%;"></td>
                                          <td class="indexInformation"></td>
                                      </tr>
                                       <%} else if(single_department[i].equalsIgnoreCase("Direct Tax")){%> 
                                      <tr>
                                          <td><button type="button" class="btn department" data-id=<%=i %> data-dept=Direct Tax style="width:138px !important;background:#6c757d;color:white !important;">Direct Tax</button></td>
                                          <td class="documentType" style="width:30%;"></td>
                                          <td class="indexInformation"></td>
                                      </tr>
                                      <%} else if(single_department[i].equalsIgnoreCase("Hr")){%>  
                                      <tr>
                                          <td><button type="button" class="btn department" data-id=<%=i %> data-dept=Hr style="width:138px !important;background:#6c757d;color:white !important;">Hr</button></td>
                                          <td class="documentType" style="width:30%;"></td>
                                          <td class="indexInformation"></td>
                                      </tr>
                                      <%}else if(single_department[i].equalsIgnoreCase("Indirect Tax")){ %>  
                                        
                                      <tr>
                                          <td><button type="button" class="btn department" data-id=<%=i %> data-dept=Indirect Tax style="width:138px !important;background:#6c757d;color:white !important;">Indirect Tax</button></td>
                                          <td class="documentType" style="width:30%;"></td>
                                          <td class="indexInformation"></td>
                                      </tr>
                                      
                                      <%}else if((single_department[i].equalsIgnoreCase("Legal") && industry.equalsIgnoreCase("Manufacturing")) || (single_department[i].equalsIgnoreCase("Legal") && industry.equalsIgnoreCase("FMCG")) || (single_department[i].equalsIgnoreCase("Legal") && industry.equalsIgnoreCase("Services-Others"))){%>  
                                      <tr>
                                          <td><button type="button" class="btn department" data-id=<%=i%> data-dept=Legal style="width:138px !important;background:#6c757d;color:white !important;">Legal</button></td>
                                          <td class="documentType" style="width:30%;"></td>
                                          <td class="indexInformation"></td>
                                      </tr>
                                      <%}else if(single_department[i].equalsIgnoreCase("Marketing")){%>  
                                      <tr>
                                          <td><button type="button" class="btn department" data-id=<%=i %> data-dept=Marketing style="width:138px !important;background:#6c757d;color:white !important;">Marketing</button></td>
                                          <td class="documentType" style="width:30%;"></td>
                                          <td class="indexInformation"></td>
                                      </tr>
                                      <%}else if(single_department[i].equalsIgnoreCase("Production")){ %>  
                                      <tr>
                                          <td><button type="button" class="btn department" data-id=<%=i %> data-dept=Production style="width:138px !important;background:#6c757d;color:white !important;">Production</button></td>
                                          <td class="documentType" style="width:30%;"></td>
                                          <td class="indexInformation"></td>
                                      </tr>
                                      <%}else if((single_department[i].equalsIgnoreCase("Purchase") && industry.equalsIgnoreCase("Manufacturing")) || (single_department[i].equalsIgnoreCase("Purchase") && industry.equalsIgnoreCase("FMCG")) || (single_department[i].equalsIgnoreCase("Purchase") && industry.equalsIgnoreCase("Services-Others"))){ %>  
                                        
                                      <tr>
                                          <td><button type="button" class="btn department" data-id=<%=i %> data-dept=Purchase style="width:138px !important;background:#6c757d;color:white !important;">Purchase</button></td>
                                          <td class="documentType" style="width:30%;"></td>
                                          <td class="indexInformation" ></td>
                                      </tr>
                                      <%}else if(single_department[i].equalsIgnoreCase("Quality")) {%>  
                                        
                                      <tr>
                                          <td><button type="button" class="btn department" data-id=<%=i %> data-dept=Quality style="width:138px !important;background:#6c757d;color:white !important;">Quality</button></td>
                                          <td class="documentType" style="width:30%;"></td>
                                          <td class="indexInformation"></td>
                                      </tr>
                                      <%}else if((single_department[i].equalsIgnoreCase("Sales") && industry.equalsIgnoreCase("Manufacturing")) || (single_department[i].equalsIgnoreCase("Sales") && industry.equalsIgnoreCase("FMCG")) || (single_department[i].equalsIgnoreCase("Sales") && industry.equalsIgnoreCase("Services-Others"))){ %>  
                                        
                                      <tr>
                                          <td><button type="button" class="btn department" data-id=<%=i %> data-dept=Sales style="width:138px !important;background:#6c757d;color:white !important;">Sales</button></td>
                                          <td class="documentType" style="width:30%;"></td>
                                          <td class="indexInformation"></td>
                                      </tr>
                                     <%}else if(single_department[i].equalsIgnoreCase("Statutory Audit")){ %>  
                                         
                                      <tr>
                                          <td><button type="button" class="btn department" data-id=<%=i %> data-dept=Statutory Audit style="width:138px !important;background:#6c757d;color:white !important;">Statutory Audit</button></td>
                                          <td class="documentType" style="width:30%;"></td>
                                          <td class="indexInformation"></td>
                                      </tr>
                                      <%}else if(single_department[i].equalsIgnoreCase("Store")) {%>  
                                        
                                      <tr>
                                          <td><button type="button" class="btn department" data-id=<%=i %> data-dept=Store style="width:138px !important;background:#6c757d;color:white !important;">Store</button></td>
                                          <td class="documentType" style="width:30%;"></td>
                                          <td class="indexInformation"></td>
                                      </tr>
                                     <%} else if(single_department[i].equalsIgnoreCase("Finance & Accounts")) {%>  
                                      <tr>
                                          <td><button type="button" class="btn department" data-id=<%=i %> data-dept="Finance & Accounts:<%=industry%>" style="width:138px !important;background:#6c757d;color:white !important;">Finance & Accounts</button></td>
                                          <td class="documentType" style="width:30%;"></td>
                                          <td class="indexInformation"></td>
                                      </tr>
                                       
                                      <%} else if(single_department[i].equalsIgnoreCase("Legal") && industry.equalsIgnoreCase("Services-CA/CS")) {%>  
                                      <tr>
                                          <td><button type="button" class="btn department" data-id=<%=i %> data-dept="Legal:<%=industry%>" style="width:138px !important;background:#6c757d;color:white !important;">Legal</button></td>
                                          <td class="documentType" style="width:30%;"></td>
                                          <td class="indexInformation"></td>
                                      </tr>
                                     <%} else if(single_department[i].equalsIgnoreCase("People & HR")) {%>  
                                      <tr>
                                          <td><button type="button" class="btn department" data-id=<%=i %> data-dept="People & HR" style="width:138px !important;background:#6c757d;color:white !important;">People & HR</button></td>
                                          <td class="documentType" style="width:30%;"></td>
                                          <td class="indexInformation"></td>
                                      </tr>
                                     <%} else if(single_department[i].equalsIgnoreCase("Purchase") && industry.equalsIgnoreCase("Services-CA/CS")) {%>  
                                      <tr>
                                          <td><button type="button" class="btn department" data-id=<%=i %> data-dept="Purchase:<%=industry%>" style="width:138px !important;background:#6c757d;color:white !important;">Purchase</button></td>
                                          <td class="documentType" style="width:30%;"></td>
                                          <td class="indexInformation"></td>
                                      </tr>
                                     <%} else if(single_department[i].equalsIgnoreCase("Sale")) {%>  
                                      <tr>
                                          <td><button type="button" class="btn department" data-id=<%=i %> data-dept="Sale" style="width:138px !important;background:#6c757d;color:white !important;">Sale</button></td>
                                          <td class="documentType" style="width:30%;"></td>
                                          <td class="indexInformation"></td>
                                      </tr>
                                     <%} }%>  
                                       
                                  	   <!--   <tr>
                                          <td><a href="#" data-toggle="modal" data-target="#increasedepartment">Request New</a></td>
                                          <td><a href="#" data-toggle="modal" data-target="#documnetType">Request New</a></td>
                                          <td><a href="#" data-toggle="modal" data-target="#indexField">Request New</a></td>
                                      </tr>  -->
                               </tbody>
                            </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
      <div class="modal fade" id="increasedepartment" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Department</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="Email" class="col-sm-4 control-label">Department Name
							</label>
						<div class="col-sm-8">
							<div class="form-line">
								<input type="email" class="form-control" name="current_limit"
									value="" placeholder="Department Name">
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
					style="text-align: center; margin-top: 30px;">
					<button type="button" class="btn" style="width:120px;border:1px solid #6c757d;color: #f8fcff;background: #6c757d;">Submit</button>
					<button type="button" class="btn" style="width:120px;border:1px solid #6c757d;color: #f8fcff;background: #6c757d;" data-dismiss="modal">Cancel</button>
				</div>
			</div>
		</div>
	</div>
	
	
	
	 <div class="modal fade" id="documnetType" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Document Type</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				 <div class="container-fluid">
				   <div class="row">
				       <div class="form-group">
                        <label for="NameSurname" class="col-sm-4 control-label">Department</label>
                        <div class="col-sm-8">
                            <div class="form-line">
                                <select class="form-control show-tick" name="role" >
                                    <option value="">Select</option>
                                    <option value="store">Store</option>
                                    <option value="indexing">Indexing</option>
                                    <option value="quality">Quality</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
						<label for="Email" class="col-sm-4 control-label">Doc. Type
							</label>
						<div class="col-sm-8">
							<div class="form-line">
								<input type="email" class="form-control" name="current_limit"
									value="" placeholder="Document Type">
							</div>
						</div>
					</div>
					<div class="form-group" style="margin-top:95px;">
                          <div class="col-sm-10 table-responsive">
                              <table class="table table-bordered table-hover"  id="documentuploading">
                               <thead>
                               </thead>
                               <tbody>
                                   
                               </tbody>
                              </table>
                          </div>
                           <div class="col-sm-2">
                               <button id="addmore" class="btn  addmore" style="width:120px;border:1px solid #6c757d;color: #f8fcff;background: #6c757d;" type="button" >+ Add Field </button>
                            </div>    
                    </div>
				   <div class="form-group" style="margin-top:95px;">
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
				  </div>
				</div>
				<div class="modal-footer" style="text-align:center;">
					<button type="button" class="btn" style="width:120px;border:1px solid #6c757d;color: #f8fcff;background: #6c757d;">Submit</button>
					<button type="button" class="btn" style="width:120px;border:1px solid #6c757d;color: #f8fcff;background: #6c757d;" data-dismiss="modal">Cancel</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="indexField" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Index Field</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
								 <div class="container-fluid">
				   <div class="row">
				       <div class="form-group">
                        <label for="NameSurname" class="col-sm-4 control-label">Department</label>
                        <div class="col-sm-8">
                            <div class="form-line">
                                <select class="form-control show-tick" name="role" >
                                    <option value="">Select</option>
                                    <option value="store">Store</option>
                                    <option value="indexing">Indexing</option>
                                    <option value="quality">Quality</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
						<label for="Email" class="col-sm-4 control-label">Doc. Type
							</label>
						<div class="col-sm-8">
							<div class="form-line">
	                            <select class="form-control show-tick" name="role" >
                                    <option value="">Select</option>
                                    <option value="store">Store</option>
                                    <option value="indexing">Indexing</option>
                                    <option value="quality">Quality</option>
                                </select>
   						   </div>
						</div>
					</div>
					<div class="form-group" style="margin-top:95px;">
                          <div class="col-sm-10 table-responsive">
                              <table class="table table-bordered table-hover"  id="indexField">
                               <thead>
                               </thead>
                               <tbody>
                                   
                               </tbody>
                              </table>
                          </div>
                           <div class="col-sm-2">
                               <button id="addindex" class="btn  addindex" style="width:120px;border:1px solid #6c757d;color: #f8fcff;background: #6c757d;" type="button" >+ Add Field </button>
                            </div>    
                    </div>
				   <div class="form-group" style="margin-top:95px;">
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
				  </div>
				</div>
				<div class="modal-footer" style="text-align:center;">
					<button type="button" class="btn" style="width:120px;border:1px solid #6c757d;color: #f8fcff;background: #6c757d;">Submit</button>
					<button type="button" class="btn" style="width:120px;border:1px solid #6c757d;color: #f8fcff;background: #6c757d;" data-dismiss="modal">Cancel</button>
				</div>
			</div>
		</div>
	</div>
    <%@include file="include/footer.jsp"%>
   <script>
   
   
   var i=$('table#documentuploading tr').length;
   $("#addmore").on('click',function(){
    html = '<tr>';
    html+= '<td><input type="text" class="form-control" name="multidocument['+i+']" id="multidocument_'+i+'" placeholder="Document Type"></td>';
    html+= '<td><select class="form-control"><option>Hr</option><option>Sales</option><option>Marketing</option></select></td>';
    html+= '<td><button class="delete-appended-row btn btn-danger" type="button">Remove</button></td>';
    html+= '</tr>';
    $('table#documentuploading').append(html);
    i++;
  });
   
  $(document).on('click','.delete-appended-row',function(){
  		 $(this).parent().parent().remove();
  });


  
  var i=$('table#indexField tr').length;
  $("#addindex").on('click',function(){
	   html = '<tr>';
	   html+= '<td><input type="text" class="form-control" name="multidocument['+i+']" id="multidocument_'+i+'" placeholder="Index Field"></td>';
	   html+= '<td><select class="form-control" name="documenttype"><option>Hr</option><option>Sales</option><option>Marketing</option></select></td>';
	   html+= '<td><button class="delete-appended-row btn btn-danger" type="button">Remove</button></td>';
	   html+= '</tr>';
	   $('table#indexField').append(html);
	   i++;
 });
  
 $(document).on('click','.delete-appended-row',function(){
 		 $(this).parent().parent().remove();
 });

  
   
      
     $('.department').click( function (event) {
    	    event.preventDefault();
    	    
    	    var dept=$(this).data('dept');
    	    var id=$(this).data('id');
    	    console.log(dept)
    	    console.log(id);
    	    
    	   
    	    
    	     if(dept=='Purchase')
    	    {
    	    	
    	            var select= '<select class="form-control" style="background-color:#6c757d;color:white"  onchange="showform(this.value , '+id+')">'
    	                    +'<option>DOCUMENT TYPE</option>' 
            	            +'<option value="Vendor Registration">Vendor Registration</option>'
            	            +'<option value="Purchase">Purchase</option>'
                            +'</select>';
    	            var documentType=document.getElementsByClassName('documentType');
    	    	    documentType[id].innerHTML=select;
     	            
    	    	  
    	    }
    	    else if(dept=='Hr')
    	    {
    	        var select='<select class="form-control" style="background-color:#6c757d;color:white" onchange="employee(this.value , '+id+')">'
    	        	       +'<option selected>DOCUMENT TYPE</option>'
     	                   +'<option value="Employee OutBoarding">Employee OutBoarding</option>'
                           +'</select>';
                 var documentType=document.getElementsByClassName('documentType');
 	    	     documentType[id].innerHTML=select;
  	            
                           
    	    	
    	    }
    	    else if(dept=='Sales')
    	    {
    	    	var select='<select class="form-control" name="documenttype" style="background-color:#6c757d;color:white" onchange="salesmarketing(this.value , '+id+')">'
            	           +'<option selected>DOCUMENT TYPE</option>'
            	           +'<option value="Customer Registration">Customer Registration</option>'
            	           +'<option value="Sales">Sales</option>'
                           +'</select>';
    	    	 var documentType=document.getElementsByClassName('documentType');
	    	     documentType[id].innerHTML=select;
 	        }
    	    else if(dept=='Direct')
    	    {
    	     
    	    	var select=  '<select class="form-control" name="documenttype" style="background-color:#6c757d;color:white" onchange="directtaxdoc(this.value , '+id+')">'
				             +'<option>DOCUMENT TYPE</option>' 
				         	 +'<option value="Challen">Challen</option>'
				         	 +'<option value="Tax Audit Report">Tax Audit Report</option>'
				             +'<option value="Power of Attorney">Power Of Attorney</option>'
				             +'<option value="Notice">Notice</option>'
				             +'<option value="Submission">Submission</option>'
				             +'<option value="Assessment Order">Assessment Order</option>'
				             +'<option value="Income Tax Return">Income Tax Return</option>'
				             +'<option value="Engagement Letter">Engagement Letter</option>'
				             +'</select>';
				   var documentType=document.getElementsByClassName('documentType');
	    	       documentType[id].innerHTML=select;
	        
    	    }else if(dept =='Statutory') {
	        	
	         var select= '<select class="form-control" name="documenttype" style="background-color:#6c757d;color:white" onchange="statutoryaudit(this.value , '+id+')">'
            	         +'<option >DOCUMENT TYPE</option>' 
            	         +'<option value="Confirmations">Confirmations</option>'
            	         +'<option value="General">General</option>'
            	         +'<option value="Minutes">Minutes</option>'
            	         +'<option value="Workpaper">Workpaper</option>'
            	         +'<option value="Financials">Financials</option>'
                         +'<option value="Engegement Letter">Engagement Letter</option>'
                         +'</select>';
	          	   var documentType=document.getElementsByClassName('documentType');
			       documentType[id].innerHTML=select;
		    
    	    }else if(dept =='Indirect') {
		    	
		    	var select='<select class="form-control"  style="background-color:#6c757d;color:white"  onchange="indirecttax(this.value , '+id+')">'
                           +'<option >DOCUMENT TYPE</option>' 
                           +'<option value="Challen">Challen</option>'
                           +'<option value="GSTR-1 Returns">GSTR-1 Returns</option>'
                           +'<option value="Invoice / Docs - Output">Invoice / Docs - Output</option>'
                           +'<option value="GSTR-3B Returns">GSTR-3B Returns</option>'
                           +'<option value="Input Detail/Docs/Invoices">Input Detail/Docs/Invoices</option>'
                           +'<option value="E-way Bill">E-way Bill</option>'
                           +'<option value="Refund Forms RFD 01/01A">Refund Forms RFD 01/01A</option>'
                           +'<option value="Debit / Credit Note">Debit / Credit Note</option>'
                           +'</select>'
                     var documentType=document.getElementsByClassName('documentType');
			        documentType[id].innerHTML=select;
		    
    	    }else if(dept =='Finance & Accounts:Services-CA/CS') {
		    	
		    	var select='<select class="form-control"  style="background-color:#6c757d;color:white"  onchange="financeServices(this.value , '+id+')">'
                           +'<option >DOCUMENT TYPE</option>' 
                           +'<option value="Audit Report">Audit Report</option>'
                           +'<option value="Balance Sheet">Balance Sheet</option>'
                           +'<option value="Other">Other</option>'
                           +'</select>'
                     var documentType=document.getElementsByClassName('documentType');
			        documentType[id].innerHTML=select;
			        
		    }else if(dept =='Legal:Services-CA/CS') {
		    	
		    	var select='<select class="form-control"  style="background-color:#6c757d;color:white"  onchange="legalServices(this.value , '+id+')">'
                           +'<option >DOCUMENT TYPE</option>' 
                           +'<option value="Contract">Contract</option>'
                           +'<option value="Other">Other</option>'
                           +'<option value="Registration">Registration</option>'
                           +'</select>'
                     var documentType=document.getElementsByClassName('documentType');
			        documentType[id].innerHTML=select;
		    
		    }else if(dept =='People & HR') {
		    	
		    	var select='<select class="form-control"  style="background-color:#6c757d;color:white"  onchange="people(this.value , '+id+')">'
                           +'<option >DOCUMENT TYPE</option>' 
                           +'<option value="Employee Documents">Employee Documents</option>'
                           +'<option value="Other">Other</option>'
                           +'<option value="Salary Regsiter">Salary Regsiter</option>'
                           +'</select>'
                     var documentType=document.getElementsByClassName('documentType');
			        documentType[id].innerHTML=select;
		    
		    }else if(dept =='Purchase:Services-CA/CS') {
		    	
		    	var select='<select class="form-control"  style="background-color:#6c757d;color:white"  onchange="purchaseServices(this.value , '+id+')">'
                           +'<option >DOCUMENT TYPE</option>' 
                           +'<option value="Purchase(Goods)">Purchase(Goods)</option>'
                           +'<option value="Purchase(Services)">Purchase(Services)</option>'
                           +'<option value="Vendor Registration">Vendor Registration</option>'
                           +'</select>'
                     var documentType=document.getElementsByClassName('documentType');
			        documentType[id].innerHTML=select;
		    
		    }else if(dept =='Sale') {
		    	
		    	var select='<select class="form-control"  style="background-color:#6c757d;color:white"  onchange="sale(this.value , '+id+')">'
                           +'<option >DOCUMENT TYPE</option>' 
                           +'<option value="Customer Registration">Customer Registration</option>'
                           +'<option value="Other">Other</option>'
                           +'<option value="Sale(Goods)">Sale(Goods)</option>'
                           +'<option value="Sale(Services)">Sale(Services)</option>'
                           +'</select>'
                     var documentType=document.getElementsByClassName('documentType');
			        documentType[id].innerHTML=select;
		    }
    	     
    	     
    	    
     })
     
     
     function employee(data, index){
    	 
    	 if(data=='Employee OutBoarding'){
    		
    		 
    		 var select='<select class="form-control"  style="background-color:#6c757d;color:white">'
  	            +'<option>Employee Code</option>'
  	            +'<option>Employee Name</option>'
  	            +'<option>Date of Joining</option>'
                 +'</select>';
  	        var documentType=document.getElementsByClassName('indexInformation');
 	        documentType[index].innerHTML=select;
        	 	
    	 }
    	 
	    	
     }
     
     
     function showform(data , index){
	
      //var id=$(this).data('id');
      if(data == 'Vendor Registration') {
		  
    	  var select= '<select class="form-control" style="background-color:#6c757d;color:white">'
            		+'<option>Vendor Code</option>'
		            +'<option>Vendor Name</option>'
		            +'<select>';
		            
	   	   var documentType=document.getElementsByClassName('indexInformation');
	       documentType[index].innerHTML=select;
    	            
   	  }else if(data == 'Purchase') {
   		  
		var select= '<select class="form-control" style="background-color:#6c757d;color:white">'
    		+'<option >Invoice Date</option>'
            +'<option >Invoice Number</option>'
            +'<option >Vendor Code</option>'
            +'<option >Vendor Name</option>'
            +'<select>';
		   var documentType=document.getElementsByClassName('indexInformation');
	       documentType[index].innerHTML=select;    
	 }
  }    
      
     
     
     
    function financeServices(data,index){
    	 
    	
	  if(data == 'Audit Report') {
    			
    			var select= '<select class="form-control" style="background-color:#6c757d;color:white">'
    	    		+'<option >Financial Year</option>'
    	            +'<option >Period</option>'
       	            +'<option >Auditor Name</option>'
       	            +'<option >Sign Date</option>'
    	            +'<select>';
    			   var documentType=document.getElementsByClassName('indexInformation');
    		       documentType[index].innerHTML=select;    
    		 			
	   }else  if(data == 'Balance Sheet') {
			
			var select= '<select class="form-control" style="background-color:#6c757d;color:white">'
	    		+'<option >Financial Year</option>'
	            +'<option >Period</option>'
  	            +'<option >Description</option>'
  	            +'<select>';
			   var documentType=document.getElementsByClassName('indexInformation');
		       documentType[index].innerHTML=select;    
		 			
        }else  if(data == 'Other') {
			
			var select= '<select class="form-control" style="background-color:#6c757d;color:white">'
	    		+'<option >Document Name</option>'
	            +'<option >Description</option>'
  	            +'<select>';
			   var documentType=document.getElementsByClassName('indexInformation');
		       documentType[index].innerHTML=select;    
		 			
          }
    	 
     }
     
    
    function legalServices(data , index){
    	
    	 if(data == 'Contract') {
    			
    			var select= '<select class="form-control" style="background-color:#6c757d;color:white">'
    	    		+'<option >Document Name</option>'
    	            +'<option >Description</option>'
       	            +'<select>';
    			   var documentType=document.getElementsByClassName('indexInformation');
    		       documentType[index].innerHTML=select;    
    		 			
	   }else  if(data == 'Other') {
			
			var select= '<select class="form-control" style="background-color:#6c757d;color:white">'
	    		+'<option >Financial Year</option>'
	            +'<option >Period</option>'
  	            +'<option >Description</option>'
  	            +'<select>';
			   var documentType=document.getElementsByClassName('indexInformation');
		       documentType[index].innerHTML=select;    
		 			
        }else  if(data == 'Registration') {
			
			var select= '<select class="form-control" style="background-color:#6c757d;color:white">'
	    		+'<option >Registration Type</option>'
	            +'<option >Registration Date</option>'
	            +'<option >Description</option>'
	            +'<select>';
			   var documentType=document.getElementsByClassName('indexInformation');
		       documentType[index].innerHTML=select;    
		 			
          }
    	
    	
    	
    }
      
    
    
    function people(data,index){
    	
    	
    	  if(data == 'Employee Documents') {
  			
  			var select= '<select class="form-control" style="background-color:#6c757d;color:white">'
  	    		+'<option >Employee ID</option>'
  	            +'<option >Employee Name</option>'
     	        +'<option >Hiring Date</option>'
     	        +'<select>';
  			   var documentType=document.getElementsByClassName('indexInformation');
  		       documentType[index].innerHTML=select;    
  		 			
	   }else  if(data == 'Other') {
			
			var select= '<select class="form-control" style="background-color:#6c757d;color:white">'
	    		+'<option >Document Name</option>'
	            +'<option >Description</option>'
	            +'<select>';
			   var documentType=document.getElementsByClassName('indexInformation');
		       documentType[index].innerHTML=select;    
		 			
      }else  if(data == 'Salary Regsiter') {
			
			var select= '<select class="form-control" style="background-color:#6c757d;color:white">'
	    		+'<option >Period</option>'
	            +'<option >Description</option>'
	            +'<select>';
			   var documentType=document.getElementsByClassName('indexInformation');
		       documentType[index].innerHTML=select;    
		 			
        }
    	
    }
    
    
    
    function purchaseServices(data,index){
    	

  	  if(data == 'Purchase(Goods)') {
			
			var select= '<select class="form-control" style="background-color:#6c757d;color:white">'
	    		+'<option >Invoice Date</option>'
	            +'<option >Invoice Number</option>'
   	            +'<option >Description</option>'
   	            +'<option >Vendor Code</option>'
	            +'<option >Vendor Name</option>'
	            +'<option >Voucher Number</option>'
   	            +'<select>';
			   var documentType=document.getElementsByClassName('indexInformation');
		       documentType[index].innerHTML=select;    
		 			
	   }else  if(data == 'Purchase(Services)') {
			
			var select= '<select class="form-control" style="background-color:#6c757d;color:white">'
	    		+'<option >Invoice Date</option>'
	            +'<option >Invoice Number</option>'
	            +'<option >Description</option>'
   	            +'<option >Vendor Code</option>'
	            +'<option >Vendor Name</option>'
	            +'<option >Voucher Number</option>'
   	            +'<select>';
			   var documentType=document.getElementsByClassName('indexInformation');
		       documentType[index].innerHTML=select;    
		 			
       }else  if(data == 'Vendor Registration') {
			
			var select= '<select class="form-control" style="background-color:#6c757d;color:white">'
		          +'<option >Vendor Code</option>'
		          +'<option >Vendor Name</option>'
		          +'<option >Registration Date</option>'
	   	  	      +'<select>';
			   var documentType=document.getElementsByClassName('indexInformation');
		       documentType[index].innerHTML=select;    
		 			
      }
    	
    	
    	
    }
    
    
    
    function sale(data , index){
    	
    	  if(data == 'Customer Registration') {
  			
  			var select= '<select class="form-control" style="background-color:#6c757d;color:white">'
  	    		+'<option>Customer Code</option>'
  	            +'<option>Customer Name</option>'
     	        +'<option>Registration Date</option>'
     	        +'<select>';
  			   var documentType=document.getElementsByClassName('indexInformation');
  		       documentType[index].innerHTML=select;    
  		 			
  	   }else  if(data == 'Other') {
  			
  			var select= '<select class="form-control" style="background-color:#6c757d;color:white">'
  	    		+'<option >Document Name</option>'
  	            +'<option >Description</option>'
     	        +'<select>';
  			   var documentType=document.getElementsByClassName('indexInformation');
  		       documentType[index].innerHTML=select;    
  		 			
         }else  if(data == 'Sale(Goods)') {
  			
  			var select= '<select class="form-control" style="background-color:#6c757d;color:white">'
  				+'<option >Invoice Date</option>'
	            +'<option >Invoice Number</option>'
   	            +'<option >Description</option>'
   	            +'<option >Customer Code</option>'
	            +'<option >Customer Name</option>'
	            +'<select>';
  			   var documentType=document.getElementsByClassName('indexInformation');
  		       documentType[index].innerHTML=select;    
  		 			
       }else  if(data == 'Sale(Services)') {
  			
  			var select= '<select class="form-control" style="background-color:#6c757d;color:white">'
  				+'<option >Invoice Date</option>'
	            +'<option >Invoice Number</option>'
   	            +'<option >Description</option>'
   	            +'<option >Customer Code</option>'
	            +'<option >Customer Name</option>'
	            +'<select>';
  			   var documentType=document.getElementsByClassName('indexInformation');
  		       documentType[index].innerHTML=select;    
  		 			
       }
    	
    }
    
    
    
      function salesmarketing(datas,index){
    		
    		if(datas == 'Customer Registration') {
    			
    			var select= '<select class="form-control" style="background-color:#6c757d;color:white">'
    	    		+'<option >Customer Code</option>'
    	            +'<option >Customer Namer</option>'
    	            +'<select>';
    			   var documentType=document.getElementsByClassName('indexInformation');
    		       documentType[index].innerHTML=select;    
    		 			
    			
    			
    		}
    		else if(datas =='Sales')
    	    {
    			
    			var select= '<select class="form-control" style="background-color:#6c757d;color:white">'
    	    		+'<option >Invoice Date</option>'
    	            +'<option >Invoice Number</option>'
    	        	+'<option >Customer Code</option>'
    	            +'<option >Customer Namer</option>'
    	            +'<select>';
    		
    			   var documentType=document.getElementsByClassName('indexInformation');
    		       documentType[index].innerHTML=select;    
    			
    		}
    	}

      
   
     
     function directtaxdoc(datatax , index)
     {
    	 
     	 $('.remove').remove();
     	 if(datatax == 'Challen'){

     		 
     		 var field_name = ["Tax Type", "Challen Date", "Challan","Period/AY" ,"BSR Code"];
     		 var challen="";
     		 challen +='<select class="form-control" style="background-color:#6c757d;color:white">'
    		 for(var num=0;num<=field_name.length-1;num++)
     		 {
     			 challen +='<option value='+field_name[num]+' >'+field_name[num]+'</option >'
     		 }
     		challen +='</select>'
        	var documentType=document.getElementsByClassName('indexInformation');
		    documentType[index].innerHTML=challen;    
		  
     	  }else if(datatax == 'Tax Audit Report'){
     		  
     		    
     		     var field_name = ["Financial Year", "Assessment Year", "Date","Membership No." ,"Firm Name/Reg No.","UDIN"];
     	         var challen="";
     	         challen +='<select class="form-control" style="background-color:#6c757d;color:white">'
     	     	 for(var num=0;num<=field_name.length-1;num++)
     			 {
     				 challen +='<option value='+field_name[num]+'>'+field_name[num]+'</option >'
     	     		
     			 }
     	   	     challen +='</select>'
      	 		 var documentType=document.getElementsByClassName('indexInformation');
 		         documentType[index].innerHTML=challen;    
 			  
     		  
     		  
     	  }else if(datatax == 'Power of Attorney'){
     		  
     		    
     		     var field_name = ["Date", "Signatory", "Authorization authority"];
     	         var challen="";
     	         challen +='<select class="form-control" style="background-color:#6c757d;color:white">'
         	     for(var num=0;num<=field_name.length-1;num++)
     			 {
     				 challen +='<option >'+field_name[num]+'</option >'
         	     	 
     			 }
     	        challen +='</select>'
          	    var documentType=document.getElementsByClassName('indexInformation');
 		        documentType[index].innerHTML=challen;    
 			
     		  
     		  
     	  }else if(datatax == 'Notice'){
     		  
     		    
     		     var field_name = ["Financial Year", "Assessment Year", "Date","Section","DIN","CIN"];
     	         var challen="";
     	         challen +='<select class="form-control" style="background-color:#6c757d;color:white">'
         	     for(var num=0;num<=field_name.length-1;num++)
     			 {
     				 challen +='<option >'+field_name[num]+'</option >'
         	     	
     			 }
     			 challen +='</select>'
           	     	
     			var documentType=document.getElementsByClassName('indexInformation');
 		        documentType[index].innerHTML=challen;    
 			
     		  
     		  
     	  }else if(datatax == 'Submission'){
     		  
     		    
     		     var field_name = ["Financial Year", "Assessment Year", "Submission Date","Order Reference / Notice Reference"];
     	         var challen="";
     	   	     challen +='<select class="form-control" style="background-color:#6c757d;color:white">'
          	     for(var num=0;num<=field_name.length-1;num++)
     			 {
     			     challen +='<option >'+field_name[num]+'</option >'
         	     	
     			 }
     	   	    challen +='</select>'
            	var documentType=document.getElementsByClassName('indexInformation');
 		        documentType[index].innerHTML=challen;    
 			
     		  
     		  
     	  }else if(datatax == 'Assessment Order'){
     		  
     		    
     		     var field_name = ["Financial Year", "Assessment Year", "Date","Section","Jurisdiction","Document Indentification No.(DIN)"];
     	          var challen="";
     	   	      challen +='<select class="form-control" style="background-color:#6c757d;color:white">'
          	     for(var num=0;num<=field_name.length-1;num++)
     			 {
     			     challen +='<option >'+field_name[num]+'</option >'
         	     	
     			 }
     	   	 	 challen +='</select>'
              	    
     			var documentType=document.getElementsByClassName('indexInformation');
 		        documentType[index].innerHTML=challen;    
 			
     		  
     		  
     	  }else if(datatax == 'Income Tax Return'){
     		  
     		    
     		     var field_name = ["Financial Year", "Assessment Year", "Date of Filling","ITR Form No/ACR.No"];
     	         var type=["text","text","date","text"];
     	         var name=["documentType1","documentType2","documentType3","documentType4"];
     			 var challen="";
     			 challen +='<select class="form-control" style="background-color:#6c757d;color:white">'
          	     for(var num=0;num<=field_name.length-1;num++)
     			 {
     				 challen +='<option >'+field_name[num]+'</option >'
         	     	
     			 }
     			 challen +='</select>'
            	 var documentType=document.getElementsByClassName('indexInformation');
 		         documentType[index].innerHTML=challen;    
 			
     		  
     		  
     	  }else if(datatax == 'Engagement Letter'){
     		  
     		    
     		     var field_name = ["Date", "Period", "Authorization"];
     	         var challen="";
     		     challen +='<select class="form-control" style="background-color:#6c757d;color:white">'
              	 for(var num=0;num<=field_name.length-1;num++)
     			 {
     			 		 challen +='<option >'+field_name[num]+'</option >'
         	     	
     			 }
     			 challen +='</select>'
             	     
     			var documentType=document.getElementsByClassName('indexInformation');
 		        documentType[index].innerHTML=challen;    
 			
     	  }
              
     }  
     
     
     function statutoryaudit(dataaudit , index)
     {
     	
     	
     	 $('.remove').remove();
     	 if(dataaudit=='Confirmations')
         {
     		
     	     var field_name = ["Confirmation Type", "Company / Bank Name", "Date"];
     	     var challen="";
     	     challen +='<select class="form-control" style="background-color:#6c757d;color:white">'
              	 for(var num=0;num<=field_name.length-1;num++)
     			 {
     			 		 challen +='<option >'+field_name[num]+'</option >'
         	     	
     			 }
     		 challen +='</select>'
     		 var documentType=document.getElementsByClassName('indexInformation');
		     documentType[index].innerHTML=challen;    
			
     		 
         }else if(dataaudit=='Minutes'){
        
             
        	 var field_name = ["Period", "Meeting Type", "Meeting Date"];
        	 var challen="";
        	 challen +='<select class="form-control" style="background-color:#6c757d;color:white">'
              	 for(var num=0;num<=field_name.length-1;num++)
     			 {
     			 		 challen +='<option >'+field_name[num]+'</option >'
         	     	
     			 }
     		 challen +='</select>'
     		 var documentType=document.getElementsByClassName('indexInformation');
		     documentType[index].innerHTML=challen;    
			
        	 
        	 
        	  
         }else if(dataaudit=='General'){
        
             var field_name = ["Name", "Description", "Date"];
             var challen="";
             challen +='<select class="form-control" style="background-color:#6c757d;color:white">'
              	 for(var num=0;num<=field_name.length-1;num++)
     			 {
     			 		 challen +='<option >'+field_name[num]+'</option >'
         	     	
     			 }
     		 challen +='</select>'
     		 var documentType=document.getElementsByClassName('indexInformation');
		     documentType[index].innerHTML=challen;
		     
         }else if(dataaudit=='Workpaper'){
        
             var field_name = ["Audit Period", "Workpaper Name", "Description"];
             var challen="";
             challen +='<select class="form-control" style="background-color:#6c757d;color:white">'
              	 for(var num=0;num<=field_name.length-1;num++)
     			 {
     			 		 challen +='<option >'+field_name[num]+'</option >'
         	     	
     			 }
     		 challen +='</select>'
     		 var documentType=document.getElementsByClassName('indexInformation');
		     documentType[index].innerHTML=challen;
		     
         }else if(dataaudit=='Financials'){
        
             var field_name = ["Financial Year", "Signing Date", "UDIN"];
             var challen=""; 
             challen +='<select class="form-control" style="background-color:#6c757d;color:white">'
              	 for(var num=0;num<=field_name.length-1;num++)
     			 {
     			 		 challen +='<option >'+field_name[num]+'</option >'
         	     	
     			 }
     		 challen +='</select>'
     		 var documentType=document.getElementsByClassName('indexInformation');
		     documentType[index].innerHTML=challen;
		     
         }else if(dataaudit=='Engegement Letter'){
        
             var field_name = ["Date", "Period", "Authorization"];
             var challen="";
             challen +='<select class="form-control" style="background-color:#6c757d;color:white">'
              	 for(var num=0;num<=field_name.length-1;num++)
     			 {
     			 		 challen +='<option >'+field_name[num]+'</option >'
         	     	
     			 }
     		 challen +='</select>'
     		 var documentType=document.getElementsByClassName('indexInformation');
		     documentType[index].innerHTML=challen;
         }
     	 
     } 
     
     

     function indirecttax(dataindirect , index)
     {
    	 
    	 
    	 
     	 $('.remove').remove();
     	 if(dataindirect=='Challen')
     	 {
     	     
     	     var field_name = ["Tax Type", "Challen Date", "Challan","Period /AY ","BSR code"];
     	    var challen="";
            challen +='<select class="form-control" style="background-color:#6c757d;color:white">'
             	 for(var num=0;num<=field_name.length-1;num++)
    			 {
    			 		 challen +='<option >'+field_name[num]+'</option >'
        	     	
    			 }
    		 challen +='</select>'
    		 var documentType=document.getElementsByClassName('indexInformation');
		     documentType[index].innerHTML=challen; 
         }
     	 else if(dataindirect=='GSTR-1 Returns')
     	 {
     	     
     	     var field_name = ["Legal / Trade Name", "Month / Year", "GSTN","Authorization"];
     	     var challen="";
             challen +='<select class="form-control" style="background-color:#6c757d;color:white">'
             	 for(var num=0;num<=field_name.length-1;num++)
    			 {
    			 		 challen +='<option >'+field_name[num]+'</option >'
        	     	
    			 }
    		 challen +='</select>'
    		 var documentType=document.getElementsByClassName('indexInformation');
		     documentType[index].innerHTML=challen;
		     
         }else if(dataindirect=='Invoice / Docs - Output')
     	 
         {
     	     
     	     var field_name = ["Doc / Invoice No.", "Date", "GSTN","Name of Party"];
     	     var challen="";
             challen +='<select class="form-control" style="background-color:#6c757d;color:white">'
             	 for(var num=0;num<=field_name.length-1;num++)
    			 {
    			 		 challen +='<option >'+field_name[num]+'</option >'
        	     	
    			 }
    		 challen +='</select>'
    		 var documentType=document.getElementsByClassName('indexInformation');
		     documentType[index].innerHTML=challen;
		     
         }else if(dataindirect=='GSTR-3B Returns')
     	 
         {
     	     
     	     var field_name = ["Legal / Trade Name", "Tax period", "GSTN","Authorized Sign"];
     	     var challen="";
             challen +='<select class="form-control" style="background-color:#6c757d;color:white">'
             	 for(var num=0;num<=field_name.length-1;num++)
    			 {
    			 		 challen +='<option >'+field_name[num]+'</option >'
        	     	
    			 }
    		 challen +='</select>'
    		 var documentType=document.getElementsByClassName('indexInformation');
		     documentType[index].innerHTML=challen;
		     
         }else if(dataindirect=='Input Detail/Docs/Invoices')
     	 
         {
     	     
     	     var field_name = ["Invoice No.", "Date", "GSTN","Name of Party"];
     	     var challen="";
            challen +='<select class="form-control" style="background-color:#6c757d;color:white">'
             	 for(var num=0;num<=field_name.length-1;num++)
    			 {
    			 		 challen +='<option >'+field_name[num]+'</option >'
        	     	
    			 }
    		 challen +='</select>'
    		 var documentType=document.getElementsByClassName('indexInformation');
		     documentType[index].innerHTML=challen;
         }
         else if(dataindirect=='E-way Bill')
     	 {
     	     
     	     var field_name = ["E-way Bill No.", "Date of Generator", "Name of Generation","NSN Code","GSTN of Supplier","Vehicle No."];
     	    var challen="";
            challen +='<select class="form-control" style="background-color:#6c757d;color:white">'
             	 for(var num=0;num<=field_name.length-1;num++)
    			 {
    			 		 challen +='<option >'+field_name[num]+'</option >'
        	     	
    			 }
    		 challen +='</select>'
    		 var documentType=document.getElementsByClassName('indexInformation');
		     documentType[index].innerHTML=challen;
		     
         }else if(dataindirect=='Refund Forms RFD 01/01A')
     	 {
     	     
     	     var field_name = ["Legal/Trade Name", "Tax Period", "GSTN","Authorized Sign"];
     	    var challen="";
            challen +='<select class="form-control" style="background-color:#6c757d;color:white">'
             	 for(var num=0;num<=field_name.length-1;num++)
    			 {
    			 		 challen +='<option >'+field_name[num]+'</option >'
        	     	
    			 }
    		 challen +='</select>'
    		 var documentType=document.getElementsByClassName('indexInformation');
		     documentType[index].innerHTML=challen;
		     
         }else if(dataindirect=='Debit / Credit Note')
     	 {
     	     
     	     var field_name = ["GSTN Of Supplier", "Serial Number", "Date of Issue","Authorization"];
     	     var challen="";
             challen +='<select class="form-control" style="background-color:#6c757d;color:white">'
             	 for(var num=0;num<=field_name.length-1;num++)
    			 {
    			 		 challen +='<option >'+field_name[num]+'</option >'
        	     	
    			 }
    		 challen +='</select>'
    		 var documentType=document.getElementsByClassName('indexInformation');
		     documentType[index].innerHTML=challen;
         }
     } 
       
   </script>   
 </body>
 </html>
