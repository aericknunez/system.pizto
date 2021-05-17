<?php
date_default_timezone_set('America/El_Salvador');

if(Helpers::ServerDomain() == TRUE){

	if(Helpers::ServerDemo() == TRUE){
			define("HOST", "db5001931616.hosting-data.io"); 
			define("USER", "dbu1170228"); 
			define("PASSWORD", "Caca007125-"); 
			define("DATABASE", "dbs1580844");
			define("PATH", "/admin/");
			define("TYPE", "Demo");
	} elseif(Helpers::ServerPractica() == TRUE){
			define("HOST", "db5001931620.hosting-data.io"); 
			define("USER", "dbu841125"); 
			define("PASSWORD", "Caca007125-"); 
			define("DATABASE", "dbs1580846");
			define("PATH", "/admin/");
			define("TYPE", "Practica");
	} else {

		if($_SERVER["SERVER_NAME"] == "system.hibridosv.com"){
			define("HOST", "db5001931611.hosting-data.io"); 
			define("USER", "dbu1169825"); 
			define("PASSWORD", "Caca007125-"); 
			define("DATABASE", "dbs1580840");
			define("PATH", "/admin/");
			define("TYPE", "OnLine");
		} else {
			define("HOST", "db5001931638.hosting-data.io"); 
			define("USER", "dbu307080"); 
			define("PASSWORD", "Caca007125-"); 
			define("DATABASE", "dbs1580858");
			define("PATH", "/admin/");
			define("TYPE", "Respaldos");
		}
			

	}
  

} else {

define("HOST", "localhost"); 			//35.225.56.157 The host you want to connect to. 
define("USER", "root"); 			// The database username. 
define("PASSWORD", "erick"); 	// The database password. 
define("DATABASE", "pizto_ventas"); 
define("PATH", "./pizto/");	
define("TYPE", "Local");
}

define("CAN_REGISTER", "any");
define("DEFAULT_ROLE", "member");
define("SECURE", FALSE);    // For development purposes only!!!!

// para el sistema
define("BASE_URL", "https://pizto.com/admin/");
define("BASEPATH", "https://pizto.com/admin/");	

?>