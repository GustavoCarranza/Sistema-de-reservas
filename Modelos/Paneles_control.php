<?php
	include('Base/base_datos.php');
    //Contadores generales
	$contador_general = mysqli_query($conexion, "CALL Contadores_generales();");
	$resultado_general =mysqli_num_rows($contador_general);
	if($resultado_general > 0){
		$Generales = mysqli_fetch_assoc($contador_general);
		mysqli_close($conexion);
	}	
?>

<?php
include('Base/base_datos.php');
 //Contadores generales por dias
 $contador_general_dias = mysqli_query($conexion, "CALL Contadores_por_dias();");
 $resultado_general_dias =mysqli_num_rows($contador_general_dias);
 if($resultado_general_dias > 0){
     $General_X_dia = mysqli_fetch_assoc($contador_general_dias);
     mysqli_close($conexion);
 }
?>