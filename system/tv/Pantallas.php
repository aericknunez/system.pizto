<?php 
class Pantallas{

	public function __construct(){

	}

	public function Comprueba(){
	    $db = new dbConn();

		$a = $db->query("SELECT tkn FROM login_userdata WHERE tkn = '1' and tipo = ".$_SESSION["tipo_cuenta"]." and td = ".$_SESSION["td"]."");
		if($a->num_rows != 0){
		 echo "true";  
		} 
		$a->close();
	}


	public function Cambia($edo){
	    $db = new dbConn();

		$cambio = array();
	    $cambio["tkn"] = $edo;   
	    $db->update("login_userdata", $cambio, "WHERE tkn != '$edo' and td = ".$_SESSION["td"]."");

	}




	public function Panel(){
		$db = new dbConn();

		if($_SESSION["panel_mostrar"] == NULL){ 
		$panel_mostrar = "";} else{ 
		$panel_mostrar = "panel = '" . $_SESSION["panel_mostrar"] . "' and";}

	echo '<div class="row">';

	////////////////////////////////
	///
	$a = $db->query("SELECT * FROM control_cocina WHERE ".$panel_mostrar." opciones = 1 and edo = 1 and td = ".$_SESSION["td"]." ORDER BY mesa, id LIMIT 15");
    foreach ($a as $b) {

    	echo '<!-- Card -->
		<div class="col-sm-3">
		<a id="pasar-producto" op="98" iden="'.$b["id"].'" cod="'.$b["cod"].'" identificador="'.$b["identificador"].'">';

		echo '<div class="card '. Helpers::Color($b["mesa"]).' mb-2">
		  <div class="card-body">';


		if ($r = $db->select("cajero, producto", "ticket_temp", "WHERE hash = '".$b["identificador"]."'")) { 
        $nombre_mesero = $r["cajero"];
        $producto = $r["producto"];
    	} unset($r); 

		echo '<h4>'.$producto.'</h4>';

		// busco las opciones del producto
		$x = $db->query("SELECT opcion FROM opciones_ticket WHERE identificador = '".$b["identificador"]."' and cod = '".$b["cod"]."' and td = ".$_SESSION['td']."");
	    foreach ($x as $y) {
	    	
	    	if ($s = $db->select("nombre", "opciones_name", "WHERE cod = ".$y["opcion"]." and td = ".$_SESSION['td']."")) { 
		        echo '<h6 class="card-title warning-color">'. $s["nombre"].'</h6>';
		    } unset($s);

	    } $x->close();
	    //

$nmesa = $this->NombreMesa($b["mesa"], $b["tx"]);
if($nmesa == NULL){ $mesax = $b["mesa"]; } else { $mesax = $nmesa; }

		echo '<p class="card-text">Orden de: '. $nombre_mesero .'</p>
		     <p class="card-text blue-text">Mesa: '.$mesax.' || Cliente: '.$b["cliente"].' <br> Hora: '.$b["hora"].'</p>
			  </div>
			</div>
			</a>
			 </div> 
			 <!-- Card -->';

        
    } $a->close();
	///////////////////////////////

	$d = $db->selectGroup("*", "control_cocina", "WHERE ".$panel_mostrar." opciones = 0 and edo = 1 and td = ".$_SESSION["td"]." GROUP BY producto, mesa ORDER BY mesa desc LIMIT 15");
    if ($d->num_rows > 0) {
        while($b = $d->fetch_assoc() ) {

        echo '<!-- Card -->
        <div class="col-sm-3">
        <a id="pasar-producto" op="98" iden="'.$b["id"].'" cod="'.$b["cod"].'" identificador="'.$b["identificador"].'">';

		echo '<div class="card '. Helpers::Color($b["mesa"]).' mb-2">
		  <div class="card-body">';

		if ($r = $db->select("cajero, producto", "ticket_temp", "WHERE hash = '".$b["identificador"]."'")) { 
        $nombre_mesero = $r["cajero"];
        $producto = $r["producto"];
    	} unset($r); 

		echo '<h4>'.$producto.'</h4>';

				// no tiene opciones el producto
	    
		//echo '<h6 class="card-title warning-color">Opciones</h6>';
		// para tener la cantidad
		$a = $db->query("SELECT * FROM control_cocina WHERE mesa = ".$b["mesa"]." and producto = ".$b["producto"]." and opciones = 0 and edo = 1 and td = ".$_SESSION["td"]."");
		$pendientes = $a->num_rows;
		$a->close();

		echo '<h6><span class="badge badge-pill badge-primary"> '.$pendientes.' </span> Pendientes</h6>';

$nmesa = $this->NombreMesa($b["mesa"], $b["tx"]);
if($nmesa == NULL){ $mesax = $b["mesa"]; } else { $mesax = $nmesa; }

		echo '<p class="card-text">Orden de: '.$nombre_mesero.'</p>
		     <p class="card-text blue-text">Mesa: '.$mesax.' || Cliente: '.$b["cliente"].' <br> Hora: '.$b["hora"].'</p>
			  </div>
			</div>
			</a>
			 </div> 
			 <!-- Card -->';
            
        }
    } $d->close();

	echo '</div>';





	/// lo hago para cada pantalla
	if ($r = $db->select("pantallas", "config_root", "WHERE td = ".$_SESSION["td"]."")) { 
	        $pantallas = Encrypt::Decrypt($r["pantallas"],$_SESSION['secret_key']);
	    } unset($r);

	for ($i = 1; $i <= $pantallas; $i++) {  
	echo '<a id="cambiar-panel" op="99" iden="'.$i.'" class="btn-floating btn-sm"><i class="fas fa-beer red-text"> '.$i.' </i></a>';
	} // for
	echo '<a id="cambiar-panel" op="99" iden="" class="btn-floating btn-sm"><i class="fas fa-globe red-text"> All </i></a>';
	if($_SESSION["panel_mostrar"] != NULL){
		echo 'Mostrando productos de la pantalla ' . $_SESSION["panel_mostrar"]; } else {
		echo 'Se estan mostrando todos los productos';
		}
	// pantallas
	
		$this->Sonar();


	}




public function NombreMesa($mesa, $tx){
	    $db = new dbConn();

    if ($r = $db->select("nombre", "mesa_nombre", "WHERE mesa = '$mesa' and tx = '$tx' and td = ".$_SESSION["td"]."")) { 
        return $r["nombre"];
    }  unset($r);  
}



