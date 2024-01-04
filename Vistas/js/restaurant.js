//Funcion para agregar reservaciones en restaurantes a la BD 
(function(){
    document.getElementById('form_reservas_R').addEventListener('submit', function(e){
         e.preventDefault();
         let form_reservas_R = new FormData(document.getElementById('form_reservas_R'));
              fetch('../../../Controladores/Restaurantes/Administrador/agregar_reservacion.php',{
                   method: 'POST',
                   body: form_reservas_R
              })
              .then(restaurantes => restaurantes.json())
              .then(datos_restaurantes =>{
                    if(datos_restaurantes == 'true'){
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
                        window.location = 'Restaurantes.php';
                   })
                 }else{
                     console.log(datos_restaurantes);
                 }
         });//validacion del .then
     });//evento submit
    })();
//FIN


