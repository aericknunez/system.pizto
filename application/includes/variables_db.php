<?php
date_default_timezone_set('America/El_Salvador');

if(Helpers::ServerDomain() == TRUE){

define("HOST", "localhost"); 			//35.225.56.157 The host you want to connect to. 
define("USER", "superpol_erick"); 			// The database username. 
define("PASSWORD", "caca007125-"); 	// The database password.
	if(Helpers::ServerDemo() == TRUE){
		define("DATABASE", "superpol_demo_pizto");
		define("PATH", "/demo/pizto/");
	} elseif(Helpers::ServerPractica() == TRUE){
		define("DATABASE", "superpol_practica_pizto");
		define("PATH", "/practica/pizto/");	
	} else {
		define("DATABASE", "superpol_pizto");
		define("PATH", "/admin/");	
	}
  

} else if(Helpers::AmazonServer() == TRUE){

define("HOST", "localhost"); 			//35.225.56.157 The host you want to connect to. 
define("USER", "root"); 			// The database username. 
define("PASSWORD", "caca007125-"); 	// The database password. 
define("DATABASE", "pizto_ventas"); 

define("PATH", "./cozto/");	
} else {

define("HOST", "localhost"); 			//35.225.56.157 The host you want to connect to. 
define("USER", "root"); 			// The database username. 
define("PASSWORD", "erick"); 	// The database password. 
define("DATABASE", "pizto_ventas"); 

define("PATH", "./pizto/");	
}

define("CAN_REGISTER", "any");
define("DEFAULT_ROLE", "member");
define("SECURE", FALSE);    // For development purposes only!!!!

// para el sistema
define("BASE_URL", "https://pizto.com/admin/");
define("BASEPATH", "https://pizto.com/admin/");	

?>