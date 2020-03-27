<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

include_once 'system/config_configuraciones/Config.php';
include_once 'application/common/Alerts.php';

$precios = new Config();
?>


<div id="precio_ver">
  <?php $precios->VerTodosPrecio(); ?>
</div>



<!-- Ver AGREGAR -->
<div class="modal" id="ModalCambiarPrecio" tabindex="-1" role="dialog" aria-labelledby="ModalCambiarPrecio" aria-hidden="true"  data-backdrop="false">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">
         CAMBIAR PRECIO</h5>
      </div>
      <div class="modal-body">
<!-- ./  content -->

<div id="pro"></div>
<hr>
<div id="vista_precio">
       
<form id="form-precio" name="form-precio">
<input type="hidden" name="cod" id="cod" />
<input type="number" step="any" name="precio" id="precio" class="my-2 form-control" placeholder="Precio"/>

<div align="center"><button class="btn btn-outline-info btn-rounded z-depth-0 my-4 waves-effect" type="submit" id="btn-precio" name="btn-precio">Registrar</button> </div>
</form>


</div>

<!-- ./  content -->
      </div>
      <div class="modal-footer">

<a id="cerrarmodal" class="btn btn-primary btn-rounded" data-dismiss="modal">Regresar</a>
         
    
      </div>
    </div>
  </div>
</div>
<!-- ./  Modal -->