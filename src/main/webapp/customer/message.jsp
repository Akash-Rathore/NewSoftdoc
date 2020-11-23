<%@include file="include/session.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="include/head.jsp"%>

  <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>CUSTOMER ADMIN</title>
    <!-- Favicon-->
    <link rel="icon" href="../images/favicon.png" type="image/x-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">

    <!-- Bootstrap Core Css -->
   <!--  <link href="../plugins/bootstrap/css/bootstrap.css" rel="stylesheet"> -->
    <!-- Waves Effect Css -->
    <link href="../plugins/node-waves/waves.css" rel="stylesheet" />

    <!-- Animation Css -->
    <link href="../plugins/animate-css/animate.css" rel="stylesheet" />

     	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
	

    <!-- Bootstrap Select Css -->
    <!-- <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" rel="stylesheet" /> -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">


    <!-- Custom Css -->
    <link href="../css/style.css" rel="stylesheet">

    <!-- AdminBSB Themes. You can choose a theme from css/themes instead of get all themes -->
    <link href="../css/themes/all-themes.css" rel="stylesheet" />
  
	   <link rel="stylesheet" href="include/chosen.css">

   
		  	
  <style type="text/css">

*{
   margin:0px;
   padding:0px;
}

.bootstrap-select.btn-group .dropdown-toggle .caret {
    /* position: absolute; */
    /* top: 50%; */
    /* right: 12px; */
     margin-top: 0px !important; 
    /* vertical-align: middle; */
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
    


	.chat{
			margin-top: auto;
			margin-bottom: auto;
		}
		.card{
			height: 500px;
			border-radius: 15px !important;
			background-color: rgba(0,0,0,0.4) !important;
		}
		.contacts_body{
			padding:  0.75rem 0 !important;
			overflow-y: auto;
			white-space: nowrap;
		}
		.msg_card_body{
			overflow-y: auto;
		}
		.card-header{
			border-radius: 15px 15px 0 0 !important;
			border-bottom: 0 !important;
		}
	 .card-footer{
		border-radius: 0 0 15px 15px !important;
			border-top: 0 !important;
	}
		.container{
			align-content: center;
		}
		.search{
			border-radius: 15px 0 0 15px !important;
			background-color: #fff !important;
			border:0 !important;
			color:#6c757d !important;
		}
		.search:focus{
		     box-shadow:none !important;
           outline:0px !important;
		}
		.type_msg{

			background-color: #f8f9fa !important;
			border:0 !important;
			color:#6c757d !important;
			height: 60px !important;
			overflow-y: auto;
		
		}
			.type_msg:focus{
		     box-shadow:none !important;
           outline:0px !important;
		}
		.attach_btn{
	         border-radius: 15px 0 0 15px !important;
	         background-color: rgba(0,0,0,0.3) !important;
			 border:0 !important;
			 color: white !important;
			 cursor: pointer;
			 height:53px;
		}
		.send_btn{
	border-radius: 0 15px 15px 0 !important;
	background-color: rgba(0,0,0,0.3) !important;
			border:0 !important;
			color: white !important;
			cursor: pointer;
		}
		.search_btn{
			border-radius: 0 15px 15px 0 !important;
			background-color: rgba(0,0,0,0.3) !important;
			border:0 !important;
			color: white !important;
			cursor: pointer;
		}
		.contacts{
			list-style: none;
			padding: 0;
		}
		.contacts li{
			width: 100% !important;
			padding: 5px 10px;
			margin-bottom: 15px !important;
		}
	.active{
			background-color: rgba(0,0,0,0.3);
	}
		.user_img{
			height: 70px;
			width: 70px;
			border:1.5px solid #f5f6fa;
		
		}
		.user_img_msg{
			height: 40px;
			width: 40px;
			border:1.5px solid #f5f6fa;
		
		}
	.img_cont{
			position: relative;
			height: 70px;
			width: 70px;
	}
	.img_cont_msg{
			height: 40px;
			width: 40px;
	}
	.online_icon{
		position: absolute;
		height: 15px;
		width:15px;
		background-color: #4cd137;
		border-radius: 50%;
		bottom: 0.2em;
		right: 0.4em;
		border:1.5px solid white;
	}
	.offline{
		background-color: #c23616 !important;
	}
	.user_info{
		margin-top: auto;
		margin-bottom: auto;
		margin-left: 15px;
	}
	.user_info span{
		font-size: 20px;
		color: white;
	}
	.user_info p{
	font-size: 10px;
	color: rgb(253 253 253);
	}
	.video_cam{
		margin-left: 50px;
		margin-top: 5px;
	}
	.video_cam span{
		color: #6c757d;
		cursor: pointer;
		margin-right: 20px;
	}
	.msg_cotainer{
		margin-top: auto;
		margin-bottom: auto;
		margin-left: 10px;
		border-radius: 25px;
		background-color: #82ccdd;
		padding: 10px;
		position: relative;
		font-size:15px;
	}
	.msg_cotainer_send{
		margin-top: auto;
		margin-bottom: auto;
		margin-right: 10px;
		border-radius: 25px;
		background-color: #78e08f;
		padding: 10px;
		position: relative;
		font-size:15px;
	}
	.msg_time{
		position: absolute;
		left: 0;
		bottom: -15px;
		color: rgb(108 117 125);
		font-size: 10px;
		width:122px;
	}
	.msg_time_send{
		position: absolute;
		right:0;
		bottom: -15px;
		color: rgb(108 117 125);
		font-size: 10px;
		width:122px;
	}
	.msg_head{
		position: relative;
	}
	#action_menu_btn{
		position: absolute;
		right: 10px;
		top: 10px;
		color: white;
		cursor: pointer;
		font-size: 20px;
	}
	.action_menu{
		z-index: 1;
		position: absolute;
		padding: 15px 0;
		background-color: rgba(0,0,0,0.5);
		color: white;
		border-radius: 15px;
		top: 30px;
		right: 15px;
		display: none;
	}
	.action_menu ul{
		list-style: none;
		padding: 0;
	margin: 0;
	}
	.action_menu ul li{
		width: 100%;
		padding: 10px 15px;
		margin-bottom: 5px;
	}
	.action_menu ul li i{
		padding-right: 10px;
	
	}
	.action_menu ul li:hover{
		cursor: pointer;
		background-color: rgba(0,0,0,0.2);
	}
	@media(max-width: 576px){
	.contacts_card{
		margin-bottom: 15px !important;
	}
	}

