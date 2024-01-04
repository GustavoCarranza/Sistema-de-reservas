//Funcion para agregar reservaciones en restaurantes a la BD 
(function(){
    document.getElementById('form_reservas_S').addEventListener('submit', function(e){
         e.preventDefault();
         let form_reservas_R = new FormData(document.getElementById('form_reservas_S'));
              fetch('../../../Controladores/Restaurantes/Recepcion/Consultar/Reservas_siguientes/agregar.php',{
                   method: 'POST',
                   body: form_reservas_R
              })
              .then(restaurantes => restaurantes.json())
              .then(datos_restaurantes =>{
                    if(datos_restaurantes == 'true'){
                        document.getElementById('huesped_siguiente').value = '';
                        document.getElementById('apellidos_siguiente').value = '';
                        document.getElementById('villa_siguiente').value = '';
                        document.getElementById('propiedad_siguiente').value = '';
                        document.getElementById('no_personas_siguiente').value = '';
                        document.getElementById('no_kids_siguiente').value = '';
                        document.getElementById('fecha_siguiente').value = '';
                        document.getElementById('horario_siguiente').value = '';
                        document.getElementById('comentarios_siguiente').value = '';
                        document.getElementById('solicitante_siguiente').value = '';
                   Swal.fire(
                        '!Reservacion registrada con exito',
                        'Haz click para continuar',
                        'success',
                   )
                   .then(function(){
                        window.location = 'reservas_siguientes_R.php';
                   })
                 }else{
                     console.log(datos_restaurantes);
                 }
         });//validacion del .then
     });//evento submit
    })();
//FIN


