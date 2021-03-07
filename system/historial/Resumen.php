<?php
class Resumen{

	public function __construct() { 
     } 


	public function ResumenCorte($hash = NULL, $tipocorte = NULL){ 
		$db = new dbConn();


if($hash == NULL){
if ($r = $db->select("hash", "corte_diario", "WHERE edo = 1 and td = ".$_SESSION["td"]." ORDER BY time desc limit 1")) { 
    $hash = $r["hash"];
} unset($r);  
}


    if ($r = $db->select("efectivo, propina, total, gastos, diferencia, clientes, time, edo", "corte_diario", "WHERE hash = '".$hash."' and td = ".$_SESSION["td"]."")) { 
        $efectivo = $r["efectivo"];
        $propina = $r["propina"];
        $total = $r["total"];
        $gastos = $r["gastos"];
        $diferencia = $r["diferencia"];
        $clientes = $r["clientes"];
        $edo = $r["edo"];
        $fin = $r["time"];

    } unset($r);  



    if ($r = $db->select("efectivo, time", "corte_diario", "WHERE time < $fin and edo = 1 and td = ".$_SESSION["td"]." ORDER BY time desc limit 1")) { 
        $apertura = $r["efectivo"];
        $inicio = $r["time"]+1;
    } unset($r);  



// tarjeta de credito
$a = $db->query("SELECT sum(total) FROM ticket WHERE edo = 1 and tipo_pago = 2 and td = ".$_SESSION["td"]." and time BETWEEN '".$inicio."' and '".$fin."'");
    foreach ($a as $b) {
     $tarjetacredito=$b["sum(total)"];
    } $a->close();

// venta en efectivo
$a = $db->query("SELECT sum(total) FROM ticket WHERE edo = 1 and tipo_pago = 1 and td = ".$_SESSION["td"]." and time BETWEEN '".$inicio."' and '".$fin."'");
    foreach ($a as $b) {
     $vefectivo=$b["sum(total)"];
    } $a->close();




/// propina de tarjeta
    $a = $db->query("SELECT num_fac, tx FROM ticket WHERE edo = 1 and tipo_pago = 2 and td = ".$_SESSION["td"]." and time BETWEEN  '".$inicio."' and '".$fin."' GROUP BY num_fac");
    $propinatarjetac = 0;
    foreach ($a as $b) {

	    if ($r = $db->select("total", "ticket_propina", "WHERE num_fac = ".$b["num_fac"]." and td = ".$_SESSION["td"]." and tx = ".$b["tx"]."")) { 
	        $totalx = $r["total"];
	    } unset($r);  
	    if($totalx > 0){
	    	$propinatarjetac = $propinatarjetac + $totalx;
	    	unset($total2);
	    }  
    } $a->close();


/// propina de efectivo
    $a = $db->query("SELECT num_fac, tx FROM ticket WHERE edo = 1 and tipo_pago = 1 and td = ".$_SESSION["td"]." and time BETWEEN  '".$inicio."' and '".$fin."' GROUP BY num_fac");
    $propinatarjetae = 0;
    foreach ($a as $b) {

	    if ($r = $db->select("total", "ticket_propina", "WHERE num_fac = ".$b["num_fac"]." and td = ".$_SESSION["td"]." and tx = ".$b["tx"]."")) { 
	        $total2 = $r["total"];
	    } unset($r); 
	    if($total2 > 0){
	    	$propinatarjetae = $propinatarjetae + $total2;
	    	unset($total2);
	    }  
    } $a->close();


if($edo == 2){
	Alerts::Mensajex("Este corte ha sido eliminado y sus datos puede que no esten de acorde con el corte real","danger");
}
		 echo '<div class="card-deck">


			    <!--Panel-->
			    <div class="card">
			        <div class="card-body" title="La suma de todas las ventas pagadas en efectivo sin incluir la propina" data-toggle="tooltip">
			            <h4 class="card-title">Venta Efectivo</h4>
			            <h1 class="black-text">' . Helpers::Dinero($vefectivo) . '</h1>
			        </div>
			    </div>
			    <!--/.Panel-->


			    <!--Panel-->
			    <div class="card">
			        <div class="card-body" title="La suma de las ventas pagadas con tarjeta de credito sin incluir propina" data-toggle="tooltip">
			            <h4 class="card-title">Tarjeta Credito</h4>
			            <h1 class="black-text">' . Helpers::Dinero($tarjetacredito) . '</h1>
			        </div>
			    </div>
			    <!--/.Panel-->


			    <!--Panel-->
			    <div class="card">
			        <div class="card-body" title="La suma de todas las propinas de la venta de hoy y separadas en efectivo o credito" data-toggle="tooltip">
			            <h4 class="card-title">Propina Total</h4>
			            <h1 class="black-text">' . Helpers::Dinero($propina) . '</h1>
			            <p>Tarjeta: '. Helpers::Dinero($propinatarjetac) .'</p>
			            <p>Efectivo: '. Helpers::Dinero($propinatarjetae) .'</p>
			        </div>
			    </div>
			    <!--/.Panel-->

			    <!--Panel-->
			    <div class="card">
			        <div class="card-body" title="El total de venta en efectivo y credito sumandole propina en efectivo y al credito" data-toggle="tooltip">
			            <h4 class="card-title">Total de Venta</h4>
			            <h1 class="black-text">' . Helpers::Dinero($total + $propina) . '</h1>
			        </div>
			    </div>
			    <!--/.Panel-->

			</div>';




		 echo '<div class="card-deck mt-3">

			    <!--Panel-->
			    <div class="card">
			        <div class="card-body" title="Efectivo Ingresado al momento de realizar el corte" data-toggle="tooltip">
			            <h4 class="card-title">Efectivo en caja</h4>
			            <h1 class="black-text">' . Helpers::Dinero($efectivo) . '</h1>
			        </div>
			    </div>
			    <!--/.Panel-->

			    <!--Panel-->
			    <div class="card">
			        <div class="card-body" title="La suma de todos los gastos reportados" data-toggle="tooltip">
			            <h4 class="card-title">Gastos</h4>
			            <h1 class="black-text">' . Helpers::Dinero($gastos) . '</h1>
			        </div>
			    </div>
			    <!--/.Panel-->

			    <!--Panel-->
			    <div class="card">
			        <div class="card-body" title="Dinero en efectivo del corte anterior" data-toggle="tooltip">
			            <h4 class="card-title">Apertura</h4>
			            <h1 class="black-text">' . Helpers::Dinero($apertura) . '</h1>
			        </div>
			    </div>
			    <!--/.Panel-->

			    <!--Panel-->
			    <div class="card">
			        <div class="card-body" title="Diferencia de dinero en el corte actual" data-toggle="tooltip">
			            <h4 class="card-title">Diferencia</h4>
			            <h1 class="black-text">' . Helpers::Dinero($diferencia) . '</h1>
			        </div>
			    </div>
			    <!--/.Panel-->

			</div>';


echo '<hr class="border-success pt-4"></hr>';
echo '<h1 class="text-success">MESAS ATENDIDAS POR USUARIO</h1>';
$this->ResumenVentas($inicio, $fin, $tipocorte);


$this->Gastos($inicio, $fin, $tipocorte);


$this->OrdenesEliminadas($inicio, $fin);


$this->TicketsEliminados($inicio, $fin);


$this->LoMasVendido($inicio, $fin);




if($tipocorte != NULL){
	echo '<a href="?resumen&hash='.$_REQUEST["hash"].'" title="">Ir a la versión con mas detalles</a>';
}

if ($_SESSION["td"] = 16) {
echo '<a id="imprimir_corte" inicio="'.$inicio.'" fin="'.$fin.'" class="btn-floating cyan" title="Imprimir Corte" data-toggle="tooltip" data-placement="bottom"><i class="fas fa-print"></i></a> <div id="msjimprimir"></div>';
}
	


	}













