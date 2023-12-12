<?php 
include_once('../../../Modelos/Base/base_datos.php');

$reservacion= $_REQUEST['id_reserva'];

$eliminar_reservacion = $conexion->query("DELETE FROM reservas_restaurante WHERE id_reserva_R = $reservacion");

    header('location: ../../../Vistas/Views/Administrador/Restaurantes.php');
?>