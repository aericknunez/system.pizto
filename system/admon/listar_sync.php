<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

include_once 'system/admon/Admin.php';
$admon = new Admin;

?>
<h1 class="h1-responsive">Listado archivos de Sincronizacion</h1>



<div class="row d-flex justify-content-center text-center">
  <div class="col-sm-10">

<?php   
echo '<div id="contenido">';
$admon->VerSyncLocal(date("d-m-Y"), $_REQUEST["td"]);
echo '</div>';
 ?>

  </div>
</div>