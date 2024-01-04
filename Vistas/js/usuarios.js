//Agregar usuario
(function(){
    document.getElementById('form_usuarios').addEventListener('submit', function(e){//mandamos a llamar al formulario por ID y le añadimos un evento de tipo submit
         e.preventDefault();
         //Validamos que las contraseñas coincidan, creamos 2 variables en donde les almacenamos el id
         contra1 = document.getElementById('password');
         contra2 = document.getElementById('confirmar_password');
         //Creamos un if para valida las contraseñas 
         if(contra1.value != contra2.value){
             Swal.fire(
                 '¡Las contraseñas no coinciden!',
                 'Haz click para continuar',
                 'error',
            )
            //agregamos una funcion para decirle que si no coinciden limpien los inputs que contengan ese nombre de id
            .then(function(){
             document.getElementById('password').value = '';
             document.getElementById('confirmar_password').value = '';
      })
            return false
         }
         else{
             //creamos una variable limitada para crear un formdata para controlar el compartamiento del formulario 
         let form_usuario = new FormData(document.getElementById('form_usuarios'));
              fetch('../../../Controladores/Usuarios/agregar_usuario.php',{//redireccionamos a nuestro archivo php para la consulta de agregar los datos a la BD 
                   method: 'POST',
                   body: form_usuario
              })
              .then(res => res.json())
              .then(data =>{ 
               if(data == 3){
                    Swal.fire(
                        '!El usuario ya existe, prueba con otro¡',
                        'Haz click para continuar',
                        'error',
                   )
                   .then(function(){
                    document.getElementById('usuarios').value = '';
                   })    
                }
                else if(data == 1){
                    Swal.fire(
                        '!La contraseña ya la tiene otro usuario, prueba con otra¡',
                        'Haz click para continuar',
                        'error',
                   )
                   .then(function(){
                    document.getElementById('password').value = '';
                    document.getElementById('confirmar_password').value = '';
                   })    
                }
                  else if(data == 'true'){
                   document.getElementById('nombre').value = '';
                   document.getElementById('apellidos').value = '';
                   document.getElementById('usuarios').value = '';
                   document.getElementById('password').value = '';
                   document.getElementById('confirmar_password').value = '';
                   document.getElementById('correo').value = '';
                   document.getElementById('telefono').value = '';
                   document.getElementById('tipo_rol').value = '';
                   Swal.fire(
                        '¡Usuario registrado con exito!',
                        'Haz click para continuar',
                        'success',
                   )
                   .then(function(){
                        window.location = "Usuarios.php";
                 })
              }
          });
         }
     });
})();

//Editar informacion de usuario
(function(){
$('.editar_user').on('click',function(){
    $tra=$(this).closest('tr');
    var datos_usuario = $tra.children("td").map(function(){
        return $(this).text();
    });

    $('#id_usuario').val(datos_usuario[0]);
    $('#editar_nombre').val(datos_usuario[1]);
    $('#editar_apellidos').val(datos_usuario[2]);
    $('#editar_correo').val(datos_usuario[3]);
    $('#editar_telefono').val(datos_usuario[5]);
    $('#nombres').val(datos_usuario[6]);

});
document.getElementById('form_edit_user').addEventListener('submit', function(e){//mandamos a llamar al formulario por ID y le añadimos un evento de tipo submit
    e.preventDefault();
    
        //creamos una variable limitada para crear un formdata para controlar el compartamiento del formulario 
    let editar_usuario = new FormData(document.getElementById('form_edit_user'));
         fetch('../../../Controladores/Usuarios/editar_usuario.php',{//redireccionamos a nuestro archivo php para la consulta de agregar los datos a la BD 
              method: 'POST',
              body: editar_usuario
         })
         .then(user => user.json())
         .then(datos_usuario =>{
            if(datos_usuario == 1){
                Swal.fire(
                   '¡Selecciona un rol para el usuario!',
                   'Haz click para continuar',
                   'error',
                )
            } 
           if(datos_usuario == 'true'){
              Swal.fire(
                   '¡Información editada correctamente!',
                   'Haz click para continuar',
                   'success',
              )
              .then(function(){
                   window.location = "Usuarios.php";
            })
         }
     });
    })
})();

//Editar password
(function(){
    $('.editar_pas').on('click',function(){

        $tr=$(this).closest('tr');
        var edit_pass = $tr.children("td").map(function(){
            return $(this).text();
        });
        $('#id').val(edit_pass[0]);
        });

        document.getElementById('form_edit_password').addEventListener('submit', function(e){//mandamos a llamar al formulario por ID y le añadimos un evento de tipo submit
            e.preventDefault();
            //Validamos que las contraseñas coincidan, creamos 2 variables en donde les almacenamos el id
            password1 = document.getElementById('editar_password');
            password2 = document.getElementById('editar_confirmar');
            //Creamos un if para valida las contraseñas 
            if(password1.value != password2.value){
                Swal.fire(
                    '¡Las contraseñas no coinciden!',
                    'Haz click para continuar',
                    'error',
               )
               //agregamos una funcion para decirle que si no coinciden limpien los inputs que contengan ese nombre de id
               .then(function(){
                document.getElementById('editar_password').value = '';
                document.getElementById('editar_confirmar').value = '';
         })
               return false
            }
            else{
                //creamos una variable limitada para crear un formdata para controlar el compartamiento del formulario 
            let editar_clave = new FormData(document.getElementById('form_edit_password'));
                 fetch('../../../Controladores/Usuarios/editar_password.php',{//redireccionamos a nuestro archivo php para la consulta de agregar los datos a la BD 
                      method: 'POST',
                      body: editar_clave
                 })
                 .then(clave => clave.json())
                 .then(datos_clave =>{ 
                   if(datos_clave == 1){
                       Swal.fire(
                           '!La contraseña ya la tiene otro usuario, prueba con otra¡',
                           'Haz click para continuar',
                           'error',
                      )
                      .then(function(){
                       document.getElementById('editar_password').value = '';
                       document.getElementById('editar_confirmar').value = '';
                      })    
                   }
                     else if(datos_clave == 'true'){
                      Swal.fire(
                           '¡Contraseña cambiada con exito!',
                           'Haz click para continuar',
                           'success',
                      )
                      .then(function(){
                           window.location = "Usuarios.php";
                    })
                 }
             });
            }
        });
})();

//Eliminar usuarios
$('.eliminar_usuario').on('click', function(e){
     e.preventDefault();
     const href = $(this).attr('href')
 
 Swal.fire({
 title: '¿Estas seguro de eliminar este usuario',
 text: "¡No se podra revertir esta accion!",
 icon: 'warning',
 showCancelButton: true,
 confirmButtonColor: '#3085d6',
 cancelButtonColor: '#d33',
 confirmButtonText: 'Si, eliminar usuario!',
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