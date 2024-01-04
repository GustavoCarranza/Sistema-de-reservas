//Editar reservas de restaurante
(function(){
    $('.editar_restaurantes').on('click',function(){
        $tra=$(this).closest('tr');
        var datos_restaurante = $tra.children("td").map(function(){
            return $(this).text();
        });
    
        $('#idreserva').val(datos_restaurante[0]);
        $('#nombre').val(datos_restaurante[1]);
        $('#editar_huesped').val(datos_restaurante[2]);
        $('#editar_apellidos').val(datos_restaurante[3]);
        $('#editar_villa').val(datos_restaurante[4]);
        $('#editar_propiedad').val(datos_restaurante[5]);
        $('#editar_no_personas').val(datos_restaurante[6]);
        $('#editar_no_kids').val(datos_restaurante[7]);
        $('#editar_fecha').val(datos_restaurante[8]);
        $('#editar_horario').val(datos_restaurante[9]);
        $('#editar_comentarios').val(datos_restaurante[10]);
        $('#editar_solicitante').val(datos_restaurante[11]);
        $('#editar_creacion').val(datos_restaurante[12]);
    });
    
    document.getElementById('editar_info_restaurante').addEventListener('submit', function(e){//mandamos a llamar al formulario por ID y le añadimos un evento de tipo submit
        e.preventDefault();
        
            //creamos una variable limitada para crear un formdata para controlar el compartamiento del formulario 
        let editar_reserva_R = new FormData(document.getElementById('editar_info_restaurante'));
             fetch('../../../Controladores/Restaurantes/Recepcion/editar_reservacion.php',{//redireccionamos a nuestro archivo php para la consulta de agregar los datos a la BD 
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
                       window.location = "../../../Vistas/Views/Recepcionista/Restaurantes.php";
                })
             }
         });
        })
})();

//eliminar reservas en restaurantes
$('.eliminar_reservacion').on('click', function(e){
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
