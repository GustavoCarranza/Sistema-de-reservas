<?php 
include('../../../Modelos/Base/base_datos.php');

if(empty($_POST['editar_evento'])){
    echo 1;
}
else{
$idreserva = $_REQUEST['idreserva_E'];
$nombre_evento = $_POST['editar_evento'];
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

$editar_reservacion = $conexion->query("UPDATE reservas_eventos SET name_evento = '$nombre_evento', huesped = '$huesped', apellidos = '$apellidos', villa = '$villa', propiedad = '$propiedad', numero_personas = '$no_personas', kids = '$no_kids',fecha_reserva = '$fecha', horario_reserva = '$horario', comentarios = '$comentarios', solicitante = '$solicitante' WHERE id_reserva_E = '$idreserva'");

if($editar_reservacion){
    echo   
      json_encode("true");
    
}
}
?>