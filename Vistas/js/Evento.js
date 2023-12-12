//Funcion para agregar reservaciones en eventos a la BD 
(function(){
    document.getElementById('form_reservas_E').addEventListener('submit', function(e){
         e.preventDefault();
         let form_reservas_E = new FormData(document.getElementById('form_reservas_E'));
              fetch('../../../Controladores/Eventos/Administrador/agregar_reservacion.php',{
                   method: 'POST',
                   body: form_reservas_E
              })
              .then(eventos => eventos.json())
              .then(datos_eventos =>{
                    if(datos_eventos == 'true'){
                        document.getElementById('huesped').value = '';
                        document.getElementById('apellidos').value = '';
                        document.getElementById('villa').value = '';
                        document.getElementById('propiedad').value = '';
                        document.getElementById('no_personas').value = '';
                        document.getElementById('no_kids').value = '';
                        document.getElementById('fecha').value = '';
                        document.getElementById('horario').value = '';
                        document.getElementById('comentarios').value = '';
                        document.getElementById('solicitante').value = '';
                   Swal.fire(
                        '!Reservacion registrada con exito',
                        'Haz click para continuar',
                        'success',
                   )
                   .then(function(){
                        window.location = 'Eventos.php';
                   })
                 }else{
                     console.log(datos_eventos);
                 }
         });//validacion del .then
     });//evento submit
    })();
//FIN

//Buscar reservaciones de eventos en tiempo real 
$(buscar_reservaciones());
function buscar_reservaciones(consulta){
    $.ajax({
        url: '../../../Controladores/Eventos/Administrador/tabla_eventos.php',
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
 
