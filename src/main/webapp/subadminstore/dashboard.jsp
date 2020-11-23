<%@include file="include/session.jsp" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>

<!DOCTYPE html>
<html>

<head>
  <%@include file="include/head.jsp"%>
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
                <a class="navbar-brand" href="index.jsp">SOFTDOC SUBADMIN STORE</a>
            </div>
            <div class="collapse navbar-collapse" id="navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    
                    <!-- Notifications -->
                        <%@include file="include/notification.jsp"%>
                    <!-- #END# Notifications -->                    
                    <!-- <li class="pull-right"><a href="javascript:void(0);" class="js-right-sidebar" data-close="true"><i class="material-icons">more_vert</i></a></li> -->
                </ul>
            </div>
        </div>
    </nav>
    <!-- #Top Bar -->
    <section>
        <!-- Left Sidebar -->
           <%@include file="include/sidebar.jsp" %>
        <!-- #END# Left Sidebar -->
        
    </section>

    <section class="content">
        <div class="container-fluid">
            <div class="block-header">
                <h2>Dashboard</h2>
            </div>
            <div class="row clearfix">
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                  <a href="profile.jsp"> 
                    <div class="info-box bg-pink hover-expand-effect">
                        <div class="icon">
                            <i class="material-icons">public</i>
                        </div>
                        <div class="content">
                            <div class="text">My Profile</div>
                            <div class="number count-to" data-from="0" data-to="125" data-speed="15" data-fresh-interval="20"></div>
                        </div>
                    </div>
                  </a> 
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                  <a href="scheduling.jsp">
                    <div class="info-box bg-cyan hover-expand-effect">
                        <div class="icon">
                            <i class="material-icons">help</i>
                        </div>
                        <div class="content">
                            <div class="text">Scheduling</div>
                            <div class="number count-to" data-from="0" data-to="257" data-speed="1000" data-fresh-interval="20"></div>
                        </div>
                    </div>
                  </a> 
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                  <a href="reporting.jsp">
                    <div class="info-box bg-light-green hover-expand-effect">
                        <div class="icon">
                            <i class="material-icons">forum</i>
                        </div>
                        <div class="content">
                            <div class="text">Reporting</div>
                            <div class="number count-to" data-from="0" data-to="243" data-speed="1000" data-fresh-interval="20"></div>
                        </div>
                    </div>
                  </a> 
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                 <a href="help.jsp">
                    <div class="info-box bg-orange hover-expand-effect">
                        <div class="icon">
                            <i class="material-icons">person_add</i>
                        </div>
                        <div class="content">
                            <div class="text">Help</div>
                            
                            <div class="number count-to" data-from="0" data-to="1225" data-speed="1000" data-fresh-interval="20"></div>
                        </div>
                    </div>
                  </a>  
                </div>
            </div>
         
            
            <div class="row clearfix dashboardBlocks">
                <!-- Latest Social Trends -->
                <!-- #END# Latest Social Trends -->
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                    <div class="card">
                        <div class="body bg-body bg-teal">
                            <div class="font-bold m-b-20">Pending Pickups</div>

                            
                            <div class="table-responsive">
                                <table class="table  dashboard-task-infos">
                                    <thead>
                                        <tr>
                                            <th>Company Name</th>
                                            <th>Date</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                       <%
                                            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                                            LocalDateTime now = LocalDateTime.now();
                                        	try(Connection  connection=StoreDBConnection.openConnection();PreparedStatement  preparedStatement=connection.prepareStatement("SELECT * FROM `scheduling` where `pickup_date`='"+dtf.format(now)+"' and flag='0'");)
                                            {
                                                    ResultSet resultset=preparedStatement.executeQuery();
                                                    while(resultset.next())
                                                    {
                                         %>
                                         	   
                                      <tr>
                                             
                                             <td><%=resultset.getString("company_name")%></td>
                                             <td><%=resultset.getString("pickup_date")%></td>
                                            
                                       </tr>
                                        
                       
                       
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
                                        
                                       
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                    <div class="card">
                        <div class="body bg-light-green">
                            <div class="font-bold m-b-20">Return Today</div>

                            
                            <div class="table-responsive">
                                <table class="table  dashboard-task-infos">
                                    <thead>
                                        <tr>
                                            
                                            <th>Company Name</th>
                                            <th>Date</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                     
                                                                         <tr>
                                            
                                         <%
                                            DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                                            LocalDateTime now1 = LocalDateTime.now();
                                            try(Connection  connection=StoreDBConnection.openConnection();PreparedStatement  preparedStatement=connection.prepareStatement("SELECT * FROM `scheduling` where `return_date`='"+dtf1.format(now1)+"' and flag='0'");)
                                            {
                                                    ResultSet resultset=preparedStatement.executeQuery();
                                                    while(resultset.next())
                                                    {
                                         %>
                                         	   
                                      <tr>
                                             
                                             <td><%=resultset.getString("company_name")%></td>
                                             <td><%=resultset.getString("return_date")%></td>
                                            
                                       </tr>
                                        
                       
                       
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
                                        
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            
            <div class="row clearfix dashboardBlocks">
                <!-- Latest Social Trends -->
                <!-- #END# Latest Social Trends -->
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                    <div class="card">
                        <div class="body bg-light-green">
                            <div class="font-bold m-b-20">Pickup Due Tomorrow</div>

                            
                            <div class="table-responsive">
                                <table class="table  dashboard-task-infos">
                                    <thead>
                                        <tr>
                                            
                                            <th>Company Name</th>
                                            <th>Date</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                        		<%
                        			//Add one date
                        		      			               SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                        		   				               Date myDate = formatter.parse(dtf.format(now));
                        		   				               Calendar c = Calendar.getInstance();
                        		   				               c.setTime(myDate);
                        		   				               c.add(Calendar.DATE,1);
                        		   				               String update = formatter.format(c.getTime());
                        		   				               try
                        		                              {
                        		                                Connection  connection=StoreDBConnection.openConnection();
                        		                                PreparedStatement  preparedStatement=connection.prepareStatement("SELECT * FROM `scheduling` where `pickup_date`='"+update+"' and flag='0'");
                        		                                ResultSet resultset=preparedStatement.executeQuery();
                        		                                while(resultset.next())
                        		                                {
                        		%>
                                 
                                      <tr>       
                                           <td><%=resultset.getString("company_name")%></td>
                                           <td><%=resultset.getString("pickup_date")%></td>
                                       </tr>      
                                               
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
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                    <div class="card">
                        <div class="body bg-teal">
                            <div class="font-bold m-b-20">Return Tomorrow</div>

                            
                            <div class="table-responsive">
                                <table class="table  dashboard-task-infos">
                                    <thead>
                                        <tr>
                                            
                                            <th>Company Name</th>
                                            <th>Date</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        
                                      <%
                        			//Add one date
                        		      			               SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");
                        		   				               Date myDate1 = formatter1.parse(dtf.format(now));
                        		   				               Calendar c1 = Calendar.getInstance();
                        		   				               c.setTime(myDate1);
                        		   				               c.add(Calendar.DATE,1);
                        		   				               String update1 = formatter.format(c1.getTime());
                        		   				               
                        		   				               
                        		   				               try
                        		                              {
                        		                                Connection  connection=StoreDBConnection.openConnection();
                        		                                PreparedStatement  preparedStatement=connection.prepareStatement("SELECT * FROM `scheduling` where `return_date`='"+update1+"' and flag='0'");
                        		                                ResultSet resultset=preparedStatement.executeQuery();
                        		                                while(resultset.next())
                        		                                {
                        		%>
                                 
                                      <tr>       
                                           <td><%=resultset.getString("company_name")%></td>
                                           <td><%=resultset.getString("return_date")%></td>
                                       </tr>      
                                               
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
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="row clearfix">
                <!-- #END# Visitors -->
                <!-- Latest Social Trends -->
                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                    <div class="card">
                        <div class="body bg-cyan">
                            <div class="m-b--35 font-bold">ACTIVITY LOG</div>
                            <ul class="dashboard-stat-list">
                                  <%
                                  	try{
                                            Connection  connect=StoreDBConnection.openConnection();
                                            PreparedStatement preparedStatement=connect.prepareStatement("SELECT * FROM `logfile` where user_id='"+(int) session.getAttribute("store_id")+"' and role='"+(String)session.getAttribute("storerole")+"' ORDER BY id DESC LIMIT 5");
                                            ResultSet result=preparedStatement.executeQuery();
                                            int i = 1;
                                            while(result.next())
                                            {
                                  %>
                               
                                <li>
                                    <%=result.getString("action")%>
                                    <span class="pull-right">
                                        <i class="material-icons">trending_up</i>
                                    </span>
                                </li>
                                     <%	   
                                    }
                               }
                              catch(SQLException sqlexception )
                              {
                            	  sqlexception.printStackTrace();
                              }
                              catch(Exception exception)
                              {
                            	  exception.printStackTrace();
                              }
                             %> 
                            
                            </ul>
                         <center><a role="button" class="btn" class="font-bold" href="reporting.jsp" style="color:white">View More</i></a></center>
                       
                        </div>
                    </div>
                </div>
                <!-- #END# Latest Social Trends -->
                <!-- #END# Answered Tickets -->
            </div>
        </div>
    </section>
      <%@include file="include/script.jsp"%>
</body>
</html>
