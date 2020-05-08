<?php 
class Llevar{

	public function __construct(){

	}

  public function Busqueda($dato){ // Busqueda para busqueda lenta
    $db = new dbConn();
      if($dato["keyword"] != NULL){
             $a = $db->query("SELECT * FROM clientes WHERE (telefono like '%".$dato["keyword"]."%' or nombre like '%".$dato["keyword"]."%' or documento like '%".$dato["keyword"]."%') and td = ".$_SESSION["td"]." limit 8");
                if($a->num_rows > 0){
                    echo '<table class="table table-striped table-sm table-hover">';
            foreach ($a as $b) {
                       echo '<tr>
                       			<td scope="row">
                       				<a id="scliente" hash="'. $b["hash"] .'">
									<div class="row">
											<div class="col-2">
											<img src="assets/img/imagenes/avatar.png" class="img-fluid img-responsive" alt="Avatar">
											</div>
											<div class="col-10">
												<h4>'. $b["nombre"] .'</h4>
												<strong>Tel: '. $b["telefono"] .'</strong>  |  <strong>Doc: '. $b["documento"] .'</strong>
											</div>
										</div>
                       				</a>
                              </td>
                            </tr>'; 
            }  
                        echo '<tr>
                              <td scope="row"><a id="cancel-p"><div class="col-md-12">CANCELAR</div></a></td>
                            </tr>'; 
                $a->close();

                
              } else {
                 echo '<table class="table table-sm table-hover">';
                    echo '<tr>
                              <td scope="row">El criterio de busqueda no corresponde a un producto</td>
                            </tr>';
                    echo '<tr>
                              <td scope="row"><a id="cancel-p"><div class="col-md-12">CANCELAR</div></a></td>
                            </tr>';
             }

          echo '</table>';
      }

  }






  public function AsignarCliente($mesa, $cliente){ 
     $db = new dbConn();
     
        $datos["cliente"] = $cliente;
        $datos["mesa"] = $mesa;
        $datos["tx"] = $_SESSION["tx"];
        $datos["hash"] = Helpers::HashId();
        $datos["time"] = Helpers::TimeId();
        $datos["td"] = $_SESSION["td"];
        $db->insert("clientes_mesa", $datos);
  }



  public function DatosCliente($mesa){
    $db = new dbConn();

        if ($r = $db->select("cliente, hash", "clientes_mesa", "WHERE mesa='$mesa' and tx = ".$_SESSION["tx"]." and td = ".$_SESSION["td"]."")) { 

        	    if ($x = $db->select("nombre, telefono, documento, direccion", "clientes", "WHERE hash = '".$r["cliente"]."' and td = ".$_SESSION["td"]."")) { 
			        echo '<div class="row">
								
						<div class="col-10">
							<h4><a id="desvincular" hash="'.$r["hash"].'">
					      <span><i class="fas fa-ban red-text fa-lg" aria-hidden="true"></i></span>
					      </a>'. $x["nombre"] .'</h4>
							<strong>Direcci&oacuten: '. $x["direccion"] .'</strong>  ||  <strong>Tel: '. $x["telefono"] .'</strong>  ||  <strong>Doc: '. $x["documento"] .'</strong>
						</div>	
						<div class="col-2">
							<a id="borrar-factura" op="24" mesa="'.$mesa.'">
					      <span><i class="fas fa-trash-alt red-text fa-lg" aria-hidden="true"></i></span>
					      </a>
						</div>				
   						</div>'; 
			    } unset($x);  

	    } else {
	        Alerts::Mensajex('<img src="assets/img/imagenes/danger.png" class="img-fluid img-responsive" alt="Avatar">Aun no ha agregado ningun cliente a esta orden',"danger",'<a id="borrar-factura" op="24" mesa="'.$mesa.'">
					      <span><i class="fas fa-trash-alt red-text fa-lg" aria-hidden="true"></i></span>
					      </a>', '<a id="ndelivery">
					      <span><i class="fas fa-user green-text fa-lg" aria-hidden="true"></i></span>
					      </a>');
	    } unset($r);  
                
   

  }




  public function BusquedaAsig($dato){ // Busqueda asignar un cliente al delivery
    $db = new dbConn();
      if($dato["keyword"] != NULL){
             $a = $db->query("SELECT * FROM clientes WHERE (telefono like '%".$dato["keyword"]."%' or nombre like '%".$dato["keyword"]."%' or documento like '%".$dato["keyword"]."%') and td = ".$_SESSION["td"]." limit 8");
                if($a->num_rows > 0){
                    echo '<table class="table table-striped table-sm table-hover">';
            foreach ($a as $b) {
                       echo '<tr>
                       			<td scope="row">
                       				<a id="clienteasig" hash="'. $b["hash"] .'">
									<div class="row">
											<div class="col-2">
											<img src="assets/img/imagenes/avatar.png" class="img-fluid img-responsive" alt="Avatar">
											</div>
											<div class="col-10">
												<h4>'. $b["nombre"] .'</h4>
												<strong>Tel: '. $b["telefono"] .'</strong>  |  <strong>Doc: '. $b["documento"] .'</strong>
											</div>
										</div>
                       				</a>
                              </td>
                            </tr>'; 
            }  
                        echo '<tr>
                              <td scope="row"><a id="cancel-asig"><div class="col-md-12">CANCELAR</div></a></td>
                            </tr>'; 
                $a->close();

                
              } else {
                 echo '<table class="table table-sm table-hover">';
                    echo '<tr>
                              <td scope="row">El criterio de busqueda no corresponde a un producto</td>
                            </tr>';
                    echo '<tr>
                              <td scope="row"><a id="cancel-asig"><div class="col-md-12">CANCELAR</div></a></td>
                            </tr>';
             }

          echo '</table>';
      }

  }




  public function DesvincularCliente($hash){ // desvincula cliente de la orden
    $db = new dbConn();
        Helpers::DeleteId("clientes_mesa", "hash='$hash'");
}












} // clase
?>