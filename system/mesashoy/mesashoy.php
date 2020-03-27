<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

include_once 'application/common/Alerts.php';
include_once 'system/mesashoy/Mesas.php';


if($_SESSION["mesa"] != NULL){ // para eliminar la masa que viene de index
 include_once 'system/ventas/Venta.php'; 
    if(Venta::VerProductosMesa($_SESSION["mesa"]) == NULL){
      Helpers::DeleteId("mesa", "estado = 1 and mesa = ". $_SESSION["mesa"] ." and tx = ". $_SESSION["tx"] ." and td = " . $_SESSION["td"]);
      unset ($_SESSION["mesa"]);
    }
}

?>

<h2 class="h2-responsive">Mesas registradas</h2>	    
<div id="contenido">
<?php 
$mesas = new Mesas;
$mesas->VerMesas(date("d-m-Y"),1);

 ?>
</div>





<!-- Ver producto -->
<div class="modal" id="ModalVer" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"  data-backdrop="false">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">
         DETALLES DE LA MESA</h5>
      </div>
      <div class="modal-body">
<!-- ./  content -->

<div id="vista"></div>

<!-- ./  content -->
      </div>
      <div class="modal-footer">

<a id="cerrarmodal" class="btn btn-primary btn-rounded" data-dismiss="modal">Regresar</a>
         
    
      </div>
    </div>
  </div>
</div>
<!-- ./  Modal -->