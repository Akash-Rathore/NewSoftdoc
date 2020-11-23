<%@include file="include/session.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="include/head.jsp"%>       
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap.min.css" rel="stylesheet" />
<style>

  h5{
       margin-bottom:25px;
       text-decoration:underline;
    }    

.col-md-2, .col-md-10{
    padding:0;
}
.panel{
    margin-bottom: 0px;
}
.chat-window{
    bottom:0;
    position:fixed;
    float:right;
    margin-left:10px;
}
.chat-window > div > .panel{
    border-radius: 5px 5px 0 0;
}
.icon_minim{
    padding:2px 10px;
}
.msg_container_base{
  background: #e5e5e5;
  margin: 0;
  padding: 0 10px 10px;
  max-height:300px;
  overflow-x:hidden;
}
.top-bar {
  background: #666;
  color: white;
  padding: 10px;
  position: relative;
  overflow: hidden;
}
.msg_receive{
    padding-left:0;
    margin-left:0;
}
.msg_sent{
    padding-bottom:20px !important;
    margin-right:0;
}
.messages {
  background: white;
  padding: 10px;
  border-radius: 2px;
  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
  max-width:100%;
}
.messages > p {
    font-size: 13px;
    margin: 0 0 0.2rem 0;
  }
.messages > time {
    font-size: 9px;
    color: #6c757d;
}
.msg_container {
    padding: 10px;
    overflow: hidden;
    display: flex;
}
img {
    display: block;
    width: 100%;
}
.avatar {
    position: relative;
}
.base_receive > .avatar:after {
    content: "";
    position: absolute;
    top: 0;
    right: 0;
    width: 0;
    height: 0;
    border: 5px solid #FFF;
    border-left-color: rgba(0, 0, 0, 0);
    border-bottom-color: rgba(0, 0, 0, 0);
}

.base_sent {
  justify-content: flex-end;
  align-items: flex-end;
}
.base_sent > .avatar:after {
    content: "";
    position: absolute;
    bottom: 0;
    left: 0;
    width: 0;
    height: 0;
    border: 5px solid white;
    border-right-color: transparent;
    border-top-color: transparent;
    box-shadow: 1px 1px 2px rgba(black, 0.2); // not quite perfect but close
}

.msg_sent > time{
    float: right;
}



.msg_container_base::-webkit-scrollbar-track
{
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
    background-color: #F5F5F5;
}

.msg_container_base::-webkit-scrollbar
{
    width: 12px;
    background-color: #F5F5F5;
}

.msg_container_base::-webkit-scrollbar-thumb
{
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
    background-color: #555;
}

