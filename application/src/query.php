<?php
defined('BASEPATH') OR exit('No direct script access allowed');

// if($_SESSION["td"] != 0){
// $numero = rand(1,9999999999);	
// } else {
// $numero = 1;	
// }
// $numero = 1;

$numero = rand(1,9999999999);

if(isset($_GET["modal"])) { 
echo '
	<script>
		$(document).ready(function()
		{
		  $("#' . $_GET["modal"] . '").modal("show");
		});
	</script>
	';

	if($_GET["modal"] == "selectimg"){
	echo '<script type="text/javascript" src="assets/js/query/iconos.js?v='.$numero.'"></script>';
	}
	if($_GET["modal"] == "modcategoria"){
	echo '<script type="text/javascript" src="assets/js/query/iconos.js?v='.$numero.'"></script>';
	}
	if($_GET["modal"] == "modproducto"){
	echo '<script type="text/javascript" src="assets/js/query/iconos.js?v='.$numero.'"></script>';
	}
	if($_GET["modal"] == "addopciones"){
	echo '<script type="text/javascript" src="assets/js/query/iconos.js?v='.$numero.'"></script>';
	}
	if($_GET["modal"] == "detalleproducto"){
	echo '<script type="text/javascript" src="assets/js/query/detalleproducto.js?v='.$numero.'"></script>';
	}
	if($_GET["modal"] == "opciones"){
	echo '<script type="text/javascript" src="assets/js/query/ventas.js?v='.$numero.'"></script>';
	}
	if($_GET["modal"] == "addmesa"){
	echo '<script type="text/javascript" src="assets/js/query/addmesa.js"></script>';
	}
	if($_GET["modal"] == "dividir"){
	echo '<script type="text/javascript" src="assets/js/query/dividircuenta.js?v='.$numero.'"></script>';
	}
	if($_GET["modal"] == "pagar"){
	echo '<script type="text/javascript" src="assets/js/query/pagarcuenta.js?v='.$numero.'"></script>';
	}
	if($_GET["modal"] == "modificar"){
	echo '<script type="text/javascript" src="assets/js/query/modificaropciones.js?v='.$numero.'"></script>';
	}
	if($_GET["modal"] == "reordenar"){
	echo '<script type="text/javascript" src="assets/js/query/iconos-reordenar-jquery-ui.min.js?v='.$numero.'"></script>';
	echo '<script type="text/javascript" src="assets/js/query/iconos_reordenar.js?v='.$numero.'"></script>';
	}
	if($_GET["modal"] == "conf_config"){
	echo '<script type="text/javascript" src="assets/js/query/conf_config.js?v='.$numero.'"></script>';
	}
	if($_GET["modal"] == "conf_root"){
	echo '<script type="text/javascript" src="assets/js/query/conf_config.js?v='.$numero.'"></script>';
	}
	if($_GET["modal"] == "venta_especial"){
	echo '<script type="text/javascript" src="assets/js/query/venta-especial.js?v='.$numero.'"></script>';
	}
	if($_GET["modal"] == "img_negocio"){
	echo '<script type="text/javascript" src="assets/js/query/img_negocio.js?v='.$numero.'"></script>';
	}  

		/// Planilla
	if($_GET["modal"] == "editempleado"){
	echo '<script type="text/javascript" src="assets/js/query/planilla.js?v='.$numero.'"></script>';
	}


	if($_GET["modal"] == "respaldar"){
			$url = "sync/push.php?corte=1";
			echo '<script>
				$(document).ready(function(){

				function Respaldar(){
		                      $.ajax({
		                          type: "POST",
		                          url: "'.$url.'",
		                          success: function(data) {
		                            $("#respaldo").html(data);
		                          }
		                      });
		                  }

		        Respaldar();
		});
		</script>';
	}


}


elseif($_SESSION["caduca"] != 0) {
echo '<script type="text/javascript" src="assets/js/query/noacceso.js?v='.$numero.'"></script>';
} 
elseif(isset($_GET["precios"])) {
echo '<script type="text/javascript" src="assets/js/query/conf_config.js?v='.$numero.'"></script>';
}   
elseif(isset($_GET["codigos"])) {
echo '<script type="text/javascript" src="assets/js/query/noacceso.js?v='.$numero.'"></script>';
}  
elseif(isset($_GET["user"])) {
echo '<script type="text/javascript" src="system/user/login.js?v='.$numero.'"></script>';
} 
elseif(isset($_GET["iconos"])) {
echo '<script type="text/javascript" src="assets/js/query/iconos.js?v='.$numero.'"></script>';
} 
//// gastos
elseif(isset($_GET["gastos"])) {
echo '<script type="text/javascript" src="assets/js/query/gastos.js?v='.$numero.'"></script>';
} 
elseif(isset($_GET["entradas"])) {
echo '<script type="text/javascript" src="assets/js/query/gastos.js?v='.$numero.'"></script>';
} 
///
elseif(isset($_GET["producto"])) {
echo '<script type="text/javascript" src="assets/js/query/productos.js?v='.$numero.'"></script>';
}
elseif(isset($_GET["corte"])) {
echo '<script type="text/javascript" src="assets/js/query/corte.js?v='.$numero.'"></script>';
}
elseif(isset($_GET["diario"])) {
echo '<script type="text/javascript" src="assets/js/query/historial.js?v='.$numero.'"></script>';
}
elseif(isset($_GET["mensual"])) {
echo '<script type="text/javascript" src="assets/js/query/historial.js?v='.$numero.'"></script>';
}
elseif(isset($_GET["cortes"])) {
echo '<script type="text/javascript" src="assets/js/query/historial.js?v='.$numero.'"></script>';
}
elseif(isset($_GET["ticket_eliminados"])) {
echo '<script type="text/javascript" src="assets/js/query/historial.js?v='.$numero.'"></script>';
}
elseif(isset($_GET["gastodiario"])) {
echo '<script type="text/javascript" src="assets/js/query/historial.js?v='.$numero.'"></script>';
}
elseif(isset($_GET["gastomensual"])) {
echo '<script type="text/javascript" src="assets/js/query/historial.js?v='.$numero.'"></script>';
}
// para graficos
elseif(isset($_GET["gra_semanal"])) include_once 'assets/js/query/gra_semanal.php';
elseif(isset($_GET["gra_mensual"])) include_once 'assets/js/query/gra_mensual.php';
elseif(isset($_GET["gra_semestre"])) include_once 'assets/js/query/gra_semestre.php';


