<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

include_once 'application/common/Alerts.php';
include_once 'system/historial/Resumen.php';

$corter = new Resumen()
?>


<div id="resumen_corte">
  <?php 
      $corter->ResumenCorte($_REQUEST["hash"]);
   ?>
</div>







<!-- detalles del corte -->
<div class="modal" id="ModalResumen" tabindex="-1" role="dialog" aria-labelledby="ModalResumen" aria-hidden="true"  data-backdrop="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="ModalResumen">
         RESUMEN DE CORTE</h5>
      </div>
      <div class="modal-body">
<!-- ./  content -->



<div id="vista_resumen"></div>

<!-- ./  content -->
      </div>
      <div class="modal-footer">
   <a id="cerrarmodal" class="btn btn-primary btn-rounded" data-dismiss="modal">Cerrar</a>
   
      </div>
    </div>
  </div>
</div>
<!-- ./  Modal -->





<!-- Ver producto -->
<div class="modal" id="ModalVer" tabindex="-1" role="dialog" aria-labelledby="ModalVer" aria-hidden="true"  data-backdrop="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="ModalVer">
         DETALLES DEL TICKET</h5>
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