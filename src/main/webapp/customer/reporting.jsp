<%@include file="include/session.jsp" %>
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
    left: 48px;
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
    
    .navbar-select{
    box-shadow: none !important;
    border-bottom: 0px solid #03a9f4 !important;
    -webkit-border-radius: 0;
    -moz-border-radius: 0;
    -ms-border-radius: 0;
    border-radius: 0;
    }
  </style>
</head>
<body class="theme-light-blue">
   <!-- Overlay For Sidebars -->
    <div class="overlay"></div>
    <!-- #END# Overlay For Sidebars -->
    <!-- Top Bar -->
        <%@include file="include/navbar.jsp"%>
    <section>
        <%@include file="include/sidebar.jsp"%>
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
              <div class="header  margin0">
                <div class="row">
                  <div class="">
                    <h2 class="col-md-4 col-lg-4 col-xs-12 pull-left">
                    <div class="m-t-10">
                      Report Problem
                    </div>
                    </h2>
                  </div>
                </div>
              </div>
              <div class="body mrgnbtm">
                <div class="form-group">
                  <label for="Email" class="col-sm-2 control-label">Title</label>
                  <div class="col-sm-10">
                    <div class="form-line">
                      <input type="email" class="form-control" id="Email" name="email" placeholder="Title" value="" placeholder="Title" >
                    </div>
                  </div>
                </div>

                <div class="form-group">
                  <label for="Email" class="col-sm-2 control-label">Description</label>
                  <div class="col-sm-10">
                    <div class="form-line">
                      <textarea type="text" class="form-control"  name="Description" placeholder="Description" value=""></textarea>
                    </div>
                  </div>
                </div>

                <div class="form-group">
                  <label for="Email" class="col-sm-2 control-label">Attachment</label>
                  <div class="col-sm-10">
                    <div class="form-line">
                      <input type="file" class="form-control" name="report_file"/>
                    </div>
                  </div>
                </div>

                <div class="form-group">
                  <label for="Email" class="col-sm-2 control-label">
                      <label class="container">
                           <input type="checkbox" name="vardepartment" value="">
                           <span class="checkmark"></span>
                        </label>
                  </label>
                  <div class="col-sm-10">
                       <a href="#">Accept Terms & Condition </a>
                  </div>
                </div>
                <div class="row clearfix">
                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" >
                      <button type="submit" id="usersubmit" class="btn btn-primary" style="width: 139px;margin-left:44%;">Submit</button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
    <%@include file="include/footer.jsp" %>
</body>
</html>
