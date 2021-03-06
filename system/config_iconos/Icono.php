<?php 
class Icono{
	
	public function __construct(){

	}

	public function AddProducto($nombre,$imagen,$popup,$precio,$opcion){
		$db = new dbConn();
		$cod=$this->GetCodigoProducto();
		// insertodatos en producto
			$datos = array();
		    $datos["cod"] = $cod;
		    $datos["nombre"] = $nombre;
		    $datos["categoria"] = $popup;
		    $datos["cantidad"] = 0;
		    $datos["gravado"] = "1";
		    $datos["fecha_registro"] = date('d-m-Y');
		    $datos["td"] = $_SESSION['td'];
		    $datos["hash"] = Helpers::HashId();
			$datos["time"] = Helpers::TimeId();

		    $db->insert("producto", $datos);

		//inserto datos en precios
		$datos = array();
		    $datos["cod"] = $cod;
		    $datos["nombre"] = $nombre;
		    $datos["cat"] = $popup;
		    $datos["precio"] = $precio;
		    $datos["td"] = $_SESSION['td'];
		    $datos["hash"] = Helpers::HashId();
			$datos["time"] = Helpers::TimeId();

		    $db->insert("precios", $datos);

		// inserto en la tabla de imagenes
		$datos = array();
		    $datos["img_name"] = $imagen;
		    $datos["img_order"] = $this->GetImagenNum();
		    $datos["popup"] =$popup;
		    $datos["cod"] = $cod;
		    $datos["edo"] = "1";
		    $datos["td"] = $_SESSION['td'];
		    $datos["hash"] = Helpers::HashId();
			$datos["time"] = Helpers::TimeId();

		    $db->insert("images", $datos);

		// si el producto viene con opciones las insertamos
		if($_REQUEST["opcion"] != 0){
		$datos = array();
		    $datos["producto"] = $cod;
		    $datos["opcion"] = $opcion;
		    $datos["td"] = $_SESSION['td'];
		    $datos["hash"] = Helpers::HashId();
			$datos["time"] = Helpers::TimeId();

		    $db->insert("opciones_asig", $datos);
		}

		if($_SESSION["opcionesx"] != NULL){ unset($_SESSION["opcionesx"]); } // borra la variable que creo en iconosselect
	}
	


	public function AddCategoria($nombre,$imagen){
    	$db = new dbConn();
    	$cat=$this->GetCategoria();
    	$datos = array();
	    $datos["cod"] = $cat;
	    $datos["categoria"] = $nombre;
	    $datos["td"] = $_SESSION['td'];
	    $datos["hash"] = Helpers::HashId();
		$datos["time"] = Helpers::TimeId();

	    $db->insert("categorias", $datos);

	// inserto en la tabla de imagenes
	$datos = array();
	    $datos["img_name"] = $imagen;
	    $datos["img_order"] =  $this->GetImagenNum();
	    $datos["popup"] = 0;
	    $datos["cod"] = $cat;
	    $datos["edo"] = "1";
	    $datos["td"] = $_SESSION['td'];
	    $datos["hash"] = Helpers::HashId();
		$datos["time"] = Helpers::TimeId();

	    $db->insert("images", $datos);


	if($_SESSION["opcionesx"] != NULL){ unset($_SESSION["opcionesx"]); } // borra la variable que creo en iconosselect
   }


	public function ModProducto($cod,$nombre,$popup,$imagen){
    	$db = new dbConn();

		$cambio = array();
		    $cambio["nombre"] = $nombre;
		    $cambio["categoria"] = $popup;
		    
		    Helpers::UpdateId("producto", $cambio, "cod='$cod' and td = ".$_SESSION["td"]."");

		$cambio = array();
		    $cambio["nombre"] = $nombre;
		    $cambio["cat"] = $_REQUEST["popup"];
		    
		    Helpers::UpdateId("precios", $cambio, "cod='$cod' and td = ".$_SESSION["td"]."");

		$cambio = array();
		    $cambio["img_name"] = $imagen;
		    $cambio["popup"] = $popup;
		    
		    Helpers::UpdateId("images", $cambio, "cod='$cod' and td = ".$_SESSION["td"]."");

		$db->close();

		if($_SESSION["opcionesx"] != NULL){ unset($_SESSION["opcionesx"]); } // borra la variable que creo en iconosselect

    	}   



