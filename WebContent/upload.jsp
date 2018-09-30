<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>    
<%@ page import="util.*,java.util.regex.Pattern" %>   
<%@ page import="FileExplorer.*" %> 
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<%     
        
        String loc1 = "";
        String loc2 = "";
        String r1=null,r2=null;
		File file ;
		int maxFileSize = 1024 * 1024;
		int maxMemSize = 1024 * 1024;
		
		String contentType = request.getContentType();
		if ((contentType.indexOf("multipart/form-data") >= 0)) {
 
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(maxMemSize);
		factory.setRepository(new File("temp"));
		ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setSizeMax( maxFileSize );
      try{ 
         List fileItems = upload.parseRequest(request);
         Iterator i = fileItems.iterator();
         while ( i.hasNext () ) 
         {
            FileItem f = (FileItem)i.next();
            
            
            if ( f.isFormField () )  {
            	if(f.getFieldName().equals("location1")){
            		loc1 = f.getString().trim();
            	}
            	if( f.getFieldName().equals("location2"))   {
                	loc2 = f.getString().trim();
                 
                 }
         }
            }
         Iterator item = fileItems.iterator();
         while ( item.hasNext () ) 
         {
            FileItem fi = (FileItem)item.next();
            if ( !fi.isFormField () )  {
            	if(fi.getName().split(Pattern.quote("."))[1].equals("java")){
            		if(loc1.equals("true")){
                		
                  	 r1 = UploadHelper.uploadJavaFile(fi,ConfigConstants.uploadDdirectories().get(0));
                  	 
                  	}
                  	if(loc2.equals("true")){
                  		
                  	 r2 = UploadHelper.uploadJavaFile(fi,ConfigConstants.uploadDdirectories().get(1));
                  		
                  	}
            		
            	}else{
            		
                  	if(!loc2.equals("")){
                  		
                  	 r2 = UploadHelper.uploadOtherFile(fi,ConfigConstants.uploadDdirectories().get(1)+loc2+File.separator);
                  		
                  	}
            		
            	}
            	
                
            }
         }
         out.print("["+r1+","+r2+"]");
         
      }catch(Exception ex) {
    	  System.out.print(ex);
         out.print("{ 'success': 'false', 'msg': 'Something Went Wrong"+ex.getMessage()+"' }");
      }
   }else{
     
   }
%>
