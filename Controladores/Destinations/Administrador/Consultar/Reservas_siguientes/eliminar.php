<?php 
include_once('../../../../../Modelos/Base/base_datos.php');

$reservacion= $_REQUEST['id_reserva'];

$eliminar_reservacion = $conexion->query("DELETE FROM reservas_destinations WHERE id_reserva_D = $reservacion");

    header('location: ../../../../../Vistas/Views/Administrador/reservas_siguientes_D.php');
?>