.input-group-append > input {
  display: none;
}
</style>
</head>
<body>
	<!-- Overlay For Sidebars -->
	<div class="overlay"></div>
	<!-- #END# Overlay For Sidebars -->
	<!-- Top Bar -->
	<nav class="navbar" style="padding:0px !important;">
	<div class="container-fluid"  style="background:#fff;">
		<div class="navbar-header" style="margin-right: auto !important;">
			<a href="javascript:void(0);" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar-collapse"
				aria-expanded="false"></a> <a href="javascript:void(0);"
				class="bars"></a> <a class="image" href="index.jsp"><img
				src="../images/logo5.png" class="logoClient" alt="User" /></a>
		</div>
	 	<div class="collapse navbar-collapse" id="navbar-collapse" style="background:#fff;">
			<ul class="nav navbar-nav navbar-right">
	
	<%--    <%@include file="include/message.jsp"%>
	 		    <%@include file="include/notification.jsp"%>
				<%@include file="include/profile-pic.jsp"%> --%>
			</ul>
		</div>
   
    </div>
	     <div class="container-fluid" style="height: 38px; background: #6c757d;">
	   
	          <div style="position:relative;padding-left:242px;">
                  <input type="text" name="" id="input_css" value="" style="height: 27px;font-size: 15px;position:inherit ; top:0px ;width: 400px !important; border: 2px solid #6c757d; border-radius: 25px;padding-left:10px; " placeholder="Search in Softdoc Cloud" />
                  <a href="search.jsp"  style="font-size: 16px;padding-left:130px;position:inherit;top:0px;color:#fff;">Advance Search</a>
               <!--    <a href="javascript:void(0);" class="details" style="text-decoration:none;color:#fff;padding-left:232px;"><i class='material-icons' style='color:#fff ; border-radius:13px;'>info</i></a>
                -->  
       
                  
                  
