<?php
class Email{

    public function __construct(){

    } 


   static public function EnviarEmail($destinatario, $nombre_destinatario, $envia, $nombre_envia, $asunto, $plantilla){


$cuerpo = self::PlantillaEnviado();

//para el envío en formato HTML 
$headers = "MIME-Version: 1.0\r\n"; 
$headers .= "Content-type: text/html; charset=iso-8859-1\r\n"; 

//dirección del remitente 
$headers .= "From: Erick Nunez <".$destinatario.">\r\n"; 

//dirección de respuesta, si queremos que sea distinta que la del remitente 
$headers .= "Reply-To: ".$envia."\r\n"; 

//ruta del mensaje desde origen a destino 
$headers .= "Return-path: ".$envia."\r\n"; 

mail($destinatario,$asunto,$cuerpo,$headers);

}




static public function PlantillaEnviado(){
  $cuerpo = ' 
<html> 
<head> 
   <title>Gracias por su compra</title> 
</head> 
<body> 
<h1>Gracias por su compra!</h1> 
<p> 
<b>
Gracias por su compra, en este momento estamos realizando pruebas de envio de email 
</p> 
</body> 
</html> 
'; 
}







} // class
?>