	public function ResumenVentas($inicio, $fin, $tipocorte = NULL) { /// resumen meseros
		$db = new dbConn();

    $a = $db->query("SELECT nombre, user FROM login_userdata WHERE td = ".$_SESSION["td"]."");
    foreach ($a as $b) {

	    $ax = $db->query("SELECT * FROM ticket WHERE edo = 1 and user = '".$b["user"]."' and td = '".$_SESSION["td"]."' and time BETWEEN '$inicio' AND '$fin' group by num_fac");
	    if($ax->num_rows > 0){
    echo '<h2 class="mt-2">'.$b["nombre"].'</h2>
    
    <table class="table table-striped table-sm mb-3">

		<thead>
	     <tr>
	       <th>Factura</th>
	       <th>Fecha</th>
	       <th>Pago</th>
	       <th>Total</th>
	       <th>Porcentaje</th>
	       <th>Propina</th>
	       <th>Total Factura</th>
	     </tr>
	   </thead>

	   <tbody>';
	   $xtotal = 0;
	   $xporcentaje = 0;
	   $xpropina = 0;
	   $ordenes = 0;
	    foreach ($ax as $bx) {

    if ($r = $db->select("sum(total)", "ticket", "WHERE num_fac = '". $bx["num_fac"]."' and tx = '".$bx["tx"]."' and td = '".$_SESSION["td"]."'")) { 
        $total = $r["sum(total)"];
    } unset($r);  


    if ($r = $db->select("propina, total", "ticket_propina", "WHERE num_fac = '". $bx["num_fac"]."' and tx = '".$bx["tx"]."' and td = '".$_SESSION["td"]."'")) { 
        $porcentaje = $r["propina"];
        $propina = $r["total"];
    } unset($r);  

	        echo '<tr>
				       <th scope="row">'. $bx["num_fac"]. '</th>
				       <td>'. $bx["fecha"]. ' | '. $bx["hora"]. '</td>
				       <td>'. Helpers::TipoPago($bx["tipo_pago"]). '</td>
				       <td>'. Helpers::Dinero($total). '</td>
				       <td>'. Helpers::Entero($porcentaje).' %</td>
				       <td>'. Helpers::Dinero($propina). '</td>
				       <td>'. Helpers::Dinero($total + $propina). '</td>';

				       if($tipocorte == NULL){
				       	echo '<td><a id="xverticket" num_fac="'. $bx["num_fac"] . '" tx="'. $bx["tx"] . '" op="78x" class="btn-floating btn-sm"><i class="fas fa-eye red-text"></i></a></td>';
				       }
				       
				  echo '</tr>';
	   
	   if($total != NULL) { $xtotal = $xtotal + $total; 
	   	unset($total); }
	   if($porcentaje != NULL) { $xporcentaje = $xporcentaje + $porcentaje; 
	   	unset($porcentaje); }
	   if($propina != NULL) { $xpropina = $xpropina + $propina; 
	   	unset($propina); }
	   
	   $ordenes++;

	    } 

$xporcentaje = $xporcentaje / $ordenes;
	        echo '<tr>
				       <th scope="row" colspan="3" class="text-right font-weight-bold">TOTAL: </th>
				       <td class="font-weight-bold">'. Helpers::Dinero($xtotal). '</td>
				       <td class="font-weight-bold">'. Helpers::format($xporcentaje).' %</td>
				       <td class="font-weight-bold">'. Helpers::Dinero($xpropina). '</td>
				       <td class="font-weight-bold">'. Helpers::Dinero($xtotal + $xpropina). '</td>
				  </tr>';

	    echo '</tbody>
		</table>';
		} $ax->close();


    } $a->close(); // busqueda de usuarios


} // fumcion












