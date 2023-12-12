//Buscar reservaciones de eventos en tiempo real 
$(buscar_reservaciones());
function buscar_reservaciones(consulta){
    $.ajax({
        url: '../../../Controladores/Eventos/Consultor/tabla_eventos.php',
        type: 'POST',
        dataType: 'Html',
        data: {consulta: consulta},
    })
    .done(function(respuesta){
        $("#mostrar_reservaciones").html(respuesta);
    })
    .fail(function(){
        console.log("error");
    })
}
$(document).on('keyup','#buscar_reservaciones',function(){
    var valor = $(this).val();
    if(valor != ""){
        buscar_reservaciones(valor);
    }else{
        buscar_reservaciones();
    }
});
 
