<div class="modal" id="<? echo $_GET["modal"]; ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"  data-backdrop="false">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">
          <?php 

            if ($r = $db->select("nombre", "opciones", "WHERE id = ".$_REQUEST["op"]." and td = ".$_SESSION["td"]."")) { 
                echo $r["nombre"];
            } unset($r);  

           ?></h5>
      </div>
      <div class="modal-body">
<!-- ./  content -->
<div id="ventana"></div>

 <div class="row text-center portfolio"> 
   <ul class="gallery"> 
<?php 
    $a = $db->query("SELECT * FROM opciones_name WHERE opcion = ".$_REQUEST["op"]." and td = ".$_SESSION["td"]."");
    foreach ($a as $b) {

       if ($r = $db->select("img_name", "images", "WHERE cod = ".$b["cod"]." and td = ".$_SESSION["td"]."")) { 
               $imagen = $r["img_name"];
            } unset($r);
      
      echo '<li><a id="ventaopcion" op="20" cod="'.$_REQUEST["cod"].'" mesa="'.$_REQUEST["mesa"].'" cliente="'.$_REQUEST["cliente"].'" opcion="'.$b["cod"] .'" panel="'.$_REQUEST["panel"].'" view="'.$_REQUEST["view"].'"><em>'.$b["nombre"].'</em><img src="'.$imagen.'" alt="image" class="img-fluid img-responsive wow fadeIn" /></a></li>';
    } $a->close();

?>





</ul> 
 </div>

<!-- ./  content -->
      </div>
      <div class="modal-footer">

        <?php 

          if($_SESSION["delivery_on"] == TRUE){
            $url="?delivery&mesa=" . $_REQUEST["mesa"];
          } elseif($_SESSION['view'] != NULL){
            $url="?view&mesa=" . $_REQUEST["mesa"];
          } else {
            $url="?";
          }

         ?>
          
          <a href="<?php echo $url; ?>" class="btn btn-primary btn-rounded">Regresar</a>
    
      </div>
    </div>
  </div>
</div>
<!-- ./  Modal -->