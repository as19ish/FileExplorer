<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="FileExplorer.*" %>  
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-type" content="text/html; charset=utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
  <title>British Airways</title>
  <link rel="shortcut icon" type="image/png" href="/media/images/favicon.png">
  <link rel="stylesheet" type="text/css" href="assets/css/style.css">
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/css/bootstrap.css">
  <script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.4.1/ace.js"></script>
 <style type="text/css" media="screen">
    #editor { 
        height:550px;
        
    }
    .filename{
        word-break: break-all;
    }
</style>
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
          <a href="newconfiguration.jsp">Add New Configuration</a>
        </div>
        <div class="nav-item i-download">
          <a href="/download"></a>
        </div>
        <div class="nav-item i-user">
          <div class="account"></div>
        </div>
        
      </div>
    </div>
    
    <div class="fw-body">
 
      <div class="content">
            <div class="filename"><h5><%if((request.getParameter("path"))!=null){out.print(request.getParameter("path"));}%></h5></div>
            <div id="editor"><%if((request.getParameter("path"))!=null){out.print(Freader.read(request.getParameter("path")));}else{out.print("Invalid Request");}%>
            </div>
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
        var editor = ace.edit("editor");
        editor.setTheme("ace/theme/monokai")
        editor.session.setMode("ace/mode/java");
        editor.setReadOnly(true);
        editor.setPrintMarginColumn(0);
        
   
  </script>
    
  
</body>
</html>