<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

include_once 'application/common/Alerts.php';
include_once 'system/historial/Historial.php';

?>
<form name="form-diario" method="post" id="form-diario">
  <div class="row justify-content-center">
    <div class="col-12 col-md-auto">
     
    <input placeholder="Seleccione una fecha" type="text" id="fecha" name="fecha" class="form-control datepicker my-2">
    </div>
  </div>

<div class="row justify-content-center">
  <button class="btn btn-info my-2 btn-rounded btn-sm waves-effect" type="submit" id="btn-diario" name="btn-diario">Mostra Datos</button>
</div>
</form> 

<div class="row justify-content-md-center" id="loaderx">
	<img src="assets/img/loading.gif" alt=""></div>

<div id="contenido">
<?php 
	$historial = new Historial;
	$historial->HistorialDiario(date("d-m-Y"));

 ?>
</div>