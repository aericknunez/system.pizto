<?php 
class Admin{

	public function __construct() { 
     } 



	public function VerHashes(){
		$db = new dbConn();

	 $a = $db->query("SELECT * FROM login_db_sync order by id desc");

	if($a->num_rows > 0){
	 echo '<table class="table table-sm table-striped">
			  <thead>
			    <tr>
			    <th scope="col">Hash</th>
			      <th scope="col">Fecha</th>
			      <th scope="col">Hora</th>
			      <th scope="col">Estado</th>
			      <th scope="col">Eliminar</th>
			    </tr>
			  </thead>
			  <tbody>';
	    foreach ($a as $b) {  
		    echo '<tr>
		    	  <th scope="col">'.$b["hash"].'</th>
			      <th scope="col">'.$b["fecha"].'</th>
			      <th scope="col">'.$b["hora"].'</th>			      
			      <th scope="col">'.$b["edo"].'</th>
			      <th scope="col"><a id="ejecuta-db-sync" op="202" td="" hash="'.$b["hash"].'">
				      <span class="badge red"><i class="fas fa-trash-alt" aria-hidden="true"></i></span></a></th>
			    </tr>';
			    $this->VerClientesHashes($b["hash"]);
	    } 
	    echo '</tbody>
		    </table>';
		} else {
			echo '<h1 class="h1-responsive text-danger text-center">No se encuentran archivos que sincronizar</h1>';
		}
		$a->close();
	}


	public function VerClientesHashes($hash){
		$db = new dbConn();

	 $ac = $db->query("SELECT * FROM config_master order by id desc");

	if($ac->num_rows > 0){

	    foreach ($ac as $bc) {  

	    	$ax = $db->query("SELECT * FROM login_db_user WHERE hash = '$hash' and td = " . $bc["td"]);
	    	if($ax->num_rows > 0){	    		
	    		
	    		$as = $db->query("SELECT * FROM login_sync WHERE hash = '$hash' and td = ".$bc["td"]."");
	    		if($as->num_rows > 0){
	    			$edo = "Ejecutado";
	    			$ico = "fa-ban";
	    			$color = "red";
	    			$dir = ''; //nada
	    		} else{
	    			$edo = "Activo";
	    			$ico = "fa-radiation-alt";
	    			$color = "blue";
	    			$dir = 'id="ejecuta-db-sync" op="201" td="'.$bc["td"].'" hash="'.$hash.'"'; // desactivarlo
	    		}
	    		
	    	} else {
	    		$edo = "Inactivo";
	    		$color = "green";
	    		$ico = "fa-asterisk";
	    		$dir = 'id="ejecuta-db-sync" op="200" td="'.$bc["td"].'" hash="'.$hash.'"'; // activarlo	    		
	    	}

		    echo '<tr>
			      <th scope="col" colspan="3">'.$bc["cliente"].'</th>
			      <th scope="col">'.$edo.'</th>
			      <th scope="col"><a '.$dir.'>
				      <span class="badge '.$color.'"><i class="fas '.$ico.'" aria-hidden="true"></i></span></a></th>
			    </tr>';

			  } 
		}
		$ac->close();
	}


	public function VerSyncLocal($fecha,$td){
		$db = new dbConn();

 $a = $db->query("SELECT * FROM sync_up_cloud WHERE fecha = '$fecha' and td = '$td' order by id desc");

	if($a->num_rows > 0){
	 echo '<table class="table table-sm table-striped">
			  <thead>
			    <tr>
			    <th scope="col">Hash</th>
			    <th scope="col">Tipo</th>
			     <th scope="col">Fecha</th>
			     <th scope="col">Hora</th>
			    </tr>
			  </thead>
			  <tbody>';
	    foreach ($a as $b) {  
		    echo '<tr>
		    		<th scope="col">'.$b["comprobacion"].'</th>
		    	  <th scope="col">'.$b["final"].'</th>
			      <th scope="col">'.$b["fecha"].'</th>
			      <th scope="col">'.$b["hora"].'</th>
			      </tr>';
	    } 
	    echo '</tbody>
		    </table>';
		} 
		$a->close();
	}




