package util;


import java.io.File;
import java.util.regex.Pattern;

import org.json.JSONException;
import org.json.JSONObject;


import org.apache.commons.fileupload.FileItem;

public class UploadHelper {

	
	public static String upload(FileItem fi,String path) throws JSONException {
		JSONObject response = new JSONObject();
		try {
		String fullPath = getFullPath(path,fi.getString().split("\n")[0]);
		if(fullPath.equals(null)) {
			
   	    	return getResponse(response,"false","Something Went Wrong---package not found",fullPath+fi.getName(),"","").toString();
			
		}
		if(checkFileExists(fullPath+fi.getName())) {
			rename(fullPath,fi.getName());
			if(classFileExists(fullPath,fi.getName())) {
				
				rename(fullPath,fi.getName().split(Pattern.quote("."))[0]+".class");
				File file = new File(fullPath+fi.getName()) ;
	       	    fi.write(file);
	       	   	       	    	
	       	    	return getResponse(response,"true","File Uploaded sussessfully",fullPath+fi.getName(),"javac -g "+fullPath+fi.getName(),"index.jsp?dir="+fullPath).toString();
	       	   
				
			}else {
				
			     	File file = new File(fullPath+fi.getName()) ;
	       	        fi.write(file);
	       	     	
	       	    	return getResponse(response,"true","File Uploaded sussessfully",fullPath+fi.getName(),"javac -g "+fullPath+fi.getName(),"index.jsp?dir="+fullPath).toString();
	 	       	   
	       	    
			}
			
			
		}else {
			new File(fullPath).mkdirs();
    		File file = new File(fullPath+fi.getName()) ;
       	    fi.write(file);
       	    	
       	    	return getResponse(response,"true","File Uploaded sussessfully",fullPath+fi.getName(),"javac -g "+fullPath+fi.getName(),"index.jsp?dir="+fullPath).toString();
 	       	   
    	    
		}
		}catch(Exception e) {
			System.out.println(e);
			
   	    	return getResponse(response,"true","Something Went Wrong---"+e.getMessage(),fi.getName(),""+fi.getName(),"").toString();
	       	   
		}
		
		
	}
	private static Boolean rename(String fullpath,String name) {
		  File oldName = new File(fullpath+name);
	      File newName = new File(fullpath+name+"_closed");
	      
	      if(oldName.renameTo(newName)) {
	         return true;
	      } else {
	         return false;
	      }
		
	}
   private static String getFullPath(String path,String pkg) {
		
		try {
			
		   return path+pathMaker(getPackage(pkg));
		
		}catch(Exception e) {
			
			System.out.print(e);
			return null;
			
		}
		
	 }
	
	private static String getPackage(String str) {
		
		return str.replace("package", "").trim().replace(";", "").trim();	
				
	}
	private static String pathMaker(String pkg) {
		String path = "";
		String[] arrOfStr = pkg.split(Pattern.quote("."));
		for(String str: arrOfStr) {
			path += str+File.separator;
		}
		return path;
	}
	private static Boolean checkFileExists(String path) {
		
		File f = new File(path);
		if(f.exists() && !f.isDirectory()) { 
		   return true;
		}
		return false;
	}
	private static Boolean classFileExists(String fullpath,String name) {
		String arr[] = name.split(Pattern.quote("."));
		if(checkFileExists(fullpath+arr[0]+".class")) {
			return true;
		}else {
			return false;
		}
		
		
	}
	private static JSONObject getResponse(JSONObject response,String success,String msg,String file,String command,String link ) throws JSONException {
		    response.put("success", success);
	    	response.put("msg", msg);
	    	response.put("file",file);
	    	response.put("command",command);
	    	response.put("link", link);
	    	return response;
		
	}
	
}
	
	

