package FileExplorer;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;


public class FileExplorer{
  
  private static ArrayList<String> validExt;
  
  public FileExplorer() {
	  validExt = new ArrayList<String>();
	  validExt.add("java");
	  validExt.add("xsl");
	
	  
  }
     
  public String data(String dir) throws UnsupportedEncodingException {
	    try {
	           dir = URLDecoder.decode(dir, "UTF-8");
	           File folder = new File(dir);
		           if (!folder.isDirectory()){
					      throw new IllegalArgumentException("Invalid directory: " + folder.getName());
				    }
	           int level = 0;
			   return (renderFolder(folder, level, new StringBuilder(), false)).append("]}").toString();
	      }catch(Exception e) {
	    	  
	    	  	return "";
	    	
	      }  
	  
  }
  private static StringBuilder renderFolder(File folder, int level, StringBuilder sb, boolean isLast) throws UnsupportedEncodingException
  { 
	  
   sb.append("{\"name\":\"").append(folder.getName()).append("\",\"open\":true,\"url\":\"").append(URLEncoder.encode(folder.getPath(),"UTF-8")).append("\",\"children\":[").append("\n");
 

    File[] objects = folder.listFiles();

    for (int i = 0; i < objects.length; i++)
    {
      boolean last = ((i + 1) == objects.length);

      if (objects[i].isDirectory())
      {
        renderFolder(objects[i], level + 1, sb, last);
        sb.append("]},");
      }
      else
      { 
        renderFile(objects[i], level + 1, sb, last);
      }
    }

    return sb;
  }

  private static StringBuilder renderFile(File file, int level, StringBuilder sb, boolean isLast) throws UnsupportedEncodingException
  {  if(validExtension(file.getName())) {
	  sb.append("{\"name\":\"").append(file.getName()).append("\",\"url\":\"file.jsp?path=").append(URLEncoder.encode(file.getPath(), "UTF-8")).append("\"}").append("\n");
	  if(isLast) {
		
	  }else {
		  sb.append(",");
	  }
	  return sb;
     }
     return sb;
  
  }
  
  private static boolean validExtension(String fileName) {
	    char ch;
	    int len;
	    String ext = "";
	    if(fileName==null || 
	            (len = fileName.length())==0 || 
	            (ch = fileName.charAt(len-1))=='/' || ch=='\\' || 
	             ch=='.' ) 
	        return false;
	    int dotInd = fileName.lastIndexOf('.'),
	        sepInd = Math.max(fileName.lastIndexOf('/'), fileName.lastIndexOf('\\'));
	    if( dotInd<=sepInd )
	        return false;
	    else
	    	for(String str: validExt) {
	    	    if(str.trim().contains(fileName.substring(dotInd+1).toLowerCase()))
	    	       return true;
	    	}
	    	return false;
	        
	}
  

}