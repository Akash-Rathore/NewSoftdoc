<%@include file="include/session.jsp" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date" %>   
<!DOCTYPE html>
<html>

<head>

    <%@include file="include/head.jsp"%>
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
    
          .navbar-select{
    box-shadow: none !important;
    border-bottom: 0px solid #03a9f4 !important;
    -webkit-border-radius: 0;
    -moz-border-radius: 0;
    -ms-border-radius: 0;
    border-radius: 0;
    }
    
      .navbar-select:not([class*="col-"]):not([class*="form-control"]):not(.input-group-btn) {
    
    width: 110px;
    
    }
    
    .navbar-select.btn-group .dropdown-toggle .caret {
    position: absolute;
    top: 50%;
    right: -12px;
    margin-top: -2px;
    vertical-align: middle;
    } 

    .navbar-select.btn-group .dropdown-toggle .filter-option {
    
    display: inline-block;
    overflow: hidden;
    width: 100%;
    color: #ffffff;
    background: #03a9f4;
    text-align: center;
    }
    .navbar-select > .btn-default,  .navbar-select > .btn-default:hover,  .navbar-select >.btn-default:active,  .navbar-select > .btn-default:focus{
           background-color: #03a9f4 !important;
    }
     
    
    </style> 
      
      
  </head>

