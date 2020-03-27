<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

include_once 'application/common/Alerts.php';
include_once 'system/planilla/Planilla.php';
$planilla = new Planilla(); 

?>

<div id="msj"></div>
<h2 class="h2-responsive">Nuevo Empleado</h2>
<div class="row">
    <div class="col-md-6 btn-outline-black z-depth-2">
            

  <form id="form-addempleado">
  
  <div class="form-row">

  <div class="col-md-8 mb-2 md-form">
      <label for="nombre">* Nombre</label>
      <input type="text" class="form-control" id="nombre" name="nombre">
    </div>

    <div class="col-md-4 mb-2 md-form">
      <label for="documento">* Documento</label>
      <input type="text" class="form-control" id="documento" name="documento">
    </div>

  </div>


  <div class="form-row">

   <div class="col-md-4 mb-2 md-form">
      <label for="telefono">* Tel&eacutefono</label>
      <input type="text" class="form-control" id="telefono" name="telefono">
    </div>

    <div class="col-md-8 mb-2 md-form">
      <label for="direccion">* Direcci&oacuten</label>
      <input type="text" class="form-control" id="direccion" name="direccion">
    </div>

  </div>


  <div class="form-row">

    <div class="col-md-6 mb-2 md-form">
      <label for="nit">NIT</label>
      <input type="text" class="form-control" id="nit" name="nit">
    </div>

  <div class="col-md-6 mb-2 md-form">
      <label for="puesto">Puesto</label>
      <input type="text" class="form-control" id="puesto" name="puesto">
    </div>

  </div>


 

  <div class="form-row">

    <div class="col-md-6 mb-2 md-form">
      <label for="sueldo">Sueldo</label>
      <input type="number" step="any" class="form-control" id="sueldo" name="sueldo">
    </div>

  <div class="col-md-6 mb-2 md-form">
        <div class="switch">
            <label>
             Entradas ||  Off
              <input type="checkbox" id="entradas" name="entradas" disabled>
              <span class="lever"></span> On 
            </label>
          </div>
    </div>

  </div>


  <div class="form-row">

    <div class="col-md-6 mb-2 md-form">
        <div class="switch">
            <label>
             Extra ||  Off
              <input type="checkbox" id="extra" name="extra" disabled>
              <span class="lever"></span> On 
            </label>
          </div>
    </div>

  <div class="col-md-6 mb-2 md-form">
          <div class="switch">
            <label>
             Nocturnas ||  Off
              <input type="checkbox" id="nocturnas" name="nocturnas" disabled>
              <span class="lever"></span> On 
            </label>
          </div>
    </div>

  </div>


  <div class="form-row mt-4">

    <div class="col-md-12 mb-1 md-form">
      <textarea id="comentarios" name="comentarios" class="md-textarea form-control" rows="3"></textarea>
      <label for="comentarios">Comentarios..</label>
    </div>

  </div>



  <div class="form-row">
    <div class="col-md-12 my-6 md-form text-center">
     <button class="btn btn-info my-4" type="submit" id="btn-addempleado"><i class="fas fa-save mr-1"></i> Guardar</button>

    </div>
  </div>

</form>

<!-- TERMINA FORMULARIO PRINCIPAL -->

    </div>
    
    <div class="col-md-6 btn-outline-black z-depth-2" id="contenido">
          <?php $planilla->VerEmpleados(); ?>
    </div>
   
</div>  <!-- row -->



<!-- MODAL PARA CONFIRMAR ELIMINACION -->

<div class="modal fade" id="ConfirmDelete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog modal-sm modal-notify modal-danger" role="document">
    <!--Content-->
    <div class="modal-content text-center">
      <!--Header-->
      <div class="modal-header d-flex justify-content-center">
        <p class="heading">Seguro que desea eliminar este elemento?</p>
      </div>

      <!--Body-->
      <div class="modal-body">

        <i class="fas fa-times fa-4x animated rotateIn"></i>

      </div>

      <!--Footer-->
      <div class="modal-footer flex-center">
        <a id="delempleado" class="btn  btn-outline-danger">Eliminar</a>
        <a type="button" class="btn  btn-danger waves-effect" data-dismiss="modal">No</a>
      </div>
    </div>
    <!--/.Content-->
  </div>
</div>
<!--Modal: modalConfirmDelete-->
