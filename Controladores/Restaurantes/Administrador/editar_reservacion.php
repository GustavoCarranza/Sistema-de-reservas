<?php 
include('../../../Modelos/Base/base_datos.php');

if(empty($_POST['editar_restaurante'])){
    echo 1;
}
else{
$idreserva = $_REQUEST['idreserva'];
$nombre_restaurante = $_POST['editar_restaurante'];
$huesped = $_POST['editar_huesped'];
$apellidos = $_POST['editar_apellidos'];
$villa = $_POST['editar_villa'];
$propiedad = $_POST['editar_propiedad'];
$no_personas =$_POST['editar_no_personas'];
$no_kids =$_POST['editar_no_kids'];
$fecha =$_POST['editar_fecha'];
$horario =$_POST['editar_horario'];
$comentarios =$_POST['editar_comentarios'];
$solicitante =$_POST['editar_solicitante'];

$editar_reservacion = $conexion->query("UPDATE reservas_restaurante SET nombre_restaurante = '$nombre_restaurante', huesped = '$huesped', apellidos = '$apellidos', villa = '$villa', propiedad = '$propiedad', numero_personas = '$no_personas', kids = '$no_kids',fecha_reserva = '$fecha', horario_reserva = '$horario', comentarios = '$comentarios', solicitante = '$solicitante' WHERE id_reserva_R = '$idreserva'");

if($editar_reservacion){
    echo
        json_encode("true");
}
}



?>