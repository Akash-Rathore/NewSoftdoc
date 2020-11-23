<%@page import="com.customerclient.connection.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="include/head.jsp"%>       
 <style>

  h5{
      margin-bottom:25px;
      text-decoration:underline;
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

.loader{
     
    display:none;
      
   }
   
   .logoClient{
      
      width:55px !important;
      height:50px !important;
      
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
                <a class="image" href="index.jsp"><img src="../images/logo5.png" class="logoClient" alt="User" /></a>
            </div>
            <div class="collapse navbar-collapse" id="navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <!-- Notifications -->
                         <%@include file="include/notification.jsp"%>
                     <!-- #END# Notifications -->                   
                </ul>
            </div>
        </div>
    </nav>
    <!-- #Top Bar -->
    <section>
        <!-- Left Sidebar -->
           <%@include file="include/sidebar.jsp"%>
        <!-- #END# Left Sidebar -->
       
    </section>

    <section class="content">
        <div class="container-fluid">
            <div class="block-header">
            </div>
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                               Add File
                            </h2>
                           
                        </div>
                        <div class="body mrgnbtm">
                            <form   method="post" class="form-horizontal" id="addfileform">
                                         <%
                                            String  customer_num="";
                                            String file_num="0";
                                         	try(Connection connection=DBConnection.openConnection(); PreparedStatement preparedStat=connection.prepareStatement("select * from customer_details where id='"+session.getAttribute("cust_id")+"'");)
                                            {
                                                                                 	
                                             	    ResultSet resultset=preparedStat.executeQuery();
                                                    if(resultset.next()){
                                                       
                                                       String customer_number=resultset.getString("customer_number");
                                                       for (int i=0 ;i <customer_number.length(); i++) {
 				                                    	     
 				                           					   if(i==0||i==1||i==2){
 				                           						   
 				                           					   }
 				                           					   else
 				                           					   {
 				                           						   customer_num += customer_number.charAt(i);
 				                           					   }
 				                           				 
 				                           			  }
                                                   }	  	
                                         %> 
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">File No.</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                                <%
                                                        
                           	                          ResultSet resultdf = preparedStat.executeQuery("select * from document_info where company_id='"+session.getAttribute("cust_id")+"' order by file_no desc limit 1");
				                           			  if(resultdf.next()){       
				                           			  String serial_number=resultdf.getString("file_no");
				                           			  for (int i=0 ;i<serial_number.length(); i++) 
				                     				  {
				                                  	     
				                   					    if(i==0||i==1||i==2||i==3||i==4){
				                   						   
				                   						   
				                   					    }
				                   					    else
				                   					    {
				                   						   file_num  += serial_number.charAt(i);
				                   						    
				                   					    }
				                   				 
				                   				      }
				                           	      }		  
				                     			    
				                           			
				                           			 String file_number = String.format ("%06d",Integer.parseInt(file_num)+1);
				                     	        %>
                                                <input type='text' value="<%=customer_num+"9"+file_number%>" name="filenoOfClient" class="form-control show-tick" readonly="readonly">
                                       </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Department</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <select class="form-control show-tick" name="department">
                                                <option selected disable>Select</option>
                                                 <%
                                                         String deptinfo =(String)session.getAttribute("client_department");
                                                         String array[]=deptinfo.split(",");
                                                         for(int i=0;i<array.length;i++)
                                                         {
                                                         %>
                                                          
                                                              <option value="<%=array[i]%>"><%=array[i]%></option>
                                                          
                                                         <% 
                                                           }
                                                         %>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                 <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">File Name <span style="color:red; font-size:18px;">*</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (Max 100 letters)</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                               <input type='text'  name="filename" class="form-control show-tick" value="" maxlength = "100" required="required">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">File Description (Max 500 letters) </label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                            <textarea   name="description"   class="form-control show-tick" maxlength = "500"></textarea>
                                       </div>
                                    </div>
                                </div>
                              
                              
                                        <%
                                               
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
                                    <div class="col-sm-12">
                                          <center>
                                               <button type="submit"  class="btn btn-primary" id="preloader" style="margin-right:20px;">Submit</button>
                                                <div class="loader">
                                                   <img src="../images/preloader.gif"  alt="Loader" style="margin-right:20px;width: 60px;height:60px;">
                                                </div> 
                                               <a href="mydocument.jsp"  class="btn btn-primary" >Return</a>
                                          </center>        
                                    </div>
                                </div>
                           </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <%@include file="include/script.jsp"%>   
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script type="text/javascript">
    $('#addfileform').submit(function(e){
        
   	 e.preventDefault();
        var form=$(this);
   	 var formdata=new FormData($(form)[0]);
   	 var data={};
        formdata.forEach(function(value,key)
   	 {
   		 data[key]=value;
   	 });
        
        Swal.fire({
        	title: 'Are you sure ?',
      	    text: "you will not be able to revert this section",
      	    icon: 'warning',
      	    showCancelButton: true,
      	    cancelButtonText: ' No ',
      	    confirmButtonColor: '#3085d6',
      	    cancelButtonColor: '#d33',
      	    confirmButtonText: 'Yes'
        }).then((result) => {
        	  if (result.value) {
                  
        		  $.ajax({
   	    	       url:"../clientprocess?action=addfile",
   	    	       type:"POST",
   	    	       dataType:"json",
   	    	       data:data,
   	    	       beforeSend:function(){
   		        	
   	 	            $('#preloader').hide(); 
   		        	$('.loader').show();
   	 	    
   		           },
   	    	       success:function(data,textStatus,jqXHR)
   	    	       {
   	   	   	    	   
   	    	    	   if(data.status)
          	               {
          	            	  Swal.fire({
   	     	    			  position: 'center',
   	     	    			  icon: 'success',
   	     	    			  title: 'File Success',
   	     	    			  timer: 2000
   	     	    			})
   	     	    			$('#preloader').show();
	    			        $('.loader').hide();
	    		  	 
   	     	    		    setTimeout(function(){
			     	    		   window.location.href="mydocument.jsp";
			     	    	})
   	     	    			
   	     	    			
          	               }
          	               else
          	               {
          	            	  Swal.fire({
   	     	    			  position: 'top-end',
   	     	    			  icon: 'warning',
   	     	    			  title: 'Something is wrong',
   	     	    			  timer: 2000
   	     	    			 })
   	     	    		    $('#preloader').show();
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