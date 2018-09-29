<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="FileExplorer.*" %>  
<% FileExplorer fileExplorer = new FileExplorer();%>    
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-type" content="text/html; charset=utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
  <title>British Airways</title>
  <link rel="shortcut icon" type="image/png" href="/media/images/favicon.png">
  <link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="http://www.datatables.net/rss.xml">
  <link rel="stylesheet" type="text/css" href="assets/css/style.css">
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/css/bootstrap.css">
  <script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="assets/css/ztree.css" type="text/css">
   <script type="text/javascript" src="assets/script/ztree.js"></script>
</head>
<body class="wide comments example dt-example-bootstrap4">
      
  <a name="top" id="top"></a>
  <div class="fw-background">
    <div></div>
  </div>
  <div class="fw-container">
    <div class="fw-header">
      <div class="nav-master">
        <div class="nav-item active">
          <a href="index.jsp"><img src="assets/images/British_Airways_logo.png" height="50" width="200" /></a>
        </div>
        
      </div>
      <div class="nav-search">
        <div class="nav-item i-manual">
          <a href="newconfiguration.jsp">Add Java Files</a>
        </div>
        <div class="nav-item i-download">
          <a href="addxls.jsp"><i class="fas fa-plus-square"></i> Add Xls Files</a>
        </div>
        <div class="nav-item i-user">
          <div class="account"></div>
        </div>
        
      </div>
    </div>
    
    <div class="fw-body">
 
      <div class="content">
   
          <div class="container">
            <div class="row">
                
               
                <div class="col-4">
                <form action="index.jsp" method="post" onchange="dropDownSubmit()" id="dropDownDir" >
                <input type="hidden" name="dir" id="h_dir"/>
                <select class="custom-select"  id="selectDir"  >
					  <option selected disabled>Select Directory</option>
					  <%  for (String temp : ConfigConstants.directories()) { %>
					  		<option value="<%= temp %>" ><%= temp %></option>
						
					  <% } %>
					 
				</select>
				</form>
                </div>
                 <div class="col-8">
                   <form action="index.jsp" method="post" id="search">
                      <div class="input-group">
                          <input type="text" class="form-control" placeholder="Enter Full Directory Path..." name="dir" id="dir">
                          <span class="input-group-btn">
                            <button class="btn btn-default" type="submit" name="submit" id="search_btn">Go!</button>
                           </span>
                      </div><!-- /input-group -->
                   </form>
                </div>
             </div>
           </div>
         
           <%   if((request.getParameter("dir"))!= null){
               if((fileExplorer.data(request.getParameter("dir"))).equals("")){ %>
                 <div class="alert alert-danger " role="alert" style="margin-top:40px">
            	  <strong>Oops..</strong>Invalid directory !!
            	  </div>  
          <%     }
             }
           %>
               
          
            
        <div id="treeDemo" class="ztree "></div>
    
        </div>
      </div>
  </div>
  <div class="fw-footer">
    <div class="skew"></div>
    <div class="skew-bg"></div>
    <div class="copyright">
      <a href="/"><img src="assets/images/footerSpeedmarque.png"></a><br>
      © 2007-2018 <a href="/license/mit">MIT licensed</a>. <a href="/privacy">Privacy policy</a>. <a href="/supporters">Supporters</a>.<br>
      SpryMedia Ltd is registered in Scotland, company no. SC456502.</p>
    </div>
    </div>
  <script type="text/javascript">
    
    var setting = { };

    var zNodes =[
    	<%
    	if((request.getParameter("dir"))!= null){
    		out.print(fileExplorer.data(request.getParameter("dir")));
    	}
    	%>
    	

];

    $(document).ready(function(){
      $.fn.zTree.init($("#treeDemo"), setting, zNodes);
    });
   $('#search_btn').click(function(e){
	  
	   var dir = $('#dir').val();
	   dir = encodeURI(dir);
	   $('#dir').val(dir);
	   $('#search').submit();
   }); 
   function dropDownSubmit(){
	   
	   var path = $('#selectDir').val();
	   $('#h_dir').val(encodeURI(path));
	   $('#dropDownDir').submit();
	 
	   
   }
  
  </script>
    
  
</body>
</html>