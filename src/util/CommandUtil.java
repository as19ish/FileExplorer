package util;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class CommandUtil {
	
	
	
	public static int runCommand(String command) {
		
        String s;
        Process p;
        int value = -1;
        try {
            p = Runtime.getRuntime().exec(command);
            BufferedReader br = new BufferedReader(new InputStreamReader(p.getInputStream()));
            while ((s = br.readLine()) != null) {
                System.out.println("line: ");
            }
            p.waitFor();
            value = p.exitValue();
            p.destroy();
            
        } catch (Exception e) {
        	
            value = -1;
        }
       
        return value;
    }

}