	public function ModCategoria($cod,$nombre,$imagen){
    	$db = new dbConn();

		$cambio = array();
		    $cambio["categoria"] = $nombre;
		    
		    Helpers::UpdateId("categorias", $cambio, "cod='$cod' and td = ".$_SESSION["td"]."");

		$cambio = array();
		    $cambio["img_name"] = $imagen;
		    
		    Helpers::UpdateId("images", $cambio, "cod='$cod' and td = ".$_SESSION["td"]."");

		$db->close();

		if($_SESSION["opcionesx"] != NULL){ unset($_SESSION["opcionesx"]); } // borra la variable que creo en iconosselect

    	}




	public function DelProducto($cod){
    	$db = new dbConn();

		Helpers::DeleteId("producto", "cod='$cod' and td = ".$_SESSION["td"]."");
		Helpers::DeleteId("precios", "cod='$cod' and td = ".$_SESSION["td"]."");
		Helpers::DeleteId("images", "cod='$cod' and td = ".$_SESSION["td"]."");
		// para despues que este comida empleado
		// Helpers::DeleteId("comida_empleado_ico", "WHERE cod='".$_REQUEST["cod"]."'")
    	}


	public function DelCategoria($cod){
    	$db = new dbConn();
			Helpers::DeleteId("categorias", "cod='".$cod."' and td = ".$_SESSION["td"]."");
			Helpers::DeleteId("images", "cod='".$cod."' and td = ".$_SESSION["td"]."");

			$cambio = array();
			    $cambio["popup"] = "0";
			    Helpers::UpdateId("images", $cambio, "popup='".$cod."' and td = ".$_SESSION["td"]."");
    	}



   public function GetCategoria(){
   	$db = new dbConn();
   	// para obtener el ultimo codigo
	$ac = $db->query("SELECT max(cod) FROM categorias WHERE td = ".$_SESSION["td"]."");
	    foreach ($ac as $bc) {
	      $ultimocod=$bc["max(cod)"]+1;
	      if($ultimocod == 1) return 9901;
	      else return $bc["max(cod)"]+1;
	    }
	    $ac->close();
	   }

	public function GetImagenNum(){
   	$db = new dbConn();
   	// para obtener el ultimo codigo
		$a = $db->query("SELECT max(img_order) FROM images WHERE td = ".$_SESSION["td"]."");
	    foreach ($a as $b) {
	        return $b["max(img_order)"]+1;
	    }
	    $a->close();
	   
	   }


	public function GetCodigoProducto(){
   	$db = new dbConn();
   	// para obtener el ultimo codigo
		$ac = $db->query("SELECT max(cod) FROM producto WHERE td = ".$_SESSION["td"]."");
    	foreach ($ac as $bc) {
      $ultimocod=$bc["max(cod)"]+1;
      if($ultimocod == 1) return 1001;
      else return $bc["max(cod)"]+1;
    	}  $ac->close();
	   
	}

	public function GetUltimaOpcion(){
   	$db = new dbConn();
   	// para obtener numero de opcion
		$ac = $db->query("SELECT max(cod) FROM opciones WHERE td = ".$_SESSION["td"]."");
    	foreach ($ac as $bc) {
	      $ultimocod=$bc["max(cod)"]+1;
	      if($ultimocod == 1) return 1;
	      else return $bc["max(cod)"]+1;
    	}  $ac->close();
	   
	}

	
	public function GetUltimaOpcionName(){
   	$db = new dbConn();
   	// para obtener numero de opcion
		$ac = $db->query("SELECT max(cod) FROM opciones_name WHERE td = ".$_SESSION["td"]."");
	    foreach ($ac as $bc) {
	    	$opultima=$bc["max(cod)"]+1;
	    	if($opultima == 1) return 101;
	    	else return $bc["max(cod)"]+1;
	    }   $ac->close();
	   
	}


	public function AddOpcion($nombre){
   	$db = new dbConn();
	   	$datos = array();
	    $datos["nombre"] = $nombre;
	    $datos["cod"] = $this->GetUltimaOpcion();
	    $datos["td"] = $_SESSION['td'];
	    $datos["hash"] = Helpers::HashId();
		$datos["time"] = Helpers::TimeId();
	    $db->insert("opciones", $datos);

	    $this->VerOpciones();
	}


	public function AddOpcionName($cod,$nombre,$imagen){
   	$db = new dbConn();
   	$codi=$this->GetUltimaOpcionName();
	   	$datos = array();
	    $datos["nombre"] = $nombre;
	    $datos["cod"] =	$codi;
	    $datos["opcion"] = $cod;
	    $datos["td"] = $_SESSION['td'];
	    $datos["hash"] = Helpers::HashId();
		$datos["time"] = Helpers::TimeId();
	    $db->insert("opciones_name", $datos);

	    // inserto en la tabla de imagenes
		$datos = array();
		    $datos["img_name"] = $imagen;
		    $datos["img_order"] = $this->GetImagenNum();
		    $datos["popup"] = $cod;
		    $datos["cod"] =	$codi;
		    $datos["edo"] = "1";
		    $datos["td"] = $_SESSION['td'];
		    $datos["hash"] = Helpers::HashId();
			$datos["time"] = Helpers::TimeId();
		    $db->insert("images", $datos);

		$this->VerOpcionesName($cod);

		if($_SESSION["opcionesx"] != NULL){ unset($_SESSION["opcionesx"]); } // borra la variable que creo en iconosselect
	}




