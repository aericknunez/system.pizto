<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

unset($_SESSION["mesa"]);

    $a = $db->query("SELECT mesa FROM mesa WHERE estado = 1 and tipo = 3 and tx = ".$_SESSION["tx"]." and td =".$_SESSION["td"]."");
    echo '<div class="row justify-content-center">';
    
    foreach ($a as $b) {

    $ax = $db->query("SELECT clientes.nombre FROM clientes_mesa INNER JOIN clientes ON clientes_mesa.cliente = clientes.hash WHERE clientes_mesa.mesa = ".$b["mesa"]." and clientes_mesa.tx = ".$_SESSION["tx"]." and clientes_mesa.td =".$_SESSION["td"]."");
    foreach ($ax as $bx) {
        $nombre = $bx["nombre"];
        $nombre = explode(" ",$nombre);
    } $ax->close();

    if($nombre == NULL){ $nombre = $b["mesa"]; } else { $nombre = $nombre[0]; }

	echo '<a href="?delivery&mesa='.$b["mesa"].'">
	<figure class="figure">
	    <img src="assets/img/imagenes/delivery.jpg" class="figure-img img-fluid z-depth-2 rounded-circle"  alt="hoverable" >
	    <figcaption class="figure-caption text-center">'.$nombre.'</figcaption>
	</figure>
	</a>  &nbsp &nbsp &nbsp';

  unset($nombre);
    } 
echo '</div>';
    $a->close();
?>

<hr>
<!-- aqui comienza para agregar mesa -->
<div class="d-flex justify-content-center">
<a id="ndelivery">
<img src="assets/img/imagenes/nuevo_delivery.png" alt="" class="figure-img img-fluid">
</a>
</div>  





<!-- Ver agregar delivery -->
<div class="modal" id="ModalVer" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"  data-backdrop="false">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">
         AGREGAR NUEVO DELIVERY</h5>
      </div>
      <div class="modal-body">
<!-- ./  content -->

<div align="center">
  <div class="col-md-8 z-depth-2 justify-content-center">
      <div class="md-form mt-0">
      	<form id="p-busqueda">
        <input class="form-control" type="text" placeholder="Buscar Cliente" aria-label="Search" id="cliente-busqueda" name="cliente-busqueda" autofocus>
        </form>
      </div>
  </div>
  <div class="col-md-6 z-depth-2 justify-content-center" id="muestra-busqueda"></div>
</div>


<!-- ./  content -->
      </div>
      <div class="modal-footer">


<a id="continuar" class="btn btn-sm btn-danger btn-rounded">Continuar</a>
  
<a id="ncliente" class="btn btn-secondary btn-rounded">Nuevo Cliente</a>
  
<a id="cerrarmodal" class="btn btn-primary btn-rounded" data-dismiss="modal">Regresar</a>
         
    
      </div>
    </div>
  </div>
</div>
<!-- ./  Modal -->





<!-- nuevo cliente -->
<div class="modal" id="ModalNliente" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"  data-backdrop="false">
  <div class="modal-dialog modal-md" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">
         NUEVO CLIENTE</h5>
      </div>
      <div class="modal-body">
<!-- ./  content -->


<form id="form-addcliente">
  
  <div class="form-row">

<input type="hidden" id="hash" name="hash" value="<?php echo $hash; ?>">
  <div class="col-md-8 mb-2 md-form">
      <label for="descripcion">* Nombre</label>
      <input type="text" class="form-control" id="nombre" name="nombre" >
    </div>

    <div class="col-md-4 mb-2 md-form">
      <label for="cod">Documento</label>
      <input type="text" class="form-control" id="documento" name="documento" >
    </div>

  </div>


  <div class="form-row">

 <div class="col-md-6 mb-2 md-form">
      <label for="descripcion">Tel&eacutefono</label>
      <input type="text" class="form-control" id="telefono" name="telefono" >
    </div>

  <div class="col-md-6 mb-2 md-form">
      <label for="descripcion">Direcci&oacuten</label>
      <input type="text" class="form-control" id="direccion" name="direccion" >
    </div>

  </div>


  <div class="form-row">

    <div class="col-md-6 mb-2 md-form">
      <label for="cod">Departamento</label>
      <input type="text" class="form-control" id="departamento" name="departamento" >
    </div>

  <div class="col-md-6 mb-2 md-form">
      <label for="descripcion">Municipio</label>
      <input type="text" class="form-control" id="municipio" name="municipio" >
    </div>

  </div>



  <div class="form-row">

    <div class="col-md-6 mb-2 md-form">
      <label for="cod">Email</label>
      <input type="text" class="form-control" id="email" name="email" >
    </div>

  <div class="col-md-6 mb-2 md-form">
      <input placeholder="Fecha de Nacimiento" type="text" id="nacimiento" name="nacimiento" class="form-control datepicker">
    </div>

  </div>

  <div class="form-row">

    <div class="col-md-12 mb-1 md-form">
      <textarea id="comentarios" name="comentarios" class="md-textarea form-control" rows="3"> </textarea>
      <label for="comentarios">Comentarios..</label>
    </div>

  </div>



  <div class="form-row">
    <div class="col-md-12 my-6 md-form text-center">
     <button class="btn btn-info my-4" type="submit" id="btn-addcliente"><i class="fa fa-save mr-1"></i> Agregar Cliente</button>

    </div>
  </div>

</form>


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