elseif(isset($_GET["mesasfecha"])) {
echo '<script type="text/javascript" src="assets/js/query/historial.js?v='.$numero.'"></script>';
}
elseif(isset($_GET["inout"])) {
echo '<script type="text/javascript" src="assets/js/query/historial.js?v='.$numero.'"></script>';
}
elseif(isset($_GET["reportediario"])) {
echo '<script type="text/javascript" src="assets/js/query/reportes.js?v='.$numero.'"></script>';
}
elseif(isset($_GET["rango"])) {
echo '<script type="text/javascript" src="assets/js/query/reportes.js?v='.$numero.'"></script>';
}
elseif(isset($_GET["contadora"])) {
echo '<script type="text/javascript" src="assets/js/query/reportes.js?v='.$numero.'"></script>';
}
elseif(isset($_GET["search"])) {
echo '<script type="text/javascript" src="assets/js/query/search.js?v='.$numero.'"></script>';
}
elseif(isset($_GET["tv"])) {
echo '<script type="text/javascript" src="assets/js/query/tv.js?v='.$numero.'"></script>';
}
elseif(isset($_GET["venta_especial"])) {
echo '<script type="text/javascript" src="assets/js/query/conf_config.js?v='.$numero.'"></script>';
}
elseif(isset($_GET["ctc"])) {
echo '<script type="text/javascript" src="assets/js/query/conf_config.js?v='.$numero.'"></script>';
}
elseif(isset($_GET["averias"])) {
echo '<script type="text/javascript" src="assets/js/query/product.js?v='.$numero.'"></script>';
}
elseif(isset($_GET["addpro"])) {
echo '<script type="text/javascript" src="assets/js/query/product.js?v='.$numero.'"></script>';
}
elseif(isset($_GET["rtn"])) {
echo '<script type="text/javascript" src="assets/js/query/facturar.js?v='.$numero.'"></script>';
}
elseif(isset($_GET["cai"])) {
echo '<script type="text/javascript" src="assets/js/query/facturar.js?v='.$numero.'"></script>';
}
elseif(isset($_GET["facturasopciones"])) {
echo '<script type="text/javascript" src="assets/js/query/facturar.js?v='.$numero.'"></script>';
}
elseif(isset($_GET["eliminar_facturas"])) {
echo '<script type="text/javascript" src="assets/js/query/facturar.js?v='.$numero.'"></script>';
}
elseif(isset($_GET["syncstatus"])) {
echo '<script type="text/javascript" src="assets/js/query/respaldo.js?v='.$numero.'"></script>';
}

elseif(isset($_GET["tablas"])) {
echo '<script type="text/javascript" src="assets/js/query/conf_config.js?v='.$numero.'"></script>';
} 
/// admin
elseif(isset($_GET["db_sync"])) {
echo '<script type="text/javascript" src="assets/js/query/admin.js?v='.$numero.'"></script>';
}
elseif(isset($_GET["edocortes"])) {
echo '<script type="text/javascript" src="assets/js/query/admin.js?v='.$numero.'"></script>';
}
elseif(isset($_GET["admon"])) {
		echo '<script type="text/javascript" src="assets/js/query/admin.js?v='.$numero.'"></script>';
		include_once 'system/admon/script.php';
}


//////////////// Planilla
elseif(isset($_GET["addempleado"])) {
echo '<script type="text/javascript" src="assets/js/query/planilla.js?v='.$numero.'"></script>';
} 
elseif(isset($_GET["verempleado"])) {
echo '<script type="text/javascript" src="assets/js/printThis.js?v='.$numero.'"></script>';
echo '<script type="text/javascript" src="assets/js/query/paginador.js?v='.$numero.'"></script>';
echo '<script type="text/javascript" src="assets/js/query/planilla.js?v='.$numero.'"></script>';
} 
elseif(isset($_GET["descuentos"])) {
echo '<script type="text/javascript" src="assets/js/query/planilla.js?v='.$numero.'"></script>';
} 
elseif(isset($_GET["planillasver"])) {
echo '<script type="text/javascript" src="assets/js/printThis.js?v='.$numero.'"></script>';
echo '<script type="text/javascript" src="assets/js/query/paginador.js?v='.$numero.'"></script>';
echo '<script type="text/javascript" src="assets/js/query/planilla.js?v='.$numero.'"></script>';
} 



else{
echo '<script type="text/javascript" src="assets/js/query/ventas.js?v='.$numero.'"></script>';	
}
	
?>

<script>
$("body").on("click","#cambiar-pantalla-inicio",function(){
        var op = $(this).attr('op');
        $.post("application/src/routes.php", {op:op}, 
        function(htmlexterno){
            window.location.href="?";
        });
    });	

// preloader
    $(window).on("load", function () {
        $('#mdb-preloader').fadeOut('fast');
    });

</script>

