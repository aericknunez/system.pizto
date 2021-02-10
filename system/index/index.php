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

// print_r($_SESSION);
	
echo '<div id="ventana"></div>';
?>



<!-- Modal paa comentarios -->
<div class="modal" id="ComentarioComanda" tabindex="-1" role="dialog" aria-labelledby="ComentarioComanda" aria-hidden="true"  data-backdrop="true">
		  <div class="modal-dialog modal-md" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">
		         INGRESE EL COMENTARIO A LA COMANDA</h5>
		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
		      </div>
		      <div class="modal-body">


<form id="form-comentario" name="form-comentario">
 
     <div class="justify-content-center">
      <div class="col-xs-2">
        <textarea type="text" id="comentario" name="comentario" class="form-control mb-3" placeholder="Escriba su cometario aqui"></textarea>
      </div>
    </div>

    <div class="justify-content-center">
      <button class="btn btn-info my-4" type="submit" id="btn-comentario" name="btn-comentario">AGREGAR COMENTARIO</button>
    </div>

    </form>


<div id="vista_comentarios"></div>

		</div>

  </div>
</div>
</div>
















<!-- Modal -->
<div class="modal bounceIn" id="ModalCantidad" tabindex="-1" role="dialog" aria-labelledby="ModalCantidad"
  aria-hidden="true" data-backdrop="false">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">CAMBIAR CANTIDAD</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
<!-- CONTENIDO -->
<div align="center">
  <div class="col-md-12 z-depth-2 justify-content-center">
      <div class="md-form mt-0">
        <form id="form-Ccantidad">
        <input class="form-control form-control-lg" type="number" step="any" min="1" placeholder="Cantidad" id="cantidad" name="cantidad" value="" autofocus>
        <input type="hidden" id="codigox" name="codigox" value="">
        <input type="hidden" id="cliente" name="cliente" value="">
         <button class="btn aqua-gradient btn-rounded btn-sm" type="submit" id="btn-Ccantidad" name="btn-Ccantidad">Agregar</button>
        </form>
      </div>
  </div>
</div>
<!-- CONTENIDO -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>