	public function VerOpciones(){
   	$db = new dbConn();
	   	$a = $db->query("SELECT * FROM opciones WHERE td = ".$_SESSION["td"]."");
          echo '<div class="table-responsive-sm">
            <table class="table table-sm table-hover">
              <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Nombre</th>
            <th scope="col">Mod</th>
            <th scope="col">Eli</th>
          </tr>
        </thead>
        <tbody>'; $n=0;
    foreach ($a as $b) {
    			$n=$n+1;
      echo '<tr>
      <th scope="row">'.$n.'</th>
      <td>'.$b["nombre"].'</td>
      <td><a href="?modal=addopciones&cod='.$b["cod"].'"><i class="fas fa-edit fa-lg green-text"></i></a></td>
      <td><a id="delopciones" op="12" cod="'.$b["cod"].'"><i class="fas fa-trash-alt fa-lg red-text"></i></a></td>
      </tr>';
    }
    echo '</tbody>
            </table>
          </div>';

    echo "El numero de registros es: ". $a->num_rows . "<br>";
    $a->close();

	}



	public function VerOpcionesName($cod){
   	$db = new dbConn();
	   	$a = $db->query("SELECT * FROM opciones_name where opcion='$cod' and td = ".$_SESSION["td"]."");
          echo '<div class="table-responsive-sm">
            <table class="table table-sm">
              <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Nombre</th>
            <th scope="col">Eli</th>
          </tr>
        </thead>
        <tbody>'; $n=0;
    foreach ($a as $b) {
    			$n=$n+1;
      echo '<tr>
      <th scope="row">'.$n.'</th>
      <td>'.$b["nombre"].'</td>
      <td><a id="delopciones" op="13" cod="'.$b["cod"].'" opciones="'.$cod.'" ><i class="fas fa-trash-alt fa-lg red-text"></i></a></td>
      </tr>';
    }
    echo '</tbody>
            </table>
          </div>';

    $a->close();

	}



	public function DelOpciones($cod){
    	$db = new dbConn();
			Helpers::DeleteId("opciones", "cod='$cod' and td = ".$_SESSION["td"]."");
			// elimino las imagenes antes de borrar el registro
		    $a = $db->query("SELECT cod FROM opciones_name WHERE opcion='$cod' and td = ".$_SESSION["td"]."");
		    foreach ($a as $b) {
		    	Helpers::DeleteId("images", "cod='".$b["cod"]."' and td = ".$_SESSION["td"]."");
		    }$a->close();

			Helpers::DeleteId("opciones_name", "opcion='$cod' and td = ".$_SESSION["td"]."");
			Helpers::DeleteId("opciones_asig", "opcion='$cod' and td = ".$_SESSION["td"]."");
			$db->close();
			$this->VerOpciones();

    	}


	public function DelOpcionesName($cod, $opcion){
    	$db = new dbConn();
			// elimino las imagenes antes de borrar el registro
		    Helpers::DeleteId("images", "cod='$cod' and td = ".$_SESSION["td"]."");
			Helpers::DeleteId("opciones_name", "cod='$cod' and td = ".$_SESSION["td"]."");
			Helpers::DeleteId("opciones_asig", "opcion='$cod' and td = ".$_SESSION["td"]."");
			$db->close();
			$this->VerOpcionesName($opcion);
    	}



///////////////////////////////////// reordenar ////////////
///
	public function GetReordenar($popup){
    	$db = new dbConn();

    	$a = $db->query("SELECT * FROM images WHERE popup = '$popup' and td = ".$_SESSION["td"]." ORDER BY img_order ASC");
	    foreach ($a as $b) {
	    
		if ($r = $db->select("nombre", "producto", "WHERE cod = ".$b["cod"]." and td = ".$_SESSION["td"]."")) { $producto = $r["nombre"];  } unset($r);
	        
	        if($producto == NULL) $producto = "Categoria";
	        echo '<li id="image_li_'.$b["id"].'"><a href="javascript:void(0);" style="float:none;"><em>'.$producto.'</em><img src="'.$b["img_name"].'" alt="image" class="img-fluid img-responsive wow fadeIn" /></a></li>';
	    
	    } $a->close();
			
    }

