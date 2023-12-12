<?php
include('../../Modelos/Base/base_datos.php');

$id = $_REQUEST['idusuario'];

$eliminar_usuario = $conexion->query("DELETE FROM usuarios WHERE id_usuario = '$id'");

header('location: ../../Vistas/Views/Administrador/Usuarios.php');

?>