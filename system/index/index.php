<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

include_once 'application/common/Alerts.php';
include_once 'application/common/Fechas.php';
include_once 'system/index/Inicio.php';
include_once 'system/corte/Corte.php';
include_once 'system/ventas/Venta.php';
$corte = new Corte();

$datalive = TRUE; /// para saber que estoy en index

// if(Helpers::ServerDomain() == TRUE){
// Alerts::Mensaje('<strong>En este momento el Sistema se encuentra en tareas de mantenimiento urgentes. Es necesario que actualice su sistema local, y es muy probable que sus datos no estén disponibles en este momento.</strong>',"danger",NULL,NULL);	
// }


if($_SESSION["tipo_cuenta"] == 1 or $_SESSION["tipo_cuenta"] == 5) {
		
if($_SESSION["muestra_vender"] == NULL){
	// aqui va el panel de control
	Inicio::Root();
	Inicio::Admin();

} else {

	if($corte->VerificaApertura() == 0){
		Alerts::CorteEcho("ventas");
	} else {
		// aqui para cobrar
		ActivarMenu();
	}
			
}
	
} elseif ($_SESSION["tipo_cuenta"] == 2) {
		
	if($_SESSION["muestra_vender"] == NULL){
		
		// aqui va el panel de control
		Inicio::Admin();

	} else {

		// verificamos primero el tipo cuenta
		if($corte->VerificaApertura() == 0){
			Alerts::CorteEcho("ventas");
		} else {
		// aqui para cobrar
			ActivarMenu();
		}			
			
	} // muestra vender


}  elseif ($_SESSION["tipo_cuenta"] == 4) {
	echo '<script>
	window.location.href="?tv"
	</script>';

} else {
			// verificamos primero el tipo cuenta
	if($corte->VerificaApertura() == 0){
		Alerts::CorteEcho("ventas");
		} else {
		// aqui para cobrar
			ActivarMenu();
		}
		
}


function ActivarMenu(){
	$db = new dbConn();
	
	if($_SESSION["delivery_on"] == TRUE){

		include_once 'system/delivery/delivery.php';

	} elseif($_SESSION["tipo_inicio"] == 1){
		//aqui generamos la nueva mesa si no hay creada
		if($_SESSION["mesa"] == NULL){
		$ventas = new Venta;
		$ventas->CrearMesa(1, 1); }

		if(file_exists('application/iconos/iconos_'.$_SESSION["td"].'.php') == TRUE){
		include_once 'application/iconos/iconos_'.$_SESSION["td"].'.php';
		} else {
		echo '<a id="crear-iconos" op="92" class="btn btn-success">Crear Iconos</a>';
		}

	} else {

		include_once 'system/mesas/mesas.php';
	}
}

print_r($_SESSION);
	
echo '<div id="ventana"></div>';



echo Fechas::Format("00:58:00");
echo "<br>";
echo Fechas::Format(date("H:i:s"));
?>