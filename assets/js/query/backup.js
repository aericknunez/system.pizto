$(document).ready(function()
{

    $("body").on("click","#backup",function(){ 
        
        var op = "350";
        var dataString = 'op='+op;

        $.ajax({
            type: "POST",
            url: "application/src/routes.php",
            data: dataString,
            beforeSend: function () {
               $("#vista").html('<div class="row justify-content-md-center" ><img src="assets/img/load.gif" alt=""></div>');
            },
            success: function(data) {            
                $("#vista").html(data); // lo que regresa de la busquea   
                $("#backup").hide();   
                $("#respaldos").load('application/src/routes.php?op=351');
            }
        });

    });


    $("body").on("click","#eliminar",function(){ 
        
        var op = "352";
        var data = $(this).attr('data');
        var dataString = 'op='+op+'&data='+data;

        $.ajax({
            type: "POST",
            url: "application/src/routes.php",
            data: dataString,
            beforeSend: function () {
               $("#vista").html('<div class="row justify-content-md-center" ><img src="assets/img/load.gif" alt=""></div>');
            },
            success: function(data) {            
                $("#vista").html(data); // lo que regresa de la busquea   
                $("#backup").show();   
                $("#respaldos").load('application/src/routes.php?op=351');
            }
        });

    });




});