<body class="theme-light-blue">
    <div class="overlay"></div>
    <!-- Top Bar -->
       <%@include file="include/navbar.jsp"%>
    <!-- #Top Bar -->
    <section>
        <!-- Left Sidebar -->
       <%@include file="include/sidebar.jsp" %>
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
              <div class="body mrgnbtm">
                  <div class="row clearfix">
                      
                        <div class="header">
                              
                                        <div class="row">
                                          <a href="#questionOne" class="btn btn-info sizeWidth text-center" data-toggle="collapse">Q. How do I navigate the Softdoc portal?
                                          </a>
                                        </div>
                                         <div id="questionOne" class="collapse">
                                            <h5>
                                               Navigation is very easy and intuitive. The Sidebar at the left side is always available to help you in navigating the different options like Dashboard, User Center, Cloud Reports, Log Reports and Support. Your Profile picture and profile options are also housed in the Sidebar.
                                            </h5>
                                        </div>
                                        
                                        <div class="row" style="margin-top:10px !important;">
                                          <a href="#questionTwo" class="btn btn-info sizeWidth" data-toggle="collapse">Q. How can I change my profile picture?
                                          </a>
                                        </div>
                                         <div id="questionTwo" class="collapse">
                                            <h5>Profile picture can be changed in the Profile section. </h5>
                                        </div>
                                       
                                       
                                      <div class="row" style="margin-top:10px !important;">
                                          <a href="#questionThree" class="btn btn-info sizeWidth" data-toggle="collapse">Q. How can I change my Login ID/ Email ID?</a>
                                        </div>
                                         <div id="questionThree" class="collapse">
                                            <h5> Administrator Login ID/ Email ID cannot be changed once created.</h5>
                                        </div>
                                         <div class="row" style="margin-top:10px !important;">
                                          <a href="#questionFour" class="btn btn-info sizeWidth" data-toggle="collapse">Q. What is the Dashboard?
                                          </a>
                                        </div>
                                         <div id="questionFour" class="collapse">
                                            <h5>
                                            Your Dashboard gives you an overview of your organisation. The primary metrics are Cloud Space currently in use and Number of Active Users.
                                            </h5>
                                        </div>
                                         
                                         <div class="row" style="margin-top:10px !important;">
                                          <a href="#questionFive" class="btn btn-info sizeWidth" data-toggle="collapse">Q. How do I add users?
                                          </a>
                                        </div>
                                         <div id="questionFive" class="collapse">
                                            <h5>
                                              Users can be added under User Center by clicking the "Add User" button. A User Creation form will open. This is where you enter the User Email account for operating the Softdoc portal. Also, Department level access rights are provided in this step. Once user is created, a system-generated email goes to your Email Account and also to the User Email which you entered in the Form containing their Login details.
                                            </h5>
                                        </div>
                                             <div class="row" style="margin-top:10px !important;">
                                          <a href="#questionSix" class="btn btn-info sizeWidth" data-toggle="collapse">Q. How do I remove users?
                                          </a>
                                        </div>
                                         <div id="questionSix" class="collapse">
                                            <h5>
                                              User Account can be deleted by using the Trash-bin button beside every user. Deleted user name will disappear from this screen and only Active users will remain. All historical users along with their status can be viewed by clicking the "Download" button.
                                            </h5>
                                        </div>
                                       
                                       <div class="row" style="margin-top:10px !important;">
                                          <a href="#questionSeven" class="btn btn-info sizeWidth" data-toggle="collapse">Q. How do I Edit user access?</a>
                                        </div>
                                         <div id="questionSeven" class="collapse">
                                            <h5>
                                             A dedicated Edit button is provided for every user. You can change all details and access information except Email. If any Email changes are there, a new user will have to bee created and old user will have to be deleted.
                                            </h5>
                                        </div>
                
                              
                              
                                         <div class="row" style="margin-top:10px !important;">
                                          <a href="#questionEight" class="btn btn-info sizeWidth" data-toggle="collapse">Q. What is Cloud Reports?</a>
                                        </div>
                                         <div id="questionEight" class="collapse">
                                            <h5>
                                                Cloud Reports gives you the real-time latest information about what data is using up your space. You can get the details Department-wise and drill down further up till the Document level. However, no Document or attachment can be viewed from this screen. This is only informational.
                                            </h5>
                                        </div>   
                                           
                                          <div class="row" style="margin-top:10px !important;">
                                          <a href="#questionTen" class="btn btn-info sizeWidth" data-toggle="collapse">Q. What is the Softdoc File Number?
                                          </a>
                                        </div>
                                         <div id="questionTen" class="collapse">
                                            <h5>
                                              This is the Unique File Number given by us to your files for our identification and reference purposes.
                                            </h5>
                                        </div>   
                                         
                                         <div class="row" style="margin-top:10px !important;">
                                          <a href="#questionEleven" class="btn btn-info sizeWidth" data-toggle="collapse">Q. What is the Softdoc Document Number mentioned in all my documents?
                                          </a>
                                        </div>
                                         <div id="questionEleven" class="collapse">
                                            <h5>
                                              his is the Unique Document Number we provide to all your documents to enable us to identify and easily pinpoint the document when required.
                                            </h5>
                                        </div>    
                                         
                                         <div class="row" style="margin-top:10px !important;">
                                          <a href="#question12" class="btn btn-info sizeWidth" data-toggle="collapse">Q. What is Log Reports?</a>
                                        </div>
                                         <div id="question12" class="collapse">
                                            <h5>
                                               Log Reports keeps a track of your organisation. Login/ Logout history, User creation, modification history and Document history are all stored here for Audit purposes.
                                            </h5>
                                        </div>    
                                         
                                         <div class="row" style="margin-top:10px !important;">
                                          <a href="#question13" class="btn btn-info sizeWidth" data-toggle="collapse">Q. What is Activity?</a>
                                        </div>
                                         <div id="question13" class="collapse">
                                            <h5>
                                             Activity gives you real-time tracking information of any physical files you give to Softdoc for digitising. All files uploaded by Users are by default shown as "Active"
                                            </h5>
                                        </div>     
                                 
                                                    <div class="row" style="margin-top:10px !important;">
                                          <a href="#question14" class="btn btn-info sizeWidth" data-toggle="collapse">Q. My problem is still not resolved. What do I do?
                                          </a>
                                        </div>
                                         <div id="question14" class="collapse">
                                            <h5>
                                              You can write to us at info@softdoc.co.in for any problem, suggestion, feedback or enquiry you may have.
                                             </h5>
                                        </div>     
                        </div>
                  </div>
             </div>
           </div>
         </div>
       </div>
     </div>
  </section>
   <%@include file="include/footer.jsp"%>
   </body>
 </html>
