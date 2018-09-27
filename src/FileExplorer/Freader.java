package FileExplorer;

import java.io.*; 
public class Freader{ 
 
public static String read(String filename) throws IOException {
	String st;
	StringBuilder sb = new StringBuilder(); 
	sb.append("");
	try {
	File file = new File(filename);
	BufferedReader br = new BufferedReader(new FileReader(file)); 
	
	while ((st = br.readLine()) != null) {
	
		sb.append(st).append("\n");
		
	}
	}catch(Exception e) {
		
		return e.getMessage();
	}
	return sb.toString();
 }
}


