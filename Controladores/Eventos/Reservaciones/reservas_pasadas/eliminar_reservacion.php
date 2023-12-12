<?php 
include_once('../../../../Modelos/Base/base_datos.php');

$reservacion= $_REQUEST['id_reserva'];

$eliminar_reservacion = $conexion->query("DELETE FROM reservas_eventos WHERE id_reserva_E = $reservacion");

    header('location: reservas_pasadas.php');
?>