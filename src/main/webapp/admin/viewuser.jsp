<%@ page import="com.softdocadmin.connection.StoreDBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Date" %>
<%@include file="include/session.jsp"%>
<!DOCTYPE html>
<html>

<head>
   <%@include file="include/head.jsp"%>
   <link href="cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css"/>
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
                    User Centre
                </h2>
            </div>
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                Create User
                            </h2>
                            
                        </div>
                        
                        <%
                                                	String id=request.getParameter("id");
                                                %>
                        <%
                        	if(id==null)
                                                   {
                        %>
                           
                        <div class="body mrgnbtm">
                            <form action="Process?action=subadmine" method="post" class="form-horizontal" id="user">
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Softdoc No.</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="text" class="form-control" id="NameSurname" name="softdocnum" placeholder="Softdoc ID" value="" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Employee ID.</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="text" class="form-control" id="NameSurname" name="empid" placeholder="Employee ID." value="" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Employee Name</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="text" class="form-control" id="Email" name="name" placeholder="Employee Name" value="" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Employee Email</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="email" class="form-control" id="Email" name="email" placeholder="Employee Email" value="" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Employee Mobile</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="number" class="form-control" id="Email" name="mobile" placeholder="Employee Mobile" value="" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Joining Date</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="date" class="form-control" id="Email" name="joindate" placeholder="Joining Date" value="" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Activation Date</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="date" class="form-control" id="Email" name="activitiondate" placeholder="Activation Date" value="" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Designation</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="text" class="form-control" id="Email" name="designation" placeholder="Designation" value="" required="">
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Role</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <select class="form-control show-tick" name="role">
                                                <option value="">Select</option>
                                                <option value="store">Store</option>
                                                <option value="onsite">Onsite</option>
                                                <option value="indexing">Indexing</option>
                                                <option value="quality">Quality</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row clearfix">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> 
                                        <button type="button" class="btn btn-primary" style="float: right;">Modify</button>
                                        <button type="submit" class="btn btn-primary" style="float: right; margin-right: 3px;">Submit</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                         <%
                         	}else if(id!=null){
                                                 	   
                                                 	   try(Connection connection=StoreDBConnection.openConnection();PreparedStatement preparedStatement=connection.prepareStatement("SELECT `name`, `designation`, `mobile`, `email`, `softdoc_no`, `employee_id`, `joining_date`, `activation_date`, `department`, `role` FROM `softdoc_staff` WHERE id='"+id+"'");)
                                                 	   {
                                                     	   ResultSet resultset=preparedStatement.executeQuery();
                                                            int i = 1;
                                                            if(resultset.next())
                                                             {
                         %>
                         <div class="body mrgnbtm">
                            <form action="Process?action=subadminupdate&id=<%=id%>" method="post" class="form-horizontal">
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Softdoc No.</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="text" class="form-control" id="NameSurname" name="softdocnum" placeholder="Softdoc ID" value="<%=resultset.getString("softdoc_no")%>" disabled="disabled">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Employee ID.</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="text" class="form-control" id="NameSurname" name="empid" placeholder="Employee ID." value="<%=resultset.getString("employee_id")%>" disabled="disabled">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Employee Name</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="text" class="form-control" id="Email" name="name" placeholder="Employee Name" value="<%=resultset.getString("name")%>" disabled="disabled">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Employee Email</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="email" class="form-control" id="Email" name="email" placeholder="Employee Email" value="<%=resultset.getString("email")%>" disabled="disabled">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Employee Mobile</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="number" class="form-control" id="Email" name="mobile" placeholder="Employee Mobile" value="<%=resultset.getLong("mobile")%>" disabled="disabled">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Joining Date</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="text" class="form-control" id="Email" name="joindate" placeholder="Joining Date" value="<%=resultset.getString("joining_date")%>" disabled="disabled">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Email" class="col-sm-2 control-label">Designation</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <input type="text" class="form-control" id="Email" name="designation" placeholder="Designation" value="<%=resultset.getString("designation")%>" disabled="disabled">
                                        </div>
                                    </div>
                                </div>
                               <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Role</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                             <input type="text" class="form-control" id="Email" name="role" placeholder="Role" value="<%=resultset.getString("role")%>" disabled="disabled">
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
                     	 
                            }
                        %>
                       
                    </div>
                </div>
            </div>
     
        </div>
    </section>
    <%@include file="include/script.jsp"%> 
</body>
</html>
