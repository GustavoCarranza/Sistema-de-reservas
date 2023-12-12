<?php
header("Content-Type: application/xlsx");
header("Content-Disposition: attachment; filename = Reservaciones_Destinations.xls");
?>
<table>
          <thead>
              <tr>
                  <th class="text-center">ID</th>  
                  <th class="text-center">Destination</th>
                  <th class="text-center">Fecha</th>
                  <th class="text-center">Horario</th>
                  <th class="text-center">Huesped</th>
                  <th class="text-center">Apellidos</th>
                  <th class="text-center">Adultos</th>
                  <th class="text-center">Kids</th>
                  <th class="text-center">Villa</th>
                  <th class="text-center">Mesa</th>
                  <th class="text-center">Hotel</th>
                  <th class="text-center">Responsable</th>
                  <th class="text-center">Comentarios</th>
                  <th class="text-center">En turno</th>
              </tr>
          </thead>
          <tbody>
          <?php

                include ('../../../Modelos/Base/base_datos.php');
                $inicio = $_POST['inicio'];
                $nombre_des = $_POST['destination'];
                
                if($nombre_des == "todos"){
                    $sql = "SELECT D.id_reserva_D,D.name_destination,D.huesped,D.apellidos,D.mesa,D.villa,D.propiedad,D.numero_personas,D.kids,D.fecha_reserva,D.horario_reserva,D.comentarios,D.solicitante,D.usuario,dest.nombre_destination FROM reservas_destinations D INNER JOIN destinations dest ON D.name_destination = dest.id_destinations
                    WHERE fecha_reserva = '$inicio' ORDER BY id_destinations, horario_reserva ";
                    $resultado = mysqli_query($conexion, $sql);
                    ?>
                    <center><h1>RESERVACIONES GENERALES</h1></center>
                    <?php
                }
                else{
                    $sql = "SELECT D.id_reserva_D,D.name_destination,D.huesped,D.apellidos,D.mesa,D.villa,D.propiedad,D.numero_personas,D.kids,D.fecha_reserva,D.horario_reserva,D.comentarios,D.solicitante,D.usuario,dest.nombre_destination FROM reservas_destinations D INNER JOIN destinations dest ON D.name_destination = dest.id_destinations
                    WHERE D.name_destination = $nombre_des AND fecha_reserva = '$inicio' ORDER BY id_destinations,fecha_reserva, horario_reserva ";
                    $resultado = mysqli_query($conexion, $sql);
    
                    $nombre_destination = $conexion->query("SELECT dest.nombre_destination FROM reservas_destinations D INNER JOIN destinations dest ON D.name_destination = dest.id_destinations WHERE D.name_destination = $nombre_des");
                    $nombre = $nombre_destination->fetch_object()->nombre_destination;
                    $nombre_mayuscula = strtoupper($nombre);
                    ?>
                    <center><h1>RESERVACIONES EN <?php echo $nombre_mayuscula ?></h1></center>
                    <?php
                }
               

                while($fila = $resultado->fetch_assoc()){
              ?>

         <tr>
             <th class="text-center"><?php echo utf8_decode($fila['id_reserva_D']) ?></th>
             <th class="text-center"><?php echo utf8_decode($fila['nombre_destination']) ?></th>
             <th class="text-center"><?php echo utf8_decode($fila['fecha_reserva']) ?></th>
             <th class="text-center"><?php echo utf8_decode($fila['horario_reserva']) ?></th>
             <th class="text-center"><?php echo utf8_decode($fila['huesped']) ?></th>
             <th class="text-center"><?php echo utf8_decode($fila['apellidos']) ?></th>
             <th class="text-center"><?php echo utf8_decode($fila['numero_personas']) ?></th>
             <th class="text-center"><?php echo utf8_decode($fila['kids']) ?></th>
             <th class="text-center"><?php echo utf8_decode($fila['villa']) ?></th>
             <th class="text-center"><?php echo utf8_decode($fila['mesa']) ?></th>
             <th class="text-center"><?php echo utf8_decode($fila['propiedad']) ?></th>
             <th class="text-center"><?php echo utf8_decode($fila['solicitante']) ?></th>
             <th class="text-center"><?php echo utf8_decode($fila['comentarios']) ?></th>
             <th class="text-center"><?php echo utf8_decode($fila['usuario']) ?></th>
        </tr>  
     <?php        


 }

?>
          </tbody>
      </table>