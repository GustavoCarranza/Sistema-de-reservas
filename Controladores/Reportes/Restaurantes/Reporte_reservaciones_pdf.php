<?php


require('../Calculo_celdas_footer.php');
include('../../../Modelos/Base/base_datos.php');
date_default_timezone_set('America/Cancun');

//Variables
$inicio = $_POST['inicio'];
$nombre_res = $_POST['restaurante'];

$pdf = new PDF_MC_Table();

//RESTAURANTE CELLO
$pdf->AddPage();
$pdf->AliasNbPages();
$pdf->SetFont('Arial', 'B', 7.5);

//Tablas de la base de datos
$contadores=["reservas_restaurante"];

//Tablas de la base de datos
$restaurants = [
    "reservas_restaurante"
];

//Codigo para generar los contadores generales de los contadores 
foreach($contadores as $keys => $contador){
if($nombre_res == "todos"){
//Contadores para CELLO
    $consulta = "SELECT SUM(numero_personas + kids) as total, COUNT(*) as reservas, SUM(numero_personas) as 
    adultos, SUM(kids) as kid FROM $contador WHERE fecha_reserva = '$inicio' AND nombre_restaurante = 1";
    $result = mysqli_query($conexion, $consulta);

    $h = 10;

    //Tamaños de los Cell
    $pdf->SetWidths([40,40,40,40]);
    //Se crea un arreglo de 4
    $Variables = ['Total de personas: ', 'Total de reservas: ', 'Total de adultos:', 'Total de kids: '];
    //Se almacena en una variable el contador donde van almacenados los restaurantes
    $nombre = strtoupper($contador); 
    //Se crea un CellHeader, es decir, un titulo y se manda a traer la variable donde se alojan los nombres de los restaurantes
    $pdf->CellHeader(0, 20, "RESTAURANTE CELLO", 0, 1, 'C');
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
//FIN

//Contadores para COPA
    $consulta = "SELECT SUM(numero_personas + kids) as total, COUNT(*) as reservas, SUM(numero_personas) as 
    adultos, SUM(kids) as kid FROM $contador WHERE fecha_reserva = '$inicio' AND nombre_restaurante = 2 ";
    $result = mysqli_query($conexion, $consulta);
    $h = 10;

    //Tamaños de los Cell
    $pdf->SetWidths([40,40,40,40]);
    //Se crea un arreglo de 4
    $Variables = ['Total de personas: ', 'Total de reservas: ', 'Total de adultos:', 'Total de kids: '];
    //Se almacena en una variable el contador donde van almacenados los restaurantes
    $nombre = strtoupper($contador); 
    //Se crea un CellHeader, es decir, un titulo y se manda a traer la variable donde se alojan los nombres de los restaurantes
    $pdf->CellHeader(0, 20, "RESTAURANTE COPA", 0, 1, 'C');
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
//FIN

//Contadores para ORIENTE
    $consulta = "SELECT SUM(numero_personas + kids) as total, COUNT(*) as reservas, SUM(numero_personas) as 
    adultos, SUM(kids) as kid FROM $contador WHERE fecha_reserva = '$inicio' AND nombre_restaurante = 3 ";
    $result = mysqli_query($conexion, $consulta);
    $h = 10;

    //Tamaños de los Cell
    $pdf->SetWidths([40,40,40,40]);
    //Se crea un arreglo de 4
    $Variables = ['Total de personas: ', 'Total de reservas: ', 'Total de adultos:', 'Total de kids: '];
    //Se almacena en una variable el contador donde van almacenados los restaurantes
    $nombre = strtoupper($contador); 
    //Se crea un CellHeader, es decir, un titulo y se manda a traer la variable donde se alojan los nombres de los restaurantes
    $pdf->CellHeader(0, 20, "RESTAURANTE ORIENTE", 0, 1, 'C');
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
//FIN

//Contadores para TOMAHAWK
    $consulta = "SELECT SUM(numero_personas + kids) as total, COUNT(*) as reservas, SUM(numero_personas) as 
    adultos, SUM(kids) as kid FROM $contador WHERE fecha_reserva = '$inicio' AND nombre_restaurante = 4 ";
    $result = mysqli_query($conexion, $consulta);
    $h = 10;

    //Tamaños de los Cell
    $pdf->SetWidths([40,40,40,40]);
    //Se crea un arreglo de 4
    $Variables = ['Total de personas: ', 'Total de reservas: ', 'Total de adultos:', 'Total de kids: '];
    //Se almacena en una variable el contador donde van almacenados los restaurantes
    $nombre = strtoupper($contador); 
    //Se crea un CellHeader, es decir, un titulo y se manda a traer la variable donde se alojan los nombres de los restaurantes
    $pdf->CellHeader(0, 20, "RESTAURANTE TOMAHAWK", 0, 1, 'C');
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
//FIN

//Contadores para EMBER
    $consulta = "SELECT SUM(numero_personas + kids) as total, COUNT(*) as reservas, SUM(numero_personas) as 
    adultos, SUM(kids) as kid FROM $contador WHERE fecha_reserva = '$inicio' AND nombre_restaurante = 5 ";
    $result = mysqli_query($conexion, $consulta);
    $h = 10;

    //Tamaños de los Cell
    $pdf->SetWidths([40,40,40,40]);
    //Se crea un arreglo de 4
    $Variables = ['Total de personas: ', 'Total de reservas: ', 'Total de adultos:', 'Total de kids: '];
    //Se almacena en una variable el contador donde van almacenados los restaurantes
    $nombre = strtoupper($contador); 
    //Se crea un CellHeader, es decir, un titulo y se manda a traer la variable donde se alojan los nombres de los restaurantes
    $pdf->CellHeader(0, 20, "RESTAURANTE EMBER", 0, 1, 'C');
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
//FIN

//Contadores para SAFFRON
    $consulta = "SELECT SUM(numero_personas + kids) as total, COUNT(*) as reservas, SUM(numero_personas) as 
    adultos, SUM(kids) as kid FROM $contador WHERE fecha_reserva = '$inicio' AND nombre_restaurante = 6 ";
    $result = mysqli_query($conexion, $consulta);
    $h = 10;

    //Tamaños de los Cell
    $pdf->SetWidths([40,40,40,40]);
    //Se crea un arreglo de 4
    $Variables = ['Total de personas: ', 'Total de reservas: ', 'Total de adultos:', 'Total de kids: '];
    //Se almacena en una variable el contador donde van almacenados los restaurantes
    $nombre = strtoupper($contador); 
    //Se crea un CellHeader, es decir, un titulo y se manda a traer la variable donde se alojan los nombres de los restaurantes
    $pdf->CellHeader(0, 20, "RESTAURANTE SAFFRON", 0, 1, 'C');
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
//FIN

//Contadores para SANDS
    $consulta = "SELECT SUM(numero_personas + kids) as total, COUNT(*) as reservas, SUM(numero_personas) as 
    adultos, SUM(kids) as kid FROM $contador WHERE fecha_reserva = '$inicio' AND nombre_restaurante = 7 ";
    $result = mysqli_query($conexion, $consulta);
    $h = 10;

    //Tamaños de los Cell
    $pdf->SetWidths([40,40,40,40]);
    //Se crea un arreglo de 4
    $Variables = ['Total de personas: ', 'Total de reservas: ', 'Total de adultos:', 'Total de kids: '];
    //Se almacena en una variable el contador donde van almacenados los restaurantes
    $nombre = strtoupper($contador); 
    //Se crea un CellHeader, es decir, un titulo y se manda a traer la variable donde se alojan los nombres de los restaurantes
    $pdf->CellHeader(0, 20, "RESTAURANTE SANDS", 0, 1, 'C');
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
//FIN      

$pdf->Ln(25);//salto de linea
}//Fin de else todos

//Contadores por restaurante
else{
    $consulta = "SELECT SUM(numero_personas + kids) as total, COUNT(*) as reservas, SUM(numero_personas) as 
    adultos, SUM(kids) as kid FROM $contador WHERE nombre_restaurante = $nombre_res AND fecha_reserva = '$inicio'";
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
if($nombre_res == "todos"){
    $sql = "SELECT R.nombre_restaurante,R.huesped,R.apellidos,R.villa,R.propiedad,R.numero_personas,R.kids,R.fecha_reserva,R.horario_reserva,R.comentarios,R.solicitante,res.nombre_restaurant FROM reservas_restaurante R INNER JOIN restaurantes res ON R.nombre_restaurante = res.id_restaurante
    WHERE fecha_reserva = '$inicio' ORDER BY id_restaurante, horario_reserva ";
    $resultado = mysqli_query($conexion, $sql);
    $pdf->CellHeader(0, 20, "RESERVACIONES GENERALES", 0, 1, 'C');
}//Fin del if todos

//Reservaciones individuales
else{
    $sql = "SELECT R.nombre_restaurante,R.huesped,R.apellidos,R.villa,R.propiedad,R.numero_personas,R.kids,R.fecha_reserva,R.horario_reserva,R.comentarios,R.solicitante,res.nombre_restaurant FROM reservas_restaurante R INNER JOIN restaurantes res ON R.nombre_restaurante = res.id_restaurante
    WHERE R.nombre_restaurante = $nombre_res AND fecha_reserva = '$inicio' ORDER BY id_restaurante, horario_reserva ";
    $resultado = mysqli_query($conexion, $sql);
    
    $nombre_restaurante = $conexion->query("SELECT res.nombre_restaurant FROM reservas_restaurante R INNER JOIN restaurantes res ON R.nombre_restaurante = res.id_restaurante WHERE R.nombre_restaurante = $nombre_res");
    $nombre = $nombre_restaurante->fetch_object()->nombre_restaurant;
    $nombre_mayuscula = strtoupper($nombre);
    $pdf->CellHeader(0, 20, "RESERVACIONES $nombre_mayuscula", 0, 1, 'C');
}

    $h = 10;
    $pdf->SetWidths([17,16, 15, 17, 17, 12, 8, 8, 10, 40, 25]);

    $tableHeaders = ['Restaurante','Fecha', 'Horario', 'Nombre', 'Apellidos', 'Adultos', 'Kids', 'Villa', 'Hotel', 'Comentarios', 'Responsable'];
   
    $pdf->Row($tableHeaders);
    $pdf->SetDrawColor(0,0,0);
    $pdf->SetFillColor(0,0,0);

    while ($row = $resultado->fetch_assoc()) {
        $dat = [
            utf8_decode($row['nombre_restaurant']),
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