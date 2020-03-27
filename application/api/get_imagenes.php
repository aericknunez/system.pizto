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
unset($data, $datos, $valores);


?>