<?php
require('../Calculo_celdas_footer.php');
include('../../../Modelos/Base/base_datos.php');
date_default_timezone_set('America/Cancun');

//Variables
$inicio = $_POST['inicio'];
$nombre_des = $_POST['destination'];

$pdf = new PDF_MC_Table();

//RESTAURANTE CELLO
$pdf->AddPage();
$pdf->AliasNbPages();
$pdf->SetFont('Arial', 'B', 7.5);

//Tablas de la base de datos
$contadores=["reservas_destinations"];

//Tablas de la base de datos
$restaurants = [
    "reservas_destinations"
];

//Codigo para generar los contadores generales de los contadores 
foreach($contadores as $keys => $contador){
if($nombre_des == "todos"){
//Contadores para HAAB
    $consulta = "SELECT SUM(numero_personas + kids) as total, COUNT(*) as reservas, SUM(numero_personas) as 
    adultos, SUM(kids) as kid FROM $contador WHERE fecha_reserva = '$inicio' AND name_destination = 1";
    $result = mysqli_query($conexion, $consulta);

    $h = 10;

    //Tamaños de los CELL
    $pdf->SetWidths([40,40,40,40]);
    //Se crea un arreglo de 4
    $Variables = ['Total de personas: ', 'Total de reservas: ', 'Total de adultos:', 'Total de kids: '];
    //Se almacena en una variable el contador donde van almacenados los restaurantes
    $nombre = strtoupper($contador); 
    //Se crea un CellHeader, es decir, un titulo y se manda a traer la variable donde se alojan los nombres de los restaurantes
    $pdf->CellHeader(0, 20, "DESTINATION HAAB", 0, 1, 'C');
    $pdf->SetX(20);
    $pdf->Row($Variables);
    $pdf->SetX(20);
    while ($rows = $result->fetch_assoc()) {
        $data = [
            utf8_decode($rows['total']),
            utf8_decode($rows['reservas']),
            utf8_decode($rows['adultos']),
            utf8_decode($rows['kid'])
            
        ];
        $pdf->Row($data);
    }//Fin del While     
    $pdf->Ln(30); 
//FIN

//Contadores para LATIN BBQ
    $consulta = "SELECT SUM(numero_personas + kids) as total, COUNT(*) as reservas, SUM(numero_personas) as 
    adultos, SUM(kids) as kid FROM $contador WHERE fecha_reserva = '$inicio' AND name_destination = 2 ";
    $result = mysqli_query($conexion, $consulta);
    $h = 10;

    //Tamaños de los Cell
    $pdf->SetWidths([40,40,40,40]);
    //Se crea un arreglo de 4
    $Variables = ['Total de personas: ', 'Total de reservas: ', 'Total de adultos:', 'Total de kids: '];
    //Se almacena en una variable el contador donde van almacenados los restaurantes
    $nombre = strtoupper($contador); 
    //Se crea un CellHeader, es decir, un titulo y se manda a traer la variable donde se alojan los nombres de los restaurantes
    $pdf->CellHeader(0, 20, "DESTINATION LATIN BBQ", 0, 1, 'C');
    $pdf->SetX(20);
    $pdf->Row($Variables);
    $pdf->SetX(20);
    while ($rows = $result->fetch_assoc()) {
        $data = [
            utf8_decode($rows['total']),
            utf8_decode($rows['reservas']),
            utf8_decode($rows['adultos']),
            utf8_decode($rows['kid'])
            
        ];
        $pdf->Row($data);
    }//Fin del While   
    $pdf->Ln(30);    
//FIN

//Contadores para NOCHE MEXICANA
    $consulta = "SELECT SUM(numero_personas + kids) as total, COUNT(*) as reservas, SUM(numero_personas) as 
    adultos, SUM(kids) as kid FROM $contador WHERE fecha_reserva = '$inicio' AND name_destination = 3 ";
    $result = mysqli_query($conexion, $consulta);
    $h = 10;

    //Tamaños de los Cell
    $pdf->SetWidths([40,40,40,40]);
    //Se crea un arreglo de 4
    $Variables = ['Total de personas: ', 'Total de reservas: ', 'Total de adultos:', 'Total de kids: '];
    //Se almacena en una variable el contador donde van almacenados los restaurantes
    $nombre = strtoupper($contador); 
    //Se crea un CellHeader, es decir, un titulo y se manda a traer la variable donde se alojan los nombres de los restaurantes
    $pdf->CellHeader(0, 20, "DESTINATION NOCHE MEXICANA", 0, 1, 'C');
    $pdf->SetX(20);
    $pdf->Row($Variables);
    $pdf->SetX(20);
    while ($rows = $result->fetch_assoc()) {
        $data = [
            utf8_decode($rows['total']),
            utf8_decode($rows['reservas']),
            utf8_decode($rows['adultos']),
            utf8_decode($rows['kid'])
            
        ];
        $pdf->Row($data);
    }//Fin del While 
    $pdf->Ln(30);      
//FIN

$pdf->Ln(155);//salto de linea
}//Fin de else todos

//Contadores por restaurante
else{
    $consulta = "SELECT SUM(numero_personas + kids) as total, COUNT(*) as reservas, SUM(numero_personas) as 
    adultos, SUM(kids) as kid FROM $contador WHERE name_destination = $nombre_des AND fecha_reserva = '$inicio'";
    $result = mysqli_query($conexion, $consulta);

    $h = 10;

    //Tamaños de los Cell
    $pdf->SetWidths([40,40,40,40]);
    //Se crea un arreglo de 4
    $Variables = ['Total de personas: ', 'Total de reservas: ', 'Total de adultos:', 'Total de kids: '];
    //Se almacena en una variable el contador donde van almacenados los restaurantes
    $nombre = strtoupper($contador); 
    //Se crea un CellHeader, es decir, un titulo y se manda a traer la variable donde se alojan los nombres de los restaurantes
    $pdf->SetX(20);
    $pdf->Row($Variables);
    $pdf->SetX(20);
    while ($rows = $result->fetch_assoc()) {
        $data = [
            utf8_decode($rows['total']),
            utf8_decode($rows['reservas']),
            utf8_decode($rows['adultos']),
            utf8_decode($rows['kid'])
            
        ];
        $pdf->Row($data);
    }//Fin del While   
    $pdf->Ln(5);
}//Fin de else
}//Fin del Foreach

