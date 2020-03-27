$(document).ready(function()
{

//setTimeout(function () {
	$("body").on("click","#venta",function(){
	var op = $(this).attr('op');
	var cod = $(this).attr('cod');
	var mesa = $(this).attr('mesa');
	var panel = $(this).attr('panel');
	var cliente = $(this).attr('cliente');
    	$.post("application/src/routes.php", {op:op, cod:cod, mesa:mesa, panel:panel, cliente:cliente}, 
    	function(htmlexterno){
		$("#lateral").load('application/src/routes.php?op=22');
		$("#ventana").html(htmlexterno);
   	 	});
	});
//}, 1000);

	$("body").on("click","#ventaopcion",function(){
	var op = $(this).attr('op');
	var cod = $(this).attr('cod');
	var mesa = $(this).attr('mesa');
	var cliente = $(this).attr('cliente');
	var opcion = $(this).attr('opcion');
	var panel = $(this).attr('panel');
	var view = $(this).attr('view');
    	$.post("application/src/routes.php", {op:op, cod:cod, mesa:mesa, cliente:cliente, panel:panel, opcion:opcion}, 
    	function(htmlexterno){
    		if(view != "1"){
    			window.location.href="?";
    		} else {
    			window.location.href="?view&mesa=" + mesa;
    		}
		
   	 	});
	});


	$("body").on("click","#borrar-producto",function(){
	var op = $(this).attr('op');
	var iden = $(this).attr('iden');
    	$.post("application/src/routes.php", {op:op, iden:iden}, 
    	function(htmlexterno){
		$("#lateral").load('application/src/routes.php?op=22');
		$("#ventana").html(htmlexterno);
   	 	});
	});



	$("body").on("click","#borrar-factura",function(){
	var op = $(this).attr('op');
	var mesa = $(this).attr('mesa');
    	$.post("application/src/routes.php", {op:op, mesa:mesa}, 
    	function(htmlexterno){
		$("#lateral").load('application/src/routes.php?op=22');
		$("#ventana").html(htmlexterno);
   	 	});
	});


	$("body").on("click","#nuevo-cliente",function(){
	var op = $(this).attr('op');
	var mesa = $(this).attr('mesa');
    	$.post("application/src/routes.php", {op:op, mesa:mesa}, 
    	function(htmlexterno){
		$("#lateral").load('application/src/routes.php?op=22');
		$("#clientes").load('application/src/routes.php?op=46');
		$("#iconos").load('application/src/routes.php?op=47');
   	 	});
	});
	

	$("body").on("click","#cambiar-cliente",function(){
	var op = $(this).attr('op');
	var select = $(this).attr('select');
    	$.post("application/src/routes.php", {op:op, select:select}, 
    	function(htmlexterno){
		$("#lateral").load('application/src/routes.php?op=22');
		$("#clientes").load('application/src/routes.php?op=46');
		$("#iconos").load('application/src/routes.php?op=47');
   	 	});
	});


	cargarIconos();
	function cargarIconos(){
		$.ajax({
			url: 'application/src/routes.php?op=47',
			method: 'POST',
			success: function(data){
				$('#iconos').html(data);
			}
		})
	}


 //    $("#contenido_clientes").show();
 //    $("#contenido_paginador").hide();
 //    $("#contenido_paginador").load('application/src/routes.php?op=14&iden=1');
	// $("#contenido_clientes").html(htmlexterno);


//// crear iconos

	$("body").on("click","#crear-iconos",function(){
	var op = $(this).attr('op');
    $.post("application/src/routes.php", {op:op}, 
    	function(htmlexterno){
	 $("#ventana").html(htmlexterno);
	 window.location.href="?";
   	 });

	});






///////////ver modal de ber mesas
    $("body").on("click","#xvermesa",function(){ 
        
        $('#ModalVer').modal('show');
        
        var mesa = $(this).attr('mesa');
        var tx = $(this).attr('tx');
        var op = $(this).attr('op');
        var tbl = $(this).attr('tbl');
        var dataString = 'op='+op+'&mesa='+mesa+'&tx='+tx+'&tbl='+tbl;

        $.ajax({
            type: "POST",
            url: "application/src/routes.php",
            data: dataString,
            beforeSend: function () {
               $("#vista").html('<div class="row justify-content-md-center" ><img src="assets/img/load.gif" alt=""></div>');
            },
            success: function(data) {            
                $("#vista").html(data); // lo que regresa de la busquea         
            }
        });       
    });








});