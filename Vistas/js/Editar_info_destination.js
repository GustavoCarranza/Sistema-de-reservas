//Editar informacion de destinations
(function(){
    $('.editar_destinations').on('click',function(){
        $des=$(this).closest('tr');
        var datos_destinations = $des.children("td").map(function(){
            return $(this).text();
        });
    
        $('#id').val(datos_destinations[0]);
        $('#nombre').val(datos_destinations[1]);
        $('#editar_huesped').val(datos_destinations[2]);
        $('#editar_apellidos').val(datos_destinations[3]);
        $('#editar_villa').val(datos_destinations[4]);
        $('#editar_propiedad').val(datos_destinations[5]);
        $('#editar_no_personas').val(datos_destinations[6]);
        $('#editar_no_kids').val(datos_destinations[7]);
        $('#editar_fecha').val(datos_destinations[8]);
        $('#editar_horario').val(datos_destinations[9]);
        $('#editar_comentarios').val(datos_destinations[10]);
        $('#editar_solicitante').val(datos_destinations[11]);
        $('#editar_creacion').val(datos_destinations[12]);
    });
    
    document.getElementById('editar_info_destination').addEventListener('submit', function(e){//mandamos a llamar al formulario por ID y le añadimos un evento de tipo submit
        e.preventDefault();
        
            //creamos una variable limitada para crear un formdata para controlar el compartamiento del formulario 
        let editar_reserva_D = new FormData(document.getElementById('editar_info_destination'));
             fetch('../../../Controladores/Destinations/Administrador/editar_reservas.php',{//redireccionamos a nuestro archivo php para la consulta de agregar los datos a la BD 
                  method: 'POST',
                  body: editar_reserva_D
             })
             .then(destination => destination.json())
             .then(datos_destinations =>{
                if(datos_destinations == 1){
                    Swal.fire(
                        '¡Selecciona el destination a cambiar!',
                        'Haz click para continuar',
                        'error',
                   )
                } 
               else if(datos_destinations == 'true'){
                  Swal.fire(
                       '¡Información editada correctamente!',
                       'Haz click para continuar',
                       'success',
                  )
                  .then(function(){
                       window.location = "../../../Vistas/Views/Administrador/Destinations.php";
                })
             }
         });
        })
    })();

//Eliminar destinations
$('.eliminar_desti').on('click', function(e){
    e.preventDefault();
    const href = $(this).attr('href')

Swal.fire({
title: '¿Estas seguro de eliminar la reservación',
text: "¡No se podra revertir esta accion!",
icon: 'warning',
showCancelButton: true,
confirmButtonColor: '#3085d6',
cancelButtonColor: '#d33',
confirmButtonText: 'Si, eliminar reservación!',
cancelButtonText: 'Cancelar!',
}).then((result) => {
    if(result.value){
if (result.isConfirmed) {
Swal.fire({
    type: 'success',
    title: 'Correcto',
    showConfirmButton: false,
})
Swal.fire({
    timer:3000
  });
}
document.location.href = href;
    }
})
})