	public function Gastos($inicio, $fin, $tipocorte = NULL) {
		$db = new dbConn();

		$a = $db->query("SELECT * FROM gastos WHERE time BETWEEN '$inicio' AND '$fin' and td = ". $_SESSION["td"] ." order by id desc");
	        	$total=0;
	        	if($a->num_rows > 0){
	        echo '<hr class="border-success pt-4"></hr>';
			echo '<h1 class="text-success">GASTOS Y REMESAS</h1>

				<table class="table table-sm table-striped">
			  <thead>
			    <tr>
			      <th scope="col">Tipo</th>
			      <th scope="col">Gasto</th>
			      <th scope="col">Descripci&oacuten</th>
			      <th scope="col">Cantidad</th>';
			      if($tipocorte == NULL){
			      	echo '<th scope="col">Imagen</th>';
			      }
			      
			    echo '</tr>
			  </thead>
			  <tbody>';
		    foreach ($a as $b) {

		    	if($b["edo"] != 0){
				$total = $total + $b["cantidad"];
				$colores='class="text-black"';
				} else {
				$colores='class="text-danger"';	
				}
		    	echo '<tr '.$colores.'>
			      <th scope="row">'. Helpers::Gasto($b["tipo"]) .'</th>
			      <td>'. $b["nombre"] .'</td>
			      <td>'. $b["descripcion"] .'</td>
			      <td>'. Helpers::Dinero($b["cantidad"]) .'</td>';


			      if($tipocorte == NULL){
			      
			      echo '<td>'; 

			    $aw = $db->query("SELECT imagen FROM gastos_images WHERE gasto = ". $b["id"] ." and td = ".$_SESSION["td"]."");
				if($aw->num_rows > 0){
				echo '<a id="xver" gasto="'. $b["id"] .'">
					<span class="badge green"><i class="fas fa-image" aria-hidden="true"></i></span>
					</a>';		
				} else {
				echo '<span class="badge red"><i class="fas fa-ban" aria-hidden="true"></i></span>';	
				}
				$aw->close();
  
			    echo '</td>';

			     }

			    echo '</tr>';
		    }
		    echo '<tr>
			      <th scope="col"></th>
			      <th scope="col"></th>
			      <th scope="col">Total</th>
			      <th scope="col">'. Helpers::Dinero($total) .'</th>
			      <td></td>
			    </tr>
			    </tbody>
		    </table>';
			echo "El numero de registros es: ". $a->num_rows . "<br>";

			$ag = $db->query("SELECT sum(cantidad) FROM gastos where tipo != 5 and (edo = 1 or edo = 2) and time BETWEEN '$inicio' AND '$fin' and td = ".$_SESSION['td']."");
		    foreach ($ag as $bg) {
		        echo "Efectivo afectado: ". Helpers::Dinero($bg["sum(cantidad)"]) . "<br>";
		    } $ag->close();

		   $as = $db->query("SELECT sum(cantidad) FROM gastos where tipo = 5 and (edo = 1 or edo = 2) and  time BETWEEN '$inicio' AND '$fin' and td = ".$_SESSION['td']."");
		    foreach ($as as $bs) {
		        echo "Cheques emitidos: ". Helpers::Dinero($bs["sum(cantidad)"]) . "<br>";
		    } $as->close();


			} // num rows
			$a->close();

			

	}