	public function UpdateReordenar($id_array){
    	$db = new dbConn();

    	$count = 1;
		foreach ($id_array as $id){
			
			$cambio = array();
		    $cambio["img_order"] = $count;
		    
		    Helpers::UpdateId("images", $cambio, "id='$id' and td = ".$_SESSION["td"]."");

			$count ++;	
		} $a->close();
		return TRUE;

	} 
			

   	
   	public function MostrarIconos($categoria, $opciones){
   		$db = new dbConn();
    	
    	if($categoria != NULL){
    		$a = $db->query("SELECT * FROM login_imagenes WHERE categoria = $categoria");
    	} else {
    		$a = $db->query("SELECT * FROM login_imagenes");
    	}	    
	    foreach ($a as $b) {
	        echo '<li><a ' . $opciones .' imagen="assets/img/ico/' . $b["imagen"] .'"><em>Seleccionar</em><img src="assets/img/ico/' . $b["imagen"] .'" alt="image" class="img-fluid img-responsive wow fadeIn" /></a></li>';
	    } $a->close();
   	}



   	public function IconosOpcionesVenta($data){

		if($_SESSION["config_tipo_menu"] == 2){
			$this->IconosOpcionesVentaResponsivo($data);
		} else {
			$this->IconosOpcionesVentaDefault($data);
		}

   	}

   	public function IconosOpcionesVentaDefault($data){
   		$db = new dbConn();

    if ($r = $db->select("opcion", "opciones_ticket", "WHERE identificador = '".$data["identificador"]."' and td = ".$_SESSION["td"]." and edo = 1 limit 1")) { 
        $option = $r["opcion"];
    } unset($r);  

if($option != NULL){
	echo '<div class="row text-center portfolio"> 
	   <ul class="gallery">';

    $a = $db->query("SELECT * FROM opciones_name WHERE opcion = '".$option."' and td = ".$_SESSION["td"]."");
    foreach ($a as $b) {

	if ($r = $db->select("img_name", "images", "WHERE cod = ".$b["cod"]." and td = ".$_SESSION["td"]."")) {
	   $imagen = $r["img_name"];
	} unset($r);

	      
	  echo '<li><a id="addopcion" op="19x" codigo="'.$data["codigo"].'" identificador="'.$data["identificador"].'" opcion="'.$b["cod"] .'" producto="'.$data["producto"].'"><em>'.$b["nombre"].'</em><img src="'.$imagen.'" alt="image" class="img-fluid img-responsive wow fadeIn" /></a></li>';
	} $a->close();

	echo '</ul> 
	 </div>';
	}
}



   	public function IconosOpcionesVentaResponsivo($data){
   		$db = new dbConn();

    if ($r = $db->select("opcion", "opciones_ticket", "WHERE identificador = '".$data["identificador"]."' and td = ".$_SESSION["td"]." and edo = 1 limit 1")) { 
        $option = $r["opcion"];
    } unset($r);  

if($option != NULL){
	echo '<div class="container-fluid">';
$row = 0;
$col = 0;
$count = 0;

    $a = $db->query("SELECT * FROM opciones_name WHERE opcion = '".$option."' and td = ".$_SESSION["td"]."");
    $rec = $a->num_rows;
    foreach ($a as $b) {

	if ($r = $db->select("img_name", "images", "WHERE cod = ".$b["cod"]." and td = ".$_SESSION["td"]."")) {
	   $imagen = $r["img_name"];
	} unset($r); 

$row++;
$col++;
$count++;
/// condicionales para row and col
if($row == 1){
	echo '<div class="row">';
}


echo '<div class="col-3 col-md-3">
        <div class="newmenu text-center">
            <a id="addopcion" op="19x" codigo="'.$data["codigo"].'" identificador="'.$data["identificador"].'" opcion="'.$b["cod"] .'" producto="'.$data["producto"].'">
            <img src="'.$imagen.'" class="img-fluid wow fadeIn">
            <div class="menu-titleO text-truncate">'.ucwords(strtolower($b["nombre"])).'</div> 
            </a>
        </div>
    </div>';	  

// condicionales para row and col
if($row == 8 or $rec == $count){
	echo "</div>";
   $row = 0;
}

	} $a->close();

	echo '</div>';
	}

}















   	public function ContarIconos(){
   		$db = new dbConn();

		$a = $db->query("SELECT * FROM login_imagenes");
		return $a->num_rows;
		$a->close();
	}











} /// termina clase
?>