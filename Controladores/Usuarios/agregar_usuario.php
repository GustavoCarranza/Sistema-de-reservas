<?php
include('../../Modelos/Base/base_datos.php'); //Mandamos a traer la conexion a la base de datos 

$nombre = $_POST['nombre'];
$apellidos = $_POST['apellidos'];
$correo = $_POST['correo'];
$usuario = $_POST['usuarios'];
$rol = $_POST['tipo_rol'];
$telefono = $_POST['telefono'];
$password =$_POST['password'];
$password = hash('sha512',$password);

$buscar_usuario_repetido = $conexion->query("SELECT * from usuarios WHERE usuario = '$usuario'");
$buscar_password_repetido = $conexion->query("SELECT * from usuarios WHERE clave = '$password'");
if(mysqli_num_rows($buscar_usuario_repetido) > 0){
    echo 3;
}
else if(mysqli_num_rows($buscar_password_repetido) > 0){
    echo 1;
}
else{
    $sql = $conexion->query("INSERT INTO usuarios (nombre, apellidos, correo, usuario, clave, telefono,rol_usuario) VALUES ('$nombre','$apellidos', '$correo', '$usuario' , '$password','$telefono','$rol')");

    if($sql == TRUE){
        echo
            json_encode("true");
    }
}
?>