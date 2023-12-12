<?php
header("Content-Type: application/xlsx");
header("Content-Disposition: attachment; filename = Reservaciones_Destinations.xls");
?>
<table>
          <thead>
              <tr>
                  <th class="text-center">ID</th>  
                  <th class="text-center">Evento</th>
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
                $nombre_eve = $_POST['evento'];
                
                if($nombre_eve == "todos"){
                    $sql = "SELECT E.id_reserva_E,E.name_evento,E.huesped,E.apellidos,E.mesa,E.villa,E.propiedad,E.numero_personas,E.kids,E.fecha_reserva,E.horario_reserva,E.comentarios,E.solicitante,E.usuario,EV.nombre_evento FROM reservas_eventos E INNER JOIN eventos EV ON E.name_evento = EV.id_evento
                    WHERE fecha_reserva = '$inicio' AND ORDER BY id_evento,fecha_Reserva, horario_reserva ";
                    $resultado = mysqli_query($conexion, $sql);
                    ?>
                    <center><h1>RESERVACIONES GENERALES</h1></center>
                    <?php
                }
                else{
                    $sql = "SELECT E.id_reserva_E,E.name_evento,E.huesped,E.apellidos,E.mesa,E.villa,E.propiedad,E.numero_personas,E.kids,E.fecha_reserva,E.horario_reserva,E.comentarios,E.solicitante,E.usuario,EV.nombre_evento FROM reservas_eventos E INNER JOIN eventos EV ON E.name_evento = EV.id_evento
                    WHERE E.name_evento = $nombre_eve AND fecha_reserva = '$inicio' ORDER BY id_evento,fecha_reserva, horario_reserva ";
                    $resultado = mysqli_query($conexion, $sql);
    
                    $nombre_evento = $conexion->query("SELECT EV.nombre_evento FROM reservas_eventos E INNER JOIN eventos EV ON E.name_evento = EV.id_evento WHERE E.name_evento = $nombre_eve");
                    $nombre = $nombre_evento->fetch_object()->nombre_evento;
                    $nombre_mayuscula = strtoupper($nombre);
                    ?>
                    <center><h1>RESERVACIONES EN <?php echo $nombre_mayuscula ?></h1></center>
                    <?php
                }
               

                while($fila = $resultado->fetch_assoc()){
              ?>

         <tr>
             <th class="text-center"><?php echo utf8_decode($fila['id_reserva_E']) ?></th>
             <th class="text-center"><?php echo utf8_decode($fila['nombre_evento']) ?></th>
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