<!--              <a href="#"  style="text-decoration:none;color:#fff;padding-left:309px;"><span style="font-size:32px;font-weight:bold;">+</span></a>
 -->          
 <!--     <a href="javascript:void(0);"  class="delete-all-document access_level_hide" style="text-decoration:none;color:#fff;padding-left:148px;"><span style="font-size:32px;font-weight:bold;"><i class="material-icons">delete</i></span></a>
 -->	          
	          </div>
	       
        </div>
		<div class="container-fluid"
			style="font-size: 15px;position: fixed; bottom: 0; width: 100%; height: 37px; background: #6c757d; display: flex; flex-direction: row; justify-content: space-between; align-items: center;">
			<div>
				<a href="reporting.jsp" style="color: #fff; text-decoration: none;">Report
					Problem</a>
			</div>
			<div style="color: #fff;">
				<a href="#" style="color: #fff; text-decoration: none;">[Copyright
					Information]</a>
			</div>
			<div style="color: #fff;">
				<a href="#"
					style="color: #fff; padding-right: 40px; text-decoration: none;">Term
					& Condition</a> <a href="#" style="color: #fff; text-decoration: none;">Privacy
					Policy</a>
			</div>
		</div>
</nav>
	
	
	<!-- #Top Bar -->
	<section>
		<!-- Left Sidebar -->
		<%@include file="include/sidebar.jsp"%>
		<!-- #END# Left Sidebar -->
	</section>
	<section class="content" >
		<div class="container-fluid">
			<div class="block-header">
				<h2></h2>
			</div>
			<div class="row"
				style="margin-right: -28px !important; margin-left: -156px !important;">

                   <div class="col-md-4  chat">
					<div class="card  contacts_card">
					  <div class="card-header" style="background:#6c757d;">
						<div class="input-group">
							<input type="text" placeholder="Search..." name="" style="height:38px; !important;padding-left: 20px;font-size:19px;" class="form-control search">
							<div class="input-group-prepend">
								<span class="input-group-text search_btn" style="width:40px;"><i style="font-size:18px;" class="fas fa-search"></i></span>
							</div>
						</div>
					</div>
					<div class="card-body contacts_body" style="background: #fff;">
						<ui class="contacts name_data" style="background: #fff;">
						 
						<!--  <li class="active" style="background: #fff;">
							<div class="d-flex bd-highlight" style="background:#6c757d;">
								<div class="img_cont">
									<img src="https://static.turbosquid.com/Preview/001292/481/WV/_D.jpg" class="rounded-circle user_img">
									<span class="online_icon"></span>
								</div>
								<div class="user_info">
									<span>Khalid</span>
									<p>Kalid is online</p>
								</div>
							</div>
						</li> -->
						
						</ui>
					</div>
					<div class="card-footer"></div>
				</div></div>



				<div class="col-md-8  chat">
					<div class="card">
						<div class="card-header msg_head" style="background:#6c757d;">
							<div class="d-flex bd-highlight" style="background:#6c757d;">
								<div class="img_cont profile_image">
									<img src="https://cdn.iconscout.com/icon/free/png-512/avatar-380-456332.png" class="rounded-circle user_img">
									<span class="online_icon"></span>
								</div>
								<div class="user_info profile_info">
								</div>
						 	    	
							     <div class="video_cam"> 
									
								</div> 
								
							</div>
							<span id="action_menu_btn"><i class="fas fa-ellipsis-v"></i></span>
							<div class="action_menu">
								<ul>
									<li class="chat-group"><i class="fas fa-plus chat-group"></i> Add to group</li>
								</ul>
							</div>
						</div>
						<div class="card-body msg_card_body chat_html" style="background-color: #fff;">
							
							
					     <div class="d-flex justify-content-start mb-4">
								<div class="img_cont_msg">
									<img src="https://static.turbosquid.com/Preview/001292/481/WV/_D.jpg" class="rounded-circle user_img_msg">
								</div>
								<div class="msg_cotainer">
									Select Users
								</div>
						 </div> 
						
						<!-- 	<div class="d-flex justify-content-end mb-4">
								<div class="msg_cotainer_send">
									Hi Khalid i am good tnx how about you?
									<span class="msg_time_send">8:55 AM, Today</span>
								</div>
								<div class="img_cont_msg">
							<img src="https://cdn.iconscout.com/icon/free/png-512/avatar-380-456332.png">
								</div>
							</div> -->
						<!-- 	<div class="d-flex justify-content-start mb-4">
								<div class="img_cont_msg">
									<img src="https://static.turbosquid.com/Preview/001292/481/WV/_D.jpg" class="rounded-circle user_img_msg">
								</div>
								<div class="msg_cotainer">
									I am good too, thank you for your chat template
									<span class="msg_time">9:00 AM, Today</span>
								</div>
							</div> -->
							
							<!-- <div class="d-flex justify-content-end mb-4">
								<div class="msg_cotainer_send">
									You are welcome
									<span class="msg_time_send">9:05 AM, Today</span>
								</div>
								<div class="img_cont_msg">
							      <img src="https://cdn.iconscout.com/icon/free/png-512/avatar-380-456332.png" class="rounded-circle user_img_msg">
								</div>
							</div> -->
							
							<!-- <div class="d-flex justify-content-start mb-4">
								<div class="img_cont_msg">
									<img src="https://static.turbosquid.com/Preview/001292/481/WV/_D.jpg" class="rounded-circle user_img_msg">
								</div>
								<div class="msg_cotainer">
									I am looking for your next templates
									<span class="msg_time">9:07 AM, Today</span>
								</div>
							</div> -->
							<!-- <div class="d-flex justify-content-end mb-4">
								<div class="msg_cotainer_send">
									Ok, thank you have a good day
									<span class="msg_time_send">9:10 AM, Today</span>
								</div>
								<div class="img_cont_msg">
						<img src="https://cdn.iconscout.com/icon/free/png-512/avatar-380-456332.png" width="40">
								</div>
							</div> -->
							
							<!-- <div class="d-flex justify-content-start mb-4">
								<div class="img_cont_msg">
									<img src="https://static.turbosquid.com/Preview/001292/481/WV/_D.jpg" class="rounded-circle user_img_msg">
								</div>
								<div class="msg_cotainer">
									Bye, see you
									<span class="msg_time">9:12 AM, Today</span>
								</div>
							</div> -->
						
						</div>
						<div class="card-footer" style="background-color: #6c757d;">
							<div class="input-group">
								<div class="input-group-append">
								    <label for="file-input">
									    <span  class="input-group-text attach_btn" style="width:40px;"><i style="font-size:23px;" class="fas fa-paperclip"></i></span>
								    </label>  
								    <input type="file" name="chat_attachement"  id="file-input"  />
								</div>
								
								<textarea name="" class="form-control type_msg" placeholder="Type your message..." style="height:55px !important;font-size:15px !important;"></textarea>
								<div class="input-group-append">
								   <span class="input-group-text send_btn" id="chat-input" style="width:40px;"><i style="font-size:23px;" class="fas fa-location-arrow"></i></span>
								</div>
							</div>
						</div>
					</div>
				</div>
            </div>
		</div>
	</section>
	
   <%@include file="include/loader.jsp"%>
   <%@include file="include/footer.jsp"%>
   <script src="include/custom-script.js"></script>  
   <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script> 
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
   <script type="text/javascript">
   
   function client_chat_details(){
		
	 	  var chat_details_id = sessionStorage.getItem("chat_details_id");
		  document.getElementById("chat-input").setAttribute("data-id", chat_details_id);
		  
		  $.ajax({
			   
			    url: "./customerprocess?action=client_chat_details",
		        type: "post",
		        dataType:"json",
		        data:{"client_id":chat_details_id},
		        success: function(data)
		        {
		            
		            	var obj = JSON.parse(JSON.stringify(data.single_client_details));
		            	console.log(obj);
		            	html_data_client="";
		            	html_image="";
		                $.each(obj,  function( key, value ) {
		                	
		                	html_data_client +='<span>'+value.name+'</span>'
		                	html_data_client +='<p>'+value.email+'</p>'
		                	
		                	if(value.image_upload){
		                	 html_image +='<img src='+value.image_upload+' class="rounded-circle user_img">'		
						    }else{
		                     html_image +='<img src="https://cdn.iconscout.com/icon/free/png-512/avatar-380-456332.png" class="rounded-circle user_img">'		
		                 	}
		                	
				        })
				        
				           var html_data='';
				           var fetch_send_message = JSON.parse(JSON.stringify(data.fetch_send_message));
				           
				           console.log(fetch_send_message);
				           
				           $.each(fetch_send_message ,  function( key, value ) {
				         	
				         	 if(value.direction_rule=='left'){	
					           	 
				         		 html_data +='<div class="d-flex justify-content-end mb-4">'	
					         	
				         		  if(value.attachement){
				         				if(value.attachement !=null){
						         	 	 html_data +='<div class="msg_cotainer_send">'+value.new_message+' '+value.attachement+''
				         				}else{
				         					html_data +='<div class="msg_cotainer_send">'+value.new_message+''
				         				}
					         		 	 
				         				}else{
						         		 html_data +='<div class="msg_cotainer_send">'+value.new_message+''
								  }
				         		 
					         	 html_data +='<span class="msg_time_send">'+value.date_time+'</span>'
					         	 html_data +='</div>'		
					 			 html_data +='<div class="img_cont_msg">'
					 		     if(value.image_upload){
								    html_data +='<img src='+value.image_upload+' class="rounded-circle user_img_msg">'
						           }else{
						         	html_data +='<img src="https://cdn.iconscout.com/icon/free/png-512/avatar-380-456332.png" class="rounded-circle user_img_msg">'
						          }
						         html_data +='</div>'
					 			 html_data +='</div>'	
					         
				         	 } else if(value.direction_rule == 'right'){
				         		 
				         		
				         		html_data +='<div class="d-flex justify-content-start mb-4">'
				         		html_data +='<div class="img_cont_msg">'
				         		   if(value.image_upload){
						 		    html_data +='<img src='+value.image_upload+' class="rounded-circle user_img_msg">'
				         		   }else{
				         	         html_data +='<img src="https://cdn.iconscout.com/icon/free/png-512/avatar-380-456332.png" class="rounded-circle user_img_msg">'
				         		   }
				         		html_data +='</div>'
				         		if(value.attachement){
				         			
				         			if(value.attachement !=null){
										 html_data +='<div class="msg_cotainer">'+value.new_message+' '+value.attachement+''
				         			}else{
				         				 html_data +='<div class="msg_cotainer">'+value.new_message+''
				 			        }
								
				         		}else{
							        	 html_data +='<div class="msg_cotainer">'+value.new_message+''
								}
				         		html_data +='<span class="msg_time">'+value.date_time+'</span>'
				         		html_data +='</div>'
				         		html_data +='</div>'
				    		   
				         	 }
				 			 
								
				          })
				         	
				         $('.profile_info').html(html_data_client); 
			             $('.profile_image').html(html_image);
		                 $('.chat_html').html(html_data);	
					        
		        },
		  	    error:function(e)
		  	    {
		  	    	console.log("error in pages");
		  	    }
		     
		   }); 
		  
	   
	  }

	
	  setInterval(function(){
		client_chat_details() 
	  }, 5000); 
	
   
   
	 $(document).ready(function(){
		 
		 $('#loader').show(); 
		 $.ajax({
			 
	 		   url:"./customerprocess?action=clients",
	 		   type:"POST",
	 		   dataType:"json",
			   success:function(data,textStatus,jqXHR)
	 		   {
	 			    
				   
				    var obj = JSON.parse(data.name);
				    console.log(obj);
				    
				   
	 			    var name_data="";
	 			    $.each(obj,  function( key, value ) {
	 			    
	 			    	name_data +='<a href="javascript:void(0);" class="client_chat_details" style="text-decoration:none;" data-id='+value.id+'>'
	 			    	name_data +='<li class="active" style="background: #fff;">'
	 			    	name_data +='<div class="d-flex bd-highlight" style="background:#6c757d;">'
	 			    	name_data +='<div class="img_cont">'
	 			        if(value.upload){	
	 			    	 name_data +='<img src='+value.upload+' class="rounded-circle user_img">'
	 			        }else{
	 			         name_data +='<img src="https://cdn.iconscout.com/icon/free/png-512/avatar-380-456332.png" class="rounded-circle user_img">'
	 			   	    }
	 			    	name_data +='</div>'
	 			    	name_data +='<div class="user_info"><span>'+value.name+'</span><p>'+value.email+'</p>'
	 			    	name_data +='</div>'
	 			    	name_data +='</div>'
	 			    	name_data +='</li></a>';	
	 			    });
		    
	 			   $('.name_data').html(name_data);	    
				   $('#loader').hide();
		 		     
	 		   },
	 		   error:function(e)
	 		   {
	 			 $('#loader').hide();
	 			  console.log("error in pages");
	 		   }

	 	});    
	  
  })	 
   
  
  
  $(document).on('click' , '.send_btn' , function(){
	    
		 var formData = new FormData();
		 formData.append('chat_attachement' , $("#file-input")[0].files[0]);
		 formData.append('new_message' , $('.type_msg').val());
		 formData.append('send_id' , $(this).data('id'));
		
		
		 
		 if($('.sel').val()){
			 formData.append('chat_attachement' , $("#file-input")[0].files[0]);
			 formData.append('new_message' , $('.type_msg').val());
			 formData.append('send_id' , $(this).data('id'));
			 formData.append('group_chat_id' , $('.sel').val());
		 }else{
			 formData.append('chat_attachement' , $("#file-input")[0].files[0]);
			 formData.append('new_message' , $('.type_msg').val());
			 formData.append('send_id' , $(this).data('id'));
		 }
		 
		  
		  $.ajax({
			   
		        url: "./customerprocess?action=client_message",
		        enctype: 'multipart/form-data',
		        type: "post",
		        dataType:"json",
		        processData: false,
	            contentType: false,
		        data:formData,
		        success: function(data)
		        {
		            console.log(data.status);	
		            
		           
		         	var obj = JSON.parse(JSON.stringify(data.fetch_send_message));
		         	console.log(obj);
		         	
		         	var html_data="";
		         	$.each(obj,  function( key, value ) {
		         	
		         	 if(value.direction_rule=='left'){	
			           	 
		         		 html_data +='<div class="d-flex justify-content-end mb-4">'
		         		 
			         	 if(value.attachement){
		         		 	
			         		if(value.attachement !=null){ 
			         		    html_data +='<div class="msg_cotainer_send">'+value.new_message+' '+value.attachement+''
			         		}else{
			         			html_data +='<div class="msg_cotainer_send">'+value.new_message+''
			         		}
			         		
			         	 }else{
			         		 html_data +='<div class="msg_cotainer_send">'+value.new_message+''
						 }
		         		 
			         	 html_data +='<span class="msg_time_send">'+value.date_time+'</span>'
			         	 html_data +='</div>'		
			 			 html_data +='<div class="img_cont_msg">'
			 		    
			 			 if(value.image_upload){
			 		    	  html_data +='<img src='+value.image_upload+' class="rounded-circle user_img_msg">'
					      }else{
			 		    	  html_data +='<img src="https://cdn.iconscout.com/icon/free/png-512/avatar-380-456332.png" class="rounded-circle user_img_msg">'
					      }
						  html_data +='</div>'
			 			  html_data +='</div>'	
			         
		         	 } else if(value.direction_rule == 'right'){
		         		 
		         		
		         		html_data +='<div class="d-flex justify-content-start mb-4">'
		         		html_data +='<div class="img_cont_msg">'
		         		if(value.image_upload){
				 		   html_data +='<img src='+value.image_upload+' class="rounded-circle user_img_msg">'
						}else{
						   html_data +='<img src="https://cdn.iconscout.com/icon/free/png-512/avatar-380-456332.png" class="rounded-circle user_img_msg">'
						}
						html_data +='</div>'
						
						if(value.attachement){
						  
							if(value.attachement !=null){ 
							 html_data +='<div class="msg_cotainer">'+value.new_message+' '+value.attachement+''
							}else{
								html_data +='<div class="msg_cotainer">'+value.new_message+''
							}
							 
						}else{
				        	 html_data +='<div class="msg_cotainer">'+value.new_message+''
						}
		         		html_data +='<span class="msg_time">'+value.date_time+'</span>'
		         		html_data +='</div>'
		         		html_data +='</div>'
		    		   
		         	 }
		 			 
						
		          })
		         	
		         $('.type_msg').val('') 
		         $('.chat_html').html(html_data);
		           
		        
		        },
		  	    error:function(e)
		  	    {
		  	    	console.log("error in pages");
		  	    }
		     
		   }); 
	 
		  
	  });
   
	 
	 
	 $(document).ready(function(){
		 	
		    $(document).on('click' , '.client_chat_details' , function(){

		    	var id=$(this).data('id');
		    	
		    	$('#chat-input').data('id' , id);
		    	sessionStorage.setItem("chat_details_id", id); 
		    	
		    	
		    	 $.ajax({
					   
				        url: "./customerprocess?action=client_chat_details",
				        type: "post",
				        dataType:"json",
				        data:{"client_id":id},
				        success: function(data)
				        {
				                console.log(data.status);
				            	var obj = JSON.parse(JSON.stringify(data.single_client_details));
				            	console.log(obj);
				            	html_data_client="";
				            	html_image="";
				               
				            	
				            	$.each(obj,  function( key, value ) {
				                	
				                	html_data_client +='<span>'+value.name+'</span>'
				                	html_data_client +='<p>'+value.email+'</p>'
				                	
				                	if(value.image_upload){
				                	 html_image +='<img src='+value.image_upload+' class="rounded-circle user_img">'		
								    }else{
				                     html_image +='<img src="https://cdn.iconscout.com/icon/free/png-512/avatar-380-456332.png" class="rounded-circle user_img">'		
				                 	}
				                	
						        })
						        
						          var html_data='';
						          var fetch_send_message = JSON.parse(JSON.stringify(data.fetch_send_message));
						           
						          $.each(fetch_send_message ,  function( key, value ) {
						         	
						         	 if(value.direction_rule=='left'){	
							           	 
						         		 html_data +='<div class="d-flex justify-content-end mb-4">'	
						         		 
					         			 if(value.attachement){
					         			
					         				if(value.attachement !=null){
					         				 html_data +='<div class="msg_cotainer_send">'+value.new_message+' '+value.attachement+''
					         				}else{
					         			
					         			     html_data +='<div class="msg_cotainer_send">'+value.new_message+''
								        	}
					         				 
					         			 }else{
							         		 html_data +='<div class="msg_cotainer_send">'+value.new_message+''
										 }
							         	 html_data +='<span class="msg_time_send">'+value.date_time+'</span>'
							         	 html_data +='</div>'		
							 			 html_data +='<div class="img_cont_msg">'
							 			 html_data +='<img src="https://cdn.iconscout.com/icon/free/png-512/avatar-380-456332.png" class="rounded-circle user_img_msg">'
							 			 html_data +='</div>'
							 			 html_data +='</div>'	
							         
						         	 } else if(value.direction_rule == 'right'){
						         		 
						         		
						         		html_data +='<div class="d-flex justify-content-start mb-4">'
						         		html_data +='<div class="img_cont_msg">'
						         		html_data +='<img src="https://cdn.iconscout.com/icon/free/png-512/avatar-380-456332.png" class="rounded-circle user_img_msg">'
						         		html_data +='</div>'
						         	    if(value.attachement){
						         	    	if(value.attachement !=null){ 
												 html_data +='<div class="msg_cotainer">'+value.new_message+' '+value.attachement+''
						         	    	}else{
						         	    		html_data +='<div class="msg_cotainer">'+value.new_message+''
						         	    	}
												 
						         	    }else{
									        	 html_data +='<div class="msg_cotainer">'+value.new_message+''
										}
						         		html_data +='<span class="msg_time">'+value.date_time+'</span>'
						         		html_data +='</div>'
						         		html_data +='</div>'
						    		   
						         	 }
						 			 
										
						          })
						         	
						         $('.profile_info').html(html_data_client); 
					             $('.profile_image').html(html_image);
				                 $('.chat_html').html(html_data);	
							        
				        },
				  	    error:function(e)
				  	    {
				  	    	console.log("error in pages");
				  	    }
				     
				   });
		    	
			});
	 });
	
	 
	
	 
	 $(document).on('keyup' , '.search' , function(){
	     
		   
		   $.ajax({
		        url: "./customerprocess?action=suggestionName",
		        type: "post",
		        dataType:"json",
		        data:{"search_box":$(this).val()},
		        success: function(data)
		        {
		        	
		            var obj = JSON.parse(JSON.stringify(data.name));
		            
		            $('.remove').remove();
		            var name_data="";
		            $.each(obj,  function( key, value ) {
		 			    
		            	name_data +='<a href="javascript:void(0);" class="client_chat_details" style="text-decoration:none;"  data-id='+value.id+'>'
	 			    	name_data +='<li class="active remove" style="background: #fff;">'
	 			    	name_data +='<div class="d-flex bd-highlight" style="background:#6c757d;">'
	 			    	name_data +='<div class="img_cont">'
	 			        if(value.upload){	
	 			    	 name_data +='<img src='+value.upload+' class="rounded-circle user_img">'
	 			        }else{
	 			         name_data +='<img src="https://cdn.iconscout.com/icon/free/png-512/avatar-380-456332.png" class="rounded-circle user_img">'
	 			   	    }
	 			    	name_data +='</div>'
	 			    	name_data +='<div class="user_info"><span>'+value.name+'</span><p>'+value.email+'</p>'
	 			    	name_data +='</div>'
	 			    	name_data +='</div>'
	 			    	name_data +='</li></a>';	
	 			    });
		            
		            $('.name_data').html(name_data);	 
		        
		        },
		  	    error:function(e)
		  	    {
		  	    	console.log("error in pages");
		  	    }
		     }); 
	 
	  });
	 
	 

	 
   </script>
	
</body>
</html>