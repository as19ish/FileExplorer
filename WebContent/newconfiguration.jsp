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
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  <script src="assets/script/clipboard.js"></script>

   <style>

   .row{
      margin-top: 100px;
    }

    .padd{
      padding-left: 100px;
      padding-right: 100px;
    }

     .wrapper {
  width: 100%;
  height: 400px;
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: #fff;
  border: 1px solid #e2e2e2;

}
.wrapper .file-upload {
  height: 200px;
  width: 200px;
  border-radius: 100px;
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  border: 4px solid #FFFFFF;
  overflow: hidden;
  background-image: linear-gradient(to bottom, #2590EB 50%, #FFFFFF 50%);
  background-size: 100% 200%;
  transition: all 1s;
  color: #FFFFFF;
  font-size: 100px;
}
.wrapper .file-upload input[type='file'] {
  height: 200px;
  width: 200px;
  position: absolute;
  top: 0;
  left: 0;
  opacity: 0;
  cursor: pointer;
}

.wrapper .file-upload:hover {
  background-position: 0 -100%;
  color: #2590EB;
}

.choose{
  height: 200px;
  width: 100%;
}

.mrgin-left{
  margin-left: 14px;
}

ul{
  margin: 0;
  padding: 0;
}

ul li{
  margin: 10px;
  height: auto;
  padding: 15px;
  background: #fff;
  border: 1px solid #e2e2e2;
  border-radius: 4px;
  list-style: none;
}

.btn1{
  margin-top: 20px;
  
}
@import url(https://fonts.googleapis.com/css?family=Open+Sans:400);
.frame {
  position: relative;
  width: 100%;
  height: 400px;
  border-radius: 2px;
  box-shadow: 1px 2px 10px 0px rgba(0, 0, 0, 0.3);
  background: #3A92AF;
  background: linear-gradient(to top right, #3A92AF 0%, #5CA05A 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#3A92AF', endColorstr='#5CA05A',GradientType=1 );
  color: #fff;
  font-family: 'Open Sans', Helvetica, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.center {
  position: relative;
  width: 300px;
  height: 260px;
  top: 70px;
  left: 30%;
  background: #fff;
  box-shadow: 8px 10px 15px 0 rgba(0, 0, 0, 0.2);
  border-radius: 3px;
}

.title {
  font-size: 16px;
  color: #676767;
  line-height: 50px;
  height: 50px;
  border-bottom: 1px solid #D8D8D8;
  text-align: center;
}

.dropzone {
  position: absolute;
  z-index: 1;
  box-sizing: border-box;
  display: table;
  table-layout: fixed;
  width: 100px;
  height: 80px;
  top: 86px;
  left: 100px;
  border: 1px dashed #A4A4A4;
  border-radius: 3px;
  text-align: center;
  overflow: hidden;
}
.dropzone.is-dragover {
  border-color: #666;
  background: #eee;
}
.dropzone .content {
  display: table-cell;
  vertical-align: middle;
}
.dropzone .upload {
  margin: 6px 0 0 2px;
}
.dropzone .filename {
  display: block;
  color: #676767;
  font-size: 14px;
  line-height: 18px;
}
.dropzone .input {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  opacity: 0;
}

.upload-btn {
  position: absolute;
  width: 140px;
  height: 40px;
  left: 80px;
  bottom: 24px;
  background: #6ECE3B;
  border-radius: 3px;
  text-align: center;
  line-height: 40px;
  font-size: 14px;
  box-shadow: 0 2px 0 0 #498C25;
  cursor: pointer;
  transition: all .2s ease-in-out;
}
.upload-btn:hover {
  box-shadow: 0 2px 0 0 #498C25, 0 2px 10px 0 #6ECE3B;
}

.bar {
  position: absolute;
  z-index: 1;
  width: 300px;
  height: 3px;
  top: 49px;
  left: 0;
  background: #6ECE3B;
  transition: all 3s ease-out;
  -webkit-transform: scaleX(0);
          transform: scaleX(0);
  -webkit-transform-origin: 0 0;
          transform-origin: 0 0;
}
.bar.active {
  -webkit-transform: scaleX(1) translate3d(0, 0, 0);
          transform: scaleX(1) translate3d(0, 0, 0);
}

.syncing {
  position: absolute;
  top: 109px;
  left: 134px;
  opacity: 0;
}
.syncing.active {
  -webkit-animation: syncing 3.2s ease-in-out;
          animation: syncing 3.2s ease-in-out;
}

.done {
  position: absolute;
  top: 112px;
  left: 132px;
  opacity: 0;
}
.done.active {
  -webkit-animation: done .5s ease-in 3.2s;
          animation: done .5s ease-in 3.2s;
  -webkit-animation-fill-mode: both;
          animation-fill-mode: both;
}

@-webkit-keyframes syncing {
  0% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
  }
  10% {
    opacity: 1;
  }
  90% {
    opacity: 1;
  }
  100% {
    -webkit-transform: rotate(360deg);
            transform: rotate(360deg);
    opacity: 0;
  }
}

@keyframes syncing {
  0% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
  }
  10% {
    opacity: 1;
  }
  90% {
    opacity: 1;
  }
  100% {
    -webkit-transform: rotate(360deg);
            transform: rotate(360deg);
    opacity: 0;
  }
}
@-webkit-keyframes done {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}
@keyframes done {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}
 
   </style>

</head>
<body>
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
        <div class="nav-item ">
         
        </div>
        <div class="nav-item ">
          <a href="index.jsp" style="margin-left:-200px"><i class="fas fa-home"></i> Home</a>
        </div>
        <div class="nav-item i-user">
          <div class="account"></div>
        </div>      
      </div>
    </div>
  </div>
    
    <div class="container-fluid padd">
      <div class="row">
        <div class="col-sm-4">
          <div class="choose">
            <h3 class="mrgin-left">Select the location</h3>
            <ul>
              <li><input type="checkbox" name="location1" id="location1" >&nbsp;&nbsp;&nbsp;<%= ConfigConstants.uploadDdirectories().get(0) %></li>
              <li><input type="checkbox" name="location2" id="location2" >&nbsp;&nbsp;&nbsp;<%= ConfigConstants.uploadDdirectories().get(1) %></li>
            </ul>
          </div>
           
        </div>
        <div class="col-sm-8">
          <div class="wrapper">
          
              <div class="frame">
  <div class="center">
		<div class="bar"></div>
		<div class="title">Drop File Here</div>
		<div class="dropzone">
			<div class="content">
				<img src="assets/images/upload.svg" class="upload">
				<span class="filename"></span>
				<form id="fileUploadForm">
				<input type="file" name="file" class="input" id="input" >
				</form>
				
			</div>
		</div>
		<img src="assets/images/syncing.svg" class="syncing">
		<img src="assets/images/checkmark.svg" class="done">
		<div class="upload-btn">Upload</div>
  </div>
</div>
            
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
  
  function checkValue(id){
		if(id.is(':checked') ){
			return true;
		}
		return false;
  }
  var droppedFiles = false;
  var fileName = '';
  var $dropzone = $('.dropzone');
  var $button = $('.upload-btn');
  var uploading = false;
  var $syncing = $('.syncing');
  var $done = $('.done');
  var $bar = $('.bar');
  var timeOut;
  var droppedFile = false;

  $dropzone.on('drag dragstart dragend dragover dragenter dragleave drop', function(e) {
  	e.preventDefault();
  	e.stopPropagation();
  })
  	.on('dragover dragenter', function() {
  	$dropzone.addClass('is-dragover');
  })
  	.on('dragleave dragend drop', function() {
  	$dropzone.removeClass('is-dragover');
  })
  	.on('drop', function(e) {
  	droppedFiles = e.originalEvent.dataTransfer.files;
  	fileName = droppedFiles[0]['name'];
  	$('.filename').html(fileName);
  	$('.dropzone .upload').hide();
  	droppedFile = droppedFiles[0];
    
  });

  $button.bind('click', function(e) {
	  event.preventDefault();
      startUpload(this);
  });

  $("input:file").change(function (){
  	fileName = $(this)[0].files[0].name;
  	$('.filename').html(fileName);
  	$('.dropzone .upload').hide();
  });

  function startUpload() {
    var allowedExtensions = /(java)$/i;  
	var ext =  fileName.split(".")[1]; 
	var form = $('#fileUploadForm')[0];
	if(!allowedExtensions.exec(ext)){
		alert("Sorry..Only Java Files Allowed");
		return false;
	}  
  	if (!uploading && fileName != '' && (checkValue($('#location1')) || checkValue($('#location2')))) {
  	     uploading = true;
  		 $button.html('Uploading...');
  		 $dropzone.fadeOut();
  		 $syncing.addClass('active');
  		 $done.addClass('active');
  		 $bar.addClass('active');
  		
  	    if($('#input').val() == ""){
  	    	if(!droppedFile){
  	    		alert("drop file not working");
  	    	}
  	    	var data = new FormData();
  	    	data.append('file',droppedFile);
  	       	data.append('location1',checkValue($('#location1')));
  	        data.append('location2',checkValue($('#location2')));
  	    	
  	    }else{
  	    		
  	        var data = new FormData(form);
  	        data.append('location1',checkValue($('#location1')));
  	        data.append('location2',checkValue($('#location2')));
  	    	
  	    }
        
		
        $("#btnSubmit").prop("disabled", true);

        $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url: "upload.jsp",
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            dataType: 'json',
            success: function (data) {
            	
            		var result = "";
	                for(var i = 0;i<2;i++){
	                	if(data[i] != null){
	                	result += "<tr><td>"+data[i]['file']+"</td><td>"+data[i]['success']+"</td><td>"+data[i]['command']+"</td><td><a target='_blank' href='"+encodeURI(data[i]['link'])+"'><i class='fas fa-link'></i></a></td></tr>";
	                	}
	                }
                	result += '<tr><td colspan="3"><strong>Copy above commands and Run command in putty to compile file</strong></td><tr>'
            		$("#tbody").html(result); 
            		$("#myModal").modal();
            		$("#myModal").on('hide.bs.modal', function () {
            		      if(!confirm("are you sure you want to leave this results")){
            		    	  return false;
            		      }
            		 });
            		reset(form);  
            	

            },
            error: function (e) {
                var result = '<h5>Something goes wrong --- Internal Error</h5>';
                $("#tbody").html(result);
            	$("#myModal").modal();
        		$("#myModal").on('hide.bs.modal', function () {
        		      if(!confirm("are you sure you want to leave this results")){
        		    	  return false;
        		      }
        		 });
        		reset(form);  
            }
        });

  	}else{
  		alert("Please Select Location and drop file");
  	}

  }

  function showDone() {
  	$button.html('Done');
  }
  function reset(form){
	  form.reset();
	  uploading = false;
	  fileName = '';
	  $button.html('Upload');
	  $dropzone.fadeIn();
	  $syncing.addClass('active');
	  $done.removeClass('active');
	  $bar.removeClass('active');
	  $('.filename').html("");
	  $('.dropzone .upload').show();
	  $('#location1').prop('checked',false);
	  $('#location2').prop('checked',false);  
	    
  }
  
    
  </script>
      <div class="modal fade" id="myModal" tabindex="-1"   role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
              <div class="modal-content" style="background: transparent;border: none;" >
             
                <div class="modal-body"  >
                
                            <table class="table table-hover" style="background:#fff">
							    <thead>
							      <tr>
							        <th>File Path</th>
							        <th>Status</th>
							        <th>Command</th>
							        <th>Dir Link</th>
							      </tr>
							    </thead>
							    <tbody id="tbody" style="word-break: break-word;" >
							      
							    </tbody>
							  </table>
                    
                </div>
              </div>
            </div>
          </div>
</body>
</html>