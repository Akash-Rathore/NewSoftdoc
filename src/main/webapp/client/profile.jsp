<%@page import="java.sql.PreparedStatement"%>
<%@ page import="com.customerclient.connection.DBConnection"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@include file="include/session.jsp"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>

<!DOCTYPE html>
<html>
<head>
   <%@include file="include/head.jsp"%>
   <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet"/>
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
   
   




   </style>	
   
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
                        <div class="header">
                          </div>
                            <%
                            try(Connection connection=DBConnection.openConnection();PreparedStatement  preparedStatement=connection.prepareStatement("SELECT  department ,`employee_name`, `emp_email_id`,`designation`, `location`, `mobile`,softdoc_id,employee_id , access_info FROM `client_details` WHERE `id`='"+(int)session.getAttribute("clientid")+"'");)
                           {
                               ResultSet resultset=preparedStatement.executeQuery();
                               if(resultset.next())
                               {
                         %>
                        <div class="body mrgnbtm">
                            <form  id="profile" method="POST" class="form-horizontal">
                                  <div class="container">
                                     <div class="row">
                                        <div class="col-6 col-md-6">
                                               <div class="form-group">
                                                <label for="Email" class="col-sm-4 control-label">Softdoc ID</label>
                                                <div class="col-sm-8">
                                                    <div class="form-line">
                                                        <input type="text"  class="form-control"  name="" placeholder="******" value="<%=resultset.getString("softdoc_id")%>" readonly>
                                                    </div>
                                                </div>
                                                <!-- <div class="col-sm-2">
                                                    <div class="form-line">
                                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                                                             Confirm New Password
                                                        </button>
                                                    </div>
                                                </div> -->
                                            </div>
                                            <div class="form-group">
                                                <label for="Email" class="col-sm-4 control-label">Employee ID</label>
                                                <div class="col-sm-8">
                                                    <div class="form-line">
                                                        <input type="text"   class="form-control"  name="" placeholder="******" value="<%=resultset.getString("employee_id")%>" readonly>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="NameSurname" class="col-sm-4 control-label">Name</label>
                                                <div class="col-sm-8">
                                                    <div class="form-line">
                                                        <input type="text" pattern="[A-Za-z\s]{0,60}" class="form-control" id="name" name="name" placeholder="Name" value="<%=resultset.getString("employee_name")%>"  readonly>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Email" class="col-sm-4 control-label">Designation</label>
                                                <div class="col-sm-8">
                                                    <div class="form-line">
                                                        <input type="text" pattern="[A-Za-z\s]{0,60}" class="form-control" id="designation" name="designation" placeholder="Designation" value="<%=resultset.getString("designation")%>" readonly>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Email" class="col-sm-4 control-label">Mobile No.</label>
                                                <div class="col-sm-8">
                                                    <div class="form-line">
                                                        <input type="number" class="form-control" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" maxlength="10" id="mobile" name="mobile" placeholder="Mobile" value="<%=resultset.getString("mobile")%>"  readonly>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Email" class="col-sm-4 control-label">Email</label>
                                                <div class="col-sm-8">
                                                    <div class="form-line">
                                                        <input type="email"  class="form-control" id="email" name="Email" placeholder="Email" value="<%=resultset.getString("emp_email_id")%>" readonly>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Email" class="col-sm-4 control-label">Location</label>
                                                <div class="col-sm-8">
                                                    <div class="form-line">
                                                        <input type="text" class="form-control" id="location" name="location" placeholder="Location" value="<%=resultset.getString("location")%>" readonly>
                                                    </div>
                                                </div>
                                            </div>
                                         <div class="row">
				                                  <div class="form-group">
				                                   <label  class="col-sm-3 control-label" style="margin-bottom:0px !important;font-size:15px;">Department</label>
				                                     <div class="col-sm-3">
				                                          <label  class="control-label">Read</label>
				                                     </div>
				                                     <div class="col-sm-3">
				                                          <label  class="control-label">Write</label>
				                                      </div>
				                                     <div class="col-sm-3">
				                                          <label  class="control-label">Dept. Admin</label>
				                                     </div>
				                                 </div>
				                                 <%
				                                 
				                                 String deptinfo =resultset.getString("department");
		                                         JSONParser jsonParser = new JSONParser();
		          								 JSONArray jsonArray = (JSONArray) jsonParser.parse(deptinfo);
		          								
		          								 for(Object object : jsonArray) {
		          							    	JSONObject  access_level1 = (JSONObject) object;
		          							  	
          											//(String)access_level1.get("department");
          											//(String)access_level1.get("access_level");
          										 %>
          										 
          										 <div class="form-group" >
				                                    <label  class="col-sm-3 control-label" style="margin-bottom:0px !important;font-family: emoji;"><%=(String)access_level1.get("department")%></label>
				                                    <%if(((String)access_level1.get("access_level")).equals("Read")){  %> 
				                                    
				                                      <div class="col-sm-3">
				                                         <label class="container">
				                                             <input type="checkbox" name="access_right_"  value=":Read" checked>
				                                             <span class="checkmark"></span>
                                                         </label> 
				                                      </div>
				                                      
				                                      <%  }else{%>
				                                       <div class="col-sm-3">
				                                          <label class="container">
				                                              <input type="checkbox" name="access_right_"  value=":Read">
				                                              <span class="checkmark"></span>
                                                          </label> 
				                                      </div>
				                                    <% } %>
				                                 
				                                  <%if(((String)access_level1.get("access_level")).equals("Write")){ %> 
				                                      <div class="col-sm-3">
				                                         <label class="container">
				                                           <input type="checkbox" name="access_right_"  value=":Write" checked>
                                                                    <span class="checkmark"></span>
                                                                  </label>  	
				                                      </div>
				                                    <%  }else{%>
				                                       <div class="col-sm-3">
				                                         <label class="container">
				                                            <input type="checkbox" name="access_right_"  value=":Write">
                                                            <span class="checkmark"></span>
                                                         </label>  	
				                                       </div>
				                                   <%} %>
				                                  
				                                   
				                                  <%if(((String)access_level1.get("access_level")).equals("Dept_Admin")){ %> 
				                                      <div class="col-sm-3">
				                                         <label class="container">
				                                           <input type="checkbox" name="access_right_"  value=":Dept_Admin" checked>
                                                                    <span class="checkmark"></span>
                                                          </label>  
				                                      </div>
				                                   <% }else{%>
				                                       <div class="col-sm-3">
				                                         <label class="container">
				                                           <input type="checkbox" name="access_right_"  value=":Dept_Admin">
                                                           <span class="checkmark"></span>
                                                         </label>  
				                                      </div>
				                                   <%} %>   
				                                      
				                                  </div>
          										 
          										 <%	
	                   							   } 
				                                 %>
				                                 
				                          
				                           <div class="form-group">
                                                <label for="Email" class="col-sm-6 control-label"></label>
                                                <div class="col-sm-6">
                                                   <a href="javascript:void(0);" class="request-access" style="position: absolute;left: -32px;">Request Access</a>
                                                </div>
                                            </div>
				                          
				                          
				                           
                                        </div>        
                                        </div>
                                        <div class="col-6 col-md-6">
              
              
              
                <div>                             
                                             <%
              try(Connection  connect=DBConnection.openConnection();PreparedStatement preparedStatement1=connect.prepareStatement("SELECT * FROM `client_details` WHERE `id`='"+(int)session.getAttribute("clientid")+"'");)
                {
                         ResultSet result=preparedStatement1.executeQuery();
                         if(result.next())
                         {
                        	
               %>
                            <%if(result.getString("imageupload") !=null){%>                        
                                  <img src="<%=result.getString("imageupload")%>" style="width:200px;height:150px;margin:auto" alt="User" />
                                  
                                  
                            <%}else{%>
                                  <img src="../images/user.png" style="width:200px;height:150px;margin:auto" alt="User" />
                            <%}%>
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
                             
                             <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalphoto" style="margin-top:30px !important;width:200px !important;">Edit Picture</button>                
                             <br>
                             <button type="button" class="btn btn-primary" style="margin-top:18px !important;width:200px !important;"  data-toggle="modal" data-target="#exampleModal">Change Password</button>                
             
             
                                            
                                            
                                        
                                        </div>
                                        
                                     </div>
                                  </div>
                                  
                                  
                                  
                                        </form>
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

                    </div>
                </div>
            </div>
         </div>
    </section>
        <!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Change Password Form</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form  method='post' class='form-submit'>
          <div class="form-group">
             <label for="recipient-name" class="col-form-label">Enter Old Password<span style="color:red; font-size:18px;">*</span></label>
            <div class="form-line">
                <input type="password" class="form-control" name="currentpassword" placeholder="Old Password">
            </div>
          </div>
           <div class="form-group">
             <label for="recipient-name" class="col-form-label">Enter New Password<span style="color:red; font-size:18px;">*</span></label>
            <div class="form-line">
                <input type="text" class="form-control" name="newpassword" placeholder="New Password">
            </div>
          </div>
           <div class="form-group">
             <label for="recipient-name" class="col-form-label">Confirm New Password<span style="color:red; font-size:18px;">*</span></label>
            <div class="form-line">
                <input type="password" class="form-control" name="confirmpassword" placeholder="Confirm Password">
            </div>
          </div>
           <div class="modal-footer">
                   
                   <button type="submit" class="btn btn-primary" >Submit</button>
                   <div class="loader">
                     <img src="../images/loader.gif"  alt="" style="width: 50px;height:50px;">
                  </div>
              
               <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
           </div>
         </form>
      </div>
     
    </div>
  </div>
</div>
<!--Modal upload profile photo start -->
<div class="modal fade" id="exampleModalphoto" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Upload Profile Photo</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action=".." method="post" class="form-upload">
          <div class="form-group">
             <label for="recipient-name" class="col-form-label">Upload Photo</label>
               <div class="form-line">
                   <input type="file" class="form-control" name="uploadprofile" accept="image/png,image/jpeg,image/jpg" required="required">
               </div>
          </div>
           <div class="modal-footer">
               <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
               <button type="submit" class="btn btn-primary">Submit</button>
               <div class="loader">
                  <img src="../images/loader.gif"  alt="" style="width: 50px;height:50px;">
               </div>
           </div>
         </form>
      </div>
    </div>
  </div>
 </div>
<!--Modal upload profile photo end -->



<!--Start Department Level Access  -->
  <div class="modal fade request-access-department-modal"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header" style="margin-bottom:-34px;">
        <h5 class="modal-title" id="exampleModalLabel" style="text-align:center;">Request For Access</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
         </button>
      </div>
      <form class="request-access-form">
      <div class="modal-body">
        
		      <div class="row">
                        <div class="form-group">
                        <!--  <label  class="col-sm-3 control-label" style="margin-bottom:0px !important;font-size:20px;">Department</label>
                         -->
                         
                            <div class="col-sm-2">
                                <label  class="control-label">Department</label>
                            </div>
                            <div class="col-sm-2">
                                <label  class="control-label">Read</label>
                           </div>
                           <div class="col-sm-2">
                                <label  class="control-label">Write</label>
                            </div>
                           <div class="col-sm-2">
                                <label  class="control-label">Dept. Admin</label>
                           </div>
                            <div class="col-sm-2">
                                <label  class="control-label">Remove</label>
                           </div>
                       </div>
                        
                        <div class="form-group">
                          <!-- <label for="NameSurname" class="col-sm-2 control-label"></label> -->
                          <div class="col-sm-12 table-responsive">
                              <table class="table table-bordered table-hover"  id="documentuploading">
                               <thead>
                               </thead>
                               <tbody>
                                   
                               </tbody>
                              </table>
                          </div>
                           </div>
                                 <div class="form-group">
                                    <label for="Email" class="col-sm-10 control-label"></label>
                                    <div class="col-sm-2">
                                        <button class="addmore" style="border:none;background-color:#fff;font-size:42px;font-weight:bold;color:#6c757d;" type="button"> + </button>
                                    </div>
                                </div> 
                           </div>   
                         </div>
				     <div class="modal-footer" style="text-align:center;margin-top:-30px;">
				         <button type="submit" class="btn" style="width:120px;border:1px solid #6c757d;color: #f8fcff;background: #6c757d;">Submit</button>      
				         <button type="button" class="btn" style="width:120px;border:1px solid #6c757d;color: #f8fcff;background: #6c757d;" data-dismiss="modal">Return</button>
				     </div>
	 </form> 
    </div>
  </div>
</div> 
  <!--End Department Level Access  -->
   
    <%@include file="include/loader.jsp"%>
     <%@include file="include/script.jsp"%>
     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script> 
     <script src="include/custom-script.js"></script> 
     <script type="text/javascript">
     
     var html_selecter_data="";
     $(document).on('click' , '.request-access' , function(event){
    	 
	     event.preventDefault();
	     $('#loader').show();
	     $.ajax({
		        url: "../clientprocess?action=customerdepartment",
		        type: "post",
		        dataType:"json",
		        success: function(data)
		        {
		        	 var dept_info=data.department;
		        	 var selectDept=dept_info.split(",");
		        	 var html_data=""
		        	 for(var i=0;i<selectDept.length-1;i++)
		   			 { 
		        		 html_data +='<option class="form-control show-tick" value="'+selectDept[i]+'">'+selectDept[i]+'</option>'
		   			 
		   			 }
		        	 html_data +='</select>';
		        	 html_selecter_data=html_data;
		        	  $('#loader').hide();
		   		     $('.request-access-department-modal').modal('show');
		              
		        },
		  	    error:function(e)
		  	    {
		  	    	$('#loader').hide();
		  	    	console.log("error in pages");
		  	    }
		     });
	
    });
     
     $(document).on('submit' , '.request-access-form' , function(event){
    	 
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
		        url: "../clientprocess?action=requestaccessDept",
		        type: "post",
		        dataType:"json",
		        data:data,
		        success: function(data)
		        {
		            
		        	 if(data.status)
	    	         {
	     	    		
	     	    	    Swal.fire({
	     	    			  position:'center',
	     	    			  icon: 'success',
	     	    			  title: 'Success',
	     	    			  showConfirmButton: false,
	     	    			  timer: 3000
	     	    			})
	     	    			
	     	    	  }
	    	    	  else 
	    	    	  {
	    	    		   Swal.fire({
	    	    			  icon:'error',
	    	    			  title:'Something went Wrong',
	    	    			  text:"wrong",
	    	    			  footer:'',
	    	    			  timer:3000
	    	    			})
	    	    	  }    
		        	 $('#loader').hide();
		        },
		  	    error:function(e)
		  	    {
		  	    	console.log("error in pages");
		  	    }
		     });
       
     });
     
     
     
     $(document).on('click' , 'input:checkbox' , function(event){
    	
    
   	  var $box = $(this);
      if($box.is(":checked")) {
    	var group = "input:checkbox[name='" + $box.attr("name") + "']";
	    $(group).prop("checked", false);
	    $box.prop("checked", true);   	    
	    
      } else {
	     $box.prop("checked", false);
     } 
    	 
    	 
   });
     
     
     
  
   
 
     
     var i=$('table#documentuploading tr').length;
     var incre_num=0;
     $(".addmore").on('click',function(){
	      html = '<tr>';
	      html+= '<td style="width:144px;"><select  class="form-control" name="department_'+i+'">'+html_selecter_data+'</td>'; 
	      html+= '<td><input type="checkbox" class="check" name="access_right_'+i+'" value="Read" id="dept_'+(incre_num+1)+'"/><label for="dept_'+(incre_num+1)+'"></label></td>';
	      html+= '<td><input type="checkbox" class="check" name="access_right_'+i+'" value="Write" id="dept_'+(incre_num+2)+'"/><label for="dept_'+(incre_num+2)+'"></label></td>';
	      html+= '<td><input type="checkbox" class="check" name="access_right_'+i+'" value="Dept_Admin" id="dept_'+(incre_num+3)+'"/><label for="dept_'+(incre_num+3)+'"></label></td>';
	      html+= '<td><button class="delete-appended-row btn btn-danger" type="button">Remove</button></td>';
	      html+= '</tr>';
	      $('table#documentuploading').append(html);
	      i++;
	      incre_num +=incre_num+5;
    });

     
     $(document).on('click','.delete-appended-row',function(){
  		 $(this).parent().parent().remove();
     });
     
     
  
     
     
       $('#profile').submit(function(e){
	     e.preventDefault();
	     
	    	      var data={
	    	                  password:$('#password').val(),
	    	                      name:$('#name').val(),
	    	               designation:$('#designation').val(),
	    	                    mobile:$('#mobile').val(),
	    	                     email:$('#email').val(),
	    	                  location:$('#location').val(),
	    	               access_info:$('#access_info').val()
	    	                  
	    	                  
	    	                 
	    	                 }
	    	     
	    	      
	    	      Swal.fire({
	    	    	  title: 'Are you sure?',
	    	    	  text: "you want to modify your Profile",
	    	    	  icon: 'warning',
	    	    	  showCancelButton: true,
	    	    	  cancelButtonText: 'No',
	    	    	  confirmButtonColor: '#3085d6',
	    	    	  cancelButtonColor: '#d33',
	    	    	  confirmButtonText: 'Yes'
	    	    	}).then((result) => {
	    	    	  if (result.value) {
	    	    	    
	    	    		  $.ajax({
	    		    	        url:"../clientprocess?action=clientupdateprofile",
	    		    	        type:"POST",
	    		    	        dataType:"json",
	    		    	        data:data,
	    		    	        beforeSend:function(){
	    		    	    	   
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
	    		     	    			  title: 'Changes saved',
	    		     	    			  showConfirmButton: false,
	    		     	    			  timer: 2000
	    		     	    			})
	    		     	    		 $('.loader').hide();
	    		     	    			
	    		     	    	  }
	    		    	    	  else 
	    		    	    	  {
	    		    	    		   Swal.fire({
	    		    	    			  icon:'error',
	    		    	    			  title:'Something went Wrong',
	    		    	    			  text:"wrong",
	    		    	    			  footer:'',
	    		    	    			  timer:3000
	    		    	    			})
	    		    	    		   $('.loader').hide();
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
   //=======================//=======================
    $(document).on('submit', '.form-submit', function (e) {
      e.preventDefault();
     
     var form=$(this);
  	 var formdata=new FormData($(form)[0]);
  	 var data={};
       formdata.forEach(function(value,key)
  	 {
  		  data[key]=value;
  	 }); 
  	 
       console.log(data);
       if(data.currentpassword=='')
       {
      	 error("Please fill the Current Password");
           return false;
  		 
       }
       else if(data.newpassword=='')
       {
      	 error("Please fill the New Password");
           return false; 
       }
       else if(data.confirmpassword=='')
       {
      	 error("Please fill the Confirm Password");
           return false; 	  
       }
       
       if(data.newpassword==data.confirmpassword)
       {
      	 console.log("Password match");
       }
       else
       {
      	 error("Please fill the correct password");
           return false; 	 
       }
       //===============//================
       $.ajax({
  	       url:"../clientprocess?action=clientchangepassword",
  	       type:"POST",
  	       dataType:"json",
  	       data:data,
  	       beforeSend:function(){
	    	   
	    	   $('.loader').show();
	       
	       },
  	       success:function(data,textStatus,jqXHR)
  	       {
  	    	  if(data.status){
  	    		  
  	    		  Swal.fire({
  	    			  position: 'top-end',
  	    			  icon: 'success',
  	    			  title: 'Password Change Successfully',
  	    			  showConfirmButton: false,
  	    			  timer: 2000
  	    			})
  	    		    $('.loader').hide();
  	    
  	    	  }
  	    	  else
  	    	  {
  	    		   Swal.fire({
   	    			  icon:'error',
   	    			  title:'Password Not Change',
   	    			  text:"Something went Wrong",
   	    			  footer:'',
   	    			  timer:3000
   	    			}) 
   	    		    $('.loader').hide();	
   	    
  	    		  
  	    	  }
  	    	  
  	      },
  	     error:function(e)
  	    {
  	    	console.log("error in pages");
  	    }
    
       });
        
    });
   
    $(document).on('submit', '.form-upload', function (e) {
	     e.preventDefault();
	     var form = $('.form-upload')[0];
	     var data = new FormData(form);
	
	     $.ajax({
	            
	    	    type: "POST",
	            enctype: 'multipart/form-data',
	            url:"../clientprocess?action=uploadphoto",
	            data: data,
	            processData: false,
	            contentType: false,
	            cache: false,
	            timeout: 600000,
	            beforeSend:function(){
	 	    	   
	 	    	   $('.loader').show();
	 	       
	 	        },
	            success: function (data)
	            {
	            	 var result = JSON.parse(data);
	         	     if(result.status){
	  	    		  Swal.fire({
	  	    			  position: 'top-end',
	  	    			  icon: 'success',
	  	    			  title: 'Success',
	  	    			  showConfirmButton: false,
	  	    			  timer: 2000
	  	    			})
	  	    			
	  	    			$('.form-upload').trigger("reset");	
	  	    		    $('.loader').hide();
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
	   	    		  $('.loader').hide();
	   	    	   }
	            },
	            error: function (e) {

	              console.log("error");

	          }
	     });

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
