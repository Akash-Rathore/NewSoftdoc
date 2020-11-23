<%@include file="include/session.jsp"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>   
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>SOFTDOC ADMIN </title>
    <!-- Favicon-->
    <link rel="icon" href="../images/favicon.png" type="image/x-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">

    <!-- Bootstrap Core Css -->
    <link href="../plugins/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Waves Effect Css -->
    <link href="../plugins/node-waves/waves.css" rel="stylesheet" />

    <!-- Animation Css -->
    <link href="../plugins/animate-css/animate.css" rel="stylesheet" />
    <!-- Bootstrap Select Css -->
    <link href="../plugins/bootstrap-select/css/bootstrap-select.css" rel="stylesheet" />
    <!-- Custom Css -->
    <link href="../css/style.css" rel="stylesheet">

    <!-- AdminBSB Themes. You can choose a theme from css/themes instead of get all themes -->
    <link href="../css/themes/all-themes.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" rel="stylesheet"/> 
       <!-- Modal  -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
          <%@include file="include/leftsidebar.jsp"%>
        <!-- #END# Left Sidebar -->
    </section>
    <section class="content">
        <div class="container-fluid">
            <div class="block-header">
                <h2>
                    Complaint List
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
                                           Complaint List
                                        </div>
                                    </h2>
                                </div>
                            </div>
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-hover" id="myTable" >
                                <thead>
                                       <tr>
                                              <th>Complaint ID</th>
                                              <th>Company Name</th>
                                              <th>Username</th>
                                              <th>Raised On</th>
                                              <th>Department</th> 
                                              <th>Status</th>
                                              <th width="35px;">Remark</th> 
                                          
                                        </tr>
                                </thead>
                                <tbody>
                                   
                                        <%
                                                 try( Connection  connection=StoreDBConnection.openConnection();PreparedStatement preparedStatement=connection.prepareStatement("SELECT DISTINCT(complain_id), cl.id as did ,c.company_per_name, cl.area_of_issue , c.id, c.company_name, cl.attachment, cl.status, cl.date, c.depart_info  FROM complain_list as cl, customer_details as c, softdoc_staff as s WHERE cl.customer_id = c.id and cl.client_id is null GROUP BY complain_id");) {
                                                         ResultSet resultset=preparedStatement.executeQuery();
                                                         while(resultset.next())
                                                           {
                                           %>          
                                        <tr>   	
                                        	
                                        	 <td>
                                        		
                                        		  <a href="#my_modal_<%=resultset.getString("complain_id")%>"  data-toggle="modal"><%=resultset.getString("complain_id")%></a>
                                        		  
					                        </td>  
                                            <td><%=resultset.getString("company_name")%></td>
                                             <td><%=resultset.getString("company_per_name")%></td>
                                      <%
                                     	   final String OLD = "yyyy-MM-dd hh:mm:ss";
                             			   final String NEW = "dd MMM yyyy";
                             			   SimpleDateFormat simpleDateFormat = new SimpleDateFormat(OLD);
                                           Date date = simpleDateFormat.parse(resultset.getString("date"));
                                           simpleDateFormat.applyPattern(NEW);
                             			   String logintime = simpleDateFormat.format(date);
                                      %>
                                            <td><%=logintime%></td>
	                                        <td><%=resultset.getString("depart_info")%></td>
	                                           <td width="15%">
	                                             <select class="form-control status"  data-id="<%=resultset.getString("complain_id")%>">
	                                            	     <option value="<%=resultset.getString("status")%>"><%=resultset.getString("status")%></option>
	                                            		 <option value="Raised">Raised</option>
	                                            		 <option value="Pending">Pending</option>
	                                            		 <option value="Complete">Complete</option>
	                                              </select>
	                                        </td>
	                                        <td>
                                               		<form action="../Process?action=complainlistremark" method='post' class='form-submit'>
	                                                     <input type="text"  name="remark" value=""/>  
	                                                     <br>
	                                                     <input type="hidden"   name="id" value="<%=resultset.getString("did")%>">
                                                     	 <input type="submit" value="submit" class="btn btn-primary">
                                                    </form>
                                            </td>       
	                                  </tr>
	                                  
	                                  
	                                  	   <div class="modal" id="my_modal_<%=resultset.getString("complain_id")%>">
											  <div class="modal-dialog">
											    <div class="modal-content">
											      <div class="modal-header">
											        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
											          <h4 class="modal-title">Complain Description</h4>
											      </div>
											      <div class="modal-body">
											          <p> <%=resultset.getString("area_of_issue")%></p>
											          <br> 
											          <h5>Attachment</h5>
											         <a href="<%=resultset.getString("attachment")%>">Download</a>
											      </div>
											      <div class="modal-footer">
											         <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
											      </div>
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
                                       </tbody>
                                       </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            
        </div>
       
    </section>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   
   <!-- Bootstrap Core Js -->
    <script src="../plugins/bootstrap/js/bootstrap.js"></script>

    <!-- Select Plugin Js -->
    <script src="../plugins/bootstrap-select/js/bootstrap-select.js"></script>

    <!-- Slimscroll Plugin Js -->
    <script src="../plugins/jquery-slimscroll/jquery.slimscroll.js"></script>

    <!-- Waves Effect Plugin Js -->
    <script src="../plugins/node-waves/waves.js"></script>

    <!-- Custom Js -->
    <script src="../js/admin.js"></script>

    <!-- Demo Js -->
    <script src="../js/demo.js"></script>
   
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script type="text/javascript">
        $(".status").on('change', function(){    
        	  let status=$(this).val();
        	  var data={ status:$(this).val() ,id:$(this).data('id') }
        	  console.log(data);
        	  console.log(status);
        	  $.ajax({
  	            url: "../Process?action=complainlistupdate",
  	            dataType:"json",
  	            type: "post",
  	            data:data,
  	            success: function(data)
  	            {
  	            	if(data.status)
	    	         {
	     	    		
	     	    		Swal.fire({
	     	    			  position: 'top-end',
	     	    			  icon: 'success',
	     	    			  title: 'Status Change to '+status,
	     	    			  showConfirmButton: false,
	     	    			  timer: 3500	
	     	    			})
	     	    	       //setTimeout(function(){location.reload();},3500);
	     	    			  
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
	    	    	  } 
  	             
  	           },
	    	    error:function(e)
	    	    {
	    	    	console.log("error in pages");
	    	    }
  	        });
        	   
            
         });
  //====================================//=========================
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
	  $.ajax({
           
	       url:$(form).attr('action'),
	       type:"POST",
	       dataType:"json",
	       data:data,
	       success:function(data,textStatus,jqXHR)
	       {
	    	 
 	    	 if(data.status)
	         {
 	    		
 	    		Swal.fire({
 	    			  position: 'top-end',
 	    			  icon: 'success',
 	    			  title: 'Remark update Successfully',
 	    			  showConfirmButton: false,
 	    			  timer: 2500
 	    			})
 	    		    //setTimeout(function(){location.reload();},3000);
 	    			$('.form-submit').trigger("reset");
 	    	  }
	    	  else 
	    	  {
	    		   Swal.fire({
	    			  icon:'error',
	    			  title:'Remark not update Successfully',
	    			  text:"wrong",
	    			  footer:'',
	    			  timer:3000
	    			}) 
	    	  }    
	      },
	    error:function(e)
	    {
	    	console.log("error in pages");
	    }
   
    }); 

 });
  </script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
     <script>
     $(document).ready( function () {
         $('#myTable').DataTable({
        	    "searching":false,
                "lengthMenu":[25,50],
                "pageLength":25
          });
     } );
    </script> 
   
    </body>
</html>