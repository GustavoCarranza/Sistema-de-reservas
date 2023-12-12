$(buscar_incidencias());
function buscar_incidencias(consulta){
    $.ajax({
        url: '../../Controladores/incidencias/tabla_incidencias.php',
        type: 'POST',
        dataType: 'Html',
        data: {consulta: consulta},
    })
    .done(function(respuesta){
        $("#mostrar_incidencias").html(respuesta);
    })
    .fail(function(){
        console.log("error");
    })
}
$(document).on('keyup','#buscar_incidencia',function(){
    var valor = $(this).val();
    if(valor != ""){
        buscar_incidencias(valor);
    }else{
        buscar_incidencias();
    }
});
 