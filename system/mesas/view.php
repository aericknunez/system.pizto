<?php 
defined('BASEPATH') OR exit('No direct script access allowed');
include_once 'application/common/Alerts.php';
include_once 'system/mesas/Mesa.php';
$mesas = new Mesa;

$datalive = TRUE; /// para saber que estoy en index


unset($_SESSION['client-asign']);
$_SESSION["mesa"] = $_REQUEST["mesa"];


/// verifico si existe la mesa antes de continuar
$ver_mesa = $db->query("SELECT estado FROM mesa WHERE estado = 1 and mesa = ". $_REQUEST["mesa"]. " and tx = ". $_SESSION["tx"]." and td = ". $_SESSION["td"]."");
if($ver_mesa->num_rows){


 ?>

 <div id="clientes">
<?php
$mesas->VerClientes($_REQUEST["mesa"]);
 ?>  
 </div>
   <?php 
// para agregarle el numbre de la mesa a la ventana
    if ($r = $db->select("nombre", "mesa_nombre", "WHERE mesa = ". $_REQUEST["mesa"]. " and tx = ". $_SESSION["tx"]." and td = ". $_SESSION["td"]."")) { 
        $mesa_nombre = $r["nombre"];
    } unset($r);  echo "<div align='center'>" . $mesa_nombre . "</div>";

 ?> 
 <hr>
<div id="iconos" align="center">
<img src="assets/img/loading.gif">
</div>
<div id="ventana"></div>


<?php 
} else {
 Alerts::Error404("Este pedido ya no existe, posiblemente ha sido cobrado o eliminado!");
} $ver_mesa->close();
?>




  <div class="modal fade top" id="NuevoCliente" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
      data-backdrop="false">
      <div class="modal-dialog modal-frame modal-bottom modal-notify modal-info" role="document">
          <div class="modal-content">
              <div class="modal-body">
                  <div class="row d-flex justify-content-center align-items-center">

                      <p class="pt-3 pr-2">En verdad desea agregar un nuevo cliente a esta mesa?</p>

                      <a id="nuevo-cliente" op="44" clientes="<?php echo $clientes + 1; ?>" mesa="<?php echo $_SESSION["mesa"]; ?>" class="btn btn-info">Agregar
                          <i class="fas fa-gem ml-1"></i>
                      </a>
                      <a type="button" class="btn btn-outline-info waves-effect" data-dismiss="modal">Cerrar</a>
                  </div>
              </div>
          </div>
      </div>
  </div>



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
