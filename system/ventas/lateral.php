<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

		if(isset($_GET["tv"])){
			echo '<div id="lateral-panel"></div>';			
		
		} elseif($datalive == TRUE){
			
			include_once 'system/corte/Corte.php'; // para que cargue el porcentaje
			include_once 'system/ventas/Venta.php';
			$ventas = new Venta;
			$ventas->VerFactura($_SESSION["mesa"]);

		} elseif (isset($_GET["modal"])) {
			# code...
		} else {
			echo '<div align="center"><br><img src="assets/img/logo/'. $_SESSION['config_imagen'] .'" alt="" class="img-fluid hoverable"></div>';	
		}
		
?>