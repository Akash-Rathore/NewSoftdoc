<%@ page import="com.customeradmin.connection.DBConnection"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Arrays"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Statement"%>
<%@include file="include/session.jsp" %>
<%@page import="java.util.ArrayList"%>   
<%@page import="com.customeradminModal.Userclientdetail"%>
<%@page import="java.util.Iterator"%>

<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>

 
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
            <% 
               ArrayList<Userclientdetail>  editClientDetails= (ArrayList) request.getAttribute("editClientDetails"); 
               if(editClientDetails==null)
               {
            %>
              <div class="row" style="margin-left:-148px !important;margin-right:-27px;">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                Create User
                            </h2>
                        </div>
                        <div class="body mrgnbtm">
                          <form class="form-horizontal" id="userclient">
                                 <div class="form-group">
                                   <label for="NameSurname" class="col-sm-2 control-label">Softdoc ID</label>
                                     <div class="col-sm-10">
                                        <div class="form-line">
                                          <%      
							              try(Connection connection=DBConnection.openConnection(); PreparedStatement  preparedStatement=connection.prepareStatement("select cd.company_name as company_name, cc.id as id from customer_details cd , client_details cc where cd.id='"+(int)session.getAttribute("customer_id")+"' ORDER BY id DESC LIMIT 1");)
							                           { 
							            	               
							            	                      ResultSet resultset=preparedStatement.executeQuery();
							                               if(resultset.next())
							                               {
							                      %>
							                                     <%
							                                         String clientnumber = String.format ("%04d",resultset.getInt("id")+1);  
							                                         String companyname =resultset.getString("company_name");
							                                 	     String company="";
							                                 	     for (int i = 0; i <= 3; i++) {
							                                 	    	   company += companyname.charAt(i);
								                            		 }
                                                                          
							                                     %>
                                                                    <input type="text" name="softdocnum" class="form-control" value="<%=company.toUpperCase()+"CC"+clientnumber%>" required="required" placeholder="Enter Softdoc No." readonly="readonly">
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
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Employee ID<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type="text"  name="empid" class="form-control" placeholder="Employee ID" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Employee Name<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-10">
                                          <div class="form-line">
                                              <input  type="text" name="name" class="form-control" placeholder="Employee Name" required="required">
                                          </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Employee Email ID<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                           <input type="email"  name="email" class="form-control" placeholder="Employee Email ID" required="required">  
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Joining Date</label>
                                    <div class="col-sm-10">
                                         <div class="form-line">
                                             <input type="date" name="joindate"  class="form-control">
                                         </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Designation<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="text" pattern="[A-Za-z\s]{0,60}" class="form-control" id="Email" name="designation" placeholder="Designation">
                                        </div>
                                    </div>
                                </div>
                               
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Location</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type="text"  name="location" class="form-control"  placeholder="Location">
                                       </div>
                                    </div>
                                </div>
                                <div class="row" style="text-decoration:underline"><center><h4>Access Information</h4></center></div>
                            	<br>
                                 <div class="row">
                                   <div class="form-group">
                                       <label  class="col-sm-3 control-label" style="margin-bottom:0px !important;font-size:20px;">Department</label>
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
                                         
                                           try(Connection connection=DBConnection.openConnection();PreparedStatement  preparedStatement=connection.prepareStatement("SELECT `id`,`depart_info`  FROM  `customer_details` WHERE `id`='"+(int)session.getAttribute("customer_id")+"'");)
                                           {
                                              
                                        	   ResultSet resultset=preparedStatement.executeQuery();   
                                                 if(resultset.next())
                                                 {
                                          %>  
                                                   
                                                       
                                                        <%
                                                               String deptinfo =resultset.getString("depart_info");
                                                               String array[]=deptinfo.split(",");
                                                               for (int j = 0; j < array.length; j++) {
                                                            	   
                                                            	   
                                                         %>
                                                         
                                                                  
							                                  <div class="form-group" >
							                                    <label  class="col-sm-3 control-label" style="margin-bottom:0px !important;font-family: emoji;"><%=array[j]%></label>
							                                      <div class="col-sm-3">
							                                         <label class="container">
							                                           <input type="checkbox" name="access_right_<%=j%>"  value="<%=array[j]%>:Read">
							                                           <span class="checkmark"></span>
                                                                     </label>  
							                                      </div>
							                                      <div class="col-sm-3">
							                                         <label class="container">
							                                           <input type="checkbox" name="access_right_<%=j%>"  value="<%=array[j]%>:Write">
                                                                       <span class="checkmark"></span>
                                                                     </label>  	
							                                      </div>
							                                      <div class="col-sm-3">
							                                         <label class="container">
							                                           <input type="checkbox" name="access_right_<%=j%>"  value="<%=array[j]%>:Dept_Admin">
                                                                       <span class="checkmark"></span>
                                                                     </label>  
							                                      </div>
							                                  </div>
                                                        
                                                      <% 
                                                        }     
                                                           
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
                                  <br>
                            	  <div class="row clearfix">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" align="center" style="margin-bottom:10px;">
                                          <button type="submit" class="btn btn-primary btn-lg" style="float:right;width:75px;">Submit</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
           <%
               }
               else if(editClientDetails!=null)
               {
            	   
           %>
               
               <%
               
                   Iterator<Userclientdetail> iterator = editClientDetails.iterator();
                    while(iterator.hasNext())  // iterate through all the data until the last record
           	       {
                    	Userclientdetail clientDetails = iterator.next();
           	   %>
               <div class="row" style="margin-left:-148px !important;margin-right:-27px;">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                Create User
                            </h2>
                        </div>
                        <div class="body mrgnbtm">
                          <form class="form-horizontal" id="updateclient">
                                 <div class="form-group">
                                   <label for="NameSurname" class="col-sm-2 control-label">Softdoc ID</label>
                                     <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="text" name="softdocnum"  value="<%=clientDetails.getSoftdocno()%>" placeholder="Client ID" class="form-control" readonly="readonly">
                                            <input type="hidden" name="id"  value="<%=clientDetails.getId()%>"  class="form-control">
							           </div>
                                    </div>
                                </div>
                              <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Employee ID<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                               <input type="text" name="empid" value="<%=clientDetails.getEmployeeid()%>" placeholder="Employee ID" class="form-control"  required="required">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Employee Name<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-10">
                                          <div class="form-line">
                                               <input type="text" name="name" value="<%=clientDetails.getName()%>" placeholder="Employee Name" class="form-control" required="required">
                                          </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Employee Email ID<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                              <input type="email" name="email" value="<%=clientDetails.getEmail()%>" placeholder="Employee Email ID" class="form-control">
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Joining Date</label>
                                    <div class="col-sm-10">
                                         <div class="form-line">
                                                 <input type="text" name="joindate"  value="<%=clientDetails.getJoiningdate()%>" placeholder="Joining Date" class="form-control">
                                         </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Designation<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type="text" name="designation" value="<%=clientDetails.getDesignation()%>" placeholder="Designation" class="form-control" required="required">
                                        </div>
                                    </div>
                                </div>
                               
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Location</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="text" name="location" class="form-control" value="<%=clientDetails.getLocation()%>" placeholder="Location">
                                       </div>
                                    </div>
                                </div>
                                <div class="row" style="text-decoration:underline"><center><h4>Access Information</h4></center></div>
                              <br>
                              
                              
                              
                               <div class="row">
                                   <div class="form-group">
                                    <label  class="col-sm-3 control-label" style="margin-bottom:0px !important;font-size:20px;">Department</label>
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
                                      String []array=null;
                                      try(Connection connect=DBConnection.openConnection();Statement statement = connect.createStatement();)
                                      {
                                          ResultSet resultsettwo=statement.executeQuery("SELECT depart_info FROM `customer_details` where `id`='"+(int)session.getAttribute("customer_id")+"'");
                                          array =new String[20];
                                          if(resultsettwo.next()){
                                                String deptinfo =resultsettwo.getString("depart_info");
                                                array=deptinfo.split(",");                                          
                                            }
                                        
                                      }
                                  %> 
                                     
                                     <%
                                  
                                         
                                         JSONObject access_level1 = null;   
                                         String deptinfo =clientDetails.getDepartment();
                                         JSONParser jsonParser = new JSONParser();
          								 JSONArray jsonArray = (JSONArray) jsonParser.parse(deptinfo);
          								 String department="";
          							     String access_level="";
          							     for(int j = 0; j < array.length; j++) { 
                                         
          									 for(Object object : jsonArray) {
          										 access_level1 = (JSONObject) object;
          										 if(((String)access_level1.get("department")).equalsIgnoreCase(array[j])){
                   									
          											department=(String)access_level1.get("department");
          											access_level=(String)access_level1.get("access_level");
          										 }
          									 } 
          										 
          									 if(department.equalsIgnoreCase(array[j])){
          						      %>
                                                <div class="form-group" >
				                                    <label  class="col-sm-3 control-label" style="margin-bottom:0px !important;font-family: emoji;"><%=array[j]%></label>
				                                    <%if(access_level.equals("Read")){  %> 
				                                    
				                                      <div class="col-sm-3">
				                                         <label class="container">
				                                             <input type="checkbox" name="access_right_<%=j%>"  value="<%=array[j]%>:Read" checked>
				                                             <span class="checkmark"></span>
                                                         </label> 
				                                      </div>
				                                      
				                                      <%  }else{%>
				                                       <div class="col-sm-3">
				                                          <label class="container">
				                                              <input type="checkbox" name="access_right_<%=j%>"  value="<%=array[j]%>:Read">
				                                              <span class="checkmark"></span>
                                                          </label> 
				                                      </div>
				                                    <% } %>
				                                 
				                                  <%if(access_level.equals("Write")){ %> 
				                                      <div class="col-sm-3">
				                                         <label class="container">
				                                           <input type="checkbox" name="access_right_<%=j%>"  value="<%=array[j]%>:Write" checked>
                                                                    <span class="checkmark"></span>
                                                                  </label>  	
				                                      </div>
				                                    <%  }else{%>
				                                       <div class="col-sm-3">
				                                         <label class="container">
				                                            <input type="checkbox" name="access_right_<%=j%>"  value="<%=array[j]%>:Write">
                                                            <span class="checkmark"></span>
                                                         </label>  	
				                                       </div>
				                                   <%} %>
				                                  
				                                  <%if(access_level.equals("Dept_Admin")){ %> 
				                                      <div class="col-sm-3">
				                                         <label class="container">
				                                           <input type="checkbox" name="access_right_<%=j%>"  value="<%=array[j]%>:Dept_Admin" checked>
                                                                    <span class="checkmark"></span>
                                                          </label>  
				                                      </div>
				                                   <% }else{%>
				                                       <div class="col-sm-3">
				                                         <label class="container">
				                                           <input type="checkbox" name="access_right_<%=j%>"  value="<%=array[j]%>:Dept_Admin">
                                                           <span class="checkmark"></span>
                                                         </label>  
				                                      </div>
				                                   <%} %>   
				                                      
				                                  </div>
                                        <%
                                             }
                                             else
                                             {
                                        %>
                                             <div class="form-group" >
			                                   <label  class="col-sm-3 control-label" style="margin-bottom:0px !important;font-family: emoji;"><%=array[j]%></label>
			                                     <div class="col-sm-3">
			                                        <label class="container">
			                                            <input type="checkbox" name="access_right_<%=j%>"  value="<%=array[j]%>:Read">
			                                            <span class="checkmark"></span>
			                                       </label>  
			                                     </div>
			                                     <div class="col-sm-3">
			                                       <label class="container">
			                                          <input type="checkbox" name="access_right_<%=j%>"  value="<%=array[j]%>:Write">
			                                          <span class="checkmark"></span>
			                                       </label>  	
			                                     </div>
			                                     <div class="col-sm-3">
			                                        <label class="container">
			                                           <input type="checkbox" name="access_right_<%=j%>"  value="<%=array[j]%>:Dept_Admin">
			                                             <span class="checkmark"></span>
			                                          </label>  
			                                     </div>
			                                 </div>
                                        <%  
                                        
                                              }
                                          
                                         }
                                        %>
                                  
                                 </div>
                            	<br>
                            	  <div class="row clearfix">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" align="center" style="margin-bottom:10px;">
                                         <button type="submit" class="btn btn-primary btn-lg" style="float:right;width:75px;">Submit</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
       </div>
     <%
     
           	       }
    } 
   %> 
                
              
     
    </section>
   <%@include file="include/loader.jsp"%>
   <%@include file="include/footer.jsp"%>
   <script src="include/custom-script.js"></script>  
   <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script> 
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    
    <script type="text/javascript">
    
    
    
    $("input:checkbox").on('click', function() {
          
    	  var $box = $(this);
          if($box.is(":checked")) {
    	    
        	var group = "input:checkbox[name='" + $box.attr("name") + "']";
    	    $(group).prop("checked", false);
    	    $box.prop("checked", true);
    	  
          } else {
    		  
    	     $box.prop("checked", false);
    	  
    	  } 
    
    });
  
      $("#userclient").submit(function(e){
	     e.preventDefault();
	     
	    
	     var form=$(this);
    	 var formdata=new FormData($(form)[0]);
    	 var data={};
         formdata.forEach(function(value,key)
    	 {
    		 data[key]=value;
    	 });
         
	   
         
         
	    
	     
         if(data.empid=='')
         {
            error('Please fill the Employee ID');
            return false;
         }
         else if(data.name=='')
         {
             error('Please fill the Employee Name');
             return false;
         }
         else if(data.email=='')
         {
             error('Please fill the Employee Email');
             return false;
         }
         else if(data.activitiondate=='')
         {
             error('Please fill the Activation Date');
             return false;
         }
         else if(data.designation=='')
         {
             error('Please fill the Designation');
             return false;
         }
         else if(data.designation=='')
         {
              error('Please fill the Location');
             return false;
         }
         else if(data.vardepartment=='')
         {
              error('Please select the Department');
              return false;
         }

         Swal.fire({
        	  title: 'Are you sure?',
        	  text: "you want to create this user",
        	  icon: 'warning',
        	  showCancelButton: true,
        	  cancelButtonText: 'No',
        	  confirmButtonColor: '#3085d6',
        	  cancelButtonColor: '#d33',
        	  confirmButtonText: 'Yes'
        	}).then((result) => {
        	  if (result.value) {
        	    
        		      $('#loader').show();
        	          $.ajax({
        		    	       url:"./customerprocess?action=customerclientdetail",
        		    	       type:"POST",
        		    	       dataType:"json",
        		    	       data:$("#userclient").serialize(),
        	                   success:function(data,textStatus,jqXHR)
        		    	       {
        		    	    	  console.log(data);
        		     	    	  if(data.status)
        		    	          {
        		     	    	   
        		     	    		  Swal.fire({
        		     	    			  position: 'center',
        		     	    			  icon: 'success',
        		     	    			  title: 'New user Created',
        		     	    			  showConfirmButton: false,
        		     	    			  timer: 3500
        		     	    			})
        		     	    		   
        		     	    			
        		     	    	   
        		     	    	  }
        		    	    	  else 
        		    	    	  {
        		    	    		   Swal.fire({
        		    	    			  icon:'error',
        		    	    			  title:'Something Wrong',
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
        		    	    	Swal.fire({
        	  	    			  icon:'error',
        	  	    			  title:'Something Wrong',
        	  	    			  text:"wrong",
        	  	    			  footer:'',
        	  	    			  timer:3000
        	  	    			}) 
        	  	    			$('#loader').hide();
        		    	    }
        		       
        		      });
        		 }
        	})
	     
      
      });  
 //================update client profile==================================== 
	    $("#updateclient").submit(function(e){
	    
	     e.preventDefault();
	     var form=$(this);
    	 var formdata=new FormData($(form)[0]);
    	 var data={};
         formdata.forEach(function(value,key)
    	 {
    		 data[key]=value;
    	 });
       
         console.log(data);
        
         
        
         
         if(data.empid=='')
         {
            error('Please fill the Employee ID');
            return false;
         }
         else if(data.name=='')
         {
             error('Please fill the Employee Name');
             return false;
         }
         else if(data.email=='')
         {
             error('Please fill the Employee Email');
             return false;
         }
         else if(data.activitiondate=='')
         {
             error('Please fill the Activation Date');
             return false;
         }
         else if(data.designation=='')
         {
             error('Please fill the Designation');
             return false;
         }
         
         Swal.fire({
        	  title: 'Are you sure?',
        	  text: "you want to make changes",
        	  icon: 'warning',
        	  showCancelButton: true,
        	  cancelButtonText: 'No',
          	  confirmButtonColor: '#3085d6',
        	  cancelButtonColor: '#d33',
        	  confirmButtonText: 'Yes'
        	}).then((result) => {
        	  if (result.value) {
        	    
        		     $('#loader').show();
        	         $.ajax({
      	    	       url:"./customerprocess?action=customerclientdetailupdate",
      	    	       type:"POST",
      	    	       dataType:"json",
      	    	       data:$("#updateclient").serialize(),
                       success:function(data,textStatus,jqXHR)
      	    	       {
      	    	    	  console.log(data);
      	     	    	  if(data.status)
      	    	          {
      	     	    	        Swal.fire({
      	     	    			  position: 'center',
      	     	    			  icon: 'success',
      	     	    			  title: 'Changes saved',
      	     	    			  showConfirmButton: false,
      	     	    			  timer: 3000
      	     	    			 })
      	     	    			

      	     	    			/* setTimeout(function(){
      			     	    		   window.location.href="user.jsp";
      			     	    	}) */  
      	     	    	        
      	     	    	        
      	     	    			 
      	     	    	  }
      	    	    	  else 
      	    	    	  {
      	    	    		   Swal.fire({
      	    	    			  icon:'error',
      	    	    			  title:'Something Wrong',
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
      	    	    	Swal.fire({
        	    			  icon:'error',
        	    			  title:'Something Wrong',
        	    			  text:"wrong",
        	    			  footer:'',
        	    			  timer:3000
        	    			}) 
        	    		 $('#loader').hide();
      	    	    }
      	       
      	      });  
                  
          }
       })
  });  
     
	 
    </script>
  </body>
</html>
