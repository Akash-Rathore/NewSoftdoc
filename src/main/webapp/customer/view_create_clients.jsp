<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Arrays"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>   
<%@page import="com.customeradminModal.Userclientdetail"%>
<%@page import="java.util.Iterator"%>

<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="com.customeradminModal.Userclientdetail"%>
 
 <%@page import="com.customeradminModal.Userclientdetail"%>
 <%@page import="java.util.Iterator"%> 

<%@include file="include/session.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="include/head.jsp"%>
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
          
                          
               <div class="row" style="margin-left:-148px !important;margin-right:-27px;">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                Create User
                            </h2>
                        </div>
                        <div class="body mrgnbtm">
                        
                        
                        
                         <%
                             ArrayList<Userclientdetail>  viewClientDetails= (ArrayList) request.getAttribute("viewClientDetails"); 
                             Iterator<Userclientdetail> iterator = viewClientDetails.iterator();
                              while(iterator.hasNext())  // iterate through all the data until the last record
                	         {
                         	     Userclientdetail clientDetails = iterator.next();          
                        
                        %> 
                        
                           <form class="form-horizontal" id="updateclient">
                                 <div class="form-group">
                                   <label for="NameSurname" class="col-sm-2 control-label">Softdoc ID</label>
                                     <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="text" name="softdocnum"  value="<%=clientDetails.getSoftdocno()%>" placeholder="Client ID" class="form-control" readonly="readonly">
                                       </div>
                                    </div>
                                </div>
                             <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Employee ID<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                               <input type="text" name="empid" value="<%=clientDetails.getEmployeeid()%>" placeholder="Employee ID" class="form-control" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Employee Name<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-10">
                                          <div class="form-line">
                                               <input type="text" name="name" value="<%=clientDetails.getName()%>" placeholder="Employee Name" class="form-control" readonly>
                                          </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Employee Email ID<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                              <input type="email" name="email" value="<%=clientDetails.getEmail()%>" placeholder="Employee Email ID" class="form-control" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Joining Date</label>
                                    <div class="col-sm-10">
                                         <div class="form-line">
                                                 <input type="text" name="joindate"  value="<%=clientDetails.getJoiningdate()%>" placeholder="Joining Date" class="form-control" readonly>
                                         </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Designation<span style="color:red; font-size:18px;">*</span></label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type="text" name="designation" value="<%=clientDetails.getDesignation()%>" placeholder="Designation" class="form-control"  readonly>
                                        </div>
                                    </div>
                                </div>
                               
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Location</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="text" name="location" class="form-control" value="<%=clientDetails.getLocation()%>" placeholder="Location" readonly>
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
                                  
                                         
                                         JSONObject access_level1 = null;   
                                         String deptinfo =clientDetails.getDepartment();
                                         JSONParser jsonParser = new JSONParser();
          								 JSONArray jsonArray = (JSONArray) jsonParser.parse(deptinfo);
          								 String department="";
          							     String access_level="";
          							     
          							    
                                         
          									 for(Object object : jsonArray) {
          										 access_level1 = (JSONObject) object;
          										
                   									department=(String)access_level1.get("department");
          											access_level=(String)access_level1.get("access_level");
          									
          						      %>
                                                <div class="form-group" >
				                                    <label  class="col-sm-3 control-label" style="margin-bottom:0px !important;font-family: emoji;"><%=department%></label>
				                                    <%if(access_level.equals("Read")){  %> 
				                                    
				                                      <div class="col-sm-3">
				                                         <label class="container">
				                                             <input type="checkbox" name="access_right_"  value="" disabled="disabled"  checked>
				                                             <span class="checkmark"></span>
                                                         </label> 
				                                      </div>
				                                      
				                                      <%  }else{%>
				                                       <div class="col-sm-3">
				                                          <label class="container">
				                                              <input type="checkbox" name="access_right_"   disabled="disabled"  value=":Read">
				                                              <span class="checkmark"></span>
                                                          </label> 
				                                      </div>
				                                    <% } %>
				                                 
				                                  <%if(access_level.equals("Write")){ %> 
				                                      <div class="col-sm-3">
				                                         <label class="container">
				                                           <input type="checkbox" name="access_right_"   disabled="disabled"  value="" checked>
                                                                    <span class="checkmark"></span>
                                                                  </label>  	
				                                      </div>
				                                    <%  }else{%>
				                                       <div class="col-sm-3">
				                                         <label class="container">
				                                            <input type="checkbox" name="access_right_"  disabled="disabled"   value="">
                                                            <span class="checkmark"></span>
                                                         </label>  	
				                                       </div>
				                                   <%} %>
				                                  
				                                  <%if(access_level.equals("Dept_Admin")){ %> 
				                                      <div class="col-sm-3">
				                                         <label class="container">
				                                           <input type="checkbox" name="access_right_"   disabled="disabled"  value=":Dept_Admin" checked>
                                                                    <span class="checkmark"></span>
                                                          </label>  
				                                      </div>
				                                   <% }else{%>
				                                       <div class="col-sm-3">
				                                         <label class="container">
				                                           <input type="checkbox" name="access_right_"   disabled="disabled"  value="">
                                                           <span class="checkmark"></span>
                                                         </label>  
				                                      </div>
				                                   <%} %>   
				                                      
				                                  </div>
                                        <%
                                             }
                                        
                                        %>
                                  
                                 </div>
                            
                            </form>
                        </div>
                    </div>
                </div>
             </div> 
         </div>
     <%
                	         }   
   %> 
     </section>  
   <%@include file="include/footer.jsp"%>
 </body>
</html>
