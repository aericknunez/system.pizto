<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

		if(isset($_GET["tv"])){
			echo '<div id="lateral-panel"></div>';			
		} else {
			include_once 'system/corte/Corte.php'; // para que cargue el porcentaje
			include_once 'system/ventas/Venta.php';
			$ventas = new Venta;
			$ventas->VerFactura($_SESSION["mesa"]);
		}
		
?>