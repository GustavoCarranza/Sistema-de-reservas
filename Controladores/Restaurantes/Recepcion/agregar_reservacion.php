<?php
include('../../../Modelos/Base/Base_datos.php'); //Mandamos a traer la conexion a la base de datos 
session_start();
$usuario = $_SESSION['usuario'];

$nombre_restaurante = $_POST['nombre_restaurante'];
$huesped = $_POST['huesped'];
$apellidos = $_POST['apellidos'];
$villa = $_POST['villa'];
$propiedad = $_POST['propiedad'];
$no_personas =$_POST['no_personas'];
$no_kids =$_POST['no_kids'];
$fecha =$_POST['fecha'];
$horario =$_POST['horario'];
$comentarios =$_POST['comentarios'];
$solicitante =$_POST['solicitante'];


$sql = $conexion->query("INSERT INTO reservas_restaurante (nombre_restaurante,huesped,apellidos,villa,propiedad,numero_personas,kids,fecha_reserva,horario_reserva,comentarios,solicitante,usuario) VALUES ('$nombre_restaurante','$huesped','$apellidos','$villa','$propiedad','$no_personas','$no_kids','$fecha','$horario','$comentarios','$solicitante','$usuario')");

if($sql == TRUE){
    echo
        json_encode('true');
}
?>