<?php
/*
Este archivo ingresa los datos de las imagenes y categorias para poder 
crear los menu de los sistema
*/
include_once '../common/Helpers.php'; // [Para todo]
include_once '../includes/variables_db.php';
include_once '../common/Mysqli.php';
include_once '../includes/DataLogin.php';
$db = new dbConn();
$seslog = new Login();
$seslog->sec_session_start();
include_once '../common/Fechas.php';


// aqui comparo si debo actualizar o no

$check =  file_get_contents("http://localhost/app/api/imagenes_checker.php"); 
$checker = json_decode($check, true);

if($checker != NULL){
	    if ($r = $db->select("checker", "system_img_check", "WHERE td = ".$_SESSION["td"]."")) { 
	       $numero = $r["checker"];
	    }  unset($r); 
}


if($checker != NULL and $checker[0] != $numero){

$data =  file_get_contents("http://localhost/app/api/imagenes.php"); 
$datos = json_decode($data, true);

if($datos != NULL){

    $db->query("TRUNCATE login_imagenes");

	foreach ($datos as $valores) { 

		$datos = array();
		$datos["imagen"] = $valores["imagen"];
		$datos["categoria"] = $valores["categoria"];
		$db->insert("login_imagenes", $datos); 
	}

}

unset($data, $datos, $valores);



$data =  file_get_contents("http://localhost/app/api/categorias_imagenes.php"); 
$datos = json_decode($data, true);

if($datos != NULL){

    $db->query("TRUNCATE login_images_categoria");

	foreach ($datos as $valores) { 

		$datos = array();
		$datos["categoria"] = $valores["categoria"];
		$db->insert("login_images_categoria", $datos); 
	}

}


$as = $db->query("SELECT * FROM system_img_check WHERE td = " . $_SESSION["td"] ."");
	if($as->num_rows > 0){

    $cambio = array();
    $cambio["checker"] = $checker[0];
    $db->update("system_img_check", $cambio, "WHERE td=" . $_SESSION["td"] ."");

	} else {

    $datos = array();
    $datos["checker"] = $checker[0];
    $datos["td"] = $_SESSION["td"];
    $db->insert("system_img_check", $datos);
     		
	}
	
$as->close();

print_r($num);


unset($data, $datos, $valores);

} // termina cheker



?>