		public function Sonar(){
			echo '<audio id="audioplayer" autoplay=true>
					  <source src="assets/sound/Bing_1.mp3" type="audio/mpeg">
					  <source src="assets/sound/Bing_1.ogg" type="audio/ogg">
					</audio>';
		}






		public function MostarLateral() {
		$db = new dbConn();

		    $a = $db->query("SELECT * FROM control_cocina WHERE edo != 1 and td = ".$_SESSION['td']." order by time desc limit 15");

		    if($a->num_rows == 0){
		    echo '<div align="center"><img src="assets/img/logo/'. $_SESSION['config_imagen'] .'" alt="" class="img-fluid hoverable"></div>';
		    } else { 	
		    	echo '<table class="table table-striped table-sm">
					  <thead>
					    <tr>
					      <th>Producto</th>
					      <th>Mesa</th>
					      <th>Cliente</th>
					      <th>Hora</th>
					    </tr>
					  </thead>
					  <tbody>';

		    foreach ($a as $b) {
    	if ($r = $db->select("nombre", "producto", "WHERE cod = ". $b["producto"] ." and td = ".$_SESSION['td']."")) { 
	        $producto = $r["nombre"];
	    } unset($r);

//
if ($r = $db->select("mesa, tx", "ticket_temp", "WHERE hash = '".$b["identificador"]."' and td=".$_SESSION["td"]."")) { 
$mesai=$r["mesa"]; $txi=$r["tx"];
} unset($r); 

$nmesa = $this->NombreMesa($mesai, $txi);
if($nmesa == NULL){ $mesax = $b["mesa"]; } else { $mesax = $nmesa; }

			   if($b["edo"] == 3) $color = 'class="text-danger animated flash fast  delay-5s"';
		        echo '<tr '.$color.'>
				      <td>'. $producto .'</td>
				      <td>'. $mesax .'</td>
				      <td>'. $b["cliente"] .'</td>
				      <td>'. $b["hora"] .'</td>
				    </tr>';
				unset($color);
		    }
		    echo '</tbody>
					</table>';

		    echo "El numero de registros es: ". $a->num_rows . "<br>";
		    $a->close();
		}

	}






