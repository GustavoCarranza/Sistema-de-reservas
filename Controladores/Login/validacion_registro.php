<?php 
include_once("../../Modelos/Base/base_datos.php"); //Mandamos a llamar al archivo de la conexion a la BD 
session_start(); //Inicializamos una variable de sesion

if(isset($_SESSION['rol'])){//Creamos un if en donde declaramos si hay una sesion con un rol activo me abra un switch con 4 casos
    switch ($_SESSION['rol']) {
        case 1: 
            header('location: ../../Vistas/Views/Administrador/Bienvenida_administrador.php');
            break; //Caso uno direccionamos a la vista de administrador
                
        case 2:
            header('location: ../../Vistas/Views/Recepcionista/Bienvenida_recepcionista.php');
            break;//Caso dos direccionamos a la vista recepcionista

        case 3:
            header('location: ../../Vistas/Views/Consultor/Bienvenida_consultor.php');
            break;//Caso tres direccionamos a la vista consultor
            } //Fin del switch 
        }
        //Validamos el usuario y contraseña al ingresarlo en los inputs 
        if(isset($_POST['usuario']) && isset($_POST['clave'])){
            $usuario = $_POST['usuario'];
            $clave = $_POST['clave'];
            $clave = hash('sha512',$clave);
            
            $consulta = $conexion->query("SELECT * FROM usuarios where usuario = '$usuario' AND clave = '$clave'");
            $filas = mysqli_fetch_array($consulta);
            if($filas == true){
                //Validamos el rol en el numero de columna de nuestra base de datos, recordemos que un arreglo se inicializa en [0,1,2,3,4]
                $user = $filas[4];//Posicion en donde se encuentra el usuario en la tabla de la BD 
                $rol = $filas[7];//Posicion en donde se encuentra el rol en la tabla de la BD 
                $_SESSION['rol'] = $rol; //Igualamos la variable de sesion del rol con la posicion del arreglo 
                $_SESSION['usuario'] = $user;//Igualamos la variable de sesion del usuario con la posicion del arreglo
            //Mismo caso abrimos el switch y declaramos los casos corresponedientes
            switch ($_SESSION['rol']) {
                case 1:
                    header('location: ../../Vistas/Views/Administrador/Bienvenida_administrador.php');
                    break;
                    
                case 2:
                    header('location: ../../Vistas/Views/Recepcionista/Bienvenida_recepcionista.php');
                    break;

                case 3:
                    header('location: ../../Vistas/Views/Consultor/Bienvenida_consultor.php');
                    break;
            }//Fin del switch
            }else if(empty($_POST['usuario']) && empty($_POST['clave'])){
                echo "
                    <script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>
                    <script language='JavaScript'>
                    document.addEventListener('DOMContentLoaded', function() {
                    Swal.fire(
                    'No hay datos que validar, ingresa un usuario y una contraseña!',
                    'Haz click al boton para intentar de nuevo!',
                    'error',)
                    .then(function() {
                        window.location = '../../index.php';
                    })
                    });
                    </script>";
            }
            else{
                echo "
                    <script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>
                    <script language='JavaScript'>
                    document.addEventListener('DOMContentLoaded', function() {
                    Swal.fire(
                    'La contraseña o el usuario no son correctos!',
                    'Haz click al boton para intentar de nuevo!',
                    'error',)
                    .then(function() {
                        window.location = '../../index.php';
                    })
                    });
                    </script>";
            }
        }//Fin del IF
?>
