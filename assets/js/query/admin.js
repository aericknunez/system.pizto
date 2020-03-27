$(document).ready(function()
{

// db_sync
	$("body").on("click","#ejecuta-db-sync",function(){
	var op = $(this).attr('op');
	var td = $(this).attr('td');
	var hash = $(this).attr('hash');
    	$.post("application/src/routes.php", {op:op, td:td, hash:hash}, 
    	function(htmlexterno){
		$("#contenido").html(htmlexterno);
   	 	});
	});


	$('#btn-new-hash').click(function(e){ /// para el formulario
		e.preventDefault();
		$.ajax({
			url: "application/src/routes.php?op=203",
			method: "POST",
			data: $("#form-new-hash").serialize(),
			success: function(data){
				$("#contenido").html(data);
				$("#form-new-hash").trigger("reset");
			}
		})
	})
$("#form-new-hash").keypress(function(e) {//Para deshabilitar el uso de la tecla "Enter"
if (e.which == 13) {
return false;
}
});






$('.datepicker').pickadate({
  weekdaysShort: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa'],
  weekdaysFull: ['Domingo', 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado'],
  monthsFull: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre',
  'Noviembre', 'Diciembre'],
  monthsShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct',
  'Nov', 'Dic'],
  showMonthsShort: true,
  formatSubmit: 'dd-mm-yyyy',
  close: 'Cancel'
})


	$('#btn-edocortes').click(function(e){ /// para el formulario
		$("#form-edocortes").hide();
		MuestraLoader();
		e.preventDefault();
		$.ajax({
			url: "application/src/routes.php?op=204",
			method: "POST",
			data: $("#form-edocortes").serialize(),
			success: function(data){
				$("#contenido").html(data);
				$("#form-edocortes").trigger("reset");
				$("#form-edocortes").show();
				EscondeLoader();
			}
		})
	})
	


// quita el loader
	EscondeLoader();
	function EscondeLoader(){
		$("#loaderx").hide();
	}

// muestra loader
	function MuestraLoader(){
		$("#loaderx").show();
	}






});