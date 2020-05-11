<?php
include_once 'application/common/Alerts.php';
$factura = $_REQUEST["factura"];
?>
<div class="modal" id="<? echo $_GET["modal"]; ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"  data-backdrop="false">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">
          Factura No. <?php echo $factura ?></h5>
      </div>
      <a href="?">
      <div class="modal-body">
<!-- ./  content -->
<?php 
/// verifico si existe la mesa antes de continuar
$ver_mesa = $db->query("SELECT num_fac FROM ticket_temp WHERE num_fac = '$factura' and edo = 1 and tx = ". $_SESSION["tx"]." and td = ". $_SESSION["td"]."");
if($ver_mesa->num_rows){
////



 $a = $db->query("SELECT sum(stotal) , sum(imp), sum(total) FROM ticket_temp WHERE num_fac = '$factura' and tx = ".$_SESSION["tx"]." and td = ".$_SESSION["td"].""); 

    foreach ($a as $b) {
        $stotal=$b["sum(stotal)"];
        $imp=$b["sum(imp)"];
        $total=$b["sum(total)"];
    } $a->close();
//////////////////

/// define las variables finales

if($_SESSION['config_propina'] != 0.00){ ///  prara agregarle la propina
 $prop = ' | Propina '.$_SESSION['config_propina'].'% : '. Helpers::Dinero(Helpers::Propina($total));
 $total = Helpers::PropinaTotal($total);
}
if($_REQUEST["efectivo"]==NULL){ $efectivo = $total; } else { $efectivo = $_REQUEST["efectivo"];}

$cambio = $efectivo - $total;

echo '<p class="text-center">Sub Total: '. Helpers::Dinero($stotal) .' ||  Impuestos: '. Helpers::Dinero($imp) . $prop .'</p>';

echo '<p class="text-center font-weight-bold">TOTAL:</p>';
echo '<div class="display-4 text-center font-weight-bold">'. Helpers::Dinero($total) .'</div> <hr>';

echo '<p class="text-center font-weight-bold">EFECTIVO:</p>';
echo '<div class="display-4 text-center font-weight-bold">'. Helpers::Dinero($efectivo) .'</div> <hr>';

echo '<p class="text-center text-danger font-weight-bold">CAMBIO:</p>'; 
echo '<div class="display-4 text-danger text-center font-weight-bold">'. Helpers::Dinero($cambio) . '</div>'; 


if($_SESSION["noimprimir"] == NULL){ // sino viene null hay que sacar la factura



//////// verifico si es local o web


if($_SESSION["tx"] == 0){

    if ($r = $db->select("ax0, bx0", "facturar_opciones", "WHERE td = ".$_SESSION["td"]."")) { 
        $ax0 = $r["ax0"]; $bx0 = $r["bx0"];
    } unset($r);  

if($ax0 == 1 or $bx0 == 1){
    include_once 'system/facturar/facturas/'.$_SESSION["td"].'/Impresiones.php';
    $imprimir = new Impresiones; 

      if($ax0 == 1){
        $imprimir->Ticket($_REQUEST["efectivo"], $factura);
         //(tipo,numero,cambio,impresor,mesa,factura_o_tiket)
      }
      if($bx0 == 1){
         $imprimir->Factura($_REQUEST["efectivo"], $factura);
         //(tipo,numero,cambio,impresor,mesa,factura_o_tiket)
      }


}


} else {
    
    if ($r = $db->select("ax1, bx1", "facturar_opciones", "WHERE td = ".$_SESSION["td"]."")) { 
        $ax1 = $r["ax1"]; $bx1 = $r["bx1"];
    } unset($r);  
 
     if($bx1 == 1 or $bx1 == 1){
        include_once 'system/facturar/facturas/'.$_SESSION["td"].'/Impresiones.php';
        $imprimir = new Impresiones; 

        if($ax0 == 1){
           $imprimir->Ticket($_REQUEST["efectivo"], $factura);
        }
        if($bx0 == 1){
           $imprimir->Factura($_REQUEST["efectivo"], $factura);
        }

    } 


}



/// termina local o web



}  /// termina si no es null

    if($_SESSION["noimprimir"] == 1){ unset($_SESSION["noimprimir"]); } /// elimino la opcion de no imprimir
    // elimino los rtn
    if($_SESSION["rtn"] != NULL and $_SESSION["cliente"] != NULL){
        unset($_SESSION["cliente"]);
        unset($_SESSION["rtn"]); }





///////////// termina factura
} else {
 Alerts::Error404("Este pedido ya no existe, posiblemente ha sido cobrado o eliminado!");
} $ver_mesa->close();
 ?> 


      </div></a>
      <div class="modal-footer">

          <a href="?" class="btn btn-primary btn-rounded">Regresar</a>
    
      </div>
    </div>
  </div>
</div>
<!-- ./  Modal -->