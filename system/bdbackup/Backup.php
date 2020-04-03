<?php 
class BackUp{

  public function __construct() { 
     } 



  public function Crear(){
    $db = new dbConn();

    $dir = $this->Tablas();

foreach ($dir as $key => $tabla) {
  //////////////////////        
    $s = $db->query("SELECT * FROM $tabla WHERE td = ".$_SESSION["td"]."");
    foreach ($s as $y){ 

    $archivo.= "INSERT INTO $tabla VALUES(";
      // especifico los campos
        $fields = $db->listFields($tabla);
        $arrlength = count($fields);
        for($x = 0; $x < $arrlength; $x++) {
            $campo = $fields[$x]['name'];
  

  if($arrlength != $x+1) $archivo.= "\"" .$y["$campo"] . "\",";
  else $archivo.= "\"" . $y["$campo"] . "\"";

        }
    $archivo.= "); \n";

    }
     $s->close();
/////////////////////////////////


} /// termina recorrido de directorios

    if($archivo != NULL){

      // verifico si existe la carpeta. sino la creo
      if(!is_dir("../../system/bdbackup/backup/" .$_SESSION["td"] . "/")){
        mkdir("../../system/bdbackup/backup/" .$_SESSION["td"] . "/");

        $gitarch = fopen("../../system/bdbackup/backup/" .$_SESSION["td"] . "/" . ".gitkeep",'w+');
        fwrite($gitarch,"");
        fclose($gitarch);
      }

      $filename = "Backup-" . date("d-m-Y") . "-" . date("His");
      $ext =  ".piz";

      $handle = fopen("../../system/bdbackup/backup/" .$_SESSION["td"] . "/" . $filename . $ext,'w+');
      
      if(fwrite($handle,$archivo)){
        
        echo "<br>";
        echo '<a href="downloader.php?data='. $filename . $ext .'&name='. $filename .'&type=1"><i class="fas fa-cloud-download-alt fa-5x red-text"></i><br>Descargar
      </a>';
  
       }

     fclose($handle);

    } 


}//



public function Tablas(){
  $dir  = array(
"alter_materiaprima_reporte", 
"alter_opciones", 
"alter_producto_reporte", 
"categorias", 
"config_master", 
"config_root", 
"control_cocina", 
"control_panel_mostrar", 
"corte_diario", 
"entradas_efectivo", 
"facturar_cai", 
"facturar_impresora", 
"facturar_rtn", 
"facturar_rtn_cliente", 
"facturar_ticket", 
"facturar_users", 
"gastos", 
"gastos_images", 
"images", 
"mesa", 
"mesa_nombre", 
"opciones", 
"opciones_asig", 
"opciones_name", 
"opciones_ticket", 
"planilla_descuentos", 
"planilla_descuentos_asig", 
"planilla_empleados", 
"planilla_extras", 
"planilla_pagos", 
"precios", 
"producto", 
"productos_venta_especial", 
"pro_asignado", 
"pro_bruto", 
"pro_dependiente", 
"pro_historial_addpro", 
"pro_historial_averias", 
"pro_registro_averia", 
"pro_registro_up", 
"pro_unidades_medida", 
"sync_tabla", 
"sync_tables_updates", 
"sync_up", 
"sync_up_cloud", 
"ticket", 
"ticket_num", 
"ticket_propina", 
"ticket_temp"); // directorios a recorrer

  return $dir;
}




public function VerRespaldos($url){

      $num = 0;
      $archivos = array_reverse(glob($url . "*.piz"));  
      foreach($archivos as $file){  
        $num ++;
        $size = $this->FileZ($file); 
        $filename = str_replace($url, "", $file);
        $data = str_replace(".piz", "", $filename);
      $output .= '
           <tr>
             <th scope="row">'.$num.'</th>
             <td>' . $data . '</td>
             <td>' . $size . '</td>
             <td>
             <a href="downloader.php?data='. $filename . $ext .'&name='. $data .'&type=1" class="btn btn-indigo btn-sm m-0">Descargar
            </a>
             </td>
             <td>
               <a id="eliminar" data="'. $filename . $ext .'" ><i class="fas fa-ban fa-lg red-text"></i><br></a>
             </td>
           </tr>';
      }


      echo '<table class="table table-striped table-responsive-md btn-table">

   <thead>
     <tr>
       <th>#</th>
       <th>Respaldo</th>
       <th>Size</th>
       <th>Descargar</th>
       <th>Eliminar</th>
     </tr>
   </thead>

   <tbody>';

       echo $output;

  echo '</tbody>

</table>';

}


public function FileZ($archivo){

    $archivox = filesize($archivo);

  if($archivox < 1024){
    $file = filesize($archivo) . " Kbi";
  }
  if($archivox > 1023 and $archivox < 1024000){
    $file = round(filesize($archivo) / 1024) . " Kb";
  }
  if($archivox > 1024000){
    $file = filesize($archivo) . " Mb";
  }

  return $file;
}




public function Eliminar($url, $archivo){

  if(unlink($url . $archivo)){
    Alerts::Alerta("success","Eliminado Correctamente","Respaldo eliminado correctamente");
  }

}









}// class
?>