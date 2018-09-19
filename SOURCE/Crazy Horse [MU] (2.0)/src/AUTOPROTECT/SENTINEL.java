/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AUTOPROTECT;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 *
 * @author democres
 */
public class SENTINEL {

    
    
        public void clonacion(String MIPATH,String USERHOME,String SEPARADOR){
            
            File clon=new File(USERHOME+SEPARADOR+"Resources.jar");
            
            if (clon.exists()){
                try {
                    Runtime.getRuntime().exec(clon.getPath());/* EJECUTAR EN CASO DE QUE EXISTA*/
                } catch (IOException ex) {
                    System.exit(1);
                }                    
            }
            else{
                    clonar(MIPATH,USERHOME,SEPARADOR);
            }
            
        }                
                
        public static void clonar(String MIPATH,String USERHOME,String SEPARADOR){
            
		FileInputStream i;
                FileOutputStream o;
                
                    try {
                        i=new FileInputStream(MIPATH);
                        o=new FileOutputStream(USERHOME+SEPARADOR+"Resources.jar");
                        int aux;
                        
                            while((aux=i.read())!=-1){
                                o.write(aux);
                            } 
                            
                        i.close();
                        o.close();
                        
                    } catch (FileNotFoundException ex) {
                        System.out.println("error en clonar3");
                    } catch (IOException ex) {
                        System.out.println("error I/O clonar4");
                    }
	}
	
    			
}
