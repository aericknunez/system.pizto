<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

unset($_SESSION["mesa"]);

// pra que muestre nada mas las mesas del usuario mesero unicamente
if($_SESSION["config_umesas"] == "on" and $_SESSION["tipo_cuenta"] == 3){ 
$a = $db->query("SELECT * FROM mesa WHERE estado = 1 and tipo = 2 and user = '".$_SESSION["user"]."' and tx = ".$_SESSION["tx"]." and td =".$_SESSION["td"]."");
} else {
$a = $db->query("SELECT * FROM mesa WHERE estado = 1 and tipo = 2 and tx = ".$_SESSION["tx"]." and td =".$_SESSION["td"]."");
}
    


    echo '<div class="row justify-content-center">';
    
    foreach ($a as $b) {
    		// obtengo el nombre de la mesa
    	    if ($r = $db->select("nombre", "mesa_nombre", "WHERE mesa = ".$b["mesa"]." and tx = ".$_SESSION["tx"]." and td =".$_SESSION["td"]."")) { 
        		$nmesa = $r["nombre"];
    		} unset($r);  
   	// 
   	if($nmesa == NULL) $mesan = "Mesa ".$b["mesa"];
   	else  $mesan = $nmesa;
	echo '<a href="?view&mesa='.$b["mesa"].'">
	<figure class="figure">
	    <img src="assets/img/imagenes/'.Helpers::Mesa($b["clientes"]).'" class="figure-img img-fluid z-depth-2 rounded-circle"  alt="hoverable" >
	    <figcaption class="figure-caption text-center">'.$mesan.'</figcaption>
      <figcaption class="figure-caption text-center">';

    // alerta de no comanda  
    if ($r = $db->select("edo", "mesa_comanda_edo", "WHERE mesa = ".$b["mesa"]." and tx = ".$_SESSION["tx"]." and td = ".$_SESSION["td"]."")) { 
        $edo = $r["edo"];
    } unset($r);  

    if($edo == 1){ echo '<i class="fas fa-exclamation-triangle fa-xs red-text"></i> '; }  

      echo $b["empleado"].'</figcaption>
	</figure>
	</a>  &nbsp &nbsp &nbsp';
	unset($nmesa);
    } 
echo '</div>';
    $a->close();
?>

<hr>
<!-- aqui comienza para agregar mesa -->
<div class="d-flex justify-content-center">
<a href="?modal=addmesa">
<img src="assets/img/imagenes/nuevo.png" alt="" class="figure-img img-fluid">
</a>
</div>  