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
        $datos["edo"] = 1;
        $datos["tiempo_activo"] = date("H:i:s");
        $datos["tiempo_activoF"] = Fechas::Format(date("H:i:s"));
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
							<h4><a id="opciones" hash="'.$r["hash"].'" mesa="'.$mesa.'">
					      <span><i class="fas fa-cogs green-text fa-lg" aria-hidden="true"></i></span>
					      </a>'. $x["nombre"] .'</h4>
							<strong>Direcci&oacuten: '. $x["direccion"] .'</strong>  ||  <strong>Tel: '. $x["telefono"] .'</strong>  ||  <strong>Doc: '. $x["documento"] .'</strong>
						</div>	
						<div class="col-2">
							
						</div>				
   						</div>'; 
			    } unset($x);  

	    } else {
	        Alerts::Mensajex('<img src="assets/img/imagenes/danger.png" class="img-fluid img-responsive" alt="Danger">Aun no ha agregado ningun cliente a esta orden',"danger",'<a id="ndelivery" class="btn btn-dark-green btn-sm">Usuario</a>', '<a id="borrar-factura" op="24" mesa="'.$mesa.'" class="btn btn-unique btn-sm">Cancelar</a>');
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



  public function BotonesOpciones($data){
    echo '<table class="table table-striped table-sm">
  <thead>
    <tr>
      <th scope="col">Opci&oacuten</th>
      <th scope="col">Acci&oacuten</th>
    </tr>
  </thead>
  <tbody>';


  if($this->CompuebaEdo() == 1){
  echo '<tr>
        <th scope="row">Desvincular Cliente</th>
        <td align="right"><a id="desvincular" hash="'.$data["hash"].'" class="btn btn-unique btn-sm">
                  Desvincular
                  </a></td>
        </tr>';
    }

   echo '<tr>
      <th scope="row">Cancelar Factura</th>
      <td align="right"><a id="borrar-factura" op="24" mesa="'.$data["mesa"].'" class="btn btn-danger btn-sm">
                Cancelar
                </a></td>

    </tr>
    <tr>
      <th scope="row">Agregar Repartidor</th>
      <td align="right"><a mesa="'.$data["mesa"].'" class="btn btn-cyan btn-sm">
                Repartidor
                </a></td>
    </tr>
  </tbody>
</table>';
  

  }





  public function CompuebaEdo(){
    $db = new dbConn();
      if ($r = $db->select("edo", "clientes_mesa", "WHERE mesa='".$_SESSION["mesa"]."' and tx = ".$_SESSION["tx"]." and td = ".$_SESSION["td"]."")) { 
          return $r["edo"];
      } unset($r); 

  }



  public function ModalEdo(){
    $db = new dbConn();
    // 1 Activo, 2 Enviado, 3 Entregado, 4 Pagado


        if($this->CompuebaEdo() == 1) $estado = "ACTIVO";
        elseif($this->CompuebaEdo() == 2) $estado = "ENVIADO";
        elseif($this->CompuebaEdo() == 3) $estado = "ENTREGADO";
        else $estado = "PAGADO";

    echo ' <div class="card">
          <div class="card-body text-center">
            <h3>'. $estado .'</h3>
          </div>
        </div>';

        if($this->CompuebaEdo() != 3){

        echo '<div class="row d-flex justify-content-center">
          <div class="btn-group mt-3 justify-content-center" role="group">
            <button id="BtnGroup" type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              Estado
            </button>
            <div class="dropdown-menu" aria-labelledby="BtnGroup">';

              if($this->CompuebaEdo() == 1){
                echo '<a id="addedo" edo="2" class="dropdown-item" >ENVIADO</a>';
              }
              echo '<a id="addedo" edo="3" class="dropdown-item" >ENTREGADO</a>';    
            echo '</div>
          </div>
        </div>';

      }

  }



  public function AddEdo($edo){
    $db = new dbConn();
 
    if($edo == 2){
      $cambio["tiempo_enviado"] = date("H:i:s");
      $cambio["tiempo_enviadoF"] = Fechas::Format(date("H:i:s"));  
    } 
    if($edo == 3){
      $cambio["tiempo_entregado"] = date("H:i:s");
      $cambio["tiempo_entregadoF"] = Fechas::Format(date("H:i:s"));  
    } 

      $cambio["edo"] = $edo;    
      if (Helpers::UpdateId("clientes_mesa", $cambio, "mesa = '".$_SESSION["mesa"]."' and tx = ".$_SESSION["tx"]." and td = ".$_SESSION["td"]."")) {
            Alerts::Alerta("success","Realizado!","Cambio realizado corectamente!");
        } else {
            Alerts::Alerta("error","Error!","Ocurrio un error al realizar el cambio!");
        }

    $this->ModalEdo();

  }


  public function MensajeEdoBlock(){
    Alerts::Mensajex("Ya no puede segir agregando producto por que el pedido ha sido reportado como enviado","info");
  }












} // clase
?>