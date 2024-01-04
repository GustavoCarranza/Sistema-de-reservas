<?php 
include('../../../../../Modelos/Base/base_datos.php');

if(empty($_POST['editar_restaurante_siguiente'])){
    echo 1;
}
else{
session_start();
$usuario_edita = $_SESSION['usuario'];
    
$idreserva = $_REQUEST['idreserva_siguiente'];
$nombre_restaurante = $_POST['editar_restaurante_siguiente'];
$huesped = $_POST['editar_huesped_siguiente'];
$apellidos = $_POST['editar_apellidos_siguiente'];
$villa = $_POST['editar_villa_siguiente'];
$propiedad = $_POST['editar_propiedad_siguiente'];
$no_personas =$_POST['editar_no_personas_siguiente'];
$no_kids =$_POST['editar_no_kids_siguiente'];
$fecha =$_POST['editar_fecha_siguiente'];
$horario =$_POST['editar_horario_siguiente'];
$comentarios =$_POST['editar_comentarios_siguiente'];
$solicitante =$_POST['editar_solicitante_siguiente'];
$creacion = $_POST['editar_creacion_siguiente'];

$editar_reservacion = $conexion->query("UPDATE reservas_restaurante SET nombre_restaurante = '$nombre_restaurante', huesped = '$huesped', apellidos = '$apellidos', villa = '$villa', propiedad = '$propiedad', numero_personas = '$no_personas', kids = '$no_kids',fecha_reserva = '$fecha', horario_reserva = '$horario', comentarios = '$comentarios', solicitante = '$solicitante', fecha_creacion = '$creacion', usuario_edita = '$usuario_edita' WHERE id_reserva_R = '$idreserva'");

if($editar_reservacion){
    echo
        json_encode("true");
}
}



?>