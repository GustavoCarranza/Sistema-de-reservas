<?php
include('../../../../../Modelos/Base/base_datos.php'); //Mandamos a traer la conexion a la base de datos 
session_start();
$usuario = $_SESSION['usuario'];

$nombre_restaurante = $_POST['nombre_restaurante_siguiente'];
$huesped = $_POST['huesped_siguiente'];
$apellidos = $_POST['apellidos_siguiente'];
$villa = $_POST['villa_siguiente'];
$propiedad = $_POST['propiedad_siguiente'];
$no_personas =$_POST['no_personas_siguiente'];
$no_kids =$_POST['no_kids_siguiente'];
$fecha =$_POST['fecha_siguiente'];
$horario =$_POST['horario_siguiente'];
$comentarios =$_POST['comentarios_siguiente'];
$solicitante =$_POST['solicitante_siguiente'];


$sql = $conexion->query("INSERT INTO reservas_restaurante (nombre_restaurante,huesped,apellidos,villa,propiedad,numero_personas,kids,fecha_reserva,horario_reserva,comentarios,solicitante,usuario) VALUES ('$nombre_restaurante','$huesped','$apellidos','$villa','$propiedad','$no_personas','$no_kids','$fecha','$horario','$comentarios','$solicitante','$usuario')");

if($sql == TRUE){
    echo
        json_encode('true');
}
?>