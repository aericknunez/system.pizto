<?php
include_once '../common/Helpers.php';
include_once 'variables_db.php';
include_once '../common/Mysqli.php';
$db = new dbConn();
include_once '../includes/DataLogin.php';
$seslog = new Login();
$seslog->sec_session_start();

include_once '../common/Fechas.php';
include_once '../../system/index/Inicio.php';

	// elimina las mesas activas del usuario que no tienen productos
	VerificaMesa();
	// termina mesa

	$redirect = $_SESSION['td'];

		if(Helpers::ServerDomain() == TRUE and $_SESSION['tipo_cuenta'] != 1){
		@Inicio::RegisterInOut(2); // registra la salida
		}
	
	// Unset all session values 
	$_SESSION = array();

	// get session parameters 
	$params = session_get_cookie_params();

	// Delete the actual cookie. 
	setcookie(session_name(),'', time() - 42000, $params["path"], $params["domain"], $params["secure"], $params["httponly"]);

	// Destroy session 
	session_destroy();
	if($redirect == 3 and Helpers::ServerDomain() == TRUE){
	header("Location: https://superpollo.net");
	} else {
	header("Location: ../../");
	}


function VerificaMesa(){
    $db = new dbConn();

$a = $db->query("SELECT mesa FROM mesa WHERE estado = 1 and user = '".$_SESSION["user"]."' and td = ".$_SESSION["td"]."");

    if($a->num_rows > 0){
        include_once '../../system/ventas/Venta.php'; 
        foreach ($a as $b) {    
                
                if(Venta::VerProductosMesa($b["mesa"]) == NULL){
                  Helpers::DeleteId("mesa", "estado = 1 and mesa = '".$b["mesa"]."' and user = '".$_SESSION["user"]."' and td = " . $_SESSION["td"]);
                }

        } 
    } $a->close();
}

exit();

?>