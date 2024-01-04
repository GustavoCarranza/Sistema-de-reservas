
(function(){
    $('.editar_reserva_siguiente').on('click',function(){
        $tra=$(this).closest('tr');
        var datos_restaurante = $tra.children("td").map(function(){
            return $(this).text();
        });
    
        $('#idreserva_siguiente').val(datos_restaurante[0]);
        $('#nombre_siguiente').val(datos_restaurante[1]);
        $('#editar_huesped_siguiente').val(datos_restaurante[2]);
        $('#editar_apellidos_siguiente').val(datos_restaurante[3]);
        $('#editar_villa_siguiente').val(datos_restaurante[4]);
        $('#editar_propiedad_siguiente').val(datos_restaurante[5]);
        $('#editar_no_personas_siguiente').val(datos_restaurante[6]);
        $('#editar_no_kids_siguiente').val(datos_restaurante[7]);
        $('#editar_fecha_siguiente').val(datos_restaurante[8]);
        $('#editar_horario_siguiente').val(datos_restaurante[9]);
        $('#editar_comentarios_siguiente').val(datos_restaurante[10]);
        $('#editar_solicitante_siguiente').val(datos_restaurante[11]);
        $('#editar_creacion_siguiente').val(datos_restaurante[12]);

    });
    
    document.getElementById('editar_siguientes').addEventListener('submit', function(e){//mandamos a llamar al formulario por ID y le añadimos un evento de tipo submit
        e.preventDefault();
        
            //creamos una variable limitada para crear un formdata para controlar el compartamiento del formulario 
        let editar_reserva_R = new FormData(document.getElementById('editar_siguientes'));
             fetch('../../../Controladores/Restaurantes/Administrador/Consultar/Reservas_siguientes/editar.php',{//redireccionamos a nuestro archivo php para la consulta de agregar los datos a la BD 
                  method: 'POST',
                  body: editar_reserva_R
             })
             .then(restaurante => restaurante.json())
             .then(datos_restaurante =>{
                if(datos_restaurante == 1){
                    Swal.fire(
                        '¡Selecciona el restaurante a cambiar!',
                        'Haz click para continuar',
                        'error',
                   )
                } 
                
               else if(datos_restaurante == 'true'){
                  Swal.fire(
                       '¡Información editada correctamente!',
                       'Haz click para continuar',
                       'success',
                  )
                  .then(function(){
                       window.location = "reservas_siguientes_R.php";
                })
             }
         });
        })
    })();


    //eliminar reservas en restaurantes
$('.eliminar_reservacion_siguiente').on('click', function(e){
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
    timer: 5 // es ms (mili-segundos)
})
}
document.location.href = href;
    }
})
})