	public function EdoCortes($fecha){
		$db = new dbConn();


	 $ac = $db->query("SELECT * FROM config_master WHERE td != 0  order by td asc");

	if($ac->num_rows > 0){
		echo "<h3>". Fechas::NombreDia($fecha) . ", " . Fechas::FechaEscrita($fecha) ."</h3>";
		echo '<table class="table table-sm table-striped">
			  <thead>
			    <tr>
			    <th scope="col">TD</th>
			    <th scope="col">Ciente</th>			    
			     <th scope="col">Corte</th>
			     <th scope="col">Fecha</th>
			     <th scope="col">Estado</th>
			    </tr>
			  </thead>
			  <tbody>';

	foreach ($ac as $bc) {  
				/// reviso si ya hubo corte ese dia
			
			$a = $db->query("SELECT * FROM corte_diario WHERE fecha = '$fecha' and td = ". $bc["td"] ."");
				if($a->num_rows > 0){
					$cortex = '<th scope="col" class="black-text">Con Corte</th>';
					$edox = '<th scope="col" class="green-text">Correcto!</th>';
				} else {
					$cortex = '<th scope="col" class="red-text">Sin Corte</th>';
					$edox = '<th scope="col" class="red-text">Error!</th>';
				} 
    		$a->close();


			   echo '<tr>
			   	  <th scope="col">'.$bc["td"].'</th>
		    	  <th scope="col">'.$bc["cliente"].'</th>
		    	  '.$cortex.'
		    	  <th scope="col">'.$fecha.'</th>
			      '.$edox.'
			      </tr>';

			  } // foreach
			 echo '</tbody>
		    </table>';
		}
		$ac->close();
	}




	public function AddClienteSync($hash,$td){
		$db = new dbConn();
		    
		    $datos = array();
		    $datos["hash"] = $hash;
		    $datos["td"] = $td;
		    if ($db->insert("login_db_user", $datos)) {
		      Alerts::Alerta("success","Agregado!","Usuario agregado correctamente!");  
		    }
		$this->VerHashes(); 		
	}


	public function DelClienteSync($hash,$td){
		$db = new dbConn();
  
	    if ( Helpers::DeleteId("login_db_user", "hash = '$hash' and td =" . $td)) {
	        Alerts::Alerta("success","Eliminado!","Usuario agregado correctamente!");
	    }
	   $this->VerHashes(); 	     		
	}



// eliminar todo el hash de actualizcion
	public function DelHash($hash){
		$db = new dbConn();
  		
  		if ( Helpers::DeleteId("login_db_sync", "hash = '$hash'")) {
		        Helpers::DeleteId("login_db_user", "hash = '$hash'");
		        Alerts::Alerta("success","Eliminado!","Usuario agregado correctamente!");
	   
	    }
	   $this->VerHashes(); 	     		
	}



// agregar nuevo hash
	public function NewHash($hash){
		$db = new dbConn();
  		
  		if(strlen($hash) != 36){
  			Alerts::Alerta("error","Error!","El hash no coincide!"); 
  		} else {
  			$datos = array();
		    $datos["hash"] = $hash;
		    $datos["fecha"] = date("d-m-Y");
		    $datos["hora"] = date("H:i:s");
		    if ($db->insert("login_db_sync", $datos)) {
		      Alerts::Alerta("success","Agregado!","Usuario agregado correctamente!");  
		    }
		}    
	   $this->VerHashes(); 	     		
	}






	public function VerActualizacionesDia($fecha){
		$db = new dbConn();

 $a = $db->query("SELECT cliente, td FROM config_master WHERE td != 0 order by td asc");

	if($a->num_rows > 0){
	 echo '<table class="table table-sm table-striped">
			  <thead>
			    <tr>
			    <th scope="col">ID</th>
			    	<th scope="col">Cliente</th>
			      <th scope="col">Estado</th>
			      <th scope="col">Hora</th>
			      <th scope="col">Corte</th>
			    </tr>
			  </thead>
			  <tbody>';
	    foreach ($a as $b) {  
		    echo '<tr>
		    		<th scope="col">'.$b["td"].'</th>
		    	  <th scope="col"><a href="?synclist&td='.$b["td"].'">'.$b["cliente"].'</a></th>
			      '. $this->CompruebaHashHoy($fecha,$b["td"]) .'
			      <th scope="col">'.$this->UltimaHoraHash($fecha,$b["td"]).'</th>			      
			      '.$this->CompruebaHashCorte($fecha,$b["td"]).'
			      </tr>';
	    } 
	    echo '</tbody>
		    </table>';
		} 
		$a->close();
	}



