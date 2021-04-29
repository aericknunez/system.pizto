<?php
include_once '../common/Helpers.php'; // [Para todo]
include_once '../includes/variables_db.php';
include_once '../common/Mysqli.php';
$db = new dbConn();
include_once '../includes/DataLogin.php';
$seslog = new Login();
$seslog->sec_session_start();



include_once '../common/Alerts.php';
$alert = new Alerts;
$helps = new Helpers;
include_once '../common/Fechas.php';
include_once '../common/Encrypt.php';
include_once '../common/Dinero.php';


// filtros para cuando no hay session abierta
if ($seslog->login_check() != TRUE) {
echo '<script>
	window.location.href="application/includes/logout.php"
</script>';
} 

if($_SESSION["user"] == NULL and $_SESSION["td"] == NULL){
echo '<script>
	window.location.href="application/includes/logout.php"
</script>';
exit();
}
//

//

/// inicia el switch
switch ($_REQUEST["op"]) {


case "22": // MUESTRA EL LATERAL (FACTURA)
		include_once '../../system/ventas/Venta.php';
		include_once '../../system/corte/Corte.php';
		$ventas = new Venta;
		$ventas->VerFactura($_SESSION["mesa"]);
break; 



case "20": //venta normal
	include_once '../../system/ventas/Venta.php';
	$ventas = new Venta;
	if($_REQUEST["cliente"] == NULL) { $clientes = 1; }
	else { $clientes = $_REQUEST["cliente"]; } 			

$identificador = $ventas->Execute($_REQUEST["cod"], $_SESSION["mesa"], $clientes, $_SESSION['config_imp']);

	// para pantallas
	include_once '../../system/tv/Pantallas.php';
	$pantalla = new Pantallas;
	if($_REQUEST["panel"] != NULL and $_REQUEST["panel"] != 0){
	$pantalla->AgregarControl($identificador, $_SESSION["mesa"],$clientes,0,$_REQUEST["panel"]);
	}
	$pantalla->Cambia(1);

break; 



case "19": // venta con opciones
	include_once '../../system/ventas/Venta.php';
	$ventas = new Venta;
	if($_REQUEST["cliente"] == NULL) { $clientes = 1; }
	else { $clientes = $_REQUEST["cliente"]; } 			

	$id = $ventas->Execute($_REQUEST["cod"], $_SESSION["mesa"], $clientes, $_SESSION['config_imp']);

	$datos = $ventas->AddOpcion($id, $_REQUEST["cod"], $clientes);	

	$data = json_decode($datos, true);

	$identificador = $data["identificador"];

	// para pantallas
	include_once '../../system/tv/Pantallas.php';
	$pantalla = new Pantallas;
	if($_REQUEST["panel"] != NULL and $_REQUEST["panel"] != 0){
	$pantalla->AgregarControl($identificador, $_SESSION["mesa"],$clientes,1,$_REQUEST["panel"]);
	}
	$pantalla->Cambia(1);

	echo $datos;
break; 



case "3":
	include_once '../../system/config_precios/Config.php';
	$configuracion = new ConfigP;
	$configuracion->CambiarPrecio($_POST);
break;



case "4":
include_once '../../system/config_iconos/Icono.php';
$iconos = new Icono;
$iconos->AddCategoria($_REQUEST["nombre"], $_REQUEST["imagen"]);

include_once '../../system/config_configuraciones/Config.php';
	$configuracion = new Config;
	$configuracion->CrearIconos("../iconos/", 1);
break;

case "5":
include_once '../../system/config_iconos/Icono.php';
$iconos = new Icono;
$iconos->AddProducto($_REQUEST["nombre"],$_REQUEST["imagen"],$_REQUEST["popup"],$_REQUEST["preci"],$_REQUEST["opcion"]);

include_once '../../system/config_configuraciones/Config.php';
	$configuracion = new Config;
	$configuracion->CrearIconos("../iconos/", 1);
	
break;


case "6":
include_once '../../system/config_iconos/Icono.php';
$iconos = new Icono;
$iconos->ModProducto($_REQUEST["cod"],$_REQUEST["nombre"],$_REQUEST["popup"],$_REQUEST["imagen"]);

include_once '../../system/config_configuraciones/Config.php';
	$configuracion = new Config;
	$configuracion->CrearIconos("../iconos/", 1);
break;


case "7":
include_once '../../system/config_iconos/Icono.php';
$iconos = new Icono;
$iconos->ModCategoria($_REQUEST["cod"],$_REQUEST["nombre"],$_REQUEST["imagen"]);

include_once '../../system/config_configuraciones/Config.php';
	$configuracion = new Config;
	$configuracion->CrearIconos("../iconos/", 1);
break;


case "8":
include_once '../../system/config_iconos/Icono.php';
$iconos = new Icono;
$iconos->DelProducto($_REQUEST["cod"]);

include_once '../../system/config_configuraciones/Config.php';
	$configuracion = new Config;
	$configuracion->CrearIconos("../iconos/", 1);
echo '<script>
	window.location.href="?iconos"
</script>';
break;


case "9":
include_once '../../system/config_iconos/Icono.php';
$iconos = new Icono;
$iconos->DelCategoria($_REQUEST["cod"]);

include_once '../../system/config_configuraciones/Config.php';
	$configuracion = new Config;
	$configuracion->CrearIconos("../iconos/", 1);
echo '<script>
	window.location.href="?iconos"
</script>';
break;


case "10":
	include_once '../../system/config_iconos/Icono.php';
	$iconos = new Icono;
if($_REQUEST["nombre"] != NULL){
	$iconos->AddOpcion($_REQUEST["nombre"]);
	} else {
		Alerts::Alerta("error","Error!","La opcion esta vacia!");
		$iconos->VerOpciones();
	}

include_once '../../system/config_configuraciones/Config.php';
	$configuracion = new Config;
	$configuracion->CrearIconos("../iconos/", 1);
	
break;



case "11":
include_once '../../system/config_iconos/Icono.php';
$iconos = new Icono;
$iconos->AddOpcionName($_REQUEST["cod"],$_REQUEST["nombre"],$_REQUEST["imagen"]);

include_once '../../system/config_configuraciones/Config.php';
	$configuracion = new Config;
	$configuracion->CrearIconos("../iconos/", 1);

break;


case "12":
include_once '../../system/config_iconos/Icono.php';
$iconos = new Icono;
$iconos->DelOpciones($_REQUEST["cod"]);

include_once '../../system/config_configuraciones/Config.php';
	$configuracion = new Config;
	$configuracion->CrearIconos("../iconos/", 1);
	
break;


case "13":
include_once '../../system/config_iconos/Icono.php';
$iconos = new Icono;
$iconos->DelOpcionesName($_REQUEST["cod"], $_REQUEST["opciones"]);

include_once '../../system/config_configuraciones/Config.php';
	$configuracion = new Config;
	$configuracion->CrearIconos("../iconos/", 1);
	
break; 



case "14":
include_once '../../system/config_iconos/Icono.php';
$iconos = new Icono;

$idArray = explode(",",$_POST['ids']);
//update images order
$iconos->UpdateReordenar($idArray);
break; 


case "15":
	include_once '../../system/config_configuraciones/Config.php';
	$configuracion = new Config;
	$configuracion->ModTabla($_POST);
break;


case "16":
	include_once '../../system/facturar/Facturar.php';
	$fact = new Facturar();
	$fact->ModFactura($_POST);
break;



case "17": // carga las opciones de los platillos en el menu
	include_once '../../system/facturar/Facturar.php';
	$fact = new Facturar();
	$fact->ModFactura($_POST);
break;



case "18": // opciones a agregar
include_once '../../system/config_iconos/Icono.php';
$iconos = new Icono;
$iconos->IconosOpcionesVenta($_POST);
break;



case "19x": // opciones a agregar
	include_once '../../system/ventas/Venta.php';
	$ventas = new Venta;
	echo $ventas->ChangeOp($_POST);

include_once '../../system/tv/Pantallas.php';
	$pantalla = new Pantallas;
	$pantalla->Cambia(1);
break;


case "20q": //cambiar cantidad de producto
	include_once '../../system/ventas/Venta.php';
	$ventas = new Venta;
		
// cambia la cantidad del producto

$identificador = $ventas->NewCantidad($_REQUEST["codigox"], $_SESSION["mesa"], $_REQUEST["cliente"], $_SESSION['config_imp'], $_REQUEST["cantidad"]);



    if ($r = $db->select("panel", "control_panel_mostrar", "WHERE producto = '".$_REQUEST["codigox"]."' and td = " . $_SESSION["td"])) { 
        $panelx = $r["panel"];
    } unset($r);  


	// para pantallas
	include_once '../../system/tv/Pantallas.php';
	$pantalla = new Pantallas;
	if($panelx != NULL){
	$pantalla->AgregarControl($identificador, $_SESSION["mesa"], $_REQUEST["cliente"],0,$panelx, "cantidadx");
	}
	$pantalla->Cambia(1);
break; 



case "20x": //Otras Ventas
include_once '../../system/ventas/Venta.php';
$ventas = new Venta;
if($_REQUEST["cliente"] == NULL) { $clientes = 1; }
else { $clientes = $_REQUEST["cliente"]; } 

$ventas->OtrasVentas(8888, 
	$_SESSION["mesa"], 
	$clientes, 
	$_SESSION['config_imp'],
	$_POST["producto"],
	$_POST["cantidad"]);

// redireccionar
	if($_SESSION["delivery_on"] == TRUE){
		echo '<script>
		window.location.href="../../?delivery&mesa='.$_SESSION["mesa"].'"
		</script>';
	} elseif($_SESSION['tipo_inicio'] == 2){
		echo '<script>
		window.location.href="../../?view&mesa='.$_SESSION["mesa"].'"
		</script>';
	} else {
		echo '<script>
		window.location.href="../../?"
		</script>';
	}

break;



case "20t": //Otras Ventas
include_once '../../system/ventas/Venta.php';
$ventas = new Venta;
if($_REQUEST["cliente"] == NULL) { $clientes = 1; }
else { $clientes = $_REQUEST["cliente"]; } 

$ventas->RegistroDelivery(8887, 
	$_SESSION["mesa"], 
	$clientes, 
	$_SESSION['config_imp'],
	"Delivery",
	$_POST["cant"]);
break;




case "20y": //Venta Especial
include_once '../../system/ventas/Venta.php';
$ventas = new Venta;

include_once '../../system/ventas/Especial.php';
$especial = new Especial;
if($_REQUEST["cliente"] == NULL) { $clientes = 1; }
else { $clientes = $_REQUEST["cliente"]; } 

$especial->VentaEspecial($_REQUEST["cod"], 
						$_SESSION["mesa"], 
						$clientes, $_SESSION['config_imp']);

break;



case "20z": // MUESTRA EL LATERAL (venta especial)
		include_once '../../system/ventas/Especial.php';
		$ventas = new Especial;
		$ventas->VerProductos($_SESSION["mesa"]);
break; 



case "20w": // BORRAR ESPECIAL 
		include_once '../../system/ventas/Especial.php';
		$ventas = new Especial;
		$ventas->BorrarEspecial($_REQUEST["iden"]);
break; 



case "20v": // BORRAR TODO  venta especial
		include_once '../../system/ventas/Especial.php';
		$ventas = new Especial;
		$ventas->BorrarTodo($_REQUEST["url"]);
break; 


case "20u": // agrega detalle especial
include_once '../../system/ventas/Venta.php';
$ventas = new Venta;
if($_REQUEST["cliente"] == NULL) { $clientes = 1; }

$ventas->OtrasVentas(8889, 
	$_SESSION["mesa"], 
	$clientes, $_SESSION['config_imp'],
	$_POST["producto"],
	$_POST["cantidad"]);

// redireccionar
	if($_SESSION["delivery_on"] == TRUE){
		echo '<script>
		window.location.href="../../?delivery&mesa='.$_SESSION["mesa"].'"
		</script>';
	} elseif($_SESSION['tipo_inicio'] == 2){
		echo '<script>
		window.location.href="../../?view&mesa='.$_SESSION["mesa"].'"
		</script>';
	} else {
		echo '<script>
		window.location.href="../../?"
		</script>';
	}

break;



case "21": // cobra la venta
include_once '../../system/ventas/Venta.php';
$ventas = new Venta;
$num = $ventas->Facturar($_SESSION["mesa"],$_POST["total"]);

header("location: ../../?modal=factura&factura=$num&efectivo=".$_POST["total"]."");
break; 



case "23": // borrar producto
include_once '../../system/ventas/Venta.php';
include_once '../../system/ventas/Especial.php';

    require_once ('../ticket/autoload.php'); 
include_once '../../system/facturar/facturas/'.$_SESSION["td"].'/Impresiones.php';

$ventas = new Venta;
$ventas->BorrarProducto($_REQUEST["iden"],$_SESSION['config_imp']);


include_once '../../system/tv/Pantallas.php';
	$pantalla = new Pantallas;
	$pantalla->EliminaProducto($_REQUEST["iden"]);
	$pantalla->Cambia(1);
break; 



case "24": // borrar factura
include_once '../../system/ventas/Venta.php';

    require_once ('../ticket/autoload.php'); 
include_once '../../system/facturar/facturas/'.$_SESSION["td"].'/Impresiones.php';

$ventas = new Venta;
$ventas->BorrarFactura($_REQUEST["mesa"]);

include_once '../../system/tv/Pantallas.php';
	$pantalla = new Pantallas;
	$pantalla->EliminaControl($_REQUEST["mesa"]);
	$pantalla->Cambia(1);
break; 


case "25": // cobra la venta
include_once '../../system/ventas/Venta.php';
$ventas = new Venta;
$num = $ventas->FacturarCliente($_SESSION["mesa"],$_POST["total"],$_POST["cancela"]);
header("location: ../../?modal=factura&factura=$num&efectivo=".$_POST["total"]."&cancela=".$_POST["cancela"]."");
break;


case "26": // cambiar tipo de pantalla de inicio mesa o rapida
	include_once '../../system/ventas/Venta.php';
	$venta = new Venta;

	if($_SESSION["mesa"] != NULL){

		if($venta->VerProductosMesa($_SESSION["mesa"]) == 0){
			Helpers::DeleteId("mesa", "mesa=".$_SESSION["mesa"]." and tx = ".$_SESSION["tx"]." and td = ".$_SESSION["td"]." and estado = 1");
			unset($_SESSION["mesa"]);
		}
	}

	if($_SESSION["mesa"] == NULL){
			if($_SESSION["tipo_inicio"] == 1) {
				$_SESSION["tipo_inicio"] = 2;
			} else {
				unset($_SESSION['client-asign']);	
				unset($_SESSION['clientselect']);
				$_SESSION["tipo_inicio"] = 1;
			}
		
		$_SESSION["delivery_on"] = FALSE;
	}
break; 



case "27": // cambiar tx
	include_once '../../system/ventas/Venta.php';
	$venta = new Venta;

	if($_SESSION["mesa"] != NULL){
		
		if($venta->VerProductosMesa($_SESSION["mesa"]) == 0){
			Helpers::DeleteId("mesa", "mesa=".$_SESSION["mesa"]." and tx = ".$_SESSION["tx"]." and td = ".$_SESSION["td"]." and estado = 1");
			unset($_SESSION["mesa"]);
		}
	}

	if($_SESSION["mesa"] == NULL){
			if($_SESSION["tx"] == 1) { $_SESSION["tx"] = 0; } 
			else { $_SESSION["tx"] = 1; }
	}

break; 



case  "27x": // cambiar panel de datos o para vender
	include_once '../../system/ventas/Venta.php';
	$venta = new Venta;

	if($_SESSION["mesa"] != NULL){

			if($venta->VerProductosMesa($_SESSION["mesa"]) == 0){
			Helpers::DeleteId("mesa", "mesa=".$_SESSION["mesa"]." and tx = ".$_SESSION["tx"]." and td = ".$_SESSION["td"]." and estado = 1");
			unset($_SESSION["mesa"]);
			}
	}	

	if($_SESSION["mesa"] == NULL){
		if($_SESSION["muestra_vender"] == 1) { unset($_SESSION["muestra_vender"]); }
		else {
			$_SESSION["muestra_vender"] = 1;
		} 	
	}


break; 



case  "28": // ACTIVAR delivery
	include_once '../../system/ventas/Venta.php';
	$venta = new Venta;

	if($_SESSION["mesa"] != NULL){
		
		if($venta->VerProductosMesa($_SESSION["mesa"]) == 0){
			Helpers::DeleteId("mesa", "mesa=".$_SESSION["mesa"]." and tx = ".$_SESSION["tx"]." and td = ".$_SESSION["td"]." and estado = 1");
			unset($_SESSION["mesa"]);
		}

	} 

	if($_SESSION["mesa"] == NULL){

	if($_SESSION["delivery_on"] == FALSE) { $_SESSION["delivery_on"] = TRUE; } 
	else { $_SESSION["delivery_on"] = FALSE; }

	}

break; 



case "29": // Ir a mesa seleccionada segun mesa y tx


	$_SESSION["tx"] = $_REQUEST["tx"];
	$_SESSION["mesa"] = $_REQUEST["mesa"];

	if($_REQUEST["tipo"] == 1){

		$_SESSION["tipo_inicio"] = 1;
		unset($_SESSION['client-asign']);	
		unset($_SESSION['clientselect']);
		$_SESSION["delivery_on"] = FALSE;

	} elseif($_REQUEST["tipo"] == 2){

		$_SESSION["tipo_inicio"] = 2;
		$_SESSION["delivery_on"] = FALSE;

	} else{

		$_SESSION["delivery_on"] = TRUE;

	}


break; 



case  "30": // Agregar Unidad
	include_once '../../system/productos/Producto.php';
	$productos = new Producto;
	$productos->AddUnidad($_POST["nombre"],$_POST["abreviacion"]);
	
break; 



case  "31": // Borrar gasto
	include_once '../../system/productos/Producto.php';
	$productos = new Producto;
	$productos->BorrarUnidad($_POST["iden"]);

break; 



case  "32": // Agregar Porciones
	include_once '../../system/productos/Producto.php';
	$productos = new Producto;
	$productos->AddPorciones($_POST["nombre"],$_POST["producto"],$_POST["cantidad"]);
	
break; 



case  "33": // Borrar porcion
	include_once '../../system/productos/Producto.php';
	$productos = new Producto;
	$productos->BorrarPorcion($_POST["iden"]);
	
break; 



case  "34": // agrega materia prima
	include_once '../../system/productos/Producto.php';
	$productos = new Producto;
	$productos->AddMateria($_POST);	
break; 



case  "35": // Borrar gasto
	include_once '../../system/productos/Producto.php';
	$productos = new Producto;
	$productos->BorrarMateria($_POST["iden"]);
	
break; 



case  "36": // Agregar Porciones a un producto
	if(isset($_POST["producto"])){
		include_once '../../system/productos/Producto.php';
		$productos = new Producto;
		$productos->AddPorcionProducto($_POST["iden"],$_POST["producto"]);
	}
	
break; 



case  "37": // Agregar Porciones a un producto
include_once '../../system/productos/Producto.php';
$productos = new Producto;
$productos->BorrarPorcionProducto($_POST["iden"],$_POST["cod"]);
	
break; 



case  "38": // mostrar productos paginados
include_once '../../system/productos/Producto.php';
$productos = new Producto;
$productos->VerPlatillos($_POST["iden"]);
break; 



case  "39": // mostrar productos paginados
include_once '../../system/productos/Producto.php';
$productos = new Producto;
$productos->VerMateria($_POST["iden"]);
break; 



case  "39.3": // mostrar productos paginados
include_once '../../system/productos/Producto.php';
$productos = new Producto;
$productos->VerPorciones($_POST["iden"]);
break; 



case  "39.1": // mostrar productos paginados
include_once '../../system/productos/Producto.php';
$productos = new Producto;
$productos->VerUnidad($_POST["iden"]);
break; 



case  "39.2": // cambiar pantalla
include_once '../../system/productos/Producto.php';
$productos = new Producto;
$productos->CambiarPantalla($_REQUEST["cod"],$_REQUEST["iden"]);
$productos->VerPlatillos($_REQUEST["pagina"]);

include_once '../../system/config_configuraciones/Config.php';
	$configuracion = new Config;
	$configuracion->CrearIconos("../iconos/", 1);
break; 



case  "40": // sumar numero de clientes
include_once '../../system/mesas/Mesa.php';
$mesas = new Mesa;
$mesas->Sumar();
break; 



case  "41": // Agrega uno mas a la mesa
include_once '../../system/mesas/Mesa.php';
$mesas = new Mesa;
$mesas->Restar();
break; 



case  "42": // activar mesa
include_once '../../system/ventas/Venta.php';
$ventas = new Venta;
$ventas->CrearMesa($_SESSION["nclientes"], 2);
$mesa=$_SESSION["mesa"];
unset($_SESSION["mesa"], $_SESSION["nclientes"]);

if($_POST["nmesa"] != NULL){

	if ($r = $db->select("nombre", "mesa_nombre", "WHERE mesa = ".$mesa." and tx = ".$_SESSION["tx"]." and td =".$_SESSION["td"]."")) { 
	    $nmesa = $r["nombre"];
	} unset($r);
        if($nmesa == NULL){ // insertamos
                   $datos = array();
                    $datos["mesa"] = $mesa;
                    $datos["tx"] = $_SESSION["tx"];
                    $datos["nombre"] = $_POST["nmesa"];
                    $datos["fecha"] = date("d-m-Y");
                    $datos["hora"] = date("H:i:s");
                    $datos["td"] = $_SESSION["td"];
                    $datos["hash"] = Helpers::HashId();
                    $datos["time"] = Helpers::TimeId();
                    $db->insert("mesa_nombre", $datos); 

        } else { // actualizamos

              $cambio = array();
              $cambio["nombre"] =$_POST["nmesa"];
              
              Helpers::UpdateId("mesa_nombre", $cambio, "mesa = ".$mesa." and tx = ".$_SESSION["tx"]." and td =".$_SESSION["td"]."");

        }
}

echo '<script>
		window.location.href="?view&mesa='.$mesa.'"
	</script>';
// header("location: ../../?view&mesa=".$mesa."");

break; 



case  "43": // 
unset($_SESSION["nclientes"]);
header("location: ../../?");
break; 



case  "44": // nuevo cliente en mesa
include_once '../../system/mesas/Mesa.php';
$mesas = new Mesa;
$mesas->AddCliente($_REQUEST["mesa"]);
break; 



case  "45": // cambiar cliente

		if($_REQUEST["select"] != 0) { 
			$_SESSION['clientselect'] = $_REQUEST["select"];
		} else {
			unset($_SESSION['clientselect']);
		}
break; 



case  "46": // cargar clientes
include_once '../../system/mesas/Mesa.php';
$mesas = new Mesa;
$mesas->VerClientes($_SESSION['mesa']);
break; 



case  "47": // cargar iconos
include_once '../../system/mesas/Mesa.php';
$mesas = new Mesa;
$mesas->VerIconos($_SESSION['mesa']);
break; 



case  "50": // clientes
include_once '../../system/mesas/Mesa.php';
$mesas = new Mesa;
$mesas->ClientSelect($_SESSION['mesa']);
break; 



case  "51": // clientes a pasar cuenta
include_once '../../system/mesas/Mesa.php';
$mesas = new Mesa;
$mesas->AsignClient($_SESSION['mesa']);
break; 



case  "52": // seleccionar cliente
		if($_SESSION['client-asign'] == $_REQUEST["cliente"]) { 
			unset($_SESSION['client-asign']);
		} else {
			$_SESSION['client-asign'] = $_REQUEST["cliente"];			
		}
break; 



case  "53": // seleccionar cliente
	if($_SESSION['client-asign'] != NULL){
include_once '../../system/mesas/Mesa.php';
$mesas = new Mesa;
$mesas->DividirCuenta($_SESSION['mesa'],$_SESSION['client-asign'],$_REQUEST["cliente"]);
	} else {
		Alerts::Alerta("error","Error!","Seleccione el cliente del que va a transferir!");
	}

break; 



case  "54": // mostrar cliente a facturar
include_once '../../system/mesas/Mesa.php';
$mesas = new Mesa;
$mesas->ClienteFactura($_SESSION['mesa']); 
break; 



case  "55": // mostrar cliente a facturar
		include_once '../../system/ventas/Venta.php';
		$ventas = new Venta;
		$ventas->VerFacturaCliente($_REQUEST["mesa"],$_REQUEST["cliente"]);
break; 



case  "56": // modificar opciones
include_once '../../system/mesas/Mesa.php';
$mesas = new Mesa;
$mesas->OpcionesActivas($_REQUEST["mesa"],$_REQUEST["iden"],$_REQUEST["cod"],$_REQUEST["cliente"]); 

include_once '../../system/tv/Pantallas.php';
	$pantalla = new Pantallas;
	$pantalla->Cambia(1);
break; 



case  "57": // modificar opciones
	include_once '../../system/mesas/Mesa.php';
	$mesas = new Mesa;
	$mesas->OpcionesModificar(
		$_REQUEST["mesa"],
		$_REQUEST["cod"],
		$_REQUEST["iden"],
		$_REQUEST["opcion"],
		$_REQUEST["activo"]);  

include_once '../../system/tv/Pantallas.php';
	$pantalla = new Pantallas;
	$pantalla->Cambia(1);
break; 



case  "58": // eliminar opciones
	include_once '../../system/ventas/Venta.php';
	$ventas = new Venta;
	$ventas->BorrarOpcion($_REQUEST["cod"], $_REQUEST["iden"], $_REQUEST["activo"]);

	include_once '../../system/mesas/Mesa.php';
	$mesas = new Mesa;
	$mesas->OpcionesActivas($_REQUEST["mesa"],$_REQUEST["iden"],$_REQUEST["cod"],$_REQUEST["cliente"]); 
	$mesas->VerificaOpcionesActivas($_REQUEST["mesa"],$_REQUEST["iden"],$_REQUEST["cod"]);

include_once '../../system/tv/Pantallas.php';
	$pantalla = new Pantallas;
	$pantalla->Cambia(1);
break; 



case  "59": // agregar opciones (listar opciones para agregar)
	include_once '../../system/mesas/Mesa.php';
	$mesas = new Mesa;
	$mesas->ListarOpciones($_REQUEST["cod"], $_REQUEST["iden"], $_REQUEST["cliente"]);
break; 



case  "60": // cambiar o eliminar
include_once '../../system/ventas/Venta.php';
$ventas = new Venta;
	
	if($_REQUEST["opcion"] == 1){ // eliminar
		$ventas->BorrarOpcion($_REQUEST["cod"], $_REQUEST["iden"], $_REQUEST["activo"]);
	} else { //modificar
		$ventas->ActualizarOpcion($_REQUEST["cod"], $_REQUEST["iden"], $_REQUEST["cambio"], $_REQUEST["activo"]);
	}
include_once '../../system/mesas/Mesa.php';
$mesas = new Mesa;
$mesas->OpcionesActivas($_REQUEST["mesa"],$_REQUEST["iden"],$_REQUEST["cod"],$_REQUEST["cliente"]);

include_once '../../system/tv/Pantallas.php';
	$pantalla = new Pantallas;
	$pantalla->Cambia(1);
break; 



case  "61": // muestra las sub opciones para aplicarlas
include_once '../../system/mesas/Mesa.php';
$mesas = new Mesa;
$mesas->VerSubOpciones(
	$_REQUEST["mesa"],
	$_REQUEST["cod"],
	$_REQUEST["iden"],
	$_REQUEST["opcion"],
	$_REQUEST["cliente"]);
break; 



case  "62": // agrega la opcion
	include_once '../../system/ventas/Venta.php';
	$ventas = new Venta;
	$ventas->AgregarOpcion(
		$_REQUEST["cod"],
		$_REQUEST["opcion"],
		$_REQUEST["mesa"],
		$_REQUEST["cliente"],
		$_REQUEST["iden"]);
/// veo las mesas despues de agregar
Alerts::Alerta("success","Exito!","Opcion agregada corectamente!");
include_once '../../system/mesas/Mesa.php';
$mesas = new Mesa;
$mesas->OpcionesActivas($_REQUEST["mesa"],$_REQUEST["iden"],$_REQUEST["cod"],$_REQUEST["cliente"]);
$mesas->VerificaOpcionesActivas($_REQUEST["mesa"],$_REQUEST["iden"],$_REQUEST["cod"]);

include_once '../../system/tv/Pantallas.php';
	$pantalla = new Pantallas;
	$pantalla->Cambia(1);
break; 



case "63": // imprime corte
    include_once '../../system/facturar/facturas/'.$_SESSION["td"].'/Impresiones.php';
    require_once ('../ticket/autoload.php'); 
    $imprimir = new Impresiones(); 
	Alerts::Alerta("success","Imprimiendo","Imprimiendo reporte");

	if(isset($_POST["inicio"]) and isset($_POST["fin"])){
		$imprimir->ReporteCorte($_POST["inicio"], $_POST["fin"]); //
	} else {
		$imprimir->ReporteCorte(); //
	}
break; 



case "64": // aperturar caja
	include_once '../../system/corte/Corte.php';
	$cortes = new Corte;
	$cortes->AperturarCaja();
break; 



case "65": // corte preguntar
	if($_POST["efectivo"] ==  NULL){
		Alerts::Alerta("error","Error!","El Formulario esta vacio");
	} else {
		Alerts::RealizarCorte("ejecuta-corte","66",$_POST["efectivo"]);
	}
break; 



case  "66": // ejecuta corte
include_once '../../system/sync/Sync.php';

if($_SESSION["config_o_tipo_corte"] == 1){
	include_once '../../system/corte/Corte1.php';
	$cortes = new Corte;
	$cortes->EjecutarCorte($_POST["efectivo"]);
}
else{
	include_once '../../system/corte/Corte.php';
	$cortes = new Corte;
	if($_POST["fecha"] == NULL){ $fecha = date("d-m-Y"); 
	} else {
	   $fecha = $_POST["fecha"];
	}
	$cortes->EjecutarCorte($_POST["efectivo"], $fecha);
}

break; 



case  "67": // ver el contenido
	include_once '../../system/corte/Corte.php';
	include_once '../../system/sync/Sync.php';
	$cortes = new Corte;
	$cortes->Contenido(date("d-m-Y"));
break; 



case  "68": // cancelar corte
	include_once '../../system/corte/Corte.php';
	$cortes = new Corte;
	if($_POST["fecha"] == NULL){ $fecha = date("d-m-Y"); 
	} else {
	   $fecha = $_POST["fecha"];
	}
	$cortes->CancelarCorte($_POST["random"], $fecha);
break; 



case  "69": 
	if($_SESSION['config_propina_cant'] != NULL){
		
		$ar = $db->query("SELECT sum(total) FROM ticket_temp where mesa = '".$_SESSION["mesa"]."' and tx = ".$_SESSION['tx']." and td = ".$_SESSION['td']."");
		foreach ($ar as $br) {
		 $totalpro = $br["sum(total)"];
		} $ar->close();	


		$_SESSION['config_propina'] = Helpers::CalculaPorcentajeMas($totalpro, $totalpro + $_POST["propina"]);
	} else {
		$_SESSION['config_propina'] = $_POST["propina"];	
	}
echo '<script>
	window.location.href="?"
</script>';	
break; 


case  "69x": // cambiar porcentaje de propina
	if($_SESSION['config_propina_cant'] != NULL){
		unset($_SESSION['config_propina_cant']);
	} else {
		$_SESSION['config_propina_cant'] = TRUE;		
	}
break; 



case  "70": // historial diario
	include_once '../../system/historial/Historial.php';
	$historial = new Historial;
	if($_POST["fecha_submit"] == NULL){ 
		$fecha = date("d-m-Y"); 
	} else { 
		$fecha = $_POST["fecha_submit"];
	}
	$historial->HistorialDiario($fecha);
break; 



case  "70x": // historial diario
	include_once '../../system/historial/Historial.php';
	$historial = new Historial;
	if($_POST["fecha_submit"] == NULL){ 
		$fecha = date("d-m-Y"); 
	} else { 
		$fecha = $_POST["fecha_submit"];
	}
	$historial->HistorialDiarioLista($fecha);
break; 



case  "71": // historial mensual
	include_once '../../system/historial/Historial.php';
	$historial = new Historial;
		$fecha=$_POST["mes"];
		@$ano=$_POST["ano"];
		$fechax="-$fecha-$ano";

	$historial->HistorialMensual($fechax);
break; 



case  "72": // historial cortes
	include_once '../../system/historial/Historial.php';
	$historial = new Historial;
	if($_POST["fecha1_submit"]){
		$inicio = $_POST["fecha1_submit"]; $fin=$_POST["fecha2_submit"];
	} else {
		$inicio = date("01-m-Y"); $fin=date("31-m-Y");
	}
	$historial->HistorialCortes($inicio, $fin);

break; 



case "73": // historial diario
	include_once '../../system/historial/Historial.php';
	$historial = new Historial;
	if($_POST["fecha_submit"] == NULL){ 
		$fecha = date("d-m-Y"); 
	} else { 
		$fecha = $_POST["fecha_submit"];
	}
	$historial->HistorialGDiario($fecha);
break; 



case  "74": // historial mensual
	include_once '../../system/historial/Historial.php';
	$historial = new Historial;
		$fecha=$_POST["mes"];
		@$ano=$_POST["ano"];
		$fechax="-$fecha-$ano";

	$historial->HistorialGMensual($fechax);
break; 



case  "75": // mesas fecha
	include_once '../../system/mesashoy/Mesas.php';
	$mesas = new Mesas;
	
	if($_POST["fecha_submit"] == NULL){ 
		$fecha = date("d-m-Y"); 
	} else { 
		$fecha = $_POST["fecha_submit"];
	}
	$mesas->VerMesas($fecha,2);
break; 



case  "76": // historial In Out
	include_once '../../system/historial/Historial.php';
	$historial = new Historial;
	if($_POST["fecha_submit"] == NULL){ 
		$fecha = date("d-m-Y"); 
	} else { 
		$fecha = $_POST["fecha_submit"];
	}
	$historial->InOut($fecha);
break; 



case  "77": // historial ticket borrados
	include_once '../../system/historial/Historial.php';
	$historial = new Historial;
	if($_POST["fecha1_submit"]){
		$inicio = $_POST["fecha1_submit"]; $fin=$_POST["fecha2_submit"];
	} else {
		$inicio = date("01-m-Y"); $fin=date("31-m-Y");
	}
	$historial->HistorialTickets($inicio, $fin);

break; 



case "78": 
	include_once '../../system/mesashoy/Mesas.php';
	$mesas = new Mesas;
	$mesas->ModalVerMesa($_POST["mesa"],$_POST["tx"],$_POST["tbl"]);
break; 



case "78x": 
	include_once '../../system/mesashoy/Mesas.php';
	$mesas = new Mesas;
	$mesas->VerProductoTicket($_POST["num_fac"],$_POST["tx"]);
break; 



case "79": 

if($_POST["motivo"] != NULL){
	$_SESSION["motivo"] = $_POST["motivo"];

    require_once ('../ticket/autoload.php'); 
include_once '../../system/facturar/facturas/'.$_SESSION["td"].'/Impresiones.php';

$mesax = $_SESSION["mesa"];
	if($_POST["tipo"] == 2){

		include_once '../../system/ventas/Venta.php';
		include_once '../../system/ventas/Especial.php';
		$ventas = new Venta;
		$ventas->BorrarProducto($_POST["iden"],$_SESSION['config_imp']);


		include_once '../../system/tv/Pantallas.php';
			$pantalla = new Pantallas;
			$pantalla->EliminaProducto($_POST["iden"]);
			$pantalla->Cambia(1);

// redireccionar
if($_SESSION["delivery_on"] == TRUE){
	echo '<script>
	window.location.href="?delivery&mesa='.$mesax.'"
	</script>';
} elseif($_SESSION['tipo_inicio'] == 2){
	echo '<script>
	window.location.href="?view&mesa='.$mesax.'"
	</script>';
} else {
	echo '<script>
	window.location.href="?"
	</script>';
}

	} else {
		include_once '../../system/ventas/Venta.php';
		$ventas = new Venta;
		$ventas->BorrarFactura($_SESSION["mesa"]);

		include_once '../../system/tv/Pantallas.php';
			$pantalla = new Pantallas;
			$pantalla->EliminaControl($_SESSION["mesa"]);
			$pantalla->Cambia(1);

echo '<script>
window.location.href="?"
</script>';


	}
}


break; 



case  "80": // search -> Eliminar Orden tx =0
Alerts::AlertaCambios("eliminar-orden","81",$_REQUEST["iden"],"Esta seguro que desea eliminar esta orden? El cambio no se puede revertir");
break; 



case  "81": // search -> Eliminar Orden tx =0
	include_once '../../system/search/Busqueda.php';
	$search = new Busqueda;
	$search->BorrarOrden($_REQUEST["iden"]); // el iden es el numero de factura
break; 



case  "82": // search -> Eliminar Orden tx =0
Alerts::AlertaCambios("cancelar-factura","83",$_REQUEST["iden"],"Esta seguro que desea eliminar esta Factura? El cambio no se puede revertir");
break; 



case  "83": // search -> Eliminar Factura tx =1
	include_once '../../system/search/Busqueda.php';
	$search = new Busqueda;
	$search->CancelarFactura($_REQUEST["iden"]); // el iden es el numero de factura
break; 



case  "84": // search -> Eliminar Orden tx =0
Alerts::AlertaCambios("pasar-factura","85",$_REQUEST["iden"],"Esta seguro que desea Pasar a factura esta orden? El cambio no se puede revertir");
break; 



case  "85": // search -> Eliminar Factura tx =1
	include_once '../../system/search/Busqueda.php';
	$search = new Busqueda;
	$search->CambiarFactura($_REQUEST["iden"]); // el iden es el numero de factura
break; 



case  "86": // imprimir factura
$factura = $_REQUEST["factura"];
include_once '../../system/facturar/facturas/'.$_SESSION["td"].'/Impresiones.php';
include_once '../../system/facturar/Facturar.php';
    require_once ('../ticket/autoload.php'); 
      $fact = new Facturar();

$fact->ObtenerEstadoFacturaReimprimir($_REQUEST["efectivo"], $factura);
break; 



case  "87": // para no facturar
	if($_SESSION["mesa"] != NULL){
			if($_SESSION["noimprimir"] == 1) unset($_SESSION["noimprimir"]);
			else $_SESSION["noimprimir"] = 1;
		
	} else {
	Alerts::Alerta("error","Error!","No debe haber ninguna mesa activa para continuar!");
	}
break; 



case  "88": // Abrir Caja
    include_once '../../system/facturar/facturas/'.$_SESSION["td"].'/Impresiones.php';
        require_once ('../ticket/autoload.php'); 
    $imprimir = new Impresiones(); 
    $imprimir->AbrirCaja();
break; 



case  "89": // Reporte Diario

    include_once '../../system/facturar/facturas/'.$_SESSION["td"].'/Impresiones.php';
        require_once ('../ticket/autoload.php'); 
    $imprimir = new Impresiones; 
    
    if($imprimir->ReporteDiario($_REQUEST["iden"])){
    	Alerts::Alerta("success","Imprimiendo","Imprimiendo Factura");
    }
	
break; 



case "90": 
	include_once '../../system/config_configuraciones/Config.php';
	$configuracion = new Config;

	$configuracion->Configuraciones($_POST);
break; 



case  "91": 
include_once '../../system/config_configuraciones/Config.php';
	$configuracion = new Config;

	include_once '../common/Encrypt.php';
	$configuracion->Root($_POST);
break; 



case  "92":  // crear iconos para venta
include_once '../../system/config_configuraciones/Config.php';
	$configuracion = new Config;
	$configuracion->CrearIconos("../iconos/", 1);
break; 



case  "93":  // Obtener el total de imagenes que hay 
include_once '../../system/config_iconos/Icono.php';
	$conf = new Icono;
	echo $conf->ContarIconos();
break; 



case  "95": 
include_once '../../system/tv/Pantallas.php';
	$pantalla = new Pantallas;
	$pantalla->Comprueba();
break; 



case  "96":  // muestra el panel
include_once '../../system/tv/Pantallas.php';
	$pantalla = new Pantallas;
	$pantalla->Panel();
	$pantalla->Cambia(0);
break; 



case  "97": // mostrar lateral
include_once '../../system/tv/Pantallas.php';
	$pantalla = new Pantallas;
	$pantalla->MostarLateral();
break; 



case  "98": // pasar producto a sacado
include_once '../../system/tv/Pantallas.php';
	$pantalla = new Pantallas;
	$pantalla->PasarProducto($_REQUEST["iden"],$_REQUEST["cod"],$_REQUEST["identificador"]);
	$pantalla->Panel();
	$pantalla->Cambia(1);
break; 



case  "99": // cambiar pantalla panel
include_once '../../system/tv/Pantallas.php';
	$pantalla = new Pantallas;
	$pantalla->CambiarPanel($_REQUEST["iden"]);
	$pantalla->Panel();
break; 



case  "100": // mostrar productos paginados products venta especial
include_once '../../system/config_especial/Config.php';
$configuracion = new Config;
$configuracion->VerProductosEspecial($_REQUEST["iden"]);
break; 



case  "101": // mostrar productos paginados products venta especial
include_once '../../system/config_especial/Config.php';
$configuracion = new Config;
$configuracion->CambiarEspecial($_REQUEST["cod"]);
$configuracion->VerProductosEspecial($_REQUEST["iden"]);
break; 



case  "102": // cambia para mostrarlo en el reporte
include_once '../../system/config_especial/Config.php';
$configuracion = new Config;
$configuracion->CambiarReporte($_REQUEST["cod"]);
$configuracion->VerProductosEspecial($_REQUEST["iden"]);
break; 



case  "110": // agregar producto averias
include_once '../../system/productos/Product.php';
$producto = new Product;
$producto->AgregarAveria($_POST["producto"],$_POST["cantidad"],$_POST["comentarios"]);
	
break; 



case  "111": // borrar averias
include_once '../../system/productos/Product.php';
$producto = new Product;
$producto->EliminarAveria($_REQUEST["iden"]);
	
break; 



case  "112": // paginador averias
include_once '../../system/productos/Product.php';
$producto = new Product;
$producto->VerAverias($_REQUEST["iden"]);
break; 



case  "115": // agregar producto nuevo
include_once '../../system/productos/Product.php';
$producto = new Product;
$producto->AgregarProducto($_POST["producto"],$_POST["cantidad"],$_POST["comentarios"]);
	
break; 



case  "116": // borrar averias
include_once '../../system/productos/Product.php';
$producto = new Product;
$producto->EliminarProducto($_REQUEST["iden"]);
	
break; 



case  "117": // paginador averias
include_once '../../system/productos/Product.php';
$producto = new Product;
$producto->VerProducto($_REQUEST["iden"]);
break; 



case  "118": // paginador averias
include_once '../../system/config_precios/Config.php';
$conf = new ConfigP();
$conf->VerOpcionesActivas($_POST["cod"]);
break; 



case  "119": // paginador averias
include_once '../../system/config_precios/Config.php';
$conf = new ConfigP();
$conf->CambiarOpcion($_POST);
break; 



case  "124": // comprueba es estado de cada respaldo
include_once '../../system/historial/Historial.php';
	$historial = new Historial;
	$historial->SyncStatus("../../sync/database/");
break; 



case  "125": // comprueba se se ha desarrollado respaldo
include_once '../../system/sync/Sync.php';
$sync = new Sync;
$sync->RespaldoStatus(date("d-m-Y"));
break; 



case  "126": // validar el sistema
$_SESSION["caduca"] = 0;
echo '<script>
	window.location.href="?"
</script>';
break; 



case  "127": // validar codigo de sistema
include_once '../common/Encrypt.php';
include_once '../../system/index/Inicio.php';
$inicio = new Inicio;
$inicio->Validar($_POST["fecha_submit"], $_POST["codigo"]);
	
break; 



case  "128": // validar cuentas
include_once '../../system/config_configuraciones/Config.php';
	$configuracion = new Config;
	$configuracion->AddSucursal($_POST["user"],$_POST["sistema"]);
break; 



case  "129": // cambiar local
include_once '../../system/config_configuraciones/Config.php';
	$configuracion = new Config; 
  	$_SESSION['td'] = $_POST["iden"];

  $_SESSION['secret_key'] = md5($_SESSION['td']);
  $configuracion->CrearVariables();
  echo '<script>
	window.location.href="?"
	</script>';
break; 



case  "130": // crear codigos
include_once '../common/Encrypt.php';
include_once '../../system/index/Inicio.php';
$inicio = new Inicio;
$inicio->CreaCodigos($_POST["fecha_submit"]);
break; 



case  "131": // cambiar local predeterminado
include_once '../../system/config_configuraciones/Config.php';
	$configuracion = new Config(); 
	$configuracion->DefineSucursal($_SESSION["user"],$_REQUEST["iden"]);
break; 



case  "132": // buscar RTN
include_once '../../system/facturar/Facturar.php';
	$facturar = new Facturar; 
	$facturar->BuscarRtn($_POST["keyword"]);
break; 



case  "133": // ver RTN
include_once '../../system/facturar/Facturar.php';
	$facturar = new Facturar; 
	$facturar->VerRtn($_REQUEST["iden"]);
break; 



case  "134": // ver RTN
include_once '../../system/facturar/Facturar.php';
	$facturar = new Facturar; 
	$facturar->QuitarRtn();
break; 



case  "135": // ver RTN
include_once '../../system/facturar/Facturar.php';
	$facturar = new Facturar; 
	$facturar->AgregarRtn($_POST["cliente"],$_POST["rtn"]);
break; 



case  "136": // vpregunta eliminar una cosa
$alert->Eliminar($_REQUEST["idx"],$_REQUEST["opx"],$_REQUEST["iden"],"rtn");
break; 



case  "137": // eliminar RTN
include_once '../../system/facturar/Facturar.php';
	$facturar = new Facturar; 
	$facturar->EliminarRtn($_REQUEST["iden"]);
break; 



case  "138": // eliminar RTN
include_once '../../system/facturar/Facturar.php';
	$facturar = new Facturar; 
	$facturar->AgregarCai($_POST["inicial"],$_POST["final"],$_POST["fechalimite_submit"],$_POST["cai"]);
	

break; 



case  "139": // eliminar RTN
include_once '../../system/facturar/Facturar.php';
	$facturar = new Facturar; 
	$facturar->EliminarCai($_REQUEST["iden"]);
	
break; 



case "150": // Imprimir Ticket
    require_once ('../ticket/autoload.php'); 
// busco que facura voy a ocupar
$user = $_SESSION["user"];
	if ($r = $db->select("impresora, clase", "facturar_users", 
		"WHERE tipo = ". $_REQUEST["tipo"] ." and user = '$user' and td = ".$_SESSION["td"]."")) {
		$impresora = $r["impresora"]; $clase = $r["clase"]; 
	} unset($r);  

	if($_REQUEST['tipo'] == 1){ // para ticket
		include_once '../../system/facturar/facturas/'.$_SESSION["td"].'/Ticket.php';
		$imprimir = new Ticket; 
		$imprimir->$clase(3,1,NULL,$impresora,6);//(tipo,numero,cambio,impresor,mesa)
	} // el tipo es 1 =  mesa, 2 = factura, 3 = cancela
		if($_REQUEST['tipo'] == 2){ // para factura
		include_once '../../system/facturar/facturas/'.$_SESSION["td"].'/Factura.php';
		$imprimir = new Factura;  // la mesa aqui es solo si es op 3 en el 1er para
		$imprimir->$clase(2,47,NULL,$impresora,null);//(tipo,numero,cambio,imp)
	}

break; 



case "159": 
include_once '../../system/reportes/Reporte.php';
$reporte = new Reporte;
	$reporte->ModalEspecial($_POST);
break; 



case  "160": // agragarUsuarios
include_once '../../system/reportes/Reporte.php';
include_once '../../system/gastos/Gasto.php';
include_once '../../system/historial/Historial.php';
	$reporte = new Reporte; 
	if($_POST["fecha_submit"] == NULL){ 
		$fecha = date("d-m-Y"); 
	} else { 
		$fecha = $_POST["fecha_submit"];
	}
	$reporte->Contenido($fecha);
break; 



case  "161": // ImprimirRanfo
$factura = $_REQUEST["factura"];
include_once '../../system/facturar/facturas/'.$_SESSION["td"].'/Impresiones.php';
    require_once ('../ticket/autoload.php'); 
      $fact = new Impresiones();
      

if($_SESSION["tx"] == 1){
	
	if($_REQUEST["inicio"] >= $_REQUEST["final"]){
		Alerts::Alerta("error","Error!","El numero inicial de factura debe ser menor a el numero final!");
	} else {
		


		$counter = 0;

		for ($x = $_REQUEST["inicio"]; $x <= $_REQUEST["final"]; $x++) {
			$counter = $counter + 1;

			$fact->Facturax(0, $x);
			// echo $x . "<br>";
		}

	$texto = "<br>Se estan imprimiendo las facturas desde la factura ".$_REQUEST["inicio"]." hasta la factura ".$_REQUEST["final"]." con un total de facturas de " . $counter . ". Por favor espere hasta que se hayan impreso todas las facturas.";
	Alerts::Mensaje($texto,"warning",NULL,NULL);
  }

	} else {
		Alerts::Alerta("error","Error!","Debe estar facturando para usar esta función!");
	}

break; 



case "162": // Imprimir contadora
	include_once '../../system/reportes/Reporte.php';
	include_once '../../system/historial/Historial.php';

	if($_POST["mes"] != NULL and $_POST["ano"] != NULL){
		$mes = $_POST["mes"];
		$ano = $_POST["ano"]; 	
	} else {
		$mes = date("m");
		$ano = date("Y");	
	}	

	$reporte = new Reporte; 
	$reporte->Contadora($mes, $ano);
break; 



case  "163": // Subir imagen negocio
		
include("../common/Imagenes.php");
	$imagen = new upload($_FILES['archivo']);
include("../common/ImagenesSuccess.php");
$imgs = new Success();

	if($imagen->uploaded) {
		if($imagen->image_src_y > 800 or $imagen->image_src_x > 800){ // si ancho o alto es mayir a 800
			$imagen->image_resize         		= true; // default is true
			$imagen->image_ratio        		= true; // para que se ajuste dependiendo del ancho definido
			$imagen->image_x              		= 700; // para el ancho a cortar
			$imagen->image_y              		= 700; // para el alto a cortar
		}
		$imagen->file_new_name_body   		= Helpers::TimeId(); // agregamos un nuevo nombre
		// $imagen->image_watermark      		= 'watermark.png'; // marcado de agua
		// $imagen->image_watermark_position 	= 'BR'; // donde se ub icara el marcado de agua. Bottom Right		
		$imagen->process('../../assets/img/logo/');	

		$imgs->SaveImagen($imagen->file_dst_name, $imagen->image_dst_x, $imagen->image_dst_y);
		$_SESSION['config_imagen'] = $imagen->file_dst_name; // cambio el logo de la variable
	} // [file_dst_name] nombre de la imagen
	else {
		Alerts::Alerta("error","Error!","Error: " . $imagen->error);
	  $imgs->VerImgNegocio("assets/img/logo/");
	}

break; 



case  "164": // comparar las versiones del sistema
	include_once '../../system/sync/Sync.php';
	$synchro = new Sync; 
	$synchro->ComparaVersiones();
break; 


// case "165": // actualizar sistema
// 	include_once '../../system/sync/Sync.php';
// 	$synchro = new Sync; 
// 	exec('C:\Windows\System32\cmd.exe /c START C:\AppServ\www\pizto\download.bat');
// 	$cambio = array();
//     $cambio["up_fecha"] = date("d-m-Y");
//     $cambio["up_hora"] = date("H:i:s");
//     Helpers::UpdateId("alter_opciones", $cambio, "td = ".$_SESSION["td"]."");
// 	$synchro->ComparaVersiones();
// break; 



case  "167": // dar seguimiento a materia prima
	include_once '../../system/productos/Producto.php';
	$productos = new Producto;
	$productos-> SeguirMateria($_REQUEST["cod"], $_REQUEST["iden"]);
	
break; 



case  "168": // borrar factura completa
include_once '../../system/facturar/Facturar.php';
	$facturar = new Facturar; 
	$facturar->BorrarFactura($_REQUEST["mesa"], $_REQUEST["num_fac"]);

include_once '../../system/tv/Pantallas.php';
	$pantalla = new Pantallas;
	$pantalla->EliminaControl($_REQUEST["mesa"]);
	$pantalla->Cambia(1);
break; 



case "170": 
include_once '../../system/gastos/Gasto.php';
	$gastos = new Gastos;
	$gastos->AddGasto($_POST);
break; 



case  "171": 
include_once '../../system/gastos/Gasto.php';
	$gastos = new Gastos;
	$gastos->BorrarGasto($_POST["iden"]);

break; 



case  "172":  // entrada de efectivo
include_once '../../system/gastos/Gasto.php';
	$gastos = new Gastos;
	$gastos->AddEfectivo($_POST);
break; 



case  "173": 
include_once '../../system/gastos/Gasto.php';
	$gastos = new Gastos;
	$gastos->BorrarEfectivo($_POST["iden"]);

break; 



case "174":
include("../common/Imagenes.php");
	$imagen = new upload($_FILES['archivo']);
include("../common/ImagenesSuccess.php");
$imgs = new Success();

	if($imagen->uploaded) {
		if($imagen->image_src_y > 800 or $imagen->image_src_x > 800){ // si ancho o alto es mayir a 800
			$imagen->image_resize         		= true; // default is true
			$imagen->image_ratio        		= true; // para que se ajuste dependiendo del ancho definido
			$imagen->image_x              		= 800; // para el ancho a cortar
			$imagen->image_y              		= 800; // para el alto a cortar
		}
		$imagen->file_new_name_body   		= Helpers::TimeId() . "-" . $_SESSION["td"]; // agregamos un nuevo nombre
		// $imagen->image_watermark      		= 'watermark.png'; // marcado de agua
		// $imagen->image_watermark_position 	= 'BR'; // donde se ub icara el marcado de agua. Bottom Right		
		$imagen->process('../../assets/img/gastosimg/');	

		$imgs->SaveGasto($_POST['codigo'], $imagen->file_dst_name, $_POST['descripcion']);

	} // [file_dst_name] nombre de la imagen
	else {
	  echo 'error : ' . $imagen->error;
	  $imgs->VerImagenGasto($_POST['codigo']);
	}	
break; 



case  "175": 
include("../common/ImagenesSuccess.php");
	$imgs = new Success();
	$imgs->VerImagenGasto($_REQUEST['gasto'], $_REQUEST['iden']);
	$imgs->ImagenesGasto($_REQUEST['gasto']);
break; 



case  "176": 
include("../common/ImagenesSuccess.php");
	$imgs = new Success();
	$imgs->VerImagenGasto($_REQUEST['gasto'], $_REQUEST['iden']);
	$imgs->ImagenesGasto($_REQUEST['gasto']);
break; 



case "189": // ver detalles del proveedor modal
include_once '../../system/proveedor/Proveedor.php';
	$proveedor = new Proveedores;
	$proveedor->VistaProveedor($_POST);
break;



case "190": // agregar proveedor
include_once '../../system/proveedor/Proveedor.php';
	$proveedor = new Proveedores;
	$proveedor->AddProveedor($_POST);
break;



case "191": // elimina proveedor
include_once '../../system/proveedor/Proveedor.php';
	$proveedor = new Proveedores;
	$proveedor->DelProveedor($_REQUEST["hash"]);
break;



case "192": // elimina proveedor desde liasta completa
include_once '../../system/proveedor/Proveedor.php';
	$proveedor = new Proveedores;
	$proveedor->DelProveedorx($_REQUEST["hash"]);
break;



case "193": // actualizar proveedor
include_once '../../system/proveedor/Proveedor.php';
	$proveedor = new Proveedores;
	$proveedor->UpProveedor($_POST);
break;


case "200": // busqueda de proveedores
include_once '../../system/cuentas/Cuentas.php';
	$cuenta = new Cuentas();
	$cuenta->AddCuenta($_POST);
break;



case "201": // ver todass las cuentas
include_once '../../system/cuentas/Cuentas.php';
	$cuenta = new Cuentas();
	$cuenta->VerCuentas($_POST["iden"], $_POST["orden"], $_POST["dir"]);
break;



case "202": // modal ver
include_once '../../system/cuentas/Cuentas.php';
	$cuenta = new Cuentas(); 
	$cuenta->VistaCuenta($_POST["cuenta"]);
break;



case "203": // cargar abonos
include_once '../../system/cuentas/Cuentas.php';
	$cuenta = new Cuentas(); 
	echo Helpers::Dinero($cuenta->TotalAbono($_REQUEST["cuenta"]));
break;



case "204": // cargar total
include_once '../../system/cuentas/Cuentas.php';
	$cuenta = new Cuentas(); 
	echo Helpers::Dinero($cuenta->ObtenerTotal($_REQUEST["cuenta"]) - $cuenta->TotalAbono($_REQUEST["cuenta"]));
break;



case "205": // agragar Abono
include_once '../../system/cuentas/Cuentas.php';
	$cuenta = new Cuentas(); 
	$cuenta->AddAbono($_POST);
break;



case "206": // Borrar Abono
include_once '../../system/cuentas/Cuentas.php';
	$cuenta = new Cuentas(); 
	$cuenta->DelAbono($_POST["hash"], $_POST["cuenta"]);
break;



case "208": // Borrar cuenta
include_once '../../system/cuentas/Cuentas.php';
	$cuenta = new Cuentas(); 
	$cuenta->DelCuenta($_POST["iden"]);
break;




case  "210": // Resumen meseros
	include_once '../../system/historial/Historial.php';
	$historial = new Historial;
	if($_POST["fecha1_submit"]){
		$inicio = $_POST["fecha1_submit"]; $fin=$_POST["fecha2_submit"];
	} else {
		$inicio = date("01-m-Y"); $fin=date("31-m-Y");
	}
	$historial->ResumenMeseros($inicio, $fin);

break; 


case "249": // Elimiar data del sistema
include_once '../../system/bdbackup/LimpiarData.php';
	$data = new DataClear();
	$data-> Clear();
break;




case "300": // agregar empleado
include_once '../../system/planilla/Planilla.php';
	$plan = new planilla;
	$plan->AddEmpleado($_POST);

break; 



case   "301": // eliminar empleado
include_once '../../system/planilla/Planilla.php';
	$plan = new planilla;
	$plan->DelEmpleado($_REQUEST["hash"], $_REQUEST["dir"]);

break; 



case  "302": // paginar empleado
include_once '../../system/planilla/Planilla.php';
	$plan = new planilla;
	$plan->VerTodosEmpleados($_POST["iden"], $_POST["orden"], $_POST["dir"]);
break; 



case  "303": //  carga de modal con detalles empleado
include_once '../../system/planilla/Planilla.php';
	$plan = new planilla;
	$plan->VerDetalles($_POST["key"]);
break; 



case  "304": //  actualizar empleado
include_once '../../system/planilla/Planilla.php';
	$plan = new planilla;
	$plan->UpEmpleado($_POST);
break; 



case  "305": // agrega extra
include_once '../../system/planilla/Planilla.php';
	$plan = new planilla;
	$plan->AddExtra($_POST);
break; 



case  "306": // agrega extra
include_once '../../system/planilla/Planilla.php';
	$plan = new planilla;
	$plan->VerTodasExtras($_POST["key"],NULL,1);
break; 



case  "307": // eliminar extra
include_once '../../system/planilla/Planilla.php';
	$plan = new planilla;
	$plan->DelExtra($_POST);
break; 



case  "308": // eliminar extra
include_once '../../system/planilla/Planilla.php';
	$plan = new planilla;
	$plan->AddPlanilla($_POST);
break; 



case  "309": // descuento
include_once '../../system/planilla/Planilla.php';
	$plan = new planilla;
	$plan->AddDescuento($_POST);
break; 



case  "310": // descuento
include_once '../../system/planilla/Planilla.php';
	$plan = new planilla;
	$plan->DelDescuento($_POST["hash"]);
break; 



case  "311": // select descuento
include_once '../../system/planilla/Planilla.php';
	$plan = new planilla;
	$plan->SelectDescuento($_POST["hash"]);
break; 



case  "312": // descuento
include_once '../../system/planilla/Planilla.php';
	$plan = new planilla;
	$plan->AddDescuentoAsig($_POST);
break; 



case  "313": // descuento
include_once '../../system/planilla/Planilla.php';
	$plan = new planilla;
	$plan->DelDescuentoAsig($_POST["hash"]);
break; 



case  "314": // paginar planillas
include_once '../../system/planilla/Planilla.php';
	$plan = new planilla;
	$plan->VerTodosPlanillas($_POST["iden"], $_POST["orden"], $_POST["dir"]);
break; 



case  "315": // agrega imagen de producto personalizada
include("../common/Imagenes.php");
	$imagen = new upload($_FILES['archivo']);
include("../../system/config_configuraciones/Config.php");
include("../../system/config_precios/Config.php"); // para cargar todos los productos
$imgs = new Config();

	if($imagen->uploaded) {
		if($imagen->image_src_y > 400 or $imagen->image_src_x > 400){ // si ancho o alto es mayir a 800
			$imagen->image_resize         		= true; // default is true
			$imagen->image_ratio        		= true; // para que se ajuste dependiendo del ancho definido
			$imagen->image_x              		= 400; // para el ancho a cortar
			$imagen->image_y              		= 400; // para el alto a cortar
		}
		$imagen->file_new_name_body   		= Helpers::TimeId(); // agregamos un nuevo nombre
	
		$imagen->process('../../assets/img/icoimg/');	
		$imgs->CambiarIcono('assets/img/icoimg/' . $imagen->file_dst_name, $_POST["codigo"]);
	} // [file_dst_name] nombre de la imagen
	else {
	  Alerts::Alerta("error","Error!","Error: " . $imagen->error);
	}

	$imgs->CrearIconos("../iconos/", 1);
break; 


case  "316": // agrega imagen de producto personalizada
include("../../system/config_configuraciones/Config.php");
include("../../system/config_precios/Config.php"); // para cargar todos los productos
$imgs = new Config();

$imgs->CambiarIcono($_POST["imagen"], $_POST["codigos"]);


	$imgs->CrearIconos("../iconos/", 1);
break; 



case "350": // crear back up
include_once '../../system/bdbackup/Backup.php';
	$back = new BackUp();
	$back-> AddRegistro($_POST["sistema"]);

break; 



case  "351": // crear back up
include_once '../../system/bdbackup/Backup.php';
	$back = new BackUp();
	$back->VerRespaldos("../../system/bdbackup/backup/" .$_SESSION["td"] . "/");

break; 



case  "352": // crear back up
include_once '../../system/bdbackup/Backup.php';
	$back = new BackUp();
	$back->Eliminar("../../system/bdbackup/backup/" .$_SESSION["td"] . "/", $_POST["data"]);
break; 



case  "353": // verifica solicitus
include_once '../../system/bdbackup/Backup.php';
	$back = new BackUp();
	$back->Search();
break; 



case "364": // agregar cliente
include_once '../../system/cliente/Cliente.php';
	$cliente = new Clientes;
	$_POST["nacimiento"] = $_POST["nacimiento_submit"];
	unset($_POST["nacimiento_submit"]);
	$cliente->AddCliente($_POST);
break; 



case  "365": // elimina cliente
include_once '../../system/cliente/Cliente.php';
	$cliente = new Clientes;
	$cliente->DelCliente($_REQUEST["hash"]);
break; 



case  "366": // elimina cliente desde liasta completa
include_once '../../system/cliente/Cliente.php';
	$cliente = new Clientes;
	$cliente->DelClientex($_REQUEST["hash"]);
break; 



case  "367": // actualizar cliente
include_once '../../system/cliente/Cliente.php';
	$cliente = new Clientes;
	$_POST["nacimiento"] = $_POST["nacimiento_submit"];
	unset($_POST["nacimiento_submit"]);
	$cliente->UpCliente($_POST);
break; 



case  "368": // ver cliente
include_once '../../system/cliente/Cliente.php';
	$cliente = new Clientes;
	$cliente->VistaCliente($_POST);
break; 



case  "370": // activa cobrar con tarjeta de credito
if($_SESSION["tcredito"] == "on"){
	unset($_SESSION["tcredito"]);
} else {
	$_SESSION["tcredito"] = "on";
	echo "on";
}
break; 


case  "371": // Aqui o para llevar
if($_SESSION["aquiLlevar"] == "on"){
	unset($_SESSION["aquiLlevar"]);
} else {
	$_SESSION["aquiLlevar"] = "on";
	echo "on";
}
include_once '../../system/ventas/Venta.php';
$ventas = new Venta;
$ventas->CambiarEdoMesa();
break; 


case  "372": // Imprimir Comanda
include_once '../../system/facturar/facturas/'.$_SESSION["td"].'/Impresiones.php';
    require_once ('../ticket/autoload.php'); 
$imprimir = new Impresiones();
$imprimir->Comanda();
Alerts::Alerta("success","Imprimiendo","Imprimiendo comanda para cocina");
break; 



case  "373": // carga el total e la venta
	include_once '../../system/ventas/Venta.php';
	$ventas = new Venta;
	$ventas->TotalFactura();
break; 



case  "374": // agrego el comentario a la ore y comanda
if($_POST["comentario"] != NULL){
	include_once '../../system/ventas/Venta.php';
	$ventas = new Venta;
	$ventas->AgregaComentario($_POST["comentario"]);
}
break; 



case  "375": // detalles del corte
	include_once '../../system/historial/Resumen.php';
	$resum = new Resumen;
	$resum->ResumenCorte($_REQUEST["hash"], $_REQUEST["corte"]);
// print_r($_REQUEST);
break; 




case "400": // agregar cliente
include_once '../../system/cliente/Cliente.php';
	$cliente = new Clientes;
	$_POST["nacimiento"] = $_POST["nacimiento_submit"];
	unset($_POST["nacimiento_submit"]);
	echo $cliente->AddCliente($_POST, 1);
break; 



case  "401": // busca cliente
include_once '../../system/delivery/Llevar.php';
	$deliver = new Llevar;
	$deliver->Busqueda($_POST);
break; 



case  "402": // activar mesa para delivery
include_once '../../system/ventas/Venta.php';
$ventas = new Venta;
$ventas->CrearMesa(1, 3);

///////////
if($_POST["hash"] != NULL){
	 $_SESSION["cad"] = $_POST["hash"];
}

if($_SESSION["mesa"] != NULL and $_SESSION["cad"] != NULL){
include_once '../../system/delivery/Llevar.php';
	$deliver = new Llevar;
	$deliver->AsignarCliente($_SESSION["mesa"], $_SESSION["cad"]);
}
//////////
$mesa = $_SESSION["mesa"];
unset($_SESSION["mesa"], $_SESSION["nclientes"], $_SESSION["cad"]);
echo '<script>
	window.location.href="?delivery&mesa='.$mesa.'"
</script>';
break; 



case "403": // busca cliente
include_once '../../system/delivery/Llevar.php';
	$deliver = new Llevar;
	$deliver->BusquedaAsig($_POST);
break; 



case  "404": // activar mesa para delivery
if($_POST["hash"] != NULL){
	 $_SESSION["cad"] = $_POST["hash"];
}

if($_SESSION["mesa"] != NULL and $_SESSION["cad"] != NULL){
include_once '../../system/delivery/Llevar.php';
	$deliver = new Llevar;
	$deliver->AsignarCliente($_SESSION["mesa"], $_SESSION["cad"]);
}
//////////
$mesa = $_SESSION["mesa"];
unset($_SESSION["mesa"], $_SESSION["cad"]);
echo '<script>
	window.location.href="?delivery&mesa='.$mesa.'"
</script>';
break; 



case  "405": // desvincular cliente
include_once '../../system/delivery/Llevar.php';
	$deliver = new Llevar;
	$deliver->DesvincularCliente($_POST["hash"]);

//////////
$mesa = $_SESSION["mesa"];
unset($_SESSION["mesa"], $_SESSION["cad"]);
echo '<script>
	window.location.href="?delivery&mesa='.$mesa.'"
</script>';
break; 



case  "406": // modal botones opciones
include_once '../../system/delivery/Llevar.php';
	$deliver = new Llevar;
	$deliver->BotonesOpciones($_POST);
break; 



case  "407": // modalpara edo
include_once '../../system/delivery/Llevar.php';
	$deliver = new Llevar;
	$deliver->ModalEdo();
break; 



case  "408": // agrega cambio de edo
include_once '../../system/delivery/Llevar.php';
	$deliver = new Llevar;
	$deliver->AddEdo($_REQUEST["edo"]);
break; 



case  "409": // agrega cambio de edo
include_once '../../system/delivery/Llevar.php';
	$deliver = new Llevar;
	$deliver->MensajeEdoBlock();
break; 



case  "410": // busca repartidor
include_once '../../system/delivery/Llevar.php';
	$deliver = new Llevar;
	$deliver->BusquedaRepartidor($_POST);
break; 


case  "411": // activar repartidor a mesa
include_once '../../system/delivery/Llevar.php';
	$deliver = new Llevar;
	$deliver->AsignarRepartidor($_POST["hash"]);
	echo '<script>
	window.location.href="?delivery&mesa='.$_SESSION["mesa"].'"
	</script>';
break; 


case  "412": // add repartidor
include_once '../../system/delivery/Llevar.php';
	$deliver = new Llevar;
	
	if($deliver->AddRepartidor($_POST) == TRUE){
		Alerts::Alerta("success","Realizado!","Cambio realizado corectamente!");
		echo '<script>
		window.location.href="?delivery&mesa='.$_SESSION["mesa"].'"
		</script>';
	} else {
		Alerts::Alerta("error","Error!","Ocurrio algo!");
	}
break; 



case  "413": // desvincular repartidor
include_once '../../system/delivery/Llevar.php';
	$deliver = new Llevar;
	$deliver->DelRepartidor();

echo '<script>
	window.location.href="?delivery&mesa='.$_SESSION["mesa"].'"
</script>';
break; 



case  "414": // ver listado de propinas
include_once '../../system/delivery/Llevar.php';
	$deliver = new Llevar;
	$deliver->VerListaEnvios();
break; 



case  "415": // ver listado de propinas
include_once '../../system/delivery/Llevar.php';
	$deliver = new Llevar;
	$deliver->AddEnvio($_POST);
break; 







} // termina switch














/////////
$db->close();
?>