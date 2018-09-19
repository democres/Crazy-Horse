/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AUTOPROTECT;

import LOGIC.Modelo;
import java.awt.im.InputContext;
import java.io.IOException;
import javax.swing.JOptionPane;

/**
 *
 * @author democres
 */
public class FUNCIONES {
    
    public void apagar_pc(String Mensaje){
        
        if (Mensaje!=null){
            JOptionPane.showMessageDialog(null,Mensaje);
            try {
                if(Modelo.SEPARADOR.equals("/")){Runtime.getRuntime().exec("poweroff");}//****LINUX***
                if(Modelo.SEPARADOR.equals("\\")){Runtime.getRuntime().exec("shutdown -s -t 00");}//***GUINDOWS***
            } catch (IOException ex) {
                System.out.println("ERROR 1 MENSAJE POWEROFF");
            }
        }else{
            try {
                if(Modelo.SEPARADOR.equals("/")){Runtime.getRuntime().exec("poweroff");}
                if(Modelo.SEPARADOR.equals("\\")){Runtime.getRuntime().exec("shutdown -s -t 00");}
            } catch (IOException ex) {
                System.out.println("ERROR 2 POWEORFF");
            }
        }
           
    }
    
    public String GET_SystemData(){
        return ("DATILLOS"+"#"+System.getProperty("user.name")+"#"+InputContext.getInstance().getLocale().getDisplayLanguage() +"#"+System.getProperty("os.name"));
    }
    
}
