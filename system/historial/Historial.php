<?php  

class Historial{

	public function __construct(){

	}

	public function HistorialDiario($fecha) {
		$db = new dbConn();

			$a = $db->query("select cod, sum(cant), sum(total), producto, pv 
          from ticket 
          where cod != 8888 and edo = 1 and fecha = '$fecha' and td = ".$_SESSION['td']." GROUP BY cod order by sum(cant) desc");
					    
					echo '<h1 class="h1-responsive">Productos vendidos :: '.$fecha.'</h1>
				    <table class="table table-striped">

						<thead>
					     <tr>
					       <th>Cant</th>
					       <th>Producto</th>
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
				</table>';
			

			$ar = $db->query("SELECT sum(cant) FROM ticket where edo = 1 and fecha = '$fecha' and td = ".$_SESSION['td']."");
		    foreach ($ar as $br) {
		     echo "Cantidad de Productos: ". $br["sum(cant)"] . "<br>";
		    } $ar->close();

		    $ag = $db->query("SELECT sum(total) FROM ticket where edo = 1 and fecha = '$fecha' and td = ".$_SESSION['td']."");
		    foreach ($ag as $bg) { $tot = $bg["sum(total)"];
		        echo "Total Vendido: ". Helpers::Dinero($bg["sum(total)"]) . "<br>";
		    } $ag->close();

		    $ap = $db->query("SELECT sum(total) FROM ticket_propina where fecha = '$fecha' and td = ".$_SESSION['td']."");
		    foreach ($ap as $bp) { $prop = $bp["sum(total)"];
		        echo "Total Propina: ". Helpers::Dinero($bp["sum(total)"]) . "<br>";
		    } $ap->close();
		     echo "Total Agrupado: ". Helpers::Dinero($prop + $tot) . "<br>";

		     Alerts::Mensajex("Es posible que la cantidad de productos con el total difiera con el precio de venta, ya que hay productos vendidos con precio especial","info");
	}



	public function HistorialMensual($fechax) {
		$db = new dbConn();

		$a = $db->query("select cod, sum(cant), sum(total), producto, pv, fecha 
					                  from ticket 
					                  where cod != 8888 and edo = 1 and fecha like '%$fechax' and td = ".$_SESSION['td']." GROUP BY cod order by sum(cant) desc");
					    
					echo '<h1 class="h1-responsive">Productos vendidos</h1>
				    <table class="table table-striped">

						<thead>
					     <tr>
					       <th>Cant</th>
					       <th>Producto</th>
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
			    // 
				if($b["cod"] == "8889"){
					$nombre_producto = "(Productos Especiales) ";		
				} 

			   echo '<tr>
			       <th scope="row">'. $b["sum(cant)"] . '</th>
			       <td>'. $nombre_producto . '</td>
			       <td>'. Helpers::Dinero($b["sum(total)"]) . '</td>
			     </tr>';
			    } $a->close();


			$ax = $db->query("select total, cant, producto, pv, fecha 
          from ticket 
          where cod = 8888 and edo = 1 and fecha like '%$fechax' and td = ".$_SESSION['td']." ORDER BY id");
			    foreach ($ax as $bx) {

			    echo '<tr>
			       <th scope="row">'. $bx["cant"] . '</th>
			       <td>'. $bx["producto"] . ' . (Otr)</td>
			       <td>'. Helpers::Dinero($bx["total"]) . '</td>
			     </tr>';
			    
			    } $ax->close();

			    echo '</tbody>
				</table>';

			$ar = $db->query("SELECT sum(cant) FROM ticket where edo = 1 and fecha like '%$fechax' and td = ".$_SESSION['td']."");
		    foreach ($ar as $br) {
		     echo "Cantidad de Productos: ". $br["sum(cant)"] . "<br>";
		    } $ar->close();

		    $ag = $db->query("SELECT sum(total) FROM ticket where edo = 1 and fecha like '%$fechax' and td = ".$_SESSION['td']."");
		    foreach ($ag as $bg) { $tot = $bg["sum(total)"];
		        echo "Total Vendido: ". Helpers::Dinero($bg["sum(total)"]) . "<br>";
		    } $ag->close();

		    $ap = $db->query("SELECT sum(total) FROM ticket_propina where fecha like '%$fechax' and td = ".$_SESSION['td']."");
		    foreach ($ap as $bp) { $prop = $bp["sum(total)"];
		        echo "Total Propina: ". Helpers::Dinero($bp["sum(total)"]) . "<br>";
		    } $ap->close();
		    echo "Total Agrupado: ". Helpers::Dinero($prop + $tot) . "<br>";

		     Alerts::Mensajex("Es posible que la cantidad de productos con el total difiera con el precio de venta, ya que hay productos vendidos con precio especial","info");

	}



	public function HistorialCortes($inicio, $fin) {
		$db = new dbConn();
		$primero = Fechas::Format($inicio);
		$segundo = Fechas::Format($fin);
					$pro=0;
				//busqueda de usuarios
				$a = $db->query("select * from corte_diario where fecha_format BETWEEN '$primero' AND '$segundo' and td = ".$_SESSION['td']." order by fecha_format, id asc");

					    
					echo '<h1 class="h1-responsive">Historial de Cortes</h1>
					<div class="table-responsive">
				    <table class="table table-striped">

						<thead>
					     <tr>
					       <th>Fecha</th>';
					if($_SESSION["td"] != 3){
					echo '<th>Mesas</th>					       
					       <th>Clientes</th>
					       <th>Propina</th>';
					}
					  echo '<th>Efectivo</th>
					        <th>Total</th>
					        <th>Gastos</th>
					        <th>Diferencia</th>
					     </tr>
					   </thead>

					   <tbody>';

			    $xmesas=0;
				$xclientes=0;
				$xpropina=0;
				$xefectivo=0;
				$xtotal=0;
				$xgastos=0; 
				$xdiferecia=0;

				    foreach ($a as $b) {
				
				if($b["edo"] == 1){
				$xmesas=$xmesas+$b["mesas"];
				$xclientes=$xclientes+$b["clientes"];
				$xpropina=$xpropina+$b["propina"];
				$xefectivo=$xefectivo+$b["efectivo"];
				$xtotal=$xtotal+$b["total"];
				$xgastos=$xgastos+$b["gastos"];
				$xdiferecia=$xdiferecia+$b["diferencia"];
				$colores='class="text-black"';
				} else {
				$colores='class="text-danger"';	
				} 
				  echo '<tr '.$colores.'>
				       <th scope="row">'. $b["fecha"] . '</th>';
					if($_SESSION["td"] != 3){
				echo '<td>'. $b["mesas"] . '</td>
				       <td>'. $b["clientes"] . '</td>
				       <td>'. Helpers::Dinero($b["propina"]) . '</td>';
				   }
				 echo '<td>'. Helpers::Dinero($b["efectivo"]) . '</td>
				       <td>'. Helpers::Dinero($b["total"]) . '</td>
				       <td>'. Helpers::Dinero($b["gastos"]) . '</td>
				       <td>'. Helpers::Dinero($b["diferencia"]) . '</td>
				     </tr>';
				unset($colores);
				    }
				   $a->close();
			echo '<tr class="light-blue lighten-4">
			       <th scope="row">Totales</th>';
					if($_SESSION["td"] != 3){
			echo '<td>'. $xmesas . '</td>
			       <td>'. $xclientes . '</td>
			       <td>'. Helpers::Dinero($xpropina) . '</td>';
				   }
			echo '<td>'. Helpers::Dinero($xefectivo) . '</td>
			       <td>'. Helpers::Dinero($xtotal) . '</td>
			       <td>'. Helpers::Dinero($xgastos) . '</td>
			       <td>'. Helpers::Dinero($xdiferecia) . '</td>
			     </tr>';

			echo '</tbody>
				</table> </div>';
			echo "Fechas afectadas desde el: ". $inicio ." hasta el ". $fin ." <br>";

	}




















	public function HistorialGDiario($fecha) {
		$db = new dbConn();

		$a = $db->query("SELECT * FROM gastos WHERE fecha = '$fecha' and td = ". $_SESSION["td"] ." order by id desc");
	        	$total=0;
	        	if($a->num_rows > 0){
	        echo ' <h3 class="h3-responsive">Detalle gastos del dia : '.$fecha.'</h3>

				<table class="table table-sm table-striped">
			  <thead>
			    <tr>
			      <th scope="col">Tipo</th>
			      <th scope="col">Gasto</th>
			      <th scope="col">Descripci&oacuten</th>
			      <th scope="col">Cantidad</th>
			      <th scope="col">Imagen</th>
			    </tr>
			  </thead>
			  <tbody>';
		    foreach ($a as $b) {

		    	if($b["edo"] == 1){
				$total = $total + $b["cantidad"];
				$colores='class="text-black"';
				} else {
				$colores='class="text-danger"';	
				}
		    	echo '<tr '.$colores.'>
			      <th scope="row">'. Helpers::Gasto($b["tipo"]) .'</th>
			      <td>'. $b["nombre"] .'</td>
			      <td>'. $b["descripcion"] .'</td>
			      <td>'. Helpers::Dinero($b["cantidad"]) .'</td>
			      <td>'; 

			    $aw = $db->query("SELECT imagen FROM gastos_images WHERE gasto = ". $b["id"] ." and td = ".$_SESSION["td"]."");
				if($aw->num_rows > 0){
				echo '<a id="xver" gasto="'. $b["id"] .'">
					<span class="badge green"><i class="fas fa-image" aria-hidden="true"></i></span>
					</a>';		
				} else {
				echo '<span class="badge red"><i class="fas fa-ban" aria-hidden="true"></i></span>';	
				}
				$aw->close();
  
			    echo '</td>
			    </tr>';
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

			$ag = $db->query("SELECT sum(cantidad) FROM gastos where tipo != 5 and edo = 1 and  fecha = '$fecha' and td = ".$_SESSION['td']."");
		    foreach ($ag as $bg) {
		        echo "Efectivo afectado: ". Helpers::Dinero($bg["sum(cantidad)"]) . "<br>";
		    } $ag->close();

		   $as = $db->query("SELECT sum(cantidad) FROM gastos where tipo = 5 and edo = 1 and  fecha = '$fecha' and td = ".$_SESSION['td']."");
		    foreach ($as as $bs) {
		        echo "Cheques emitidos: ". Helpers::Dinero($bs["sum(cantidad)"]) . "<br>";
		    } $as->close();


			} // num rows
			$a->close();

			

	}



	public function HistorialGMensual($fechax) {
		$db = new dbConn();

					$a = $db->query("SELECT * FROM gastos WHERE fecha like '%$fechax' and td = ". $_SESSION["td"] ." order by fechaF desc");
	        	$total=0;
	        	if($a->num_rows > 0){
	        echo ' <h3 class="h3-responsive">Detalle</h3>

				<table class="table table-sm table-striped">
			  <thead>
			    <tr>
			      <th scope="col">Tipo</th>
			      <th scope="col">Fecha</th>
			      <th scope="col">Gasto</th>
			      <th scope="col">Descripci&oacuten</th>
			      <th scope="col">Cantidad</th>
			      <th scope="col">Imagen</th>
			    </tr>
			  </thead>
			  <tbody>';
		    foreach ($a as $b) {
		    	
		    	if($b["edo"] == 1){
				$total = $total + $b["cantidad"];
				$colores='class="text-black"';
				} else {
				$colores='class="text-danger"';	
				}
		    	echo '<tr '.$colores.'>
			      <th scope="row">'. Helpers::Gasto($b["tipo"]) .'</th>
			      <td>'. $b["fecha"] .'</td>
			      <td>'. $b["nombre"] .'</td>
			      <td>'. $b["descripcion"] .'</td>
			      <td>'. Helpers::Dinero($b["cantidad"]) .'</td>
			      <td>'; 

			    $aw = $db->query("SELECT imagen FROM gastos_images WHERE gasto = ". $b["id"] ." and td = ".$_SESSION["td"]."");
				if($aw->num_rows > 0){
				echo '<a id="xver" gasto="'. $b["id"] .'">
					<span class="badge green"><i class="fas fa-image" aria-hidden="true"></i></span>
					</a>';		
				} else {
				echo '<span class="badge red"><i class="fas fa-ban" aria-hidden="true"></i></span>';	
				}
				$aw->close();
					  
			    echo '</td>
			    </tr>';
		    }
		    echo '<tr>
			      <th scope="col"></th>
			      <th scope="col"></th>
			      <th scope="col"></th>
			      <th scope="col">Total</th>
			      <td>'. Helpers::Dinero($total) .'</td>
			    </tr>
			    </tbody>
		    </table>';
			echo "El numero de registros es: ". $a->num_rows . "<br>";
			
			$ag = $db->query("SELECT sum(cantidad) FROM gastos where tipo != 5 and edo = 1 and  fecha like '%$fechax' and td = ".$_SESSION['td']."");
		    foreach ($ag as $bg) {
		        echo "Efectivo afectado: ". Helpers::Dinero($bg["sum(cantidad)"]) . "<br>";
		    } $ag->close();

		   $as = $db->query("SELECT sum(cantidad) FROM gastos where tipo = 5 and edo = 1 and  fecha like '%$fechax' and td = ".$_SESSION['td']."");
		    foreach ($as as $bs) {
		        echo "Cheques emitidos: ". Helpers::Dinero($bs["sum(cantidad)"]) . "<br>";
		    } $as->close();


			}
  			$a->close();


	}


	public function InOut($fecha){
		$db = new dbConn();

		$a = $db->query("SELECT * FROM login_inout WHERE fecha = '$fecha' order by id desc");
	        	$total=0;
	        	if($a->num_rows > 0){
	        echo ' <h3 class="h3-responsive">Entradas y Salidas</h3>

				<table class="table table-sm table-striped">
			  <thead>
			    <tr>
			      <th>Nombre</th>
			      <th>Accion</th>
			      <th>ip</th>
			      <th>Navegador</th>
			      <th>Fecha</th>
			      <th>Hora</th>
			      <th>Local</th>
			    </tr>
			  </thead>
			  <tbody>';
		    foreach ($a as $b) {

		    	if ($r = $db->select("cliente", "config_master", "WHERE td = ". $b["td"] ."")) { 
		        $cliente = $r["cliente"];
		    	}unset($r); 
		    	
		    	echo '<tr>
			      <th>'. $b["nombre"] .'</th>
			      <td>'.Helpers::InOut($b["accion"]).'</td>
			      <td>'. $b["ip"] .'</td>
			      <td>'. Helpers::ObtenerNavegador($b["navegador"]) .'</td>
			      <td>'. $b["fecha"] .'</td>
			      <td>'. $b["hora"] .'</td>
			      <td>'. $cliente .'</td>
			    </tr>';
		    }
		    echo '</tbody>
		    </table>';
			echo "El numero de registros es: ". $a->num_rows . "<br>";
			}
  			$a->close();

	}



	public function SyncStatus($url){
		$db = new dbConn();

				$archivos = glob($url . "*.sql");  
			      foreach($archivos as $data){  
			      	$data = str_replace($url, "", $data);
			      	$data = str_replace(".sql", "", $data);
			      	$data = substr($data, 0, 25);
				    $output .= '<li class="list-group-item">' . $data . '</li>';
			      }

			      echo '<div class="form-group row justify-content-center align-items-center">
		  			<div class="col-xs-2">
		  			<ul class="list-group">
		  			<li class="list-group-item list-group-item-action active">Hash pendientes de sincronizar</li>';

					  echo $output;
				  
				  echo '</ul></div>
						</div>';

			      


  			$a = $db->query("SELECT * FROM sync_up_cloud WHERE ejecutado = 1 order by id desc limit 10");
	        	$total=0;
	        	if($a->num_rows > 0){
	        echo '<br><h3>&Uacuteltimos sincronizados</h3>

				<table class="table table-sm table-striped">
			  <thead>
			    <tr>
			      <th>Hash</th>
			      <th>Final</th>
			      <th>Fecha</th>
			      <th>Hora</th>
			      <th>Local</th>
			    </tr>
			  </thead>
			  <tbody>';
		    foreach ($a as $b) {

		    	if ($r = $db->select("cliente", "config_master", "WHERE td = ". $b["td"] ."")) { 
		        $cliente = $r["cliente"];
		    	}unset($r); 

		    	$compro = substr($b["comprobacion"], 11, 12);
		    	echo '<tr>
			      <th>'. $compro .'</th>
			      <th>'. $b["final"] .'</th>
			      <td>'. $b["fecha"] .'</td>
			      <td>'. $b["hora"] .'</td>
			      <td>'. $cliente .'</td>
			    </tr>';
		    }
		    echo '</tbody>
		    </table>';
			} $a->close();



	}









/////////ticket eliminados
///

	public function HistorialTickets($inicio, $fin) {
		$db = new dbConn();
		$primero = Fechas::Format($inicio);
		$segundo = Fechas::Format($fin);
		
		//busqueda de usuarios

	    $d = $db->selectGroup("*", "ticket", "WHERE fechaF BETWEEN '$primero' AND '$segundo' and td = ".$_SESSION['td']." and tx = 0 and edo = 2 GROUP BY num_fac");
	    if ($d->num_rows > 0) {

        echo '<h2>TICKETS ELIMINADOS</h2>
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

	    } else {
	        Alerts::Mensajex("No se encotraron registros","danger");
	    } 
	   
	   $d->close();



	}









// termina la clase
 }


?>