<%@include file="include/session.jsp" %>
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
                <a class="navbar-brand" href="index.jsp">SOFTDOC SUBADMIN QUALITY</a>
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
                <h2>
                    Documents Status
                </h2>
            </div>
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                 Add Documents 
                            </h2>
                        </div>
                        <div class="body">
                            <div class="row">
                                <div class="col-md-2">Department :-</div>
                                <div class="col-md-9">HR</div>
                            </div>    
                            
                            <div class="row">
                                <div class="col-md-2">Document Type</div>
                                <div class="col-md-4">HR</div>
                            </div>
                            
                            <div class="table-responsive">
                                <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Documents . </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>000001</td>
                                    </tr>
                                    <tr>
                                        <td>000002</td>
                                    </tr>
                                    <tr>
                                        <td>000003</td>
                                    </tr>
                                    <tr>
                                        <td>000004</td>
                                    </tr>
                                </tbody>
                                </table>
                            </div> 
                            
                            <div class="row">
                                <div class="col-md-2">Reason</div>
                                <div class="col-md-8"><input type="text" class="form-control"></div>
                            </div>
                            
                            <div class="row">
                                <center>
                                    <a href="#" role="button" class="btn btn-success">Go Data Live</a>
                                    <a href="#"  role="button" class="btn btn-danger">Send Back</a>
                                </center>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

     <%@include file="include/script.jsp"%>      
    
 <!--    <script>
       var i=$('table#documentuploading tr').length;
 
        $("#addmore").on('click',function(){
	    html = '<tr>';
   
        html+= '<td><input class="case" type="checkbox" id="checkmark"/></td>'; 
	    html+= '<td><input type="file" name="multidocument['+i+']"></td>';
 	    html+= '</tr>';
	    $('table#documentuploading').append(html);
	    i++;
      }); 
     //to check all checkboxes
     $(document).on('change','#check_all',function(){
	   $('input[class=case]:checkbox').prop("checked", $(this).is(':checked'));
     });
    //deletes the selected table rows
    $("#delete").on('click', function() {
	  $('.case:checkbox:checked').parents("tr").remove();
	 $('#check_all').prop("checked", false);
	 calculateTotal();
    });
</script>   -->  
    
</body>
</html>
