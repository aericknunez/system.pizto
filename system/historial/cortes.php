<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

include_once 'application/common/Alerts.php';
include_once 'system/historial/Historial.php';
include_once 'system/historial/Resumen.php';
?>

  <div class="row justify-content-md-center">
    <div class="col-12 col-md-auto">
        <form name="form-cortes" method="post" id="form-cortes">
    <input placeholder="Seleccione una fecha" type="text" id="fecha1" name="fecha1" class="form-control datepicker my-2">
    <input placeholder="Seleccione una fecha" type="text" id="fecha2" name="fecha2" class="form-control datepicker my-2">

    </div>
  </div>


  <div class="row justify-content-md-center">
    <div class="col-12 col-md-auto text-center">
    <button class="btn btn-info my-2 btn-rounded btn-sm waves-effect" type="submit" id="btn-cortes" name="btn-cortes">Mostra Datos</button>
      </form> 
    </div>
  </div>

<div id="contenido" class="mt-5">
<?php Alerts::Mensajex("Seleccione un rango de fechas a buscar", "info"); ?>
</div>

<div class="row justify-content-md-center" id="loaderx">
  <img src="assets/img/loading.gif" alt=""></div>














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