	public function CompruebaHashHoy($fecha,$td){// comprueba cual esel hash de ahora
		$db = new dbConn();

	    	$a = $db->query("SELECT * FROM sync_up_cloud WHERE td = '$td' and fecha = '$fecha'"); 
	    	if($a->num_rows > 0){
	    		return '<th scope="col" class="text-success font-weight-bold">Ajecutandose</th>';	
	    	} else {
	    		return '<th scope="col" class="text-danger font-weight-bold">Detenido</th>';	
	    	}
	    	$a->close();
		
	}

	public function CompruebaHashCorte($fecha,$td){// comprueba corte de ahora
		$db = new dbConn();

	    	$a = $db->query("SELECT * FROM corte_diario WHERE edo = 1 and td = '$td' and fecha = '$fecha'"); 
	    	if($a->num_rows > 0){
	    		return '<th scope="col" class="text-success font-weight-bold">Ejecutado</th>';	
	    	} else {
	    		return '<th scope="col" class="text-danger font-weight-bold">Sin Corte</th>';	
	    	}
	    	$a->close();
		
	}

	public function UltimaHoraHash($fecha,$td){ //para reporte nada mas
		$db = new dbConn();
	   if ($r = $db->select("hora", "sync_up_cloud", "where fecha = '$fecha' and td = '$td' order by id DESC LIMIT 1")) { 
	        $hora=$r["hora"];
	    } 
	    unset($r); 
		return $hora;
	}
///////



//// para el inicio
// agregar nuevo hash
	public function Trafico($fecha){
		$db = new dbConn();
  		
   		$a = $db->query("SELECT * FROM sync_up_cloud WHERE fecha = '$fecha'");
		return $a->num_rows;
		$a->close();

	}

	public function Entradas($fecha){
		$db = new dbConn();
  		
   		$a = $db->query("SELECT * FROM login_inout WHERE fecha = '$fecha'");
		return $a->num_rows;
		$a->close();

	}

	public function Productos($fecha){
		$db = new dbConn();
  		
		$a = $db->query("SELECT sum(cant) FROM ticket WHERE fecha = '$fecha'");
		    foreach ($a as $b) {
		        $cant=$b["sum(cant)"];
		    } $a->close();
		    return $cant;

	}

	public function ProductosT(){
		$db = new dbConn();

   		$a = $db->query("SELECT sum(cant) FROM ticket");
		    foreach ($a as $b) {
		        $cant=$b["sum(cant)"];
		    } $a->close();
		    return $cant;
	}


	public function Cuentas(){
		$db = new dbConn();

   		$a = $db->query("SELECT * FROM config_master");
		return $a->num_rows;
		$a->close();

	}

	public function UltimosHas(){
		$db = new dbConn();

	 $a = $db->query("SELECT * FROM sync_up_cloud order by id desc limit 3");

	if($a->num_rows > 0){
	 echo '<div class="card mb-4">

            <div class="card-header text-center">
               &Uacuteltimos Hash sincronizados
            </div>

            <div class="card-body  text-center">
            <div class="list-group list-group-flush">';
	    foreach ($a as $b) {  
		    echo '<a class="list-group-item list-group-item-action waves-effect">
					<small>'. substr($b["comprobacion"], 0, 30) .'</small>
                    </a>';
	    } 
	    echo '</div>

            </div>

        </div>';
		} 
		$a->close();
	}



	static public function VerClienteNombre($td){
		$db = new dbConn();

   		if ($r = $db->select("cliente", "config_master", "WHERE td = '$td'")) { 
	        return $r["cliente"];
	    } unset($r);  

	}








} // fin de la clase

 ?>