	public function OrdenesEliminadas($inicio, $fin) {
		$db = new dbConn();

    $a = $db->query("SELECT * FROM mesa_borrado WHERE td = ".$_SESSION['td']." and time BETWEEN '$inicio' AND '$fin'");
	if($a->num_rows > 0){

    echo '<hr class="border-success pt-4"></hr>';
	echo '<h1 class="text-success">ORDENES ELIMINADAS</h1>
        <table class="table table-striped table-sm">

			<thead>
		     <tr>
		       <th>Mesa</th>
		       <th>Motivo</th>
		       <th>Nombre</th>
		     </tr>
		   </thead>

		   <tbody>';

    foreach ($a as $b) {


    if ($r = $db->select("nombre", "mesa_nombre", "WHERE mesa = '".$b["mesa"]."' and tx = '".$b["tx"]."' and td = ".$_SESSION['td']."")) { 
        $nombre = $r["nombre"];
    } unset($r);  

	        echo '<tr class="bg-success font-weight-bold">
				       <th scope="row">'. $b["mesa"]. '</th>
				       <td>'.$b["motivo"]. '</td>
				       <td>'.$nombre. '</td>
				  </tr>';

    $ax = $db->query("SELECT * FROM ticket_borrado WHERE mesa = '".$b["mesa"]."' and tx = '".$b["tx"]."' and td = ".$_SESSION['td']."");
	        echo '<tr>
				       <th scope="row">Fecha y Hora</th>
				       <td>Cantidad - Producto</td>
				       <td>Total</td>
				  </tr>';
    foreach ($ax as $bx) {
	        echo '<tr>
				       <th scope="row">'. $bx["fecha"]. ' '. $bx["hora"]. '</th>
				       <td>'. $bx["cant"]. ' - '.$bx["producto"]. '</td>
				       <td>'. $bx["total"]. '</td>
				  </tr>';
    } $ax->close();


	 }
	echo '</tbody>
		</table>';


	} $a->close();

}






