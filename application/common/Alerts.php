<?php 
class Alerts{

      public function __construct(){
        
      }


       static public function Alerta($tipo,$encabezado,$texto){ 
       //tipo = warning , success , error , info , danger
       // md-toast-top-right / md-toast-top-left / md-toast-bottom-right /md-toast-bottom-left
        echo '<script>
        toastr.'.$tipo.'("'.$texto.'", "'.$encabezado.'", {
              "closeButton": true,
              "debug": false,
              "newestOnTop": true,
              "progressBar": false,
              "positionClass": "md-toast-top-right", 
              "preventDuplicates": true,
              "onclick": null,
              "showDuration": 100,
              "hideDuration": 100,
              "timeOut": 2000,
              "extendedTimeOut": 1000,
              "showEasing": "swing",
              "hideEasing": "linear",
              "showMethod": "fadeIn",
              "hideMethod": "fadeOut"
            }) 
        </script>';
        }


        static public function Cambios($return){
        echo '<div class="alert alert-info alert-dismissible">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            
         Se han realizado los cambios exitosamente. 
        <br>
        <a href="index.php?'.$return.'" class="btn btn-danger waves-effect waves-light">Aceptar</a>
        </div>';
    }


    static public function Eliminado(){
        echo '<div class="alert alert-danger ">
        <h4><i class="icon fas fa-ban"></i> Alerta!</h4>
        Se ha eliminado el registro correctamente... 

        </div>';
    }



    static public function Eliminar($id,$op,$iden,$return){
        echo '<div class="alert alert-danger alert-dismissible">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
    <h4><i class="icon fas fa-ban"></i> Alerta!</h4>
    Esta seguro que desea eliminar este resgistro? Es posible que se pierda informaci&oacuten relacionada a este. 
    <br>
    
    <a id="'.$id.'" op="'.$op.'" iden="'.$iden.'" class="btn btn-default waves-effect waves-light" >Eliminar</a>
    
    <a href="index.php?'.$return.'" class="btn btn-danger waves-effect waves-light">Cancelar</a>

  </div>';
    }




    static public function EliminarUsuario($iden, $user){
        echo '<div class="alert alert-danger alert-dismissible">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
    <h4><i class="icon fas fa-ban"></i> Alerta!</h4>
    Esta seguro que desea eliminar este usuario? Es posible que se pierda informaci&oacuten relacionada a este. 
    <br>
    
    <a id="deluser" op="3" iden="'.$iden.'" username="'.$user.'" class="btn btn-default waves-effect waves-light" >Eliminar</a>
    
    <a href="?user" class="btn btn-danger waves-effect waves-light">Cancelar</a>

  </div>';
    }

    static public function UsuarioEliminado(){
        echo '<div class="alert alert-danger ">
    <h4><i class="icon fas fa-ban"></i> Alerta!</h4>
    Usuario Eliminado Correctamente 
    <br>
    
    <a href="?user" class="btn btn-default waves-effect waves-light" >Continuar...</a>
    
  </div>';
    }



    static public function RealizarCorte($id,$op,$efectivo){
    echo '<div class="alert alert-danger alert-dismissible">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
    <h4><i class="icon fas fa-ban"></i> Alerta!</h4>
    Esta seguro que <strong>'. $efectivo .'</strong> es la cantidad correcta?
    <br>
    
    <a id="'.$id.'" op="'.$op.'" efectivo="'.$efectivo.'" class="btn btn-default waves-effect waves-light" >Aceptar</a>
    
    <button type="button" class="btn btn-danger waves-effect waves-light" data-dismiss="alert" aria-hidden="true">Cancelar</button>

  </div>';
    }



    static public function AlertaCambios($id,$op,$iden,$mensaje){
    echo '<div class="alert alert-danger alert-dismissible">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
    <h4><i class="icon fas fa-ban"></i> Alerta!</h4>
    '. $mensaje .'
    <br>
    
    <a id="'.$id.'" op="'.$op.'" iden="'.$iden.'" class="btn btn-default waves-effect waves-light" >Aceptar</a>
    
    <button type="button" class="btn btn-danger waves-effect waves-light" data-dismiss="alert" aria-hidden="true">Cancelar</button>

  </div>';
    }


    static public function CorteEcho($tipo){
      $num = rand(1,4);
      $corte = new Corte();
    echo '<div class="alert alert-danger alert-dismissible">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>';

// verificar que tipo de corte tiene activado ( si es 0 o null muesto mensaje de corte)
if($_SESSION["config_o_tipo_corte"] == 0 or $_SESSION["config_o_tipo_corte"] == NULL){
      echo 'Existe un corte realizado este dia, ya no se puede seguir agregando '.$tipo.' a menos que elimine el corte realizado';
      echo '<br>';
      echo '<a href="?corte" class="btn btn-danger waves-effect waves-light">Eliminar Corte</a>';

} else {
    if($corte->UltimaFecha() == date("d-m-Y")){
      echo 'Existe un corte realizado este dia, ya no se puede seguir agregando '.$tipo.' a menos que elimine el corte realizado o aperture la caja nuevamente para iniciar otro turno';
      echo '<br>';
      echo '<a href="?corte" class="btn btn-danger waves-effect waves-light">Eliminar Corte</a>';
      echo '<a href="?apertura" class="btn btn-success waves-effect waves-light">Aperturar Caja</a>';
    } else {
      echo 'Para poder realizar '.$tipo.' debe aperturar la caja.';
      echo '<br>';
      echo '<a href="?apertura" class="btn btn-success waves-effect waves-light">Aperturar Caja</a>';
    }
}

    echo '</div><div align="center"><img src="assets/img/imagenes/error'.$num.'.png" class="img-fluid" alt="Responsive image"></div>';
    }



    static public function RealizarRespaldo($texto){
      echo '<div class="alert alert-danger alert-dismissible">
      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      '.$texto.'
      <br>
      </div>';
    }

    static public function RealizadoRespaldo($texto){
      echo '<div class="alert alert-success alert-dismissible">
      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      '.$texto.'
      <br>
      </div>';
    }


    static public function Error404($texto){
      $num = rand(1,4);
      echo '<div class="alert alert-danger alert-dismissible">
<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
'.$texto.' 
<br>
</div><div align="center"><img src="assets/img/imagenes/404.jpg" class="img-fluid" alt="Responsive image"></div>';
    }

    static public function Mensaje($texto,$style,$boton = NULL,$boton2 = NULL){
      echo '<div class="border border-light alert alert-'.$style.' alert-dismissible">
      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      '.$texto.'
      <br>
      '.$boton.'  '.$boton2.'
      </div>';
    }


    static public function Mensajex($texto,$style,$boton = NULL,$boton2 = NULL){ // es lo mismo pero todo va centrado y sin boton cerrar
      echo '<div class="border border-light alert alert-'.$style.' alert-dismissible">
      <div align="center">
      '.$texto.'
      <br>
      '.$boton.'  '.$boton2.'
      </div>
      </div>';
    }



    

}
 ?>