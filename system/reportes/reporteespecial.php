<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

include_once 'application/common/Alerts.php';
include_once 'system/reportes/Reporte.php';
include_once 'system/historial/Historial.php';
include_once 'system/gastos/Gasto.php';


$reporte = new Reporte;

$fecha = date("d-m-Y");

?>


  <div class="row justify-content-center">
    <div class="col-12 col-md-auto">
     <form name="form-reporte" method="post" id="form-reporte">
    <input placeholder="Seleccione una fecha" type="text" id="fecha" name="fecha" class="form-control datepicker my-2">
    </div>
  </div>

<div class="row justify-content-center">
  <button class="btn btn-info my-2 btn-rounded btn-sm waves-effect" type="submit" id="btn-reporte" name="btn-reporte">Mostra Datos</button>
  </form> 
</div>
  
<div class="row justify-content-md-center" id="loaderx">
  <img src="assets/img/loading.gif" alt=""></div>



<div id="contenido">
  <?php 
  $reporte->Contenido($fecha);
 ?>

</div>








<!-- Ver producto -->
<div class="modal" id="ModalVerEspecial" tabindex="-1" role="dialog" aria-labelledby="ModalVerEspecial" aria-hidden="true"  data-backdrop="false">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">
         DETALLES VENTA ESPECIAL</h5>
      </div>
      <div class="modal-body">
<!-- ./  content -->

<div id="vista_especial"></div>

<!-- ./  content -->
      </div>
      <div class="modal-footer">

<a id="cerrarmodal" class="btn btn-primary btn-rounded" data-dismiss="modal">Regresar</a>
         
    
      </div>
    </div>
  </div>
</div>
<!-- ./  Modal -->




<!-- Ver imagenes -->
<div class="modal" id="ModalImagenes" tabindex="-1" role="dialog" aria-labelledby="ModalImagenes" aria-hidden="true"  data-backdrop="false">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">
         IMAGENES GASTOS</h5>
      </div>
      <div class="modal-body">
<!-- ./  content -->



<div id="vista"></div>

<!-- ./  content -->
      </div>
      <div class="modal-footer">
   <a id="cerrarmodal" class="btn btn-primary btn-rounded" data-dismiss="modal">Cerrar</a>
   
      </div>
    </div>
  </div>
</div>
<!-- ./  Modal -->