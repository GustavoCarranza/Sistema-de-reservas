<?php include('../../Modelos/Base/base_datos.php');
if(empty($_POST['editar_rol_usuario'])){
    echo 1;
}
else{
$id = $_REQUEST['id_usuario'];
$rol = $_POST['editar_rol_usuario'];
$nombre = $_POST['editar_nombre'];
$apellidos = $_POST['editar_apellidos'];
$correo = $_POST['editar_correo'];
$telefono = $_POST['editar_telefono'];

$editar = $conexion->query("UPDATE usuarios SET nombre = '$nombre', apellidos = '$apellidos', correo = '$correo', telefono= '$telefono', rol_usuario = '$rol'  WHERE id_usuario = '$id'");

if($editar){
    echo 
      json_encode("true");
}
}
?>