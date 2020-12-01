<?
include_once '../common/Helpers.php';
include_once 'variables_db.php';
include_once '../common/Mysqli.php';
$db = new dbConn();
include_once '../includes/DataLogin.php';
$seslog = new Login();
$seslog->sec_session_start();
include_once '../common/Encrypt.php';
include_once '../common/Alerts.php';
include_once '../common/Fechas.php';
include_once '../../system/corte/Corte.php';
include_once '../../system/sync/Sync.php';
include_once '../../system/index/Inicio.php';
include_once '../../system/config_configuraciones/Config.php';

if($_SESSION['username'] == NULL){
header("location: logout.php");
exit();
}

if ($seslog->login_check() == TRUE) {

$user=$_SESSION['username'];
$_SESSION["ver_avatar"] = NULL;

// para eliminar las variables de login admin
unset($_SESSION["session_unluck"], $_SESSION["login_admin"]);


	function UserInicio($user){
        $db = new dbConn();
            if ($r = $db->select("*", "login_userdata", "WHERE user = '$user' limit 1")) { 
            $_SESSION['nombre'] = $r["nombre"];
            $_SESSION['tipo_cuenta'] = $r["tipo"];
            $_SESSION['tkn'] = $r["tkn"];
            $_SESSION['avatar'] = $r["avatar"];
            $_SESSION['user'] = $user;
            $_SESSION['td'] = $r["td"];
            $_SESSION['secret_key'] = md5($r["td"]);

            } unset($r);



// antes de seguir debo revisar si exixten datos en el sistema de este usuario
// si no hay datos, debo redirigirlo a la pantalla de config para que los llene
// de igual manera si estan incompletos y el sistema no puede continuar, debe llenarlos
            VerificaUso();
            BuscaDatosSistema();
            VerificaOpciones(); 
/// continua con el login normal
        
        $configuracion = new Config;
        $configuracion->CrearVariables(); // creo el resto de variables del sistema


// si es mesero lo inicio en mesas
if($_SESSION["tipo_cuenta"] == 6){
    $_SESSION["tipo_inicio"] = 2;
}
$_SESSION["aquiLlevar"] = "on";

        // verifica apertura de caja
        VerificaAperturaCaja();


        // Aqui revisare si quedo la ultima mesa sin productos (se elimino los sql para meterlos)
            VerificaMesa();
            VerificaMesaRapida();
        //////////////
        $inicia = new Inicio;
        $inicia->CompruebaIconos("../iconos/", NULL); // creo iconos si no exite el archivo
               
       $inicia->Caduca(); // revisa si ha caducado
       // BuscaRespaldo(); // revisa sy hay respaldos imcompletos

	       if(Helpers::ServerDomain() == TRUE and $_SESSION['tipo_cuenta'] != 1){ // registro entrada en web
	       	@$inicia->RegisterInOut(1);
	       }

           header("location: ../../");   
       }



    // function BuscaRespaldo(){
        
    //     $sync = new Sync;
    //     $corte = new Corte;        
    //     $fechas = new Fechas;

    //     $dia=5;
    //     for ($x = 1; $x <= $dia; $x++) {
    //             $dias = $fechas->DiaResta(date("d-m-Y"),$x);
    //          // sin no hay corte, no hay respaldo y si hay datos  
    //          if($sync->BuscaRespaldo($dias) == 0 and $corte->BuscaCorte($dias) == 0 and $sync->VerificarDatos($dias) == "Si"){
    //             header("location: ../../?respaldos&msj");
    //          } else {
    //             header("location: ../../");
    //          }
    //      }   
        

    // }

    function BuscaDatosSistema(){
        $db = new dbConn();

            if ($r = $db->select("*", "config_master", "WHERE td = " . $_SESSION['td'])) { 
                if($r["cliente"] == NULL or $r["moneda"] == NULL){
                        $_SESSION['nodatainicial'] = md5($_SESSION['td']); // es para los que no llena datos 
                      header("location: ../../?modal=conf_config&inicio");
                       exit();
                }  
            } unset($r); 
    }

    function VerificaUso(){
        $db = new dbConn();

            $a = $db->query("SELECT * FROM images WHERE td = " . $_SESSION['td']);
            if($a->num_rows == 0){
               $_SESSION['sinuso'] = TRUE; 
            }
            $a->close();

    }


    function VerificaMesa(){
        $db = new dbConn();

    $a = $db->query("SELECT mesa FROM mesa WHERE estado = 1 and user = '".$_SESSION["user"]."' and td = ".$_SESSION["td"]."");

        if($a->num_rows > 0){
            include_once '../../system/ventas/Venta.php'; 
            foreach ($a as $b) {    
                    
                    if(Venta::VerProductosMesa($b["mesa"]) == NULL){
                      Helpers::DeleteId("mesa", "estado = 1 and mesa = '".$b["mesa"]."' and user = '".$_SESSION["user"]."' and td = " . $_SESSION["td"]);
                    }

            } 
        } $a->close();

    }



// verifico y elimino mesas rapidas del usuario y no se completaron

    function VerificaMesaRapida(){
        $db = new dbConn();

    $a = $db->query("SELECT mesa FROM mesa WHERE tipo = 1 and estado = 1 and user = '".$_SESSION["user"]."' and td = ".$_SESSION["td"]."");

        if($a->num_rows > 0){
            include_once '../../system/ventas/Venta.php'; 
            foreach ($a as $b) {    

            Helpers::DeleteId("mesa", "estado = 1 and mesa = '".$b["mesa"]."' and user = '".$_SESSION["user"]."' and td = " . $_SESSION["td"]);

            Helpers::DeleteId("ticket_temp", "num_fac = 0 and tx = '".$b["tx"]."' and mesa = '".$b["mesa"]."' and user = '".$_SESSION["user"]."' and td = " . $_SESSION["td"]);
            } 
        } $a->close();

    }



    function VerificaOpciones(){ // determina si el sistema tiene opciones activas para mostrar o no el boton modificar opciones
        $db = new dbConn();

            $a = $db->query("SELECT * FROM opciones WHERE td = " . $_SESSION['td']);
            if($a->num_rows == 0){
               $_SESSION['opcionesactivas'] = FALSE; 
            } else {
              $_SESSION['opcionesactivas'] = TRUE;  
            }
            $a->close();
    }



    function VerificaAperturaCaja(){ // verifica cuando se aperturo la caja
        $db = new dbConn();
        $corte = new Corte();

            if($_SESSION["config_o_tipo_corte"] == 0 or $_SESSION["config_o_tipo_corte"] == NULL){
                if($corte->UltimaFecha() != date("d-m-Y")){
                        // pongo activa la caja
                        $cambio = array();
                        $cambio["actualizar"] = 1;
                        Helpers::UpdateId("alter_opciones", $cambio, "td = ".$_SESSION["td"]."");
                        //
                }
            }
    }





UserInicio($user);

} else {
   header("location: logout.php");
    exit(); 
}
?>