<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>   
<%@ page import="org.json.JSONObject" %>  
<%@ page import="java.io.*,java.net.URLDecoder" %>  

<%
       if(request.getParameter("filePath") != null){
    	   
    	   try{
    		JSONObject resPonse = new JSONObject();
    		String filePath = URLDecoder.decode(request.getParameter("filePath"), "UTF-8").trim();
       		File file = new File(filePath);
       		if(file.isDirectory()){

		            deleteDirectory(file);
		            resPonse.put("status", true);
    	     	   	resPonse.put("msg",file.getName() + " is deleted!");
    		    	out.print(resPonse.toString());
	                    
             }else{
            	 
               	if(file.delete()){
              			
              			resPonse.put("status", true);
              			resPonse.put("msg",file.getName() + " is deleted!");
              			out.print(resPonse.toString());
              			
              		}else{
              		 throw new IOException(getReasonForFileDeletionFailureInPlainEnglish(file));
              		}
                	
                } 		
       	   
       	}catch(Exception e){
       		System.out.print(e);
       		JSONObject resPonse = new JSONObject();
       		resPonse.put("status", false);
   			resPonse.put("msg",e.getMessage());
   			out.print(resPonse.toString());
       		
       	}
       } 
    	   
       

%>
<%!

		public String getReasonForFileDeletionFailureInPlainEnglish(File file) {
		    try {
		        if (!file.exists())
		            return "It doesn't exist in the first place.";
		        else if (file.isDirectory() && file.list().length > 0)
		            return "It's a directory and it's not empty.";
		        else
		            return "Somebody else has it open, we don't have write permissions, ";
		    } catch (SecurityException e) {
		        return "We're sandboxed and don't have filesystem access.";
		    }
		}
		public static void deleteDirectory(File file)
		    	throws IOException{
		 
		    	if(file.isDirectory()){
		 
		    		
		    		if(file.list().length==0){
		    			
		    		   file.delete();
		    		  	    			
		    		}else{
		    		
		        	   String files[] = file.list();
		     
		        	   for (String temp : files) {
		        	     
		        	      File fileDelete = new File(file, temp);
		        		 
		        	     
		        	      deleteDirectory(fileDelete);
		        	   }
		        		
		        	 
		        	   if(file.list().length==0){
		           	     file.delete();
		        	    
		        	   }
		    		}
		    		
		    	}else{
		    		
		    		file.delete();
		    		
		    	}
		    }

%>
