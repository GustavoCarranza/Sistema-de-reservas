//Editar informacion de eventos
(function(){
    $('.editar_eventos').on('click',function(){
        $eve=$(this).closest('tr');
        var datos_eventos = $eve.children("td").map(function(){
            return $(this).text();
        });
    
        $('#idreserva_E').val(datos_eventos[0]);
        $('#nombre').val(datos_eventos[1]);
        $('#editar_huesped').val(datos_eventos[2]);
        $('#editar_apellidos').val(datos_eventos[3]);
        $('#editar_villa').val(datos_eventos[4]);
        $('#editar_propiedad').val(datos_eventos[5]);
        $('#editar_no_personas').val(datos_eventos[6]);
        $('#editar_no_kids').val(datosevedatos_eventoss[7]);
        $('#editar_fecha').val(datos_eventos[8]);
        $('#editar_horario').val(datos_eventos[9]);
        $('#editar_comentarios').val(datos_eventos[10]);
        $('#editar_solicitante').val(datos_eventos[11]);
    });
    
    document.getElementById('editar_info_evento').addEventListener('submit', function(e){//mandamos a llamar al formulario por ID y le añadimos un evento de tipo submit
        e.preventDefault();
        
            //creamos una variable limitada para crear un formdata para controlar el compartamiento del formulario 
        let editar_reserva_E = new FormData(document.getElementById('editar_info_evento'));
             fetch('../../../Controladores/Eventos/Administrador/editar_reservacion.php',{//redireccionamos a nuestro archivo php para la consulta de agregar los datos a la BD 
                  method: 'POST',
                  body: editar_reserva_E
             })
             .then(evento => evento.json())
             .then(datos_evento =>{
                if(datos_evento == 1){
                    Swal.fire(
                        '¡Selecciona el evento a cambiar!',
                        'Haz click para continuar',
                        'error',
                   )
                } 
                
               else if(datos_evento == 'true'){
                  Swal.fire(
                       '¡Información editada correctamente!',
                       'Haz click para continuar',
                       'success',
                  )
                  .then(function(){
                       window.location = "../../../Vistas/Views/Administrador/Eventos.php";
                })
             }
         });
        })
    })();
    
//Eliminar reservas en eventos
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