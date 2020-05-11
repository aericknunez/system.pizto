<?php 
defined('BASEPATH') OR exit('No direct script access allowed');
include_once 'application/common/Alerts.php';
include_once 'system/mesas/Mesa.php';
$mesas = new Mesa;

$datalive = TRUE; /// para saber que estoy en index


unset($_SESSION['client-asign']);
$_SESSION["mesa"] = $_REQUEST["mesa"];
$_SESSION["view"] = "1"; // esta hace que la mesa este activada para saber que biene de view



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