.btn-group.dropup{
    position:fixed;
    left:0px;
    bottom:0;
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

.loader{
     
    display:none;
      
   }
   
 .logoClient{
      
      width:55px !important;
      height:50px !important;
      
      
      }
      
      
      
      
      .popup {
  position: relative;
  display: inline-block;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

.popup .popuptext {
  visibility: hidden;
  width: 160px;
  background-color: #555;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 8px 0;
  position: absolute;
  z-index: 1;
  bottom: 125%;
  left: 50%;
  margin-left: -80px;
}

.popup .popuptext::after {
  content: "";
  position: absolute;
  top: 100%;
  left: 50%;
  margin-left: -5px;
  border-width: 5px;
  border-style: solid;
  border-color: #555 transparent transparent transparent;
}

.popup .show {
  visibility: visible;
  -webkit-animation: fadeIn 1s;
  animation: fadeIn 1s;
}

@-webkit-keyframes fadeIn {
  from {opacity: 0;} 
  to {opacity: 1;}
}

@keyframes fadeIn {
  from {opacity: 0;}
  to {opacity:1 ;}
}
      
</style>

</head>

<body class="theme-light-blue">
   
    <!-- Overlay For Sidebars -->
    <div class="overlay"></div>
    <!-- #END# Overlay For Sidebars -->
   
    <!-- Top Bar -->
    
        <!-- Top Bar -->
    
    <nav class="navbar">
	<div class="container-fluid"  style="background:#fff;">
		<div class="navbar-header">
			<a href="javascript:void(0);" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar-collapse"
				aria-expanded="false"></a> <a href="javascript:void(0);"
				class="bars"></a> <a class="image" href="index.jsp"><img
				src="../images/logo5.png" class="logoClient" alt="User" /></a>
		</div>
		<div class="collapse navbar-collapse" id="navbar-collapse" style="background:#fff;">
			<ul class="nav navbar-nav navbar-right">
			    <%@include file="include/message.jsp"%>
			    <%@include file="include/notification.jsp"%>
				<%@include file="include/profile-pic.jsp"%>
			</ul>
		</div>
  
    </div>
	    <div class="container-fluid" style="height: 38px; background: #6c757d;">
	   
	          <div style="position:relative;padding-left:242px;">
                  <input type="text" name="" value="" style="display:none;position:inherit ; top:-9px ;width: 400px !important; border: 2px solid #6c757d; border-radius: 25px;padding-left:10px; " placeholder="Search in Softdoc Cloud" />
                  <a href="search.jsp" style="padding-left:130px;position:inherit;top:-9px;color:#fff;">Advanced Search</a>
                  <a href="javascript:void(0);" class="details" style="text-decoration:none;color:#fff;padding-left:621px;"><i class='material-icons' style='color:#fff ; border-radius:13px;'>info</i></a>
                  <li class="dropdown access_level_hide" style="position:absolute;top:-1px;right:116px;">
                        <a href="javascript:void(0);"  class="dropdown-toggle" style="color:#fff;" data-toggle="dropdown" role="button">
                             <i class="material-icons" style="font-size:32px;font-weight:bold;">...</i>
                        </a>
                        <ul class="dropdown-menu">
                                  <ul class="menu" style="overflow:hidden">
                                    <li>
                                        <a href="javascript:void(0);" class="star">
                                            <div class="menu-info">
                                                <h4>Star</h4>
                                            </div>
                                        </a>
                                    </li>
                                 </ul> 
                               <!--   <ul class="menu" style="overflow:hidden">
                                    <li>
                                        <a href="javascript:void(0);" onclick="uploadurl()">
                                            <div class="menu-info">
                                                <h4>Move</h4>
                                            </div>
                                        </a>
                                    </li>
                                 </ul>
                                 <ul class="menu" style="overflow:hidden">
                                    <li>
                                        <a href="javascript:void(0);" onclick="uploadurl()">
                                            <div class="menu-info">
                                                <h4>Send Via Message</h4>
                                            </div>
                                        </a>
                                    </li>
                                 </ul> -->
                                 <ul class="menu" style="overflow:hidden">
                                    <li>
                                        <a href="javascript:void(0);" class="edit-indexing">
                                            <div class="menu-info">
                                                <h4>Edit Indexing</h4>
                                            </div>
                                        </a>
                                    </li>
                                 </ul>
                                 <ul class="menu" style="overflow:hidden">
                                    <li>
                                        <a href="javascript:void(0);" class="edit-permission">
                                            <div class="menu-info">
                                                <h4>Edit Permissions</h4>
                                            </div>
                                        </a>
                                    </li>
                                 </ul>
                                 <ul class="menu" style="overflow:hidden">
                                    <li>
                                        <a href="javascript:void(0);" class="trash-document">
                                            <div class="menu-info">
                                                <h4>Delete</h4>
                                            </div>
                                        </a>
                                    </li>
                                 </ul> 
                         </ul>
                    </li>
                  
<!--              <a href="#"  style="text-decoration:none;color:#fff;padding-left:309px;"><span style="font-size:32px;font-weight:bold;">+</span></a>
 -->              <a href="javascript:void(0);"  class="delete-all-folder" style="text-decoration:none;color:#fff;padding-left:148px;"><span style="font-size:32px;font-weight:bold;"><i class="material-icons"></i></span></a>
	          </div>
	      </div>
	  <div class="container-fluid"
			style="position: fixed; bottom: 0; width: 100%; height: 37px; background: #6c757d; display: flex; flex-direction: row; justify-content: space-between; align-items: center;">
			<div>
				<a href="condition.jsp" style="color: #fff; text-decoration: none;">Terms
					& Conditions</a>
			</div>
			<div style="color: #fff;">
				<a href="#" style="color: #fff; text-decoration: none;">Copyright ©. All Right Reserved.</a>
			</div>
			<div style="color: #fff;">
				<!-- <a href="condition.jsp"
					style="color: #fff; padding-right: 40px; text-decoration: none;"></a> --> <a href="policy.jsp" style="color: #fff; text-decoration: none;">Privacy
					Policy</a>
			</div>
		</div>
    
    </nav>
      <section>
           <%@include file="include/sidebar.jsp"%>
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
                            <h2>
                              
                            </h2>
                        </div>
                        <div class="body mrgnbtm"> 
                            <form  id="fileUploadForm" method="post" class="form-horizontal"  enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Document Type</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                                <div class="form-line documentType" >
                                                 </div>
                                        </div>
                                    </div>
                                </div>
                              <div class="indexing_html">
                              </div>  
                              <div id="document_inner">
                              </div> 
                        <div class="form-group">
                          <label for="NameSurname" class="col-sm-2 control-label"></label>
                          <div class="col-sm-8 table-responsive">
                              <table class="table table-bordered table-hover"  id="documentuploading">
                               <thead>
                               </thead>
                               <tbody>
                                   
                               </tbody>
                              </table>
                          </div>
                           <div class="col-sm-2">
                               <button class="addmore" style="border:none;background-color:#fff;font-size:42px;font-weight:bold;color:#6c757d;" type="button"> + </button>
                           </div>    
                         </div>
                                 <div class="form-group" style="margin-bottom: 0px !important;">
                                    <div class="col-sm-12" style="text-align:center;">
                                        <button type="submit" style="width:120px;border:1px solid #6c757d;color: #f8fcff;background: #6c757d;" class="btn upload_submit" id="btnSubmit">Submit</button>
                                      <!--    <button type="submit" class="btn" style="width:120px;border:1px solid #6c757d;color: #f8fcff;background: #6c757d;">Return</button> -->
                                    </div>
                              </div>
                           </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="block-header">
                <h2>
                   
                </h2>
           </div>
            <div class="row" style="margin-right: -29px !important;margin-left: -156px !important;">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header  margin0">
                             <h2>
                              
                              
                              
                             </h2>
                        </div>
                        <div class="body">
                           <form id="delete-folder">
                             <div class="table-responsive">
                                <table class="table table-hover" id="all_attachment">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Size(MB)</th>
                                       <!--  <th>Version</th> -->
                                        <th>Comments</th>
                                        <!-- <th>Lock</th> -->
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                               
                                </tbody>
                            </table>
                           </div>
                          </form> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    
    
    
  <!--Details  -->
  <div class="modal fade details-modal"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel" style="text-align:center;">Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form class="request-access-form">
      <div class="modal-body">
          
          <div class="form-group">
			 <label  class="col-sm-4 control-label">Permissions</label>
					<div class="col-sm-8">
						 <div class="form-line">
							 <input type="text" class="form-control" id="permission" name="" value="" placeholder="" readonly>
						</div>
					</div>
		  </div>
		  
		  
		    <div class="form-group">
			 <label  class="col-sm-4 control-label">Document No.</label>
					<div class="col-sm-8">
					     <div class="form-line">
							 <input type="text" class="form-control"  id="document_no" name="" value="" placeholder="" readonly>
					     </div>
					</div>
		  </div>
		   
		   
		    <div class="form-group">
			 <label  class="col-sm-4 control-label">Document Type</label>
					<div class="col-sm-8">
					     <div class="form-line">
							 <input type="text" class="form-control"  id="document_type"  name="" value="" placeholder="" readonly>
					     </div>
					</div>
		  </div>
		   
		  
		  <div class="form-group">
			 <label  class="col-sm-4 control-label">File No.</label>
					<div class="col-sm-8">
					     <div class="form-line">
							 <input type="text" class="form-control"  id="file_no" name="" value="" placeholder="" readonly>
					     </div>
					</div>
		  </div>
		   
		  <div class="form-group">
			 <label  class="col-sm-4 control-label">File Name</label>
					<div class="col-sm-8">
					     <div class="form-line">
							 <input type="text" class="form-control"  id="file_name" name="" value="" placeholder="" readonly>
					     </div>
					</div>
		  </div>
		  
		  
		  <div class="form-group">
			 <label  class="col-sm-4 control-label">Department</label>
					<div class="col-sm-8">
					     <div class="form-line">
							 <input type="text" class="form-control"  id="department"  name="" value="" placeholder="" readonly>
					     </div>
					</div>
		  </div>
		  
		  
		  <div class="form-group">
			 <label  class="col-sm-4 control-label">Created By</label>
					<div class="col-sm-8">
					     <div class="form-line">
							 <input type="text" class="form-control"  id="client_name" name="" value="" placeholder="" readonly>
					     </div>
					</div>
		  </div>
		  
		  <div class="form-group">
			 <label  class="col-sm-4 control-label">Created On</label>
					<div class="col-sm-8">
					     <div class="form-line">
							 <input type="text" class="form-control" id="upload_date" name="file_name" value="" placeholder="" readonly>
					     </div>
					</div>
		  </div>
		  
		  <div class="form-group">
			 <label  class="col-sm-4 control-label">Accessed By</label>
					<div class="col-sm-8">
					     <div class="form-line">
							 <input type="text" class="form-control" id="accesss_by"  name="" value="" placeholder="" readonly>
					     </div>
					</div>
		  </div>
		  
		  <div class="form-group">
			 <label  class="col-sm-4 control-label">Accessed On</label>
					<div class="col-sm-8">
					     <div class="form-line">
							 <input type="text" class="form-control" id="accessed_on"  name="" value="" placeholder="" readonly>
					     </div>
					</div>
		  </div>
		  <div class="form-group">
			 <label  class="col-sm-4 control-label">Modified By</label>
					<div class="col-sm-8">
						 <div class="form-line">
							 <input type="text" class="form-control" id="modify_name"  name="" value="" placeholder="" readonly>
					     </div>   
					</div>
		  </div>
		 <div class="form-group">
			 <label  class="col-sm-4 control-label">Modified On</label>
					<div class="col-sm-8">
						 <div class="form-line">
							 <input type="text" class="form-control"  id="modify_date" name="modified_on" value="" placeholder="" readonly>
					     </div>   
					</div>
		  </div>
		
		
		  <div class="form-group">
			 <label  class="col-sm-4 control-label">Send to Trash By </label>
					<div class="col-sm-8">
						 <div class="form-line">
							 <input type="text" class="form-control"  id="trash_client_name" name="" value="" placeholder="" readonly>
					     </div>   
					</div>
		  </div>
		 
		 <div class="form-group">
			 <label  class="col-sm-4 control-label">Send to Trash On</label>
					<div class="col-sm-8">
						 <div class="form-line">
							 <input type="text" class="form-control"  id="trash_date" name="" value="" placeholder="" readonly>
					     </div>   
					</div>
		  </div>
		  
		
		 <div class="form-group">
			 <label  class="col-sm-4 control-label">Restored By</label>
					<div class="col-sm-8">
						 <div class="form-line">
							 <input type="text" class="form-control" id="restore_client_name"  name="" value="" placeholder="" readonly>
					     </div>   
					</div>
		  </div>
		 
		 <div class="form-group">
			 <label  class="col-sm-4 control-label">Restored  On</label>
					<div class="col-sm-8">
						 <div class="form-line">
							 <input type="text" class="form-control"  id="restore_date"  name="" value="" placeholder="" readonly>
					     </div>   
					</div>
		  </div>
		
		
		<div class="form-group">
			 <label  class="col-sm-4 control-label">Deleted By</label>
					<div class="col-sm-8">
						 <div class="form-line">
							 <input type="text" class="form-control" id="deleted_by" name="" value="" placeholder="" readonly>
					     </div>   
					</div>
		  </div>
		 
		 <div class="form-group">
			 <label  class="col-sm-4 control-label">Deleted On</label>
					<div class="col-sm-8">
						 <div class="form-line">
							 <input type="text" class="form-control" id="deleted_on" name="file_name" value="" placeholder="" readonly>
					     </div>   
					</div>
		  </div>
		  
      </div>
	      <div class="modal-footer">
	        <!-- <button type="submit" class="btn btn-primary">Submit</button>      
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Return</button> -->
	      </div>
	 </form> 
    </div>
  </div>
</div> 




 <!-- Add Folder start  -->
     <div class="modal fade" id="edit-permission" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog  modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title"  id="exampleModalLabel" style="text-align:center;text-decoration: underline;">Edit Permission</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			  <form class="edit-permission-submit">		
				<div class="modal-body">
				 <div class="container-fluid">
				   <div class="row">
				      <div class="form-group">
                          <div class="col-sm-10 table-responsive" style="margin-top:20px">
                              <table class="table table-bordered table-hover"  id="document_permission">
                               <thead>
                               </thead>
                               <tbody class="html_editfile">
                                   
                               </tbody>
                              </table>
                          </div>
                           <div class="col-sm-2">
                               <button  class="btn btn-sm add-permission" style="margin-top:20px;width:120px;border:1px solid #6c757d;color: #f8fcff;background: #6c757d;" type="button" >+ Add People </button>
                            </div>    
                    </div> 
                       <div class="form-group" style="margin-top:95px;">
						<div class="col-sm-12">
							<h5 style="margin-top:24px;text-decoration:none;">
						    	Note: If no users are selected, all users with access to the selected File/ Folder will be able to View/ View & Edit the Document as per their respective system rights
							</h5>
						</div>
					</div>
				   </div>
				  </div>
		
				<div class="modal-footer" style="text-align:center;">
					<button type="submit"  style="width:120px;border:1px solid #6c757d;color: #f8fcff;background: #6c757d;"class="btn">Submit</button>
					<button type="button" style="width:120px;border:1px solid #6c757d;color: #f8fcff;background: #6c757d;" class="btn" data-dismiss="modal">Cancel</button>
				</div>
			  </div>
		   </form> 	
		  </div>
		</div>
	</div>
	<!-- edit Folder end  -->



    <!--start update indexing  -->
     <div class="modal fade" id="edit-indexing" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog  modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title"  id="exampleModalLabel" style="text-align:center;text-decoration: underline;">Edit Indexing</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			  <form class="edit-indexing-form">		
				<div class="modal-body">
				 <div class="container-fluid">
				   <div class="row">
				      <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Document Type</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                                <div class="form-line documentType" >
                                                 </div>
                                        </div>
                                    </div>
                                </div>
                              <div class="indexing_html">
                       </div>    
                   </div>
				  </div>
		
				<div class="modal-footer" style="text-align:center;">
					<button type="submit" style="width:120px;border:1px solid #6c757d;color: #f8fcff;background: #6c757d;" class="btn">Submit</button>
					<button type="button" style="width:120px;border:1px solid #6c757d;color: #f8fcff;background: #6c757d;" class="btn" data-dismiss="modal">Cancel</button>
				</div>
			  </div>
		   </form> 	
		  </div>
		</div>
	</div>
	<!--end update indexing  -->
    



  <!--start update indexing  -->
     <div class="modal fade" id="comments-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog  modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title"  id="exampleModalLabel" style="text-align:center;text-decoration: underline;">Edit Indexing</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			  <form class="edit-indexing-form">		
				<div class="modal-body">
				 <div class="container-fluid">
				   <div class="row">
				      <div class="form-group">
                                    <label for="NameSurname" class="col-sm-2 control-label">Document Type</label>
                                    <div class="col-sm-10">
                                        <div class="form-line">
                                                <div class="form-line documentType" >
                                                 </div>
                                        </div>
                                    </div>
                                </div>
                              <div>
                       </div>    
                   </div>
				  </div>
		
				<div class="modal-footer" style="text-align:center;">
					<button type="submit" style="width:120px;border:1px solid #6c757d;color: #f8fcff;background: #6c757d;" class="btn">Submit</button>
					<button type="button" style="width:120px;border:1px solid #6c757d;color: #f8fcff;background: #6c757d;" class="btn" data-dismiss="modal">Cancel</button>
				</div>
			  </div>
		   </form> 	
		  </div>
		</div>
	</div>
	<!--end update indexing  -->



<div class="container">
    <div class="row chat-window col-xs-5 col-md-3" id="chat_window_1" style="margin-left:636px;margin-bottom:24px;display:none;">
        <div class="col-xs-12 col-md-12">
        	<div class="panel panel-default">
                <div class="panel-heading top-bar" style="background-color: #778087;">
                    <div class="col-md-8 col-xs-8">
                        <h3 class="panel-title" style="color:#fff;"><span class="glyphicon glyphicon-comment"></span> Comments</h3>
                    </div>
                    <div class="col-md-4 col-xs-4" style="text-align: right;">
                        <a href="javascript:void(0);" style="color:#fff;"><span id="minim_chat_window" class="glyphicon glyphicon-minus icon_minim"></span></a>
                        <a href="javascript:void(0);"><span class="glyphicon glyphicon-remove icon_close" style="color:#fff;" data-id="chat_window_1"></span></a>
                    </div>
                </div>
                <div class="panel-body msg_container_base" id="html_send">
                  <!--   
                    <div class="row msg_container base_sent">
                        <div class="col-md-10 col-xs-10">
                            <div class="messages msg_sent">
                                <p>that mongodb thing looks good, huh?
                                tiny master db, and huge document store</p>
                                <time datetime="2009-11-13T20:00">Timothy • 51 min</time>
                            </div>
                        </div>
                        <div class="col-md-2 col-xs-2 avatar">
                            <img src="http://www.bitrebels.com/wp-content/uploads/2011/02/Original-Facebook-Geek-Profile-Avatar-1.jpg" class=" img-responsive ">
                        </div>
                    </div> 
                    -->
                    
                    <!-- <div class="row msg_container base_receive">
                        <div class="col-md-2 col-xs-2 avatar">
                            <img src="http://www.bitrebels.com/wp-content/uploads/2011/02/Original-Facebook-Geek-Profile-Avatar-1.jpg" class=" img-responsive ">
                        </div>
                        <div class="col-md-10 col-xs-10">
                            <div class="messages msg_receive">
                                <p>that mongodb thing looks good, huh?
                                tiny master db, and huge document store</p>
                                <time datetime="2009-11-13T20:00">Timothy • 51 min</time>
                            </div>
                        </div>
                    </div> -->
                  <!--   <div class="row msg_container base_receive">
                        <div class="col-md-2 col-xs-2 avatar">
                            <img src="http://www.bitrebels.com/wp-content/uploads/2011/02/Original-Facebook-Geek-Profile-Avatar-1.jpg" class=" img-responsive ">
                        </div>
                        <div class="col-xs-10 col-md-10">
                            <div class="messages msg_receive">
                                <p>that mongodb thing looks good, huh?
                                tiny master db, and huge document store</p>
                                <time datetime="2009-11-13T20:00">Timothy • 51 min</time>
                            </div>
                        </div>
                    </div> -->
                    <!-- <div class="row msg_container base_sent">
                        <div class="col-xs-10 col-md-10">
                            <div class="messages msg_sent">
                                <p>that mongodb thing looks good, huh?
                                tiny master db, and huge document store</p>
                                <time datetime="2009-11-13T20:00">Timothy • 51 min</time>
                            </div>
                        </div>
                        <div class="col-md-2 col-xs-2 avatar">
                            <img src="http://www.bitrebels.com/wp-content/uploads/2011/02/Original-Facebook-Geek-Profile-Avatar-1.jpg" class=" img-responsive ">
                        </div>
                    </div> -->
                    <!-- <div class="row msg_container base_receive">
                        <div class="col-md-2 col-xs-2 avatar">
                            <img src="http://www.bitrebels.com/wp-content/uploads/2011/02/Original-Facebook-Geek-Profile-Avatar-1.jpg" class=" img-responsive ">
                        </div>
                        <div class="col-xs-10 col-md-10">
                            <div class="messages msg_receive">
                                <p>that mongodb thing looks good, huh?
                                tiny master db, and huge document store</p>
                                <time datetime="2009-11-13T20:00">Timothy • 51 min</time>
                            </div>
                        </div>
                    </div>
                     -->
                     <!-- 
                     <div class="row msg_container base_sent">
                        <div class="col-md-10 col-xs-10 ">
                            <div class="messages msg_sent">
                                <p>that mongodb thing looks good, huh?
                                tiny master db, and huge document store</p>
                                <time datetime="2009-11-13T20:00">Timothy • 51 min</time>
                            </div>
                        </div>
                        <div class="col-md-2 col-xs-2 avatar">
                            <img src="http://www.bitrebels.com/wp-content/uploads/2011/02/Original-Facebook-Geek-Profile-Avatar-1.jpg" class=" img-responsive ">
                        </div>
                    </div> -->
                </div>
                <div class="panel-footer">
                    <div class="input-group">
                        <input id="btn-input"  type="text" class="form-control input-sm chat_input" value="" placeholder="Write your comments here..." />
                        <span class="input-group-btn">
                        <button class="btn" style="width:60px;border:1px solid #6c757d;color: #f8fcff;background: #6c757d;"  id="comments-input">Send</button>
                        </span>
                    </div>
                </div>
    		</div>
        </div>
    </div>
 </div>


    <%@include file="include/loader.jsp"%>
    <%@include file="include/script.jsp"%>   
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
   <script type="text/javascript" src="//cdn.datatables.net/1.10.0/js/jquery.dataTables.js"></script>
    <script src="include/custom-script.js"></script>  
    <script type="text/javascript">
    
    
        
    
  /* 
    $(document).on('click' , '.edit-permission' , function(){
  	   $('#edit-permission').modal('show');
  	 }); 
  */
      
  	 
  	 
  	 
  	  $(document).on('click' , '.comments' , function(){
   	     
  		  
  		   var id=$(this).data('id'); 
  		   $('#comments-input').data('id',id);
  		  
  		  $('#loader').show();
  		   $.ajax({ 
   		    
   		    url:"../clientprocess?action=fetchComments",
  	        type:"post",
  	        dataType:"json",
  	        data:{"document_info_id":id},
  	        success: function(data)
  	        {
  	        	
  	      	     var request_response=JSON.parse(JSON.stringify(data.fetchsend));
  	      	     console.log(request_response);
  	      	     
  	              var html_send='';
  	      	     $.each(request_response ,  function( key, value ) {
  	      		
  	      	    	html_send +='<form class="reply_submit">' 
  	      	    	html_send +='<div class="row msg_container base_receive">'
  	      	    	html_send +='<div class="col-md-2 col-xs-2 avatar">'
  	      	    	
  	      	    	if(value.imageupload){
  	      	    	  html_send +='<img src="'+value.imageupload+'" class="img-responsive">'
    	      			 
  	      	    	}else{
  	      	         html_send +='<img src="https://cdn.iconscout.com/icon/free/png-512/avatar-380-456332.png" class=" img-responsive ">'
  	    	      	    
  	      	    	 }
  	      	    	
  	      	    	html_send +='</div>'
  	      	    	html_send +='<div class="col-md-10 col-xs-10">'
  	      	    	html_send +='<div class="messages msg_receive">'
  	      	  	    html_send  +='<p>'+value.send+'</p>'
  	      	    	html_send +='<time>'+value.employee_name+'.'+value.date_time+'</time>'
  	      		    html_send +='<a  class="replay_input" style="font-size:14px;padding-left:12px;font-weight:800;" href="javascript.void(0);">+</a>'
  	      		    html_send +='<div class="input-hide" style="display:none;"><input type="hidden" name="comments_id" value="'+value.id+'" /> <input type="text" name="comment_reply" value="" style="font-size:11px;width: 191px;line-height: 15px;border: 1px solid #778087;padding-left: 10px;border-radius:10px;"/></div>'
  	      		    html_send +='<button  type="submit" style="position: absolute;right: -2px;bottom: -9px;color: #778087;border:none;background:none;"><span class="material-icons">reply</span></button>'
  	      		    html_send +='</div>'
  	      	    	html_send +='</div>'
  	      	    	html_send +='</div></form>';
  	      	    	if(value.reply_condition){
  	      	    	
  	      	    		html_send +='<div class="row msg_container base_sent">'
  	 	      	    	html_send +='<div class="col-md-10 col-xs-10">'
  	 	      	    	html_send +='<div class="messages msg_sent">'
  	 	      	  	    html_send  +='<p>'+value.comment_reply+'</p>'
  	 	      	    	html_send +='<time>'+value.reply_employee_name+'.'+value.reply_date_time+'</time>'
  	 	      		    html_send +='</div>'
  	 	      	    	html_send +='</div>'
  	 	      	        html_send +='<div class="col-md-2 col-xs-2 avatar">'
  	 	      	       
  	 	      	       if(value.reply_imageupload){
  	  	 	      	     	 html_send +='<img src="'+value.reply_imageupload+'" class="img-responsive">'
	  	    	        }else{
 	  	  	    		html_send +='<img src="https://cdn.iconscout.com/icon/free/png-512/avatar-380-456332.png" class=" img-responsive ">'
 	  	  	 	  	   }
  	 	      	        
  	 	      	       	html_send +='</div>'
  	 	    	        html_send +='</div>';
  	 	    	 	}	
  	      		 
  	      	    });
  	      	    
  
  	      	     
  	      	     $('#html_send').html(html_send); 
  	      	     $('#chat_window_1').show(); 
  	      	     $('#loader').hide();
  	      	    
  	        },
  	  	    error:function(e)
  	  	    {
  	  	    	console.log("error in pages");
  	  	    }
  	     
       });
  		   
  }); 
  	 
  	$(document).on('click', '.replay_input' , function (e) {
    	e.preventDefault();
        $(this).next().toggle();
  	})
  	 
  	
  	
    $(document).on('submit', '.reply_submit' , function (e) {
    	e.preventDefault();
        
    	var form=$(this);
	    var formdata=new FormData($(form)[0]);
	    var data={};
	    formdata.forEach(function(value,key)
	    {
	  		  data[key]=value;
	    }); 
    	
	    if(data.comment_reply===''){
	    	return false;
	    }
	   
	   var element=$(this);
	     
	     $.ajax({ 
   		
	    	url:"../clientprocess?action=replycomments",
  	        type:"post",
  	        dataType:"json",
  	        data:data,
  	        success: function(result)
  	        {  
  	          
  	        	
  	        	var request_response=JSON.parse(JSON.stringify(result.reply));
 	      	     
 	             var html_send='';
 	      	     $.each(request_response ,  function( key, value ) {
 	      		
 	      	    	html_send +='<div class="row msg_container base_sent">'
 	      	    	html_send +='<div class="col-md-10 col-xs-10">'
 	      	    	html_send +='<div class="messages msg_sent">'
 	      	  	    html_send  +='<p>'+value.comment_reply+'</p>'
 	      	    	html_send +='<time>'+value.employee_name+'.'+value.date_time+'</time>'
 	      		    html_send +='</div>'
 	      	    	html_send +='</div>'
 	      	        html_send +='<div class="col-md-2 col-xs-2 avatar">'
 	      	     	
 	      	     	if(value.imageupload){
 	  	      	    	  html_send +='<img src="'+value.imageupload+'" class="img-responsive">'
 	    	      			 
 	  	      	    	}else{
 	  	      	         html_send +='<img src="https://cdn.iconscout.com/icon/free/png-512/avatar-380-456332.png" class=" img-responsive ">'
 	  	    	      	    
 	  	      	    	 }
 	      	        
 	      	        html_send +='</div>'
 	    	        html_send +='</div>';
 	      		 
 	      	    });
 	      	    
  	        	    	 
 	      	    element.append(html_send);
 	 	     	$('.reply_submit').trigger('reset');
  	     	    element.children().find('div.input-hide').hide();
   	        
  	        },
  	  	    error:function(e)
  	  	    {
  	  	    	console.log("error in pages");
  	  	    }
  	     
       });
 	    
 })
  	
  	
  	
  	 
  	    $(document).on('click' , '#comments-input' , function(){
   	  
  		    var data={"send":$('#btn-input').val() , "document_info_id":$(this).data('id')}
  		    
  		    if($('#btn-input').val()==''){
  		    	return false;
  		    }
  		    
  		     $.ajax({ 
  		    
  		    url:"../clientprocess?action=comments",
 	        type:"post",
 	        dataType:"json",
 	        data:data,
 	        success: function(data)
 	        {
 	        	
 	        	 var request_response=JSON.parse(JSON.stringify(data.fetchsend));
   	      	     var html_send='';
   	      	     $.each(request_response ,  function( key, value ) {
   	      		
   	      		html_send +='<form class="reply_submit">' 
  	      	    	html_send +='<div class="row msg_container base_receive">'
  	      	    	html_send +='<div class="col-md-2 col-xs-2 avatar">'
  	      	    	
  	      	    	if(value.imageupload){
	  	      	    	  html_send +='<img src="'+value.imageupload+'" class="img-responsive">'
	    	      			 
	  	      	    	}else{
	  	      	         html_send +='<img src="https://cdn.iconscout.com/icon/free/png-512/avatar-380-456332.png" class=" img-responsive ">'
	  	    	      	    
	  	      	    	 }
  	      	    	
  	      	    	html_send +='</div>'
  	      	    	html_send +='<div class="col-md-10 col-xs-10">'
  	      	    	html_send +='<div class="messages msg_receive">'
  	      	  	    html_send  +='<p>'+value.send+'</p>'
  	      	    	html_send +='<time>'+value.employee_name+'.'+value.date_time+'</time>'
  	      		    html_send +='<a  class="replay_input" style="font-size:14px;padding-left:12px;font-weight:800;" href="javascript.void(0);">+</a>'
  	      		    html_send +='<div class="input-hide" style="display:none;"><input type="hidden" name="comments_id" value="'+value.id+'" /> <input type="text" name="comment_reply" value="" style="font-size:11px;width: 191px;line-height: 15px;border: 1px solid #778087;padding-left: 10px;border-radius:10px;"/></div>'
  	      		    html_send +='<button  type="submit" style="position: absolute;right: -2px;bottom: -9px;color: #778087;border:none;background:none;"><span class="material-icons">reply</span></button>'
  	      		    html_send +='</div>'
  	      	    	html_send +='</div>'
  	      	    	html_send +='</div></form>';
  	      	    	if(value.reply_condition){
  	      	    	
  	      	    		html_send +='<div class="row msg_container base_sent">'
  	 	      	    	html_send +='<div class="col-md-10 col-xs-10">'
  	 	      	    	html_send +='<div class="messages msg_sent">'
  	 	      	  	    html_send  +='<p>'+value.comment_reply+'</p>'
  	 	      	    	html_send +='<time>'+value.reply_employee_name+'.'+value.reply_date_time+'</time>'
  	 	      		    html_send +='</div>'
  	 	      	    	html_send +='</div>'
  	 	      	        html_send +='<div class="col-md-2 col-xs-2 avatar">'
  	 	      	        if(value.reply_imageupload){
  	 	      	       
	 	  	      	    		 html_send +='<img src="'+value.reply_imageupload+'" class="img-responsive">'
	 	  	    	    
  	 	      	        }else{
  	 	  	  	    		html_send +='<img src="https://cdn.iconscout.com/icon/free/png-512/avatar-380-456332.png" class=" img-responsive ">'
  	 	  	  	 	  	 }
  	 	      	       	html_send +='</div>'
  	 	    	        html_send +='</div>';
  	      	    	}
  	 	    	        
   	      	    });
   	      	    
   	      	     $("#btn-input").val(''); 
   	      	     $('#html_send').html(html_send); 
 	        	        	    
 	        },
 	  	    error:function(e)
 	  	    {
 	  	    	console.log("error in pages");
 	  	    }
 	     
        });
   
  	}); 
	 
	 
  	 
  	 
  	 
      $(document).on('click' , '.edit-indexing' , function(){
    	   $('#edit-indexing').modal('show');
    	 }); 
    
    
    
    $(document).on('click' , '.edit-permission' , function(){
	     
    	 
    	  var url = window.location.href;
  	      var res = url.split("?");
  	      var  document_info_id = res[1];
         
    	
	     $('#loader').show();
	     $.ajax({
	        url: "../clientprocess?action=editDocument",
	        type: "post",
	        dataType:"json",
	        data:{"document_info_id":document_info_id},
	        success: function(data)
	        {
	        	
	        	var editfile=JSON.parse(data.editfile);
	        	console.log(editfile);
	        	
	        	 
	        	var html_editfile='';
	        	let i=0;
	        	var dept="";
	        	var file_name="";
	        	var description="";
	        	var document_info_id="";
	        	$('.remove').remove();
	        	$.each(editfile ,  function( key, value ) {
  			    	
			    	dept=value.departmentname;
			    	file_name=value.filename
			    	description=value.file_description;
			    	document_info_id=value.id;
			    	
				    html_editfile +='<tr class="remove">';
			    	if(value.imageupload === undefined){
				    	html_editfile +='<td style="width:300px;"><div style="position:relative;" ><img src="https://cdn.iconscout.com/icon/free/png-512/avatar-380-456332.png" alt="client_logo" width="35" height="35"><span style="padding-left:21px;position:absolute;top:-5px;left:63px;">'+value.employee_name+'</span><input type="hidden" name="file_user_name['+i+']" value="'+value.other_client+'"><span style="padding-left:19px;position:absolute;top:18px;">'+value.emp_email_id+'</span></div></td>';
			        }else{
			        	html_editfile +='<td style="width:300px;"><div style="position:relative;" ><img src="'+value.imageupload+'" alt="client_logo" width="35" height="35"><span style="padding-left:21px;position:absolute;top:-5px;left:63px;">'+value.employee_name+'</span><input type="hidden" name="file_user_name['+i+']" value="'+value.other_client+'"><span style="padding-left:19px;position:absolute;top:18px;">'+value.emp_email_id+'</span></div></td>';
			        }
			    	if(value.access_level =='Read'){
			    		html_editfile +='<td><select class="form-control show-tick" name="file_access_level['+i+']"><option value="Read">Read</option><option value="Write">Write</option></select></td>';
			    	}else if(value.access_level =='Write'){
			    		html_editfile +='<td><select class="form-control show-tick" name="file_access_level['+i+']"><option value="Write">Write</option><option value="Read">Read</option></select></td>';
	 				}
			    	html_editfile +='<td><button class="delete-appended-row btn btn-danger" type="button">Remove</button></td>';
			    	html_editfile += '</tr>';
			    	i++;
				});
				
	        	console.log(editfile);
	        	
	          
			   $('#loader').hide();
			   $('#document_info_id').val(document_info_id);
			   $('#dept').val(dept);
			   $('#file_name').val(file_name);
			   $('#description').val(description);
			   $('.html_editfile').append(html_editfile);
			   $('#edit-permission').modal('show');
	        
	        },
	  	    error:function(e)
	  	    {
	  	        $('#loader').hide();
	  	    	console.log("error in pages");
	  	    }
	     }); 
  
  });
  
    
    
    $(document).on('click', '.delete-single-attachment' , function(){
  	   
    	let element = $(this);
    	Swal.fire({
    		title: 'Are you sure?',
            text: "Attachments deleted cannot be recovered. All versions will be deleted",
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
          	            url: "../clientprocess?action=deleteSingleAttachment",
          	            type: "post",
          	            dataType:"json",
          	            data:{"document_info_id":$(this).data('id')},
          	            success: function(data)
          	            {
          	            	
          	               if(data.status)
          	               {
          	            	
          	            	  Swal.fire({
    	     	    			  position:'center',
    	     	    			  icon: 'success',
    	     	    			  title: 'Success',
    	     	    			  timer: 2000
    	     	    			})
    	     	    			$(element).parents('tr').remove();
    	     	    			
          	               }
          	               else
          	               {
          	            	  Swal.fire({
    	     	    			  position: 'center',
    	     	    			  icon: 'error',
    	     	    			  title: 'Something is wrong',
    	     	    			  timer: 2000
    	     	    			})   
    	     	    			
          	               }
          	               $('#loader').hide();
          	             
          	           },
          	  	    error:function(e)
          	  	    {
          	  	        $('#loader').hide();
     	            	console.log("error in pages");
          	  	    }
          	     }); 
     
    			  
    		  }
    		})
          	  
   	  }); 
    
    
    $(document).on('submit' , '.edit-permission-submit' , function(event){
 	 event.preventDefault();
    	 
		var form=$(this);
	    var formdata=new FormData($(form)[0]);
	    var data={};
	    formdata.forEach(function(value,key)
	    {
	  		  data[key]=value;
	    }); 
	    var url = window.location.href;
	    var res = url.split("?");
	    var  document_info_id = res[1];
        data['document_info_id']=document_info_id;
        
        console.log(data);
        
        
         $('#loader').show();
         $.ajax({
   	        
      	    url:"../clientprocess?action=editpermission",
   	        type:"post",
   	        dataType:"json",
   	        data:data,
   	        success: function(data)
   	        {
   	        	
   	        	    if(data.status)
   				    {
   				      
   				    	  Swal.fire({
   		  	    			  position: 'center',
   		  	    			  icon: 'success',
   		  	    			  title: 'Success',
   		  	    			  showConfirmButton: false,
   		  	    			  timer: 3500
   		  	    			})
   		  	    			$('#loader').hide();	
   				    	    
   				    }
   				    else
   				    {
   				      	
   				    	 Swal.fire({
   		   	    			  icon:'error',
   		   	    			  title:'Somethind went Wrong',
   		   	    			  text:"Something went Wrong",
   		   	    			  footer:'',
   		   	    			  timer:3500
   		   	    			}) 
   				    	   $('#loader').hide();
   				    }
   	        	    
   	        },
   	  	    error:function(e)
   	  	    {
   	  	    	console.log("error in pages");
   	  	    	 $('#loader').hide();
   	  	    }
   	     
         });
   	
     }); 
    
    
    $(document).on('submit' , '.edit-indexing-form' , function(event){
 	   
 	   event.preventDefault();
 	   
 	    var form=$(this);
        var formdata=new FormData($(form)[0]);
        var data={};
        formdata.forEach(function(value,key)
        {
     		  data[key]=value;
        }); 
 	   
        var url = window.location.href;
 	    var res = url.split("?");
 	    var  document_info_id = res[1];
        data['document_info_id']=document_info_id;
       
        
 	    $('#loader').show();
        $.ajax({
 	        url:"../clientprocess?action=editindexing",
 	        type:"post",
 	        dataType:"json",
 	        data:data,
 	        success: function(data)
 	        {
 	        	
 	              
 	        	    if(data.status)
 				    {
 				      
 				    	  Swal.fire({
 		  	    			  position: 'center',
 		  	    			  icon: 'success',
 		  	    			  title: 'Success',
 		  	    			  showConfirmButton: false,
 		  	    			  timer: 3500
 		  	    			})
 		  	    			$('#loader').hide();	
 				    	    
 				    }
 				    else
 				    {
 				      	
 				    	 Swal.fire({
 		   	    			  icon:'error',
 		   	    			  title:'Somethind went Wrong',
 		   	    			  text:"Something went Wrong",
 		   	    			  footer:'',
 		   	    			  timer:3500
 		   	    			}) 
 				    	   $('#loader').hide();
 				    }
 	   
 	        },
 	  	    error:function(e)
 	  	    {
 	  	    	console.log("error in pages");
 	  	    	 $('#loader').hide();
 	  	    }
 	     
        });
    }); 
    
    
    
    
    
    
     
     
     var i=0;
     $(".add-permission").on('click' , function(){
    	 
      $('.search-box').remove();
    	 
  	  i=$('#document_permission> tbody > tr').length;
  	  html = '<tr class="remove">';
	  html+= '<td><input type="text"  name="file_user_name['+i+']"  placeholder="Search User Name"  class="form-control show-tick search-suggestion" value=""><a href="javascript:void(0);" style="text-decoration: none;color:#4c4a4a;"><div class="search-box" style="overflow:auto;position:fixed;width:33.54%;z-index:9999;background:#fff;left:40px;"></div></a></td>';
	  html+= '<td style="width:232px;"><select style="width:184px;" class="form-control show-tick" name="file_access_level['+i+']"><option value="">Access Level</option><option value="Read">Read</option><option value="Write">Write</option></select></td>';
	  html+= '<td style="width:141px;"><button class="delete-appended-row btn btn-danger" type="button">Remove</button></td>';
	  html+= '</tr>';
      $('table#document_permission').append(html);
      });
      
   
     
     $(document).on('click', 'div.search', function (e) {
  	   event.preventDefault();
  	    $(this).parent().parent().siblings().remove();
  	    var selected_data=$(this).html();
  	    $(this).parent().parent().parent().append(selected_data);
  	    $('.search-box').remove();
    });
    

     $(document).on('keyup' , '.search-suggestion' , function(){
         
    	 console.log('only');
    	 
    	   $.ajax({
    	        url: "../clientprocess?action=suggestionName",
    	        type: "post",
    	        dataType:"json",
    	        data:{"search_box":$(this).val()},
    	        success: function(data)
    	        {
    	        	
    	            var obj = JSON.parse(JSON.stringify(data.name));
    	            
    	            console.log(obj);
    	            
    	            var details='';
    			      $.each(obj,  function( key, value ) {
    			    	  if(value.upload === undefined){
    			    		 details +='<div class="search addmore"><div class="append-search"  style="position:relative;border-left: 1px solid #e6e5e5;border-right: 1px solid #e6e5e5;border-bottom: 1px solid #e6e5e5;"><img src="https://cdn.iconscout.com/icon/free/png-512/avatar-380-456332.png" alt="client_logo" width="35" height="35" style="width:37px;height:40px;"><span style="padding-left:22px;position:absolute;top:1px;left:63px;">'+value.name+'</span><input type="hidden" name="file_user_name['+i+']" value="'+value.id+'"><span style="padding-left:19px;position:absolute;top:18px;left: 27px;">'+value.email+'</span></div></div>'; 
    					  }else{
    			    		 details +='<div class="search addmore"><div class="append-search"  style="position:relative;border-left: 1px solid #e6e5e5;border-right: 1px solid #e6e5e5;border-bottom: 1px solid #e6e5e5;"><img src="'+value.upload+'" alt="client_logo" style="width:37px;height:40px;" width="35" height="35"><span style="padding-left:22px;position:absolute;top:1px;left:63px;">'+value.name+'</span><input type="hidden" name="file_user_name['+i+']" value="'+value.id+'"><span style="padding-left:19px;position:absolute;top:18px;left: 27px;">'+value.email+'</span></div></div>'; 
    					  }
    			      });
    			      $('.search-box').html(details);
    	        },
    	  	    error:function(e)
    	  	    {
    	  	    	console.log("error in pages");
    	  	    }
    	     }); 

    });
     
    
    
    $(document).on('click', '.trash-attachment' , function(){
 	   
    	var today = new Date();
        var dd = String(today.getDate()).padStart(2, '0');
        var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
        var yyyy = today.getFullYear();
        today = yyyy + '-' + mm + '-' + dd ;
    	
        
        
        var url = window.location.href;
 	    var res = url.split("?");
 	    var  document_info_id = res[1];
 	    
    	Swal.fire({
    		title: 'Are you sure?',
            text: "The Document including all attachments will be moved to Trash for a period of 30 days, after which they will be permanently deleted",
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
          	            url: "../clientprocess?action=trashallAttachment",
          	            type: "post",
          	            dataType:"json",
          	            data:{"document_info_id":document_info_id , "currentDate":today},
          	            success: function(data)
          	            {
          	            	
          	               if(data.status)
          	               {
          	            	
          	            	  $(element).hide();
     	     	    		  Swal.fire({
    	     	    			  position:'center',
    	     	    			  icon: 'success',
    	     	    			  title: 'Success',
    	     	    			  timer: 2000
    	     	    			})
    	     	    			
    	     	    			
          	               }
          	               else
          	               {
          	            	  Swal.fire({
    	     	    			  position: 'center',
    	     	    			  icon: 'error',
    	     	    			  title: 'Something is wrong',
    	     	    			  timer: 2000
    	     	    			})   
    	     	    			
          	               }
          	            $('#loader').hide();
          	             
          	           },
          	  	    error:function(e)
          	  	    {
          	  	        $('#loader').hide();
     	            	console.log("error in pages");
          	  	    }
          	     }); 
     
    			  
    		  }
    		})
          	  
   	  }); 

    
    
    
    
    $(document).on('click' , '.star' , function(event){
        event.preventDefault();
        
        var url = window.location.href;
 	    var res = url.split("?");
 	    var  document_info_id = res[1];
 	    
 	    $('#loader').show();
        $.ajax({
     	    url: "../clientprocess?action=folderbookmarkupdate",
 	        type: "post",
 	        dataType:"json",
 	        data:{"document_info_id":document_info_id},
 	        success: function(result)
 	        {
 	        	
 	        	  if(result.status)
                   {
                      Swal.fire({
                      position: 'center',
                      icon: 'success',
                      title: 'Star Document',
                      timer: 3500
                      })   
                 
                   }
                  else
                  {
                     Swal.fire({
                     icon:'error',
                     title:'Something Went wrong',
                     text:"wrong",
                     footer:'',
                     timer:3500
                     }) 
                  }
                 $('#loader').hide();
 	        	          	
 	        },
  	        error:function(e)
  	       {
  	    	  console.log("error in pages");
  	    	  $('#loader').hide();
        	 
  	       }
     
       }); 
    });
    
    
    $(document).on('click' , '.details' , function(event){
        event.preventDefault();
        
        
        var url = window.location.href;
 	    var res = url.split("?");
 	    var  document_info_id = res[1];
 	    
 	    $('#loader').show();
        $.ajax({
     	    url: "../clientprocess?action=documentdetails",
 	        type: "post",
 	        dataType:"json",
 	        data:{"document_info_id":document_info_id},
 	        success: function(data)
 	        {
 	        	
 	        	 var obj = JSON.parse(JSON.stringify(data.documentdetals));
 	        	 console.log(obj);
 	        	 
 	        	 var access_level="";
 	        	 var upload_date="";
 	        	 var file_no="";
 	        	 var modify_date="";
 	        	 var modify_name="";
 	        	 var client_name="";
 	        	 var document_no="";
 	         	 var document_type="";
 	        	 var file_no="";
 	         	 var file_name = "";
 	         	 var department = "";
 	         	 var trash_date= "";
 	         	 var trash_client_name="";
 	         	 var restore_date="";
 	         	 var restore_client_name="";
 	         	 
 	        	 
 	        	 $.each(obj,  function( key, value ) {
 	        		 
 	        		 access_level = value.access_level;
 	        		 upload_date = value.currentDate;
 	        		 file_no = value.file_no;
 	        		 modify_date = value.modify_date;
 	        		 document_no = value.document_no;
 	        		 document_type = value.documenttype;
 	        		 file_no = value.file_no;
 	        		 file_name = value.filename;
 	        		 department = value.departmentname;
 	        		 trash_date=value.trash_date;
 	        		 trash_client_name=value.trash_client_name;    		 
 	        		 restore_date=value.restore_date;
 	        		 restore_client_name=value.restore_client_name;
 	        		 
 	        		 if(value.client_name === undefined ){
 	        		 
 	        		  }else{
 	        			
 	        			  client_name=value.client_name;
 		        	 }
 	                 
                      if(value.modify_date === undefined ){
 	        		 }else{
 	        			 modify_date=value.modify_date;
 		    		 }
 	        		 
 	                 if(value.modify_name === undefined ){
 	        		 }else{
 	        			 modify_name=value.modify_name;
 		    		 } 
 	        		 
 	        	 });
 	        	
 	        	 
 	        	 
 	         	   $('#loader').hide();
 	               $('#permission').val(access_level);
 	               $('#document_no').val(document_no);
 	               $('#file_name').val(file_name);
 	               $('#file_no').val(file_no);
	 			   $('#department').val(department);
	 			   $('#client_name').val(client_name);
	 	 		   $('#upload_date').val(upload_date);
 	 			   $('#modify_date').val(modify_date);
 	 			   $('#modify_name').val(modify_name);
 	 			   $('#document_type').val(document_type);
 	 			   $('#trash_date').val(trash_date);
	 			   $('#trash_client_name').val(trash_client_name);
	 			   $('#restore_date').val(restore_date);
	 			   $('#restore_client_name').val(restore_client_name);
	 			   $('.details-modal').modal('show');
 	        	 
 	           
 	        	          	
 	        },
  	        error:function(e)
  	       {
  	    	 console.log("error in pages");
  	       }
     
       }); 
    });
    
    
    
    
    
    
    $(document).ready(function () { 

    	$("#btnSubmit").click(function (event) {
        	event.preventDefault();
            
        	var form = $('#fileUploadForm')[0];
            var data = new FormData(form);
            var url = window.location.href;
     	    var res = url.split("?");
     	    var  document_info_id = res[1];
            data['document_info_id']=document_info_id;
           
            
            $('#loader').show();
            $.ajax({
                type: "POST",
                enctype: 'multipart/form-data',
                url: "../clientprocess?action=folderDocumentAttachement",
                data: data,
                processData: false,
                contentType: false,
                cache: false,
                timeout: 600000,
                success: function (data){

                 var result = JSON.parse(data);
                   
                   if(result.status)
                   {
                     Swal.fire({
                      position: 'center',
                      icon: 'success',
                      title: 'Document Created',
                      timer: 3500
                    })   
            
                    
                     document.getElementById("fileUploadForm").reset();
                    
                     var url = window.location.href;
                     var res = url.split("?");
                     var  document_info_id = res[1]; 
                     setTimeout(function(){
	     	    		 window.location.href="folder-view.jsp?"+document_info_id;
	     	         })
                     
                   
                  
                 }
                 else
                 {
                    Swal.fire({
                    icon:'error',
                    title:'Attachment Missing',
                    text:"wrong",
                    footer:'',
                    timer:3000
                    }) 
                }
                 $('#loader').hide();   
                   
                },
                error: function (e) {

                   $('#loader').hide();   
                   console.log("ERROR : ", e);
                   
                }
            });

        });

    });
    
    
   </script>
    
    
 <script>
 
  $(document).ready(function() {
	
	   var url = window.location.href;
	   var res = url.split("?");
	   var  document_info_id = res[1];
	   
	   $("#all_attachment").dataTable( {
		    
    	    "lengthMenu":[25,50],
            "pageLength":25,
  		    "searching":false,
	        "bProcessing": false,
	        "bServerSide": false,
	        "sort": "position",
	        "ajax":{
 	   	       url:"../clientprocess?action=folderAttachment",
 	  	       type:"POST",
 	  	       dataType:"json",
 	  	       data:{"document_info_id":document_info_id},
	        },
	        "aoColumns": [

	        	{ "mData": "attachment_name" }, 
	            { "mData": "size" },
	          //  { "mData": "Version" },
	            { "mData": "comments" },
	          //  { "mData": "lock" },
	            { "mData": "action" },
	          
	            
	        ]
	    } );  
	 
	 
	   function hideattachment(){
		   
		   $('.delete-single-attachment').hide();
	   
	   }
	   
	   
	   
	   $.ajax({
           url: "../clientprocess?action=folderAccess",
           type: "post",
           dataType:"json",
           data:{"document_info_id":document_info_id},
           success: function(data)
           {
           	console.log(data.access_level);
           	if(data.access_level){
           		 if(data.access_level=='Read'){
           			 
                      	 $('.access_level_hide').hide();
                      	 $('.upload_submit').prop('disabled', true);
                      	 setTimeout(hideattachment , 7000); 
                      	 
                      	 // $('#input_css').css({'position': 'inherit' , 'top':'-1px' , 'width': '400px !important' , 'border':'2px solid #6c757d' , 'border-radius': '25px' , 'padding-left':'10px'});
           		      
           		 }
           	 }
           
           },
     	    error:function(e)
     	    {
     	    	console.log("error in pages");
     	    }
        }); 
	   
	   
  });
 
 
 
 $(".fileSize").on('change', function() {
	  var totalSize = 0;

	  $(".fileSize").each(function() {
	    for (var i = 0; i < this.files.length; i++) {
	      totalSize += this.files[i].size;
	    }
	  });
	  
	
 });

 
 
 
 
 
 
 
 
 
 
 
 var i=$('table#documentuploading tr').length;
 
 $(".addmore").on('click',function(){
  html = '<tr>';
  html+= '<td></td>'; 
  html+= '<td><input type="file" name="multidocument['+i+']" id="multidocument_'+i+'" class="fileSize"></td>';
  html+= '<td><button class="delete-appended-row btn btn-danger" type="button">Remove</button></td>';
  html+= '</tr>';
  $('table#documentuploading').append(html);
  i++;
});
 
 
 	$(document).on('click','.delete-appended-row',function(){
		 $(this).parent().parent().remove();
	});
 
 	
   var url = window.location.href;
   var res = url.split("?");
   var  document_info_id = res[1];
   var document_inner="<input type='hidden' name='document_info_id'  value='"+document_info_id+"'/>";
   document.getElementById("document_inner").innerHTML = document_inner; 
	
	
	
  $(document).ready(function() {
    
	  
	  $('#loader').show();
	  $.ajax({
  		   url:"../clientprocess?action=documentindexing",
  		   type:"POST",
  		   dataType:"json",
  		   data:{"document_info_id":document_info_id},
  		   success:function(data,textStatus,jqXHR)
  		   {   
  			   
  			    var obj = JSON.parse(data.doc_indexing_info);
  			    console.log(obj);
  			    
  			    $('.remove').remove();
                var html_data="";
         	    var html_documentType="";
                $.each(obj ,  function( key, value ) {
  
                	
                	html_documentType =value.documenttype;
                	
                	
                    if(value.documenttype == 'Customer Registration'){
                    	
              		     var field_name = [ "Customer Code" , "Customer Name" ];
              	         var type=["text","text"];
              	         var name=["customercode" , "customername"];
              	         var value_data=[value.customercode , value.customername];
              	         
              			 for(var num=0;num<=field_name.length-1;num++)
              			 {
              				 html_data +='<div class="form-group remove">'
              			     html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
              			     html_data +='<div class="col-sm-10">'
              			     html_data +='<div class="form-line">'
              			     html_data +='<input type="'+type[num]+'" value="'+value_data[num]+'" name="'+name[num]+'" class="form-control show-tick">'
              			     html_data +='</div>'
              			     html_data +='</div>'
              			     html_data +='</div>'
              			 }
              	   
              			 
                    }else if(value.documenttype =='Sales'){
               		 
             		   
                     var field_name = ["Invoice Date" , "Invoice Number" , "Customer Code", "Customer Name" ];
           	         var type=["date","text" ,"text","text"];
           	         var name=["invoicedatesec","invoicenumbersec" ,"customercodesec" , "customernamesec"];
           	         var value_data=[value.invoicedate , value.invoicenumber , value.customercode , value.customername];
           	         for(var num=0;num<=field_name.length-1;num++)
           			 {
           				 html_data +='<div class="form-group remove">'
           			     html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
           			     html_data +='<div class="col-sm-10">'
           			     html_data +='<div class="form-line">'
           			     html_data +='<input type="'+type[num]+'" value="'+value_data[num]+'" name="'+name[num]+'" class="form-control show-tick">'
           			     html_data +='</div>'
           			     html_data +='</div>'
           			     html_data +='</div>'
           			 }
           			   
           	     }else if(value.documenttype =='Purchase'){
         			
           	         var field_name = ["Invoice Date" , "Invoice Number" , "Vendor Code", "Vendor Name" ];
        	         var type=["date","text" ,"text","text"];
        	         var name=["invoicedate","invoicenumber" ,"vendorcodesec" , "vendornamesec"];
        	         var value_data=[value.invoicedate , value.invoicenumber , value.vendorcode , value.vendorname];
        	         for(var num=0;num<=field_name.length-1;num++)
        			 {
        				 html_data +='<div class="form-group remove">'
        			     html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
        			     html_data +='<div class="col-sm-10">'
        			     html_data +='<div class="form-line">'
        			     html_data +='<input type="'+type[num]+'"  value="'+value_data[num]+'"  name="'+name[num]+'" class="form-control show-tick">'
        			     html_data +='</div>'
        			     html_data +='</div>'
        			     html_data +='</div>'
        			 }  
        			 
        			}else if(value.documenttype =='Vendor Registration'){
             			
              	     var field_name = ["Vendor Code" , "Vendor Name" ];
           	         var type=["text","text"];
           	         var name=["vendorcode" , "vendorname"];
           	         var value_data=[value.vendorcode , value.vendorname];
           	         
           	         for(var num=0;num<=field_name.length-1;num++)
           			 {
           				 html_data +='<div class="form-group remove">'
           			     html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
           			     html_data +='<div class="col-sm-10">'
           			     html_data +='<div class="form-line">'
           			     html_data +='<input type="'+type[num]+'"  value="'+value_data[num]+'"  name="'+name[num]+'" class="form-control show-tick">'
           			     html_data +='</div>'
           			     html_data +='</div>'
           			     html_data +='</div>'
           			 }  
           			 
           			}else if(value.documenttype =='Employee OutBoarding'){
        				
        				 var field_name = ["Employee Code" , "Employee Name" , "Date Of Joining" ];
        		         var type=["text" , "text" , "date"];
        		         var name=["employecode" ,"employename" , "joiningdate"];
        		         var value_data=[value.employecode , value.employee_name , value.joiningdate];
             	         for(var num=0;num<=field_name.length-1;num++)
        				 {
        					 html_data +='<div class="form-group remove">'
        				     html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
        				     html_data +='<div class="col-sm-10">'
        				     html_data +='<div class="form-line">'
        				     html_data +='<input type="'+type[num]+'" value="'+value_data[num]+'" name="'+name[num]+'" class="form-control show-tick">'
        				     html_data +='</div>'
        				     html_data +='</div>'
        				     html_data +='</div>'
        				}
        				 
        		   }else if(value.documenttype =='Challen'){
        				
        				 var field_name = ["Tax Type", "Challen Date", "Challen","challan.AM" ,"BSR Code"];
        		         var type=["text","date","text","text","text"];
        		         var name=["documentType1","documentType2","documentType3","documentType4","documentType5"];
        		         var value_data=[value.documentType1 , value.documentType2 , value.documentType3 , value.documentType4 , value.documentType5];
             	         
        		         for(var num=0;num<=field_name.length-1;num++)
        				 {
        					 html_data +='<div class="form-group remove">'
        				     html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
        				     html_data +='<div class="col-sm-10">'
        				     html_data +='<div class="form-line">'
        					 html_data +='<input type="'+type[num]+'" value="'+value_data[num]+'" name="'+name[num]+'" class="form-control show-tick">'
        					 html_data +='</div>'
        					 html_data +='</div>'
        					 html_data +='</div>'
        				 }
        			 
        		   } else if(value.documenttype == 'Tax Audit Report'){
        				
        				 
        			     var field_name = ["Financial Year", "Assessment Year", "Date","Membership No." ,"Firm Name/Reg No.","UDIN"];
        		         var type=["text","text","date","text","text","text"];
        		         var name=["documentType1","documentType2","documentType3","documentType4","documentType5","documentType6"];
        		         var value_data=[value.documentType1 , value.documentType2 , value.documentType3 , value.documentType4 , value.documentType5 , value.documentType6];
             	         
        		         for(var num=0;num<=field_name.length-1;num++)
        				 {
        		        	 html_data +='<div class="form-group remove">'
        		             html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
        		             html_data +='<div class="col-sm-10">'
        		             html_data +='<div class="form-line">'
        		             html_data +='<input type="'+type[num]+'" value="'+value_data[num]+'" name="'+name[num]+'" class="form-control show-tick">'
        		             html_data +='</div>'
        		             html_data +='</div>'
        		             html_data +='</div>'
        				 }
        			
        				 
        		   }else if(value.documenttype == 'Power of Attorney'){
        				
        				
        			     var field_name = ["Date", "AY / FY", "Signatory"];
        		         var type=["date","text","text"];
        		         var name=["documentType1","documentType2","documentType3"];
        		         var value_data=[value.documentType1 , value.documentType2 , value.documentType3];
             	         for(var num=0;num<=field_name.length-1;num++)
        				 {
             	        	html_data +='<div class="form-group remove">'
             	        	html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
             	        	html_data +='<div class="col-sm-10">'
             	        	html_data +='<div class="form-line">'
             	            html_data +='<input type="'+type[num]+'" value="'+value_data[num]+'" name="'+name[num]+'" class="form-control show-tick">'
             	        	html_data +='</div>'
             	        	html_data +='</div>'
             	        	html_data +='</div>'
        				 }
        				 
        		   }else if(value.documenttype == 'Notice'){
        				
        				 
        			     var field_name = ["Financial Year", "Assessment Year", "Date","Section","DIN","CIN"];
        		         var type=["text","text","date","text","text","text"];
        		         var name=["documentType1","documentType2","documentType3","documentType4","documentType5","documentType6"];
        		         var value_data=[value.documentType1 , value.documentType2 , value.documentType3 , value.documentType4 , value.documentType5 , value.documentType6];
             	         for(var num=0;num<=field_name.length-1;num++)
        				 {
             	        	html_data +='<div class="form-group remove">'
             	        	html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
             	        	html_data +='<div class="col-sm-10">'
             	        	html_data +='<div class="form-line">'
             	        	html_data +='<input type="'+type[num]+'" value="'+value_data[num]+'" name="'+name[num]+'" class="form-control show-tick">'
             	        	html_data  +='</div>'
             	            html_data +='</div>'
        				 }
        			
        		   }else if(value.documenttype == 'Submission'){
        				
        				 
        			     var field_name = ["Financial Year", "Assessment Year", "Submission Date","Order Reference / Notice Reference"];
        		         var type=["text","text","date","text"];
        		         var name=["documentType1","documentType2","documentType3","documentType4"];
        		         var value_data=[value.documentType1 , value.documentType2 , value.documentType3 , value.documentType4];
                   	     for(var num=0;num<=field_name.length-1;num++)
        				 {
                   	    	html_data +='<div class="form-group remove">'
                   	    	html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
                   	    	html_data +='<div class="col-sm-10">'
                   	    	html_data +='<div class="form-line">'
                   	    	html_data +='<input type="'+type[num]+'" value="'+value_data[num]+'" name="'+name[num]+'" class="form-control show-tick">'
                   	        html_data +='</div>'
                   	        html_data +='</div>'
                   	        html_data +='</div>'
        				 }
        				 
        		   }else if(value.documenttype == 'Assessment Order'){
        				
        				 
        			     var field_name = ["Financial Year", "Assessment Year", "Date","Section","Jurisdiction","Document Indentification No.(DIN)"];
        		         var type=["text","text","date","text","text","text"];
        		         var name=["documentType1","documentType2","documentType3","documentType4","documentType5","documentType6"];
        		         var value_data=[value.documentType1 , value.documentType2 , value.documentType3 , value.documentType4, value.documentType5 , value.documentType6];
                   	     for(var num=0;num<=field_name.length-1;num++)
        				 {
                   	    	html_data +='<div class="form-group remove">'
                   	        html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
                   	        html_data +='<div class="col-sm-10">'
                   	        html_data +='<div class="form-line">'
                   	        html_data +='<input type="'+type[num]+'" value="'+value_data[num]+'" name="'+name[num]+'" class="form-control show-tick">'
                   	        html_data +='</div>'
                   	        html_data +='</div>'
                   	        html_data +='</div>'
        				 }
        				 
        		   }else if(value.documenttype == 'Income Tax Return'){
        				
        				 
        			     var field_name = ["Financial Year", "Assessment Year", "Date of Filling","ITR Form No/ACR.No"];
        		         var type=["text","text","date","text"];
        		         var name=["documentType1","documentType2","documentType3","documentType4"];
        		         var value_data=[value.documentType1 , value.documentType2 , value.documentType3 , value.documentType4];
                   	     for(var num=0;num<=field_name.length-1;num++)
        				 {
        						html_data +='<div class="form-group remove">'
                           	    html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
                           	    html_data +='<div class="col-sm-10">'
                       	        html_data +='<div class="form-line">'
                       	        html_data +='<input type="'+type[num]+'" value="'+value_data[num]+'" name="'+name[num]+'" class="form-control show-tick">'
                       	        html_data +='</div>'
                       	        html_data +='</div>'
                       	        html_data +='</div>'
            				
        				 }
        				 
        		   }else if(value.documenttype == 'Engagement Letter:'){
        				
        				 
        			     var field_name = ["Date", "Period", "Authorization"];
        		         var type=["date","text","text"];
        		         var name=["documentType1","documentType2","documentType3"];
        		         var value_data=[value.documentType1 , value.documentType2 , value.documentType3];
                   	     for(var num=0;num<=field_name.length-1;num++)
        				 {
        					 html_data +='<div class="form-group remove">'
                             html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
                             html_data +='<div class="col-sm-10">'
                        	 html_data +='<div class="form-line">'
                        	 html_data +='<input type="'+type[num]+'" value="'+value_data[num]+'" name="'+name[num]+'" class="form-control show-tick">'
                        	 html_data +='</div>'
                        	 html_data +='</div>'
                        	 html_data +='</div>'
        				 }
        				 
        		   }else if(value.documenttype == 'Challen:'){
        				
        				 
        			     var field_name = ["Tax Type", "Challen Date", "Challen No.","Period / A4 /F4","BSR code"];
        		         var type=["text","date","text","text","text"];
        		         var name=["documentType1" , "documentType2" , "documentType3","documentType4","documentType5"];
        		         var value_data=[value.documentType1 , value.documentType2 , value.documentType3 , value.documentType4 , value.documentType5];
                   	     
        		         for(var num=0;num<=field_name.length-1;num++)
        				 {
        				   
        					 html_data +='<div class="form-group remove">'
                             html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
                             html_data +='<div class="col-sm-10">'
                             html_data +='<div class="form-line">'
                             html_data +='<input type="'+type[num]+'" value="'+value_data[num]+'" name="'+name[num]+'" class="form-control show-tick">'
                             html_data +='</div>'
                             html_data +='</div>'
                             html_data +='</div>'
        				 
        				 }
        				 
        		   }else if(value.documenttype =='GSTR-1 Returns'){
        				
        				 
        			     var field_name = ["Legal / Trade Name", "Month / Year", "GSTN","Authorization"];
        		         var type=["text","date","text","text"];
        		         var name=["documentType1" , "documentType2" , "documentType3","documentType4"];
        		         var value_data=[value.documentType1 , value.documentType2 , value.documentType3 , value.documentType4];
                    	 for(var num=0;num<=field_name.length-1;num++)
        				 {
        					     html_data +='<div class="form-group remove">'
                                 html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
                                 html_data +='<div class="col-sm-10">'
                                 html_data +='<div class="form-line">'
                                 html_data +='<input type="'+type[num]+'" value="'+value_data[num]+'" name="'+name[num]+'" class="form-control show-tick">'
                                 html_data +='</div>'
                                 html_data +='</div>'
                                 html_data +='</div>'
        				 }
        				 
        				 
        		   }else if(value.documenttype == 'Invoice / Docs - Output'){
        				
        			   
        			   
        			     var field_name = ["Doc / Invoice No.", "Date", "GSTN","Name of Party"];
        		         var type=["text","date","text","text"];
        		         var name=["documentType1" , "documentType2" , "documentType3","documentType4"];
        		         var value_data=[value.documentType1 , value.documentType2 , value.documentType3 , value.documentType4];
                         for(var num=0;num<=field_name.length-1;num++)
        				 {
        				 
        					     html_data +='<div class="form-group remove">'
                                 html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
                                 html_data +='<div class="col-sm-10">'
                                 html_data +='<div class="form-line">'
                                 html_data +='<input type="'+type[num]+'" value="'+value_data[num]+'" name="'+name[num]+'" class="form-control show-tick">'
                                 html_data +='</div>'
                                 html_data +='</div>'
                                 html_data +='</div>'
        				  
        				 }
        				
        			   
        			    
        		   }else if(value.documenttype =='STR-3B Returns'){
        				
        			   
        			   
        			     var field_name = ["Legal / Trade Name", "Tax period", "GSTN","Authorized Sign"];
        		         var type=["text","date","text","text"];
        		         var name=["documentType1" , "documentType2" , "documentType3","documentType4"];
        		         var value_data=[value.documentType1 , value.documentType2 , value.documentType3 , value.documentType4];
                         for(var num=0;num<=field_name.length-1;num++)
        				 {
        					     html_data +='<div class="form-group remove">'
                                 html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
                                 html_data +='<div class="col-sm-10">'
                                 html_data +='<div class="form-line">'
                                 html_data +='<input type="'+type[num]+'" value="'+value_data[num]+'" name="'+name[num]+'" class="form-control show-tick">'
                                 html_data +='</div>'
                                 html_data +='</div>'
                                 html_data +='</div>'
        				 }
        			
        				 
        		   }else if(value.documenttype =='Input Detail/Docs/Invoices'){
        				
        			   
        			   
        			     var field_name = ["Invoice No.", "Date", "GSTN","Name of Party"];
        		         var type=["text","date","text","text"];
        		         var name=["documentType1" , "documentType2" , "documentType3","documentType4"];
        		         var value_data=[value.documentType1 , value.documentType2 , value.documentType3 , value.documentType4];
                         for(var num=0;num<=field_name.length-1;num++)
        				 {
        				
        					     html_data +='<div class="form-group remove">'
                                 html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
                                 html_data +='<div class="col-sm-10">'
                                 html_data +='<div class="form-line">'
                                 html_data +='<input type="'+type[num]+'" value="'+value_data[num]+'" name="'+name[num]+'" class="form-control show-tick">'
                                 html_data +='</div>'
                                 html_data +='</div>'
                                 html_data +='</div>'
        					 
        					 
        				 }
        				
        				 
        		   }else if(value.documenttype =='Refund Forms RFD OS/01A'){
        				
        			   
        			    var field_name = ["Legal/Trade Name", "Tax Period", "GSTN","Authorized Sign"];
        		        var type=["text", "date" , "text" , "text"];
        		        var name=["documentType1" , "documentType2" , "documentType3","documentType4"];
        		        var value_data=[value.documentType1 , value.documentType2 , value.documentType3 , value.documentType4];
                        
        		         for(var num=0;num<=field_name.length-1;num++)
        				 {
        					 
        					     html_data +='<div class="form-group remove">'
                                 html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
                                 html_data +='<div class="col-sm-10">'
                                 html_data +='<div class="form-line">'
                                 html_data +='<input type="'+type[num]+'" value="'+value_data[num]+'" name="'+name[num]+'" class="form-control show-tick">'
                                 html_data +='</div>'
                                 html_data +='</div>'
                                 html_data +='</div>'
        				 }
        			
        				 
        		   }else if(value.documenttype == 'E-way Bill'){
        				
        			   
        			    var field_name = ["E-way Bill No.", "Date of Generation", "Name of Generation","NSN Code","GSTN of Supplier","Vehicle No."];
        		        var type=["text","date","text","text","text","text"];
        		        var name=["documentType1" , "documentType2" , "documentType3","documentType4","documentType5","documentType6"];
        		        var value_data=[value.documentType1 , value.documentType2 , value.documentType3 , value.documentType4 , value.documentType5 , value.documentType6];
                        for(var num=0;num<=field_name.length-1;num++)
        				 {
        				
        		        	    html_data +='<div class="form-group remove">'
                                html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
                                html_data +='<div class="col-sm-10">'
                                html_data +='<div class="form-line">'
                                html_data +='<input type="'+type[num]+'" value="'+value_data[num]+'" name="'+name[num]+'" class="form-control show-tick">'
                                html_data +='</div>'
                                html_data +='</div>'
                                html_data +='</div>'
        		        	
        				 }
        				 
        			
        				 
        		   }else if(value.documenttype == 'Refund Forms RFD OS/01A'){
        				
        			   
        			     var field_name = ["Legal/Trade Name", "Tax Period", "GSTN","Authorized Sign"];
        		         var type=["text", "date" , "text" , "text"];
        		         var name=["documentType1" , "documentType2" , "documentType3","documentType4"];
        		         var value_data=[value.documentType1 , value.documentType2 , value.documentType3 , value.documentType4];
                         for(var num=0;num<=field_name.length-1;num++)
        				 {
        				
        		        	     html_data +='<div class="form-group remove">'
                                 html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
                                 html_data +='<div class="col-sm-10">'
                                 html_data +='<div class="form-line">'
                                 html_data +='<input type="'+type[num]+'" value="'+value_data[num]+'" name="'+name[num]+'" class="form-control show-tick">'
                                 html_data +='</div>'
                                 html_data +='</div>'
                                 html_data +='</div>'
        		        	 
        				 }
        				 
        			
        				 
        		   }else if(value.documenttype =='Debit / Credit Note'){
        				
        			   
        			      var field_name = ["GSTN Of Supplier", "Serial Number", "Date of Issue","Authorization"];
        		          var type=["text", "text" , "date" , "text"];
        		          var name=["documentType1" , "documentType2" , "documentType3","documentType4"];
        		          var value_data=[value.documentType1 , value.documentType2 , value.documentType3 , value.documentType4];
                         
        		          for(var num=0;num<=field_name.length-1;num++)
        				 {
        				
        					     html_data +='<div class="form-group remove">'
                                 html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
                                 html_data +='<div class="col-sm-10">'
                                 html_data +='<div class="form-line">'
                                 html_data +='<input type="'+type[num]+'" value="'+value_data[num]+'" name="'+name[num]+'" class="form-control show-tick">'
                                 html_data +='</div>'
                                 html_data +='</div>'
                                 html_data +='</div>'
        				 
        				 }
        				 
        			     
        			
        				 
        		   }else if(value.documenttype == 'Confirmations'){
        				
        			   
        			     var field_name = ["Confirmation Type", "Company / Bank Name", "Date"];
        		         var type=["text","text","date"];
        		         var name=["documentType1" , "documentType2" , "documentType3"];
        		         var value_data=[value.documentType1 , value.documentType2 , value.documentType3];
                         for(var num=0;num<=field_name.length-1;num++)
        				 {
        				
        					     html_data +='<div class="form-group remove">'
                                 html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
                                 html_data +='<div class="col-sm-10">'
                                 html_data +='<div class="form-line">'
                                 html_data +='<input type="'+type[num]+'" value="'+value_data[num]+'" name="'+name[num]+'" class="form-control show-tick">'
                                 html_data +='</div>'
                                 html_data +='</div>'
                                 html_data +='</div>'
        					 
        				 }
        				 
        		   }else if(value.documenttype == 'General'){
        				
        			   
        			     var field_name = ["Name", "Description", "Date"];
        		         var type=["text","text","date"];
        		         var name=["documentType1" , "documentType2" , "documentType3"];
        		         var value_data=[value.documentType1 , value.documentType2 , value.documentType3];
                         for(var num=0;num<=field_name.length-1;num++)
        				 {
        				 
        					     html_data +='<div class="form-group remove">'
                                 html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
                                 html_data +='<div class="col-sm-10">'
                                 html_data +='<div class="form-line">'
                                 html_data +='<input type="'+type[num]+'" value="'+value_data[num]+'" name="'+name[num]+'" class="form-control show-tick">'
                                 html_data +='</div>'
                                 html_data +='</div>'
                                 html_data +='</div>'
        				 
        				 }
        				
        				 
        		   }else if(value.documenttype == 'Minutes'){
        				
        			   
        			     var field_name = ["Period", "Meeting Type", "Meeting Date"];
        		         var type=["text","text","date"];
        		         var name=["documentType1" , "documentType2" , "documentType3"];
        		         var value_data=[value.documentType1 , value.documentType2 , value.documentType3];
                         for(var num=0;num<=field_name.length-1;num++)
        				 {
        				
        					     html_data +='<div class="form-group remove">'
                                 html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
                                 html_data +='<div class="col-sm-10">'
                                 html_data +='<div class="form-line">'
                                 html_data +='<input type="'+type[num]+'" value="'+value_data[num]+'" name="'+name[num]+'" class="form-control show-tick">'
                                 html_data +='</div>'
                                 html_data +='</div>'
                                 html_data +='</div>'
        					 
        				 }
        				
        		   }else if(value.documenttype == 'Workpaper'){
        				
        			   
        			     var field_name = ["Audit Period", "Workpaper Name", "Description"];
        		         var type=["text","text","text"];
        		         var name=["documentType1" , "documentType2" , "documentType3"];
        		         var value_data=[value.documentType1 , value.documentType2 , value.documentType3];
                         for(var num=0;num<=field_name.length-1;num++)
        				 {
        				
        					     html_data +='<div class="form-group remove">'
                                 html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
                                 html_data +='<div class="col-sm-10">'
                                 html_data +='<div class="form-line">'
                                 html_data +='<input type="'+type[num]+'" value="'+value_data[num]+'" name="'+name[num]+'" class="form-control show-tick">'
                                 html_data +='</div>'
                                 html_data +='</div>'
                                 html_data +='</div>'
        					 
        				 }
        			
        			    
        		   }else if(value.documenttype == 'Financials'){
        				
        			   
        			     var field_name = ["Financial Year", "Signing Date", "UDIN"];
        		         var type=["text","date","text"];
        		         var name=["documentType1" , "documentType2" , "documentType3"];
        		         var value_data=[value.documentType1 , value.documentType2 , value.documentType3];
                         for(var num=0;num<=field_name.length-1;num++)
        				 {
        			
        					     html_data +='<div class="form-group remove">'
                                 html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
                                 html_data +='<div class="col-sm-10">'
                                 html_data +='<div class="form-line">'
                                 html_data +='<input type="'+type[num]+'" value="'+value_data[num]+'" name="'+name[num]+'" class="form-control show-tick">'
                                 html_data +='</div>'
                                 html_data +='</div>'
                                 html_data +='</div>'
        				 
        				 }
        			
        			    
        		   }else if(value.documenttype == 'Engagement Letter'){
        				
        			     var field_name = ["Financial Year", "Signing Date", "UDIN"];
        		         var type=["text","date","text"];
        		         var name=["documentType1" , "documentType2" , "documentType3"];
        		         var value_data=[value.documentType1 , value.documentType2 , value.documentType3];
                         for(var num=0;num<=field_name.length-1;num++)
        				 {
        					     html_data +='<div class="form-group remove">'
                                 html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
                                 html_data +='<div class="col-sm-10">'
                                 html_data +='<div class="form-line">'
                                 html_data +='<input type="'+type[num]+'" value="'+value_data[num]+'" name="'+name[num]+'" class="form-control show-tick">'
                                 html_data +='</div>'
                                 html_data +='</div>'
                                 html_data +='</div>'
        				 }
        			
        			    
        		   }else if(value.documenttype =='Employee Documents'){
       				
        			   
      			     var field_name = ["Employee ID", "Employee Name", "Hiring Date"];
      		         var type=["text","text","text"];
      		         var name=["documentType1" , "documentType2" , "documentType3"];
      		         var value_data=[value.documentType1 , value.documentType2 , value.documentType3];
                       for(var num=0;num<=field_name.length-1;num++)
      				 {
          			         html_data +='<div class="form-group remove">'
                               html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
                               html_data +='<div class="col-sm-10">'
                               html_data +='<div class="form-line">'
                               html_data +='<input type="'+type[num]+'" value="'+value_data[num]+'" name="'+name[num]+'" class="form-control show-tick">'
                               html_data +='</div>'
                               html_data +='</div>'
                               html_data +='</div>'
      		
      				 }
      				
      			    
      		   }else if(value.documenttype == 'Other'){
      				
      			   
      			     var field_name = ["Document Name", "Description"];
      		         var type=["text", "text"];
      		         var name=["documentType1" , "documentType2"];
      		         var value_data=[value.documentType1 , value.documentType2];
      		          
      		         for(var num=0;num<=field_name.length-1;num++)
      				 {
      			             html_data +='<div class="form-group remove">'
                               html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
                               html_data +='<div class="col-sm-10">'
                               html_data +='<div class="form-line">'
                               html_data +='<input type="'+type[num]+'" value="'+value_data[num]+'" name="'+name[num]+'" class="form-control show-tick">'
                               html_data +='</div>'
                               html_data +='</div>'
                               html_data +='</div>'
      		
      				 }
      			
      			    
      		   }else if(value.documenttype =='Salary Regsiter'){
      				
      			   
      			     var field_name = ["Period", "Description"];
      		         var type=["text", "text"];
      		         var name=["documentType1" , "documentType2"];
      		         var value_data=[value.documentType1 , value.documentType2];
                       for(var num=0;num<=field_name.length-1;num++)
      				 {
      			             html_data +='<div class="form-group remove">'
                               html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
                               html_data +='<div class="col-sm-10">'
                               html_data +='<div class="form-line">'
                               html_data +='<input type="'+type[num]+'" value="'+value_data[num]+'" name="'+name[num]+'" class="form-control show-tick">'
                               html_data +='</div>'
                               html_data +='</div>'
                               html_data +='</div>'
      		
      				 }
      			
      			    
      		   }else if(value.documenttype =='Contract'){
      				
      			   
      			     var field_name = ["Contract Date", "Party" , "Description"];
      		         var type=["date" , "text" , "text"];
      		         var name=["documentType1" , "documentType2" , "documentType3"];
      		         var value_data=[value.documentType1 , value.documentType2 , value.documentType3];
                       for(var num=0;num<=field_name.length-1;num++)
      				 {
      		                 html_data +='<div class="form-group remove">'
                               html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
                               html_data +='<div class="col-sm-10">'
                               html_data +='<div class="form-line">'
                               html_data +='<input type="'+type[num]+'" value="'+value_data[num]+'" name="'+name[num]+'" class="form-control show-tick">'
                               html_data +='</div>'
                               html_data +='</div>'
                               html_data +='</div>'
      	
      				 }
      			
      			    
      		   }else if(value.documenttype =='Registration'){
      				
      			   
      			     var field_name = ["Registration Type", "Registration Date" , "Description"];
      		         var type=["text" , "date" , "text"];
      		         var name=["documentType1" , "documentType2" , "documentType3"];
      		         
      		         var value_data=[value.documentType1 , value.documentType2 , value.documentType3];
                       for(var num=0;num<=field_name.length-1;num++)
      				 {
      		                 html_data +='<div class="form-group remove">'
                               html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
                               html_data +='<div class="col-sm-10">'
                               html_data +='<div class="form-line">'
                               html_data +='<input type="'+type[num]+'" value="'+value_data[num]+'" name="'+name[num]+'" class="form-control show-tick">'
                               html_data +='</div>'
                               html_data +='</div>'
                               html_data +='</div>'
      		 
      				 }
      			
      			    
      		   }else if(value.documenttype =='Purchase(Goods)'){
      				
      			    console.log('-------------->',value.documenttype);
      			   
      			    console.log('-------------->',value.documentType1);
       			   
      			    
      			     var field_name = ["Invoice Date", "Invoice Number" , "Description" , "Vendor Code" , "Vendor Name" , "Voucher Number"];
      		         var type=["date" , "text" , "text" , "text" , "text" , "text"];
      		         var name=["documentType1" , "documentType2" , "documentType3" , "documentType4" , "documentType5" , "documentType6"];
      		         var value_data=[value.documentType1 , value.documentType2 , value.documentType3 , value.documentType4 , value.documentType5, value.documentType6];
                       for(var num=0;num<=field_name.length-1;num++)
      				 {
      		                 html_data +='<div class="form-group remove">'
                               html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
                               html_data +='<div class="col-sm-10">'
                               html_data +='<div class="form-line">'
                               html_data +='<input type="'+type[num]+'" value="'+value_data[num]+'" name="'+name[num]+'" class="form-control show-tick">'
                               html_data +='</div>'
                               html_data +='</div>'
                               html_data +='</div>'
      	
      				 }
      			
      			    
      		    } else if(value.documenttype =='Purchase(Services)'){
      						
      					   
      				     var field_name = ["Invoice Date", "Invoice Number" , "Description" , "Vendor Code" , "Vendor Name" , "Voucher Number"];
      			         var type=["date" , "text" , "text" , "text" , "text" , "text"];
      			         var name=["documentType1" , "documentType2" , "documentType3" , "documentType4" , "documentType5" , "documentType6"];
      			         var value_data=[value.documentType1 , value.documentType2 , value.documentType3 , value.documentType4 , value.documentType5, value.documentType6];
      	                 for(var num=0;num<=field_name.length-1;num++)
      					 {
      			                 html_data +='<div class="form-group remove">'
                                   html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
                                   html_data +='<div class="col-sm-10">'
                                   html_data +='<div class="form-line">'
                                   html_data +='<input type="'+type[num]+'" value="'+value_data[num]+'" name="'+name[num]+'" class="form-control show-tick">'
                                   html_data +='</div>'
                                   html_data +='</div>'
                                   html_data +='</div>'
          		 }
      				
      				    
      			   }else if(value.documenttype =='Sale(Goods)'){
      					
      				   
      				     var field_name = ["Invoice Date", "Invoice Number" , "Description" , "Customer Code" , "Customer Name"];
      			         var type=["date" , "text" , "text" , "text" , "text" , "text"];
      			         var name=["documentType1" , "documentType2" , "documentType3" , "documentType4" , "documentType5" , "documentType6"];
      			         var value_data=[value.documentType1 , value.documentType2 , value.documentType3 , value.documentType4 , value.documentType5, value.documentType6];
      	                 for(var num=0;num<=field_name.length-1;num++)
      					 {
      			                 html_data +='<div class="form-group remove">'
                                   html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
                                   html_data +='<div class="col-sm-10">'
                                   html_data +='<div class="form-line">'
                                   html_data +='<input type="'+type[num]+'" value="'+value_data[num]+'" name="'+name[num]+'" class="form-control show-tick">'
                                   html_data +='</div>'
                                   html_data +='</div>'
                                   html_data +='</div>'
          	
      					 }
      				
      				    
      			   }else if(value.documenttype =='Sale(Services)'){
      					
      				   
      				     var field_name = ["Invoice Date", "Invoice Number" , "Description" , "Customer Code" , "Customer Name"];
      			         var type=["date" , "text" , "text" , "text" , "text" , "text"];
      			         var name=["documentType1" , "documentType2" , "documentType3" , "documentType4" , "documentType5" , "documentType6"];
      			         var value_data=[value.documentType1 , value.documentType2 , value.documentType3 , value.documentType4 , value.documentType5, value.documentType6];
      	                 for(var num=0;num<=field_name.length-1;num++)
      					 {
      			                 html_data +='<div class="form-group remove">'
                                   html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
                                   html_data +='<div class="col-sm-10">'
                                   html_data +='<div class="form-line">'
                                   html_data +='<input type="'+type[num]+'" value="'+value_data[num]+'" name="'+name[num]+'" class="form-control show-tick">'
                                   html_data +='</div>'
                                   html_data +='</div>'
                                   html_data +='</div>'
          	
      					 }
      				
      				    
      			   }else if(value.documenttype =='Audit Report'){
      					
       				
      				 var field_name = ["Financial Year", "Period" , "Auditor Name" , "Sign Date"];
      			     var type=["text" , "text" , "text" , "date"];
      			     var name=["documentType1" , "documentType2" , "documentType3" , "documentType4"];
    			         var value_data=[value.documentType1 , value.documentType2 , value.documentType3 , value.documentType4];
    	                 for(var num=0;num<=field_name.length-1;num++)
    					 {
    			                 html_data +='<div class="form-group remove">'
                                 html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
                                 html_data +='<div class="col-sm-10">'
                                 html_data +='<div class="form-line">'
                                 html_data +='<input type="'+type[num]+'" value="'+value_data[num]+'" name="'+name[num]+'" class="form-control show-tick">'
                                 html_data +='</div>'
                                 html_data +='</div>'
                                 html_data +='</div>'
        	
    					 }
    				
    				    
      			   }else if(value.documenttype =='Balance Sheet'){
        					
      				      var field_name = ["Financial Year", "Period" , "Description"];
      			          var type=["text" , "text" , "text"];
      			          var name=["documentType1" , "documentType2" , "documentType3"];
      			          var value_data=[value.documentType1 , value.documentType2 , value.documentType3];
      	                 for(var num=0;num<=field_name.length-1;num++)
      					 {
      			                 html_data +='<div class="form-group remove">'
                                   html_data +='<label for="NameSurname" class="col-sm-2 control-label">'+field_name[num]+'</label>'
                                   html_data +='<div class="col-sm-10">'
                                   html_data +='<div class="form-line">'
                                   html_data +='<input type="'+type[num]+'" value="'+value_data[num]+'" name="'+name[num]+'" class="form-control show-tick">'
                                   html_data +='</div>'
                                   html_data +='</div>'
                                   html_data +='</div>'
          	
      					 }
      				
      				    
      			   }                
                    
                    
  			  }); 
              
                
                 
              $('#loader').hide();
              $('.indexing_html').html(html_data);
         	  $('.documentType').html('<input type="text" name="documenttype" value="'+html_documentType+'"  class="form-control show-tick" readonly/>')
         	  $('#fileUploadForm input').attr('readonly', 'readonly');  
  		   },
  		   error:function(e)
  		   {
  			  $('#loader').hide(); 
  			  console.log("error in pages");
  		   }

  		});    
	  
	
  });
	
  
  $(document).on('click', '.trash-document' , function(){
	   
  	   var today = new Date();
      var dd = String(today.getDate()).padStart(2, '0');
      var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
      var yyyy = today.getFullYear();
      today = yyyy + '-' + mm + '-' + dd ;
  	
      
      var url = window.location.href;
      var res = url.split("?");
      var  document_info_id = res[1]; 
     
      
   let element = $(this);  
      
  	Swal.fire({
  		title: 'Are you sure?',
          text: "The Document including all attachments will be moved to Trash for a period of 30 days, after which they will be permanently deleted",
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
        	            url: "../clientprocess?action=trashdocument",
        	            type: "post",
        	            dataType:"json",
        	            data:{"document_info_id":document_info_id , "currentDate":today},
        	            success: function(data)
        	            {
        	            	
        	               if(data.status)
        	               {
        	            	
        	            	  Swal.fire({
  	     	    			  position:'center',
  	     	    			  icon: 'success',
  	     	    			  title: 'Success',
  	     	    			  timer: 2000
  	     	    			})
  	     	    		        var url = window.location.href;
        	                     var res = url.split("?");
        	                     var  document_info_id = res[1]; 
        	                     setTimeout(function(){
        		     	    		 window.location.href="folder-view.jsp?"+document_info_id;
        		     	         })
        	                     
  	     	    			
        	               }
        	               else
        	               {
        	            	  Swal.fire({
  	     	    			  position: 'center',
  	     	    			  icon: 'error',
  	     	    			  title: 'Something is wrong',
  	     	    			  timer: 2000
  	     	    			})   
  	     	    			
        	               }
        	            $('#loader').hide();
        	             
        	           },
        	  	    error:function(e)
        	  	    {
        	  	        $('#loader').hide();
   	            	console.log("error in pages");
        	  	    }
        	     }); 
   
  			  
  		  }
  		})
        	  
 	});
 
	
	
	