	public function TicketsEliminados($inicio, $fin) {
		$db = new dbConn();

	    $d = $db->selectGroup("*", "ticket", "WHERE time BETWEEN '$inicio' AND '$fin' and td = ".$_SESSION['td']." and tx = 0 and edo = 2 GROUP BY num_fac");
	    if ($d->num_rows > 0) {

        echo '<hr class="border-success pt-4"></hr>';
		echo '<h1 class="text-success">TICKETS ELIMINADOS</h1>
		<table class="table table-striped table-sm">

			<thead>
		     <tr>
		       <th>Fecha</th>
		       <th>Hora</th>
		       <th>Ticket</th>
		       <th>Cajero</th>
		       <th>Total</th>
		       <th>Detalles</th>
		     </tr>
		   </thead>

		   <tbody>';

	        while($r = $d->fetch_assoc() ) {
	            $factura = $r["num_fac"];

	            $s = $db->query("SELECT sum(total) FROM ticket WHERE num_fac = '$factura' and edo = 2 and tx = 0 and td = ".$_SESSION["td"]."");
				    foreach ($s as $t) {
				        $max=$t["sum(total)"];
				    } $s->close();

	        echo '<tr>
				       <th scope="row">'. $r["fecha"]. '</th>
				       <td>'.$r["hora"]. '</td>
				       <td>'.$factura.'</td>
				       <td>'. $r["cajero"]. '</td>
				       <td>'. Helpers::Dinero($max). '</td>
				       <td><a id="xvermesa" mesa="'. $r["mesa"] . '" tx="'. $r["tx"] . '" op="78" tbl="ticket" class="btn-floating btn-sm"><i class="fas fa-eye red-text"></i></a></td>
				  </tr>';
	        }
	    echo '</tbody>
				</table>';

	    } 	   
	   $d->close();



	}









	public function LoMasVendido($inicio, $fin) {
		$db = new dbConn();

			$a = $db->query("select cod, sum(cant), sum(total), producto, pv 
          from ticket 
          where cod != 8888 and edo = 1 and time BETWEEN '$inicio' AND '$fin' and td = ".$_SESSION['td']." GROUP BY cod order by sum(cant) desc LIMIT 10");
					    
        echo '<hr class="border-success pt-4"></hr>';
		echo '<h1 class="text-success">PRODUCTOS MAS VENDIDOS</h1>
				    <table class="table table-striped table-sm">

						<thead>
					     <tr>
					       <th>Cantidad</th>
					       <th>Producto</th>
					       <th>Precio</th>
					       <th>Total</th>
					     </tr>
					   </thead>

						   <tbody>';

			    foreach ($a as $b) {

			    $ay = $db->query("SELECT nombre FROM producto where cod = ".$b["cod"]." and td = ".$_SESSION['td']."");
			    foreach ($ay as $by) {
			        $nombre_producto=$by["nombre"];
			    } $ay->close();

			    // if($nombre_producto == NULL){
			    // 	$nombre_producto = $nombre_producto;
			    // } else {
			    // 	$nombre_producto = $b["producto"];
			    // }

		if($b["cod"] == "8889"){
			$nombre_producto = "(Productos Especiales) ";		
		} 
			    
			   echo '<tr>
			       <th scope="row">'. $b["sum(cant)"] . '</th>
			       <td>'. $nombre_producto . '</td>
			       <td>'. Helpers::Dinero($b["pv"]) . '</td>
			       <td>'. Helpers::Dinero($b["sum(total)"]) . '</td>
			     </tr>';
			    } 

			    $a->close();

			    $ax = $db->query("select total, cant, producto, pv 
          from ticket 
          where cod = 8888 and edo = 1 and fecha = '$fecha' and td = ".$_SESSION['td']." ORDER BY id");
			    foreach ($ax as $bx) {

			    echo '<tr>
			       <th scope="row">'. $bx["cant"] . '</th>
			       <td>'. $bx["producto"] . ' (Otr)</td>
			       <td>'. Helpers::Dinero($bx["total"]) . '</td>
			     </tr>';
			    
			    } $ax->close();

			echo '</tbody>
				</table>
				<div class="font-weight-lighter text-right">El total no incluye Propina</div>';
			
	}



















} // fin de la clase

 ?>