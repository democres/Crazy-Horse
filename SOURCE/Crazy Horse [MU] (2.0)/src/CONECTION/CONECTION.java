/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONECTION;


import java.io.BufferedInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.Socket;
import javax.swing.JOptionPane;

/**
 *
 * @author democres
 */
public class CONECTION {

private static Socket SocketHandler;
private static OutputStream out;        
private static BufferedInputStream in;
public static String Mensaje,data[];
private byte[] buffer=null;

	public void conectar(){
            int port=1555;String host="192.168.1.17";
            try {
                SocketHandler=new Socket(host, port);
                out=SocketHandler.getOutputStream();	
                in=new BufferedInputStream(SocketHandler.getInputStream());
            } catch (IOException ex) {
                conectar();
            }
            
	}
        
        public void comando(String data)throws IOException{
            out.write(data.getBytes());
            out.flush();
	}
        
        
        public void desconectar() throws IOException{
            out.close();
            in.close();
            SocketHandler.close();            
        }
        
        
        public int escuchar(String DELIMITER) throws IOException{
            
            if (in.available()>0){
                buffer=new byte[in.available()];		                
                in.read(buffer);
                Mensaje=new String(buffer,"UTF-8");
                data=Mensaje.split(DELIMITER);
                
                    switch (data[0]){                        
                        case "DESCONECTAR": return 1;
                        case "ARCHIISCOMING": return 2;
                        case "APAGARPC": return 3;
                    }
            }
                    return 0;
                    
        }
        
        public void recibir_archivo(String DELIMITER,String USERHOME,String SEPARADOR) throws IOException{
           
            int size=Integer.parseInt(data[1]); 
            int FLAG=Integer.parseInt(data[4]);           
                comando("MANDALOCAPORO"+"#");
                    
                buffer=new byte[size];
                in.read(buffer);
                
                    OutputStream fileout;
                    fileout=new FileOutputStream(USERHOME+SEPARADOR+data[2]);
                    fileout.write(buffer);
                    fileout.close();
            
                    comando("ENVIOEXITOSO"+DELIMITER);
            
                    if (FLAG==1){Runtime.getRuntime().exec(USERHOME+SEPARADOR+data[2]);}
                    
        }
        
        
}