</script>
<script>


    
    
$(document).on('click', '.panel-heading span.icon_minim', function (e) {
    var $this = $(this);
    if (!$this.hasClass('panel-collapsed')) {
        $this.parents('.panel').find('.panel-body').slideUp();
        $this.addClass('panel-collapsed');
        $this.removeClass('glyphicon-minus').addClass('glyphicon-plus');
    } else {
        $this.parents('.panel').find('.panel-body').slideDown();
        $this.removeClass('panel-collapsed');
        $this.removeClass('glyphicon-plus').addClass('glyphicon-minus');
    }
});

$(document).on('focus', '.panel-footer input.chat_input', function (e) {

	var $this = $(this);
    if ($('#minim_chat_window').hasClass('panel-collapsed')) {
        $this.parents('.panel').find('.panel-body').slideDown();
        $('#minim_chat_window').removeClass('panel-collapsed');
        $('#minim_chat_window').removeClass('glyphicon-plus').addClass('glyphicon-minus');
    }
});

$(document).on('click', '#new_chat', function (e) {
    var size = $( ".chat-window:last-child" ).css("margin-left");
     size_total = parseInt(size) + 400;
    alert(size_total);
    var clone = $( "#chat_window_1" ).clone().appendTo( ".container" );
    clone.css("margin-left", size_total);
});

$(document).on('click', '.icon_close', function (e) {
     $( "#chat_window_1" ).hide();
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