	public function AgregarControl($identificador,$mesa,$cliente,$opciones,$panel, $cantidadx = NULL) {
		$db = new dbConn();

		if($identificador == NULL){
	$a = $db->query("SELECT hash FROM ticket_temp WHERE td = ". $_SESSION["td"] ." ORDER BY id desc LIMIT 1");
    	foreach ($a as $b) {
        $identificador = $b["hash"];
    	} $a->close(); 

    }

if ($r = $db->select("cant, cod", "ticket_temp", "WHERE hash = '".$identificador."' and mesa='$mesa' and cliente='$cliente' and td=".$_SESSION["td"]."")) { 
    $cod=$r["cant"]; $producto=$r["cod"];
} unset($r); 




if($cantidadx != NULL){ // sino es vacia entoces hafo un bucle para meter los del modal cantidad

$ax= $db->query("SELECT cant FROM ticket_temp WHERE hash = '".$identificador."' and mesa='$mesa' and cliente='$cliente' and td=".$_SESSION["td"]."");
foreach ($ax as $bx) {
    $cantidad_productos=$bx["cant"];
} $ax->close();


$ar = $db->query("SELECT * FROM control_cocina WHERE identificador = '".$identificador."' and mesa='$mesa' and cliente='$cliente' and td=".$_SESSION["td"]."");
$cantidad_control = $ar->num_rows;
$ar->close();

$ncheck = $cantidad_productos - $cantidad_control;

// si el ncheck es mayor a 0 agregar mas. sino borrar

if($ncheck > 0){ // (9) resultado

$inicio = $cantidad_control + 1;
$fin =  $cantidad_productos;
		for ($i=$inicio; $i <= $fin ; $i++) { 

			$datos = array();
		    $datos["cod"] = $i;
		    $datos["identificador"] = $identificador;
		    $datos["producto"] = $producto;
		    $datos["mesa"] = $mesa;
		    $datos["cliente"] = $cliente;
		    $datos["opciones"] = $opciones;
		    $datos["panel"] = $panel;
		    $datos["fecha"] = date("d-m-Y");
		    $datos["hora"] = date("H:i:s");
		    $datos["edo"] = 1;
		    $datos["td"] = $_SESSION["td"];
		    $datos["hash"] = Helpers::HashId();
			$datos["time"] = Helpers::TimeId();
		    $db->insert("control_cocina", $datos);

		}

	} else { 


	$ar = $db->query("SELECT * FROM control_cocina WHERE identificador = '".$identificador."' and mesa='$mesa' and cliente='$cliente' and td=".$_SESSION["td"]." and edo = 2");
	$can_imp = $ar->num_rows;
	$ar->close();

	$ar = $db->query("SELECT * FROM control_cocina WHERE identificador = '".$identificador."' and mesa='$mesa' and cliente='$cliente' and td=".$_SESSION["td"]." and edo = 1");
	$can_no_imp = $ar->num_rows;
	$ar->close();


	$inicio = $cantidad_control - $cantidad_productos;


		if($can_no_imp >= $can_imp){
			Helpers::DeleteId("control_cocina", "identificador = '".$identificador."' and mesa='$mesa' and cliente='$cliente' and td=".$_SESSION["td"]." and edo = 1 limit $inicio");
		} else {

		$del_check = $can_imp - $cantidad_productos;

		$cambio = array();
		$cambio["edo"] = 3;    
		Helpers::UpdateId("control_cocina", $cambio, "identificador = '$identificador' and edo != 3 and td = ".$_SESSION["td"]." limit $del_check");

		}


	}


} else {

		$datos = array();
	    $datos["cod"] = $cod;
	    $datos["identificador"] = $identificador;
	    $datos["producto"] = $producto;
	    $datos["mesa"] = $mesa;
	    $datos["cliente"] = $cliente;
	    $datos["opciones"] = $opciones;
	    $datos["panel"] = $panel;
	    $datos["fecha"] = date("d-m-Y");
	    $datos["hora"] = date("H:i:s");
	    $datos["edo"] = 1;
	    $datos["td"] = $_SESSION["td"];
	    $datos["hash"] = Helpers::HashId();
		$datos["time"] = Helpers::TimeId();
	    $db->insert("control_cocina", $datos);

}





	}


	public function EliminaControl($mesa) {
		$db = new dbConn();

			$cambio = array();
		    $cambio["edo"] = 3;	    
		    Helpers::UpdateId("control_cocina", $cambio, "mesa = '$mesa' and td = ".$_SESSION["td"]."");
	}

	public function EliminaProducto($iden) {
		$db = new dbConn();

			$cambio = array();
		    $cambio["edo"] = 3;  
		    Helpers::UpdateId("control_cocina", $cambio, "identificador = '$iden' and edo != 3 and td = ".$_SESSION["td"]." limit 1");
	}

	public function PasarProducto($iden,$cod,$identificador) {
		$db = new dbConn();

			$cambio = array();
			$cambio["hora_salida"] = date("H:i:s");
		    $cambio["edo"] = 2;
		    
			Helpers::UpdateId("control_cocina", $cambio, "id = '$iden' and cod = '$cod' and identificador = '$identificador' and td = ".$_SESSION["td"]."");
	}

	public function CambiarPanel($option) {
		if($option == NULL){
			unset($_SESSION["panel_mostrar"]);
		} else {
			$_SESSION["panel_mostrar"] = $option; 
		}
	
	}




} // class
 ?>