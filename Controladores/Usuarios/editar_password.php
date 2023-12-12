<?php
include('../../Modelos/Base/base_datos.php'); //Mandamos a traer la conexion a la base de datos 

$id = $_POST['id'];
$password =$_POST['editar_password'];
$password = hash('sha512',$password);

$buscar_password_repetido = $conexion->query("SELECT * from usuarios WHERE clave = '$password'");
if(mysqli_num_rows($buscar_password_repetido) > 0){
    echo 1;
}
else{
    $sql = $conexion->query("UPDATE usuarios SET clave = '$password' WHERE id_usuario = $id ");

    if($sql == TRUE){
        echo
            json_encode("true");
    }
}