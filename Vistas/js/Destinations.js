//Funcion para agregar reservaciones en restaurantes a la BD 
(function(){
    document.getElementById('form_reservas_D').addEventListener('submit', function(e){
         e.preventDefault();
         let form_reservas_D = new FormData(document.getElementById('form_reservas_D'));
              fetch('../../../Controladores/Destinations/Administrador/agregar_reservacion.php',{
                   method: 'POST',
                   body: form_reservas_D
              })
              .then(destinations => destinations.json())
              .then(datos_destinations =>{
                    if(datos_destinations == 'true'){
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
                        window.location = 'Destinations.php';
                   })
                 }else{
                     console.log(datos_destinations);
                 }
         });//validacion del .then
     });//evento submit
    })();
//FIN
