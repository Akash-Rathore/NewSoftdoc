<%@include file="include/session.jsp" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>CUSTOMER CLIENT</title>
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
  
    <style>
    
      .logoClient{
      
      width:55px !important;
      height:50px !important;
      
      
      }
      
    .sizeWidth{
    width:685px !important;
    text-align:left !important;
    height:40px !important;
    font-size:18px !important;
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
                                      	<div class="row">
                                      		<a href="#questionOne" style="background: #6c757d;color:#fff;" class="btn sizeWidth text-center" data-toggle="collapse">Q. How do I navigate the Softdoc portal?</a>
                                      	</div>
                                         <div id="questionOne" class="collapse">
                                            <h5>Navigation is very easy and intuitive. The Sidebar at the left side is always available to help you in navigating the different options like Dashboard, Search, Starred Documents and Support. Your Profile picture and profile options are also housed in the Sidebar.
                                            </h5>
                                        </div>
                                        
                                        <div class="row" style="margin-top:10px !important;">
                                      		<a href="#questionTwo" style="background: #6c757d;color:#fff;" class="btn  sizeWidth" data-toggle="collapse">Q. What is the Dashboard?</a>
                                      	</div>
                                         <div id="questionTwo" class="collapse">
                                            <h5>Your Dashboard is your primary records space where you can see all the files you have access to and add more files if you want.
                                         </h5>
                                        </div>
                                       
                                         <div class="row" style="margin-top:10px !important;">
                                      		<a href="#questionThree" style="background: #6c757d;color:#fff;" class="btn  sizeWidth" data-toggle="collapse">Q. What is Search?</a>
                                      	</div>
                                         <div id="questionThree" class="collapse">
                                            <h5>When you quickly want to access the correct document, you can use search to retrieve only the relevant records by using the advanced filtering criteria like department, document type and further drill-down the results by entering anything in the index fields.</h5>
                                        </div>
                                         <div class="row" style="margin-top:10px !important;">
                                      		<a href="#questionFour" style="background: #6c757d;color:#fff;" class="btn  sizeWidth" data-toggle="collapse">Q.What is Starred?</a>
                                      	</div>
                                         <div id="questionFour" class="collapse">
                                            <h5>You can save your frequently accessed or important records by marking a star. They will then be always available under "Starred"
                                            </h5>
                                        </div>
                                         
                                         <div class="row" style="margin-top:10px !important;">
                                      		<a href="#questionFive" style="background: #6c757d;color:#fff;" class="btn  sizeWidth" data-toggle="collapse">Q. What is Indexing?
                                      		</a>
                                      	</div>
                                         <div id="questionFive" class="collapse">
                                            <h5>
                                              Indexing are certain meta data and searchable criteria we attach with all your documents. Although not mandatory, it is recommended you fill in as many Index Fields as available. This will make the records easily searchable for anyone other than you. If later you forget the attachment name or the file in which you saved it, you can easily retrieve it using any of the Index Fields.
                                            </h5>
                                        </div>
                                             <div class="row" style="margin-top:10px !important;">
                                      		<a href="#questionSix" style="background: #6c757d;color:#fff;" class="btn  sizeWidth" data-toggle="collapse">Q. What if I made a mistake in the Index Fields or uploaded incorrect attachment?
                                      		</a>
                                      	</div>
                                         <div id="questionSix" class="collapse">
                                            <h5>
                                              Every File, Folder and Document can bee edited by a button at the right side of their name.
                                            </h5>
                                        </div>
                                       
                                       <div class="row" style="margin-top:10px !important;">
                                      		<a href="#questionSeven" style="background: #6c757d;color:#fff;" class="btn  sizeWidth" data-toggle="collapse">Q. What if I deleted a document by mistake?</a>
                                      	</div>
                                         <div id="questionSeven" class="collapse">
                                            <h5>
                                               All deleted documents are available in the "Trash" for 30 days before being auto deleted.
                                            </h5>
                                        </div>
                                        
                                         <div class="row" style="margin-top:10px !important;">
                                      		<a href="#questionEight" style="background: #6c757d;color:#fff;" class="btn  sizeWidth" data-toggle="collapse">Q. Can I upload documents from my computer?</a>
                                      	</div>
                                         <div id="questionEight" class="collapse">
                                            <h5>
                                               Yes. Softdoc has been designed to eliminate your local computer storage. Just like on a computer, you can upload your data in files, arranged under Folders and Document Types
                                            </h5>
                                        </div>   
                                           
                                          <div class="row" style="margin-top:10px !important;">
                                      		<a href="#questionTen" style="background: #6c757d;color:#fff;" class="btn  sizeWidth" data-toggle="collapse">Q. Can I delete the File and Folder created?</a>
                                      	</div>
                                         <div id="questionTen" class="collapse">
                                            <h5>
                                              Currently Files and Folders once created cannot be deleted. You can delete individual documents created within a File or Folder. You can also rename the File and Folder.
                                            </h5>
                                        </div>   
                                         
                                         <div class="row" style="margin-top:10px !important;">
                                      		<a href="#questionEleven" style="background: #6c757d;color:#fff;" class="btn  sizeWidth" data-toggle="collapse">Q. How can I change my profile picture?</a>
                                      	</div>
                                         <div id="questionEleven" class="collapse">
                                            <h5>
                                              Profile picture can be changed in the Profile section.
                                            </h5>
                                        </div>    
                                         
                                         <div class="row" style="margin-top:10px !important;">
                                      		<a href="#question12" style="background: #6c757d;color:#fff;" class="btn  sizeWidth" data-toggle="collapse">Q. How can I change my Login ID/ Email ID?</a>
                                      	</div>
                                         <div id="question12" class="collapse">
                                            <h5>
                                              Login ID/ Email ID cannot be changed once created. Please contact your Administrator for issuing a new Login ID in case your Email ID has changed.
                                            </h5>
                                        </div>    
                                         
                                         <div class="row" style="margin-top:10px !important;">
                                      		<a href="#question13" style="background: #6c757d;color:#fff;" class="btn  sizeWidth" data-toggle="collapse">Q. How do I get access to multiple departments?
                                      		</a>
                                      	</div>
                                         <div id="question13" class="collapse">
                                            <h5>
                                             Department Access can be granted by the Administrator.
                                            </h5>
                                        </div>     
                                      
                                         <div class="row" style="margin-top:10px !important;">
                                      		<a href="#question14" style="background: #6c757d;color:#fff;" class="btn  sizeWidth" data-toggle="collapse"> Q. What is the Softdoc File Number mentioned in all my documents?
                                      		</a>
                                      	</div>
                                         <div id="question14" class="collapse">
                                            <h5>
                                             This is the Unique File Number given by us to the files of your department. This number will appear on all the documents of your file.
                                            </h5>
                                        </div>     
                                   
                                            <div class="row" style="margin-top:10px !important;">
                                      		<a href="#question15" style="background: #6c757d;color:#fff;" class="btn  sizeWidth" data-toggle="collapse"> Q. What is the Softdoc Document Number mentioned in all my documents?
                                      		</a>
                                      	</div>
                                         <div id="question15" class="collapse">
                                            <h5>
                                             This is the Unique Document Number we provide to all your documents to enable us to identify and easily pinpoint the document when required.
                                            </h5>
                                        </div>     
                                          
                                          <div class="row" style="margin-top:10px !important;">
                                      		<a href="#question16" style="background: #6c757d;color:#fff;" class="btn  sizeWidth" data-toggle="collapse">Q. My problem is still not resolved. What do I do?
                                      		</a>
                                      	</div>
                                         <div id="question16" class="collapse">
                                            <h5>
                                             You can write to us at care@softdoc.co.in for any problem, suggestion, feedback or enquiry you may have.
                                            </h5>
                                        </div>     
                                   
                                   
                                   
                                      
                                   </div>
                           </div>
                </div>
            </div>
           </div> 
         </section>

 <%@include file="include/script.jsp"%>
   <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
      <script>
        $(document).ready( function () {
    	  $('#myTable').DataTable( {
              "searching":false,
              "lengthMenu":[25,50],
              "pageLength":25
          } );
        } );
        
        
        
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
