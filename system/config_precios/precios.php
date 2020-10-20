<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

include_once 'system/config_precios/Config.php';
include_once 'application/common/Alerts.php';

$precios = new ConfigP();
?>

<h1 class="h1-responsive">Configuraci&oacuten productos</h1>
      

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








<!-- Ver OPCIONES -->
<div class="modal" id="ModalOpciones" tabindex="-1" role="dialog" aria-labelledby="ModalOpciones" aria-hidden="true"  data-backdrop="false">
  <div class="modal-dialog modal-md" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">
         CAMBIAR OPCIONES</h5>
      </div>
      <div class="modal-body">
<!-- ./  content -->

<div id="pro_op"></div>
<hr>
<div id="vista_opciones">
       

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









<!-- Ver Iconos -->
<div class="modal" id="ModalIconos" tabindex="-1" role="dialog" aria-labelledby="ModalIconos" aria-hidden="true"  data-backdrop="false">
  <div class="modal-dialog modal-md" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">
         CAMBIAR ICONO</h5>
      </div>
      <div class="modal-body">
<!-- ./  content -->

<div id="pro_ic"></div>
<div id="img-ico" class="text-center"></div>
<hr>



<div id="formulario">
  <form id="form-img" name="form-img" class="md-form">

    <div class="file-field">
        <a class="btn-floating blue-gradient mt-0 float-left">
            <i class="fas fa-paperclip" aria-hidden="true"></i>
            <input type="file" id="archivo" name="archivo">
        </a>
        <div class="file-path-wrapper">
           <input class="file-path validate" type="text" placeholder="Agregue su imagen">
        </div>
    </div>

<input type="hidden" id="codigo" name="codigo" value="">
   
<div class="text-center">
  <button class="btn btn-outline-info btn-rounded z-depth-0 my-2 waves-effect" type="submit" id="btn-img" name="btn-img">Subir Imagen</button>
</div>
    </form>
</div>


<div id="vista_iconos"></div>
<!-- ./  content -->
      </div>
      <div class="modal-footer">

<a id="vericonos" codigox="" class="btn btn-secondary btn-rounded btn-sm" data-dismiss="modal">Cambiar Icono</a>
   
<a id="cerrarmodal" class="btn btn-primary btn-rounded" data-dismiss="modal">Regresar</a>
         
    
      </div>
    </div>
  </div>
</div>
<!-- ./  Modal -->






<!-- Ver OPCIONES -->
<div class="modal" id="ModalIconosTodos" tabindex="-1" role="dialog" aria-labelledby="ModalIconosTodos" aria-hidden="true"  data-backdrop="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">
         CAMBIAR ICONO</h5>
      </div>
      <div class="modal-body">
<!-- ./  content -->
<?php 

echo ' <div id="mostrariconos">
<ul class="gallery">';
$precios->MostrarIconos();
echo '
</ul>
</div> ';
 ?>
<!-- ./  content -->
      </div>
      <div class="modal-footer">

<a id="cerrarmodal" class="btn btn-primary btn-rounded" data-dismiss="modal">Regresar</a>
         
    
      </div>
    </div>
  </div>
</div>
<!-- ./  Modal -->