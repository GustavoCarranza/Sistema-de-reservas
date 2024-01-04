<?php
include('../../../Modelos/Base/base_datos.php');

if(empty($_POST['editar_nombre_destination'])){
    echo 1;
}
else{
    session_start();
    $usuario_edita = $_SESSION['usuario'];

    $idreserva = $_REQUEST['id'];
    $nombre_destination = $_POST['editar_nombre_destination'];
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
    $creacion = $_POST['editar_creacion'];
    
    $editar_destination = $conexion->query("UPDATE reservas_destinations SET name_destination = '$nombre_destination', huesped = '$huesped', apellidos = '$apellidos', villa = '$villa', propiedad = '$propiedad', numero_personas = '$no_personas', kids = '$no_kids',fecha_reserva = '$fecha', horario_reserva = '$horario', comentarios = '$comentarios', solicitante = '$solicitante', fecha_creacion = '$creacion', usuario_edita = '$usuario_edita' WHERE id_reserva_D = '$idreserva'");

if($editar_destination){
    echo 
        json_encode("true");
}


}

?>