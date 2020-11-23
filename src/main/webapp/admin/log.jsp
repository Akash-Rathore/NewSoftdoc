<%@include file="include/session.jsp"%>
<%@ page import="com.softdocadmin.connection.StoreDBConnection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet"%>   
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date" %>    
<!DOCTYPE html>
<html>

<head>
       <%@include file="include/head.jsp" %>      
      <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap.min.css" rel="stylesheet" />
      <link href="https://cdn.datatables.net/buttons/1.6.0/css/buttons.bootstrap.min.css" rel="stylesheet" />
      <script type="text/javascript">
      
      function reportfilter(str) {
      
       var start_date = $('#start_date').val();
   	   var end_date = $('#end_date').val(); 
          
      if (str=="") {
         document.getElementById("txtHint1").innerHTML="";
         return;
       }
       if (window.XMLHttpRequest) {
         // code for IE7+, Firefox, Chrome, Opera, Safari
         xmlhttp=new XMLHttpRequest();
       } else { // code for IE6, IE5
         xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
       }
       xmlhttp.onreadystatechange=function() {
         if (this.readyState==4 && this.status==200) {
           document.getElementById("txtHint1").innerHTML=this.responseText;
         }
       }
        
        xmlhttp.open("POST","ajax-report.jsp?start="+start_date+"&end="+end_date,true); 
        xmlhttp.send();
     }
    
      function myreportfilter(str) {
          
          var start_date = $('#mystart_date').val();
      	  var end_date = $('#myend_date').val(); 
      	  
      	
              
         if (str=="") {
            document.getElementById("txtHint").innerHTML="";
            return;
          }
          if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp=new XMLHttpRequest();
          } else { // code for IE6, IE5
            xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
          }
          xmlhttp.onreadystatechange=function() {
            if (this.readyState==4 && this.status==200) {
              document.getElementById("txtHint").innerHTML=this.responseText;
            }
          }
           
           xmlhttp.open("POST","ajax-myreport.jsp?start="+start_date+"&end="+end_date,true); 
           xmlhttp.send(); 
        }
       
      
      </script>
      
      
      
      
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
                    
                   <!-- #END# Notifications -->                    
                </ul>
            </div>
        </div>
    </nav>
    <!-- #Top Bar -->
    <section>
        <!-- Left Sidebar -->
          
          <aside id="leftsidebar" class="sidebar">
            <!-- User Info -->
            <div class="user-info">
                <div class="image">
                                 <%
                try(Connection  connect=StoreDBConnection.openConnection();  PreparedStatement preparedStatement=connect.prepareStatement("SELECT * FROM `softdoc_staff` WHERE `id`='"+(int)session.getAttribute("id")+"'");)
                {
                         ResultSet result=preparedStatement.executeQuery();
                         int i = 1;
                         if(result.next())
                         {
                %>
                             <%if(result.getString("profile_photo") !=null){%>                        
                                  <img src="<%=result.getString("profile_photo")%>" width="48" height="48" alt="User" />
                             <%}else{%>
                                  <img src="../images/user.png" width="48" height="48" alt="User" />
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
                <div class="info-container">
                    <div class="name" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><%=(String)session.getAttribute("adminname")%></div>
                    <div class="email"><%=(String)session.getAttribute("Email")%></div>
                </div>
            </div>
            <!-- #User Info -->
            <!-- Menu -->
            <div class="menu">
                <ul class="list" style="">
                    <li class="header">MAIN NAVIGATION</li>
                    
                    <li class="<%if(request.getRequestURI().equals("/admin/dashboard.jsp")) { out.print("active"); }%>">
                    
                        <a  href="dashboard.jsp">
                            <i class="material-icons">home</i>
                            <span>Home</span>
                        </a>
                    </li>
                    <li class="<%if(request.getRequestURI().equals("/admin/customer.jsp")) { out.print("active"); }%>">
                        <a href="customer.jsp">
                            <i class="material-icons">accessibility</i>
                            <span>Customer Center</span>
                        </a>
                    </li>
                    <li class="<%if(request.getRequestURI().equals("/admin/user.jsp")) { out.print("active"); }%>">
                        <a href="user.jsp">
                            <i class="material-icons">supervised_user_circle</i>
                            <span>User Center</span>
                        </a>
                    </li>
                     <li class="<% if(request.getRequestURI().equals("/admin/activity.jsp")){ out.print("active"); }%>">
                       <a href="activity.jsp">
                           <i class="material-icons">directions_walk</i>
                           <span>Activity</span>
                       </a>
                    </li>
                    <li class="<%if(request.getRequestURI().equals("/admin/department.jsp")) { out.print("active"); }%>">
                        <a href="department.jsp">
                           <i class="material-icons">file_copy</i>
                           <span>Departments</span>
                        </a>
                    </li>
                    <li  class="<%if(request.getRequestURI().equals("/admin/report.jsp")) { out.print("active"); }%>">
                        <a href="report.jsp">
                            <i class="material-icons">policy</i>
                            <span>System Reports</span>
                        </a>
                    </li>
                    <li class="<%if(request.getRequestURI().equals("/admin/log.jsp")) { out.print("active"); }%>">
                        <a href="log.jsp">
                            <i class="material-icons">settings_applications</i>
                            <span>Log Reports</span>
                        </a>
                    </li>
                   <%--  <li  class="<%if(request.getRequestURI().equals("/admin/complaint.jsp")) { out.print("active"); }%>">
                        <a href="complaint.jsp">
                            <i class="material-icons">settings_applications</i>
                            <span>Complaint</span>
                        </a>
                    </li> --%>
                   
                  
                    <!-- <li>
                        <a href="../Process?action=logout">
                             <i class="material-icons">lock</i>
                             <span>Logout</span>
                        </a>
                    </li> -->
                    
                </ul>
            </div>
            <!-- #Menu -->
            <!-- Footer -->
            <div class="legal">
                <div class="copyright">
                    &copy; 2020 <a href="dashboard.jsp">SoftDoc</a>. All Right Reserved
                </div>
           </div>
            <!-- #Footer -->
        </aside>
        <!-- #END# Left Sidebar -->
        
    </section>


    <section class="content">
        <div class="container-fluid">
            <div class="block-header">
                <h2>
                    Log Reports 
                </h2>
                
            </div>
            
           <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header  margin0">
                                
                              
                            <div class="row">
                                <div class="">
                                    <h2 class="col-md-4 col-lg-4 col-xs-12 pull-left">
                                        <div class="m-t-10">
                                            Log Reports 
                                        </div>
                                    </h2>
                              <!-- Start  date filter -->
                                  <div class="col-md-8 col-lg-8 col-xs-12 pull-right accessCutomerTable">
                                        <div class="col-md-1">
                                            <h2 class="">From</h2>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="date" id="start_date" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-1">
                                            <h2 class="">To</h2>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group form-float">
                                            <div class="form-line">
                                                <input type="date" id="end_date" class="form-control">
                                            </div>
                                        </div>
                                         </div>
                                       <div class="col-md-4">
     								       <input type="button" name="search" onclick="reportfilter(this.value)" value="Search" class="btn btn-info" />
      						           </div>
                                     
                                    </div>
                               <!-- End date filter -->
                                </div>
                            </div>
                        </div>
                        <div class="body">
                        
                            <div class="table-responsive">
                                <table class="table table-hover" id="example" >
                                <thead>
                                      <tr>
                                          <th>S.No.</th>
                                          <th width="15%">Login ID</th>
                                          <th>System IP</th>
                                          <th>Login Time</th>
                                          <th>Action</th>
                                     </tr> 
                                </thead>
                                <tbody id="txtHint1">
                                   
                                       
                                  <%
                                   	try(Connection  connection=StoreDBConnection.openConnection(); PreparedStatement preparedStatement=connection.prepareStatement("SELECT `loginid`, `ip`, `logintime`, `action` FROM `logfile` where role!='superadmin'and role!='client' and role!='admin'  ORDER BY logintime DESC");)
                                                                          {
                                                                       	    ResultSet resultset=preparedStatement.executeQuery();
                                                                               int i = 1;
                                                                               while(resultset.next())
                                                                               {
                                                                                                            %>
                                     <tr>
                                        <td><%=i%></td>
                                        <td><%=resultset.getString("loginid")%></td>
                                        <td><%=resultset.getString("ip")%></td>
                                       <%
                                     	  final String OLD_FORMAT = "yyyy-MM-dd hh:mm:ss";
                             			  final String NEW_FORMAT = "dd MMM yyyy";
                             			  SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
                                          Date d = sdf.parse(resultset.getString("logintime"));
                             			  sdf.applyPattern(NEW_FORMAT);
                             			  String newDateString = sdf.format(d);
                                        %>
                                        <td><%=newDateString%></td>
                                        <td><%=resultset.getString("action")%></td>
                                      </tr>
                                       <%
                                       	i++;
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
                                        
                                </tbody>
                            </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header  margin0">
                            
                            <div class="row">
                                <div class="">
                                    <h2 class="col-md-4 col-lg-4 col-xs-12 pull-left">
                                        <div class="m-t-10">
                                           MyLog Reports 
                                        </div>
                                    </h2>
                                    
                                    <!--start filter  -->
                                     <div class="col-md-8 col-lg-8 col-xs-12 pull-right accessCutomerTable">
                                        <div class="col-md-1">
                                            <h2 class="">From</h2>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="date" id="mystart_date" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-1">
                                            <h2 class="">To</h2>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group form-float">
                                            <div class="form-line">
                                                <input type="date" id="myend_date" class="form-control">
                                            </div>
                                        </div>
                                         </div>
                                       <div class="col-md-4">
     								       <input type="button" name="search" onclick="myreportfilter(this.value)" value="Search" class="btn btn-info" />
      						           </div>
                                       <!-- end filter -->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-hover" id="example10" >
                                <thead>
                                      
                                      <tr>
                                         <th>S.No.</th>
                                         <th width="15%">Login ID</th>
                                         <th>System IP</th>
                                         <th>Login Time</th>
                                         <th>Action</th>
                                      </tr>
                                    
                                    
                                </thead>
                                <tbody id="txtHint">
                                   
                                          <%
                                                                     try(Connection  connection=StoreDBConnection.openConnection();PreparedStatement preparedStatement=connection.prepareStatement("SELECT * FROM `logfile` WHERE loginid = '"+email+"' AND role='admin' ORDER BY logintime DESC");)
                                                                        {
                                                                        	      ResultSet resultset=preparedStatement.executeQuery();
                                                                                  int i = 1;
                                                                                  while(resultset.next())
                                                                                  {
                                                                             %>
                                     <tr>
                                        <td><%=i %></td>
                                        <td><%=resultset.getString("loginid")%></td>
                                        <td><%=resultset.getString("ip")%></td>
                                       <%
                                     	  final String OLD = "yyyy-MM-dd hh:mm:ss";
                             			  final String NEW = "dd MMM yyyy";
                             			  SimpleDateFormat simpleDateFormat = new SimpleDateFormat(OLD);
                                          Date date = simpleDateFormat.parse(resultset.getString("logintime"));
                                          simpleDateFormat.applyPattern(NEW);
                             			  String logintime = simpleDateFormat.format(date);
                                        %>
                                        <td><%=logintime%></td>
                                        <td><%=resultset.getString("action")%></td>
                                        
                                      </tr>
                                       <%
                                            	
                                            	i++;
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
                                
                                </tbody>
                            </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
        
    </section>
    <%@include file="include/script.jsp" %>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.0/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.0/js/buttons.flash.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.0/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.0/js/buttons.print.min.js"></script>


    <script>
        $(document).ready(function() {
            $('#example').DataTable( {
            	"searching":false,
                "lengthMenu":[25,50],
                "pageLength":25,
                dom: 'Bfrtip',
                buttons: [
                    'copy', 'csv', 'excel', 'pdf', 'print'
                ]  
            } );
        } );
        
        $(document).ready(function() {
            $('#example10').DataTable( {
            	"searching":false,
                "lengthMenu":[25,50],
                "pageLength":25,
                dom: 'Bfrtip',
                buttons: [
                    'copy', 'csv', 'excel', 'pdf', 'print'
                ]  
            } );
        } );
       
        
    </script>
</body>

</html>