if ($keys < count($contadores) - 1) {
$pdf->AddPage();
}

foreach ($restaurants as $key => $restaurant) {
//Todas las reservaciones
if($nombre_des == "todos"){
    $sql = "SELECT D.name_destination,D.huesped,D.apellidos,D.villa,D.propiedad,D.numero_personas,D.kids,D.fecha_reserva,D.horario_reserva,D.comentarios,D.solicitante,dest.nombre_destination FROM reservas_destinations D INNER JOIN destinations dest ON D.name_destination = dest.id_destinations
    WHERE fecha_reserva = '$inicio' ORDER BY id_destinations,fecha_reserva, horario_reserva ";
    $resultado = mysqli_query($conexion, $sql);
    $pdf->CellHeader(0, 20, "RESERVACIONES GENERALES", 0, 1, 'C');
}//Fin del if todos

//Reservaciones individuales
else{
    $sql = "SELECT D.name_destination,D.huesped,D.apellidos,D.villa,D.propiedad,D.numero_personas,D.kids,D.fecha_reserva,D.horario_reserva,D.comentarios,D.solicitante,dest.nombre_destination FROM reservas_destinations D INNER JOIN destinations dest ON D.name_destination = dest.id_destinations
    WHERE D.name_destination = $nombre_des AND fecha_reserva = '$inicio' ORDER BY id_destinations,fecha_reserva,horario_reserva ";
    $resultado = mysqli_query($conexion, $sql);
    
    $nombre_destinations = $conexion->query("SELECT dest.nombre_destination FROM reservas_destinations D INNER JOIN destinations dest ON D.name_destination = dest.id_destinations WHERE D.name_destination = $nombre_des");
    $nombre = $nombre_destinations->fetch_object()->nombre_destination;
    $nombre_mayuscula = strtoupper($nombre);
    $pdf->CellHeader(0, 20, "RESERVACIONES $nombre_mayuscula", 0, 1, 'C');

    if($nombre_mayuscula == NULL){
        echo "No hay ninguna reserva";
    }
}

    $h = 10;
    $pdf->SetWidths([17,16, 15, 17, 17, 12, 8, 8, 10, 40, 25]);

    $tableHeaders = ['Destination','Fecha', 'Horario', 'Nombre', 'Apellidos', 'Adultos', 'Kids', 'Villa', 'Hotel', 'Comentarios', 'Responsable'];
   
    $pdf->Row($tableHeaders);
    $pdf->SetDrawColor(0,0,0);
    $pdf->SetFillColor(0,0,0);

    while ($row = $resultado->fetch_assoc()) {
        $dat = [
            utf8_decode($row['nombre_destination']),
            utf8_decode($row['fecha_reserva']),
            utf8_decode($row['horario_reserva']),
            utf8_decode($row['huesped']),
            utf8_decode($row['apellidos']),
            utf8_decode($row['numero_personas']),
            utf8_decode($row['kids']),
            utf8_decode($row['villa']),
            utf8_decode($row['propiedad']),
            utf8_decode($row['comentarios']),
            utf8_decode($row['solicitante'])
        ];
        $pdf->Row($dat);
    }
    if ($key < count($restaurants) - 1) {
        $pdf->AddPage();
    }
}




$pdf->Output('Reservaciones_generales.pdf', 'I');
?>