<?php 
class Fechas{

	public function __construct(){

	}

	
	public function DiasPendientes($iden){ // iden del contrato solo para usuarios nuevos
    	$db = new dbConn();
    	
    if ($r = $db->select("activacionF, proximo_pagoF", "contratos", "WHERE id = '$iden'")) { 
        $activacion = $r["activacionF"];
        $fpago = $r["proximo_pagoF"];
	    } unset($r);  

	    $consumo = $fpago - $activacion; 
	    $consumo = $consumo / 86400;
        return $consumo;
    }


    public function SiguientePago($fecha){ // fecha completa de cobro
        $dia=substr($fecha,0,2);
        $mes=substr($fecha,3,2);
        $anio= date("Y");
        $mes = $mes + 1;
        
        if($mes > 12) { 
        $mes = "01"; 
        $anio = 1 + date("Y");
        }
        return $dia . "-" . $mes . "-" . $anio;
    }

    public function DiaSiguiente($fecha){ // fecha completa de cobro
        return date("d-m-Y", strtotime($fecha."+ 1 days")); 
    }

    public function DiaAnterior($fecha){ // dia anterior  
        return date("d-m-Y", strtotime($fecha."- 1 days"));
    }

    public function DiaResta($fecha,$dias){ // dia anterior 
            return date("d-m-Y", strtotime($fecha."- ".$dias." days")); 
    }

    public function DiaSuma($fecha,$dias){ // dia siguiente 
            return date("d-m-Y", strtotime($fecha."+ ".$dias." days")); 
    }    

    public function MesResta($fecha,$meses){ // mes anterior (lleva fecha entera de entrada)
            return date("m-Y", strtotime($fecha."- ".$meses." month")); 
    }
    public function MesSuma($fecha,$meses){ // mes anterior (lleva fecha entera de entrada)
            return date("m-Y", strtotime($fecha."+ ".$meses." month")); 
    }


    public function NombreDia($fecha){ // nombre del dia segun fecha 
            $fecha = strtotime($fecha); //a timestamp 

            switch (date('w', $fecha)){ 
                case 0: return "Domingo"; break; 
                case 1: return "Lunes"; break; 
                case 2: return "Martes"; break; 
                case 3: return "Miercoles"; break; 
                case 4: return "Jueves"; break; 
                case 5: return "Viernes"; break; 
                case 6: return "Sabado"; break; 
            }  
    }

    public function FechaPagoProximo($fecha){ // usuarios nuevos
        
        if($fecha < date("d")) { 
        $pmes = 1 + date("m"); $ano = date("Y"); }
        else { 

        $pmes = date("m"); $ano = date("Y");
            if($pmes > 12) { 
            $pmes = "01"; 
            $ano = 1 + date("Y");
            }
        }
        return $fecha . "-" . $pmes . "-" . $ano;
    }


    public function MesPago($fecha){ // saca el mes que se esta cancelando
        $mes=substr($fecha,3,2);
        return $mes;  
    }

    public function DiaFecha($fecha){ // saca eldia de una fecha
        $dia=substr($fecha,0,2);
        return $dia;  
    }



     public static function Format($fecha){  
        $format=strtotime($fecha);
        return $format;
     }

     public static function FechaEscrita($fecha) {  
        $dia=substr($fecha,0,2);
        $mes=substr($fecha,3,2);
        $anio=substr($fecha,6,4);
      
        switch ($mes){
            case '01':
            $mes="Enero";
            break;
            case '02':
            $mes="Febrero";
            break;
            case '03':
            $mes="Marzo";
            break;
            case '04':
            $mes="Abril";
            break;
            case '05':
            $mes="Mayo";
            break;
            case '06':
            $mes="Junio";
            break;
            case '07':
            $mes="Julio";
            break;
            case '08':
            $mes="Agosto";
            break;
            case '09':
            $mes="Septiembre";
            break;
            case '10':
            $mes="Octubre";
            break;
            case '11':
            $mes="Noviembre";
            break;
            case '12':
            $mes="Diciembre";
            break;
        }
        $fecha=$dia." de ".$mes." de ".$anio;
        return $fecha; 
    }


public static function MesEscrito($fecha) {  
        $mes=substr($fecha,0,2);
              
        switch ($mes){
            case '01':
            $mes="Enero";
            break;
            case '02':
            $mes="Febrero";
            break;
            case '03':
            $mes="Marzo";
            break;
            case '04':
            $mes="Abril";
            break;
            case '05':
            $mes="Mayo";
            break;
            case '06':
            $mes="Junio";
            break;
            case '07':
            $mes="Julio";
            break;
            case '08':
            $mes="Agosto";
            break;
            case '09':
            $mes="Septiembre";
            break;
            case '10':
            $mes="Octubre";
            break;
            case '11':
            $mes="Noviembre";
            break;
            case '12':
            $mes="Diciembre";
            break;
        }
        
        return $mes; 
    }








}
?>