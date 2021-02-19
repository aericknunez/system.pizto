<?php 
defined('BASEPATH') OR exit('No direct script access allowed');
include_once 'application/common/Alerts.php';
?>

<div class="row d-flex justify-content-center">
  <div class="col-sm-8">

 <?php
    $a = $db->query("SELECT * FROM pro_bruto WHERE td = ". $_SESSION['td'] ."");
            if($a->num_rows > 0){
            echo '<table class="table table-sm table-striped">
              <thead>
                <tr>
                  <th scope="col">NOMBRE</th>
                  <th scope="col">MEDIDA</th>
                  <th scope="col">MINIMO</th>
                  <th scope="col">CANTIDAD</th>
                  
                </tr>
              </thead>
              <tbody>';
        foreach ($a as $b) {

            if ($r = $db->select("unidad", "pro_unidades_medida", "WHERE id = ".$b["um"]." and td = ".$_SESSION["td"]."")) { 
                $uni = $r["unidad"];
            } unset($r);

            if($b["cantidad"] <= $b["minimo"]){
              $text = 'class="text-danger font-weight-bold"';
            } else {
              $text = 'class="text-dark"';
            }

                echo '<tr '.$text.'>
                  <th>'. $b["nombre"] .'</th>
                  <td>'. $uni .'</td>
                  <td>'. $b["minimo"] .'</td>
                  <td>'. $b["cantidad"] .'</td>
                                    
                </tr>';
            unset($uni);
            } echo '</tbody>
                     </table>';
        } else {
          Alerts::Mensajex("No se encuentran registros","info");
        }
        $a->close();
?>
  </div> 
</div> 