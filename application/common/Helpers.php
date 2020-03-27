<?php
class Helpers{

    public function __construct(){

    } 


    public static function ServerDomain(){
          if($_SERVER["SERVER_NAME"] == "pizto.com" 
          or $_SERVER["SERVER_NAME"] == "www.pizto.com"
          or $_SERVER["SERVER_NAME"] == "superpollo.net"
          or $_SERVER["SERVER_NAME"] == "www.superpollo.net"){
            return TRUE;
          } else {
            return FALSE;
          }
    }

    public static function IsAdmin(){ // verifica si es administrador del sistema
          if($_SESSION["tipo_cuenta"] == 1 and $_SESSION["td"] == 0){
            return TRUE;
          } else {
            return FALSE;
          }
    }

    static public function ServerDemo(){
      $direccion = dirname(__FILE__);
        if (strpos($direccion, 'demo') !== false) {
           return TRUE;
        } else { 
          return FALSE; 
        }  
    }

    static public function ServerPractica(){
      $direccion = dirname(__FILE__);
        if (strpos($direccion, 'practica') !== false) {
           return TRUE;
        } else { 
          return FALSE; 
        }  
    }

    public function Gasto($string) {
    if($string == "1") return '<p class="text-danger font-weight-bold">Compra No Facturado</p>';
    if($string == "2") return '<p class="text-success font-weight-bold">Compra con Factura</p>';
    if($string == "3") return '<p class="text-info font-weight-bold">Remesas</p>';
    
    if($string == "4") return '<p class="text-primary font-weight-bold">Adelanto a personal</p>';
    if($string == "5") return '<p class="text-warning font-weight-bold">Cheques</p>';
    }



    static public function VerTipoSync($tipo) {
    if($tipo == "1") return '<p class="text-danger font-weight-bold">Corte</p>';
    if($tipo == "2") return '<p class="text-success font-weight-bold">Configuracion</p>';
    if($tipo == "3") return '<p class="text-warning font-weight-bold">Todo</p>'; 
    if($tipo == "4") return '<p class="text-primary font-weight-bold">Sync BD</p>';
    if($tipo == "5") return '<p class="text-info font-weight-bold">Sync Upload</p>';
    }


        public function InOut($string) {
    if($string == "1") return '<p class="text-success font-weight-bold">Entrada</p>';
    if($string == "2") return '<p class="text-danger font-weight-bold">Salida</p>';
    }


    static public function Pais($string) {
        if($string == "1") return 'El Salvador';
        if($string == "2") return 'Honduras';
        if($string == "3") return 'Guatemala';
    }



    public function UserName($tipo){
        if($tipo == 1) return "Root";
        if($tipo == 2) return "Administrador";
        if($tipo == 3) return "Usuario";
        if($tipo == 4) return "Pantalla";
        if($tipo == 5) return "Gerencia";
    }




    public function Signo($string) {
    if($string == "1") return '+';
    if($string == "2") return '-';
    }

   public static function Mesa($clientes) {
    if($clientes == "1") return 'mesa1.jpg';
    if($clientes == "2") return 'mesa2.jpg';
    if($clientes == "3") return 'mesa3.jpg';
    if($clientes == "4") return 'mesa4.jpg';
    if($clientes == "5") return 'mesa5.jpg';
    if($clientes == "6") return 'mesa6.jpg';
    if($clientes > "6") return 'mesax.jpg';
    } 

    public static function Color($elemento){
    if(substr($elemento, -1) == "1") $color="light-blue lighten-5";
    if(substr($elemento, -1) == "2") $color="deep-orange lighten-5";
    if(substr($elemento, -1) == "3") $color="brown lighten-5";
    if(substr($elemento, -1) == "4") $color="cyan lighten-5";
    if(substr($elemento, -1) == "5") $color="blue-grey lighten-5";
    if(substr($elemento, -1) == "6") $color="red lighten-5";
    if(substr($elemento, -1) == "7") $color="cyan lighten-4";
    if(substr($elemento, -1) == "8") $color="deep-purple lighten-5";
    if(substr($elemento, -1) == "9") $color="orange lighten-5";
    if(substr($elemento, -1) == "0") $color="purple lighten-5";
     return $color;
    }


    public function Mayusculas($nombre){
        return ucwords(strtolower($nombre));
    }

    public function MayusInicial($nombre){
    return ucfirst(strtolower($nombre));
    }


    public function Dinero($numero){  
        $format= $_SESSION['config_moneda_simbolo'] ." " . number_format($numero,2,'.',',');
        return $format;
     } 


    public function format($numero){ 
        $format=number_format($numero,2,'.',',');
        return $format;
     } 

    public function Entero($numero){ 
        $format=intval($numero);
        return $format;
     } 

    
    public function STotal($numero, $impuestos){  
        $imp = ($impuestos / 100)+1;
        $st = $numero / $imp;
        return $st;
     } 


    public function Impuesto($numero, $impuestos){  
        $imp = $impuestos / 100;
        return $numero * $imp;
    } 


    public function Propina($numero){ 
        $num = $_SESSION['config_propina'] / 100;
        $propina = $numero * $num;
        return $propina;
    }

    public function PropinaTotal($numero){ 
        $num = $_SESSION['config_propina'] / 100;
        $propina = $numero * $num;
        $numer = $propina + $numero;
        return $numer;
    }


    public function NFactura($numero){ 
        $numero1=str_pad($numero, 8, "0", STR_PAD_LEFT);
        $format="000-001-01-$numero1";
        return $format;
     } 





///////////// para usos de control de usuario ////////
    public function GetIp(){
        // Intentamos primero saber si se ha utilizado un proxy para acceder a la página,
            // y si éste ha indicado en alguna cabecera la IP real del usuario.
            if (getenv('HTTP_CLIENT_IP')) {
              $ip = getenv('HTTP_CLIENT_IP');
            } elseif (getenv('HTTP_X_FORWARDED_FOR')) {
              $ip = getenv('HTTP_X_FORWARDED_FOR');
            } elseif (getenv('HTTP_X_FORWARDED')) {
              $ip = getenv('HTTP_X_FORWARDED');
            } elseif (getenv('HTTP_FORWARDED_FOR')) {
              $ip = getenv('HTTP_FORWARDED_FOR');
            } elseif (getenv('HTTP_FORWARDED')) {
              $ip = getenv('HTTP_FORWARDED');
            } else {
              // Método por defecto de obtener la IP del usuario
              // Si se utiliza un proxy, esto nos daría la IP del proxy
              // y no la IP real del usuario.
              $ip = $_SERVER['REMOTE_ADDR'];
            }

            return $ip;
    }



    public function ObtenerNavegador($user_agent) {
     $navegadores = array(
          'Opera' => 'Opera',
          'Mozilla Firefox'=> '(Firebird)|(Firefox)',
          'Galeon' => 'Galeon',
          'Google Chrome' => 'Chrome',
          'Mozilla'=>'Gecko',
          'MyIE'=>'MyIE',
          'Lynx' => 'Lynx',
          'Netscape' => '(Mozilla/4\.75)|(Netscape6)|(Mozilla/4\.08)|(Mozilla/4\.5)|(Mozilla/4\.6)|(Mozilla/4\.79)',
          'Konqueror'=>'Konqueror',
          'Internet Explorer 7' => '(MSIE 7\.[0-9]+)',
          'Internet Explorer 6' => '(MSIE 6\.[0-9]+)',
          'Internet Explorer 5' => '(MSIE 5\.[0-9]+)',
          'Internet Explorer 4' => '(MSIE 4\.[0-9]+)',
            );
            foreach($navegadores as $navegador=>$pattern){
                   if (eregi($pattern, $user_agent))
                   return $navegador;
                }
            return 'Desconocido';
            }





////////////////////////////// Nuevos Hash
public static function HashId(){
  $id = $_SESSION["td"] . "-" . date("d-m-Y-H:i:s") . rand(1,999999999);
  $iden = sha1($id);
  $hash = substr($iden,0,10);
  return $hash;
}


public static function TimeId(){
  $id = strtotime(date("H:i:s"));
  return $id;
}


public static function DeleteId($tabla, $condicion){
  $db = new dbConn();
      if($_SESSION["root_plataforma"] == 0 and $_SESSION['root_tipo_sistema'] != 0){
        $a = $db->query("SELECT hash FROM {$tabla} WHERE {$condicion}"); 
        foreach ($a as $b) {
              $datos = array();
              $datos["tabla"] = $tabla;
              $datos["hash"] = $b["hash"];
              $datos["time"] = self::TimeId();
              $datos["action"] = 1;
              $datos["td"] = $_SESSION["td"];
              $db->insert("sync_tables_updates", $datos);
              if($db->delete($tabla, "WHERE {$condicion}")){
                return TRUE;
              } else {
                return FALSE;
              }
          unset($datos);
        } $a->close();
      } else {
            if($db->delete($tabla, "WHERE {$condicion}")){
                return TRUE;
              } else {
                return FALSE;
              }
      }
}


public static function UpdateId($tabla, $dato, $condicion){
  $db = new dbConn(); // dato actualzar y datos insertar
      if($_SESSION["root_plataforma"] == 0 and $_SESSION['root_tipo_sistema'] != 0){
        $a = $db->query("SELECT hash FROM {$tabla} WHERE {$condicion}"); 
        foreach ($a as $b) {
              $datos = array();
              $datos["tabla"] = $tabla;
              $datos["hash"] = $b["hash"];
              $datos["time"] = self::TimeId();
              $datos["action"] = 2;
              $datos["td"] = $_SESSION["td"];

              /// verifico si hay registro, lo actualizao, sino  lo agrego
              $reg = $db->query("SELECT * FROM sync_tables_updates WHERE tabla = '$tabla' and hash = '".$b["hash"]."' and td = ".$_SESSION["td"]."");
              if($reg->num_rows == 0){
                $db->insert("sync_tables_updates", $datos);
              } else {
                $datopre["time"] = self::TimeId();
                $db->update("sync_tables_updates", $datopre, "WHERE tabla = '$tabla' and hash = '".$b["hash"]."' and td = ".$_SESSION["td"]."");
              } $reg->close();
               /// con esto nada mas se registra una vez           


              $dato["time"] = self::TimeId();
              if($db->update($tabla, $dato, "WHERE {$condicion}")){
                return TRUE;
              } else {
                return FALSE;
              }
          unset($datos);
        } $a->close(); // foreach

      } else { // si es web solo actualizo y ya
            $dato["time"] = self::TimeId();
            if($db->update($tabla, $dato, "WHERE {$condicion}")){
                return TRUE;
              } else {
                return FALSE;
              }
      }  
}










} // class
?>