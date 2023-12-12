<?php
header("Content-Type: application/xlsx");
header("Content-Disposition: attachment; filename = Reservaciones.xls");
?>
<table>
          <thead>
              <tr>
                  <th class="text-center">ID</th>  
                  <th class="text-center">Restaurante</th>
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
                $nombre_res = $_POST['restaurante'];
                
                if($nombre_res == "todos"){
                    $sql = "SELECT R.id_reserva_R,R.nombre_restaurante,R.huesped,R.apellidos,R.mesa,R.villa,R.propiedad,R.numero_personas,R.kids,R.fecha_reserva,R.horario_reserva,R.comentarios,R.solicitante,R.usuario,res.nombre_restaurant FROM reservas_restaurante R INNER JOIN restaurantes res ON R.nombre_restaurante = res.id_restaurante
                    WHERE fecha_reserva = '$inicio' ORDER BY id_restaurante, horario_reserva ";
                    $resultado = mysqli_query($conexion, $sql);
                    ?>
                    <center><h1>RESERVACIONES GENERALES</h1></center>
                    <?php
                }
                else{
                    $sql = "SELECT R.id_reserva_R,R.nombre_restaurante,R.huesped,R.apellidos,R.mesa,R.villa,R.propiedad,R.numero_personas,R.kids,R.fecha_reserva,R.horario_reserva,R.comentarios,R.solicitante,R.usuario,res.nombre_restaurant FROM reservas_restaurante R INNER JOIN restaurantes res ON R.nombre_restaurante = res.id_restaurante
                    WHERE R.nombre_restaurante = $nombre_res AND fecha_reserva = '$inicio' ORDER BY id_restaurante, horario_reserva ";
                    $resultado = mysqli_query($conexion, $sql);
    
                    $nombre_restaurante = $conexion->query("SELECT res.nombre_restaurant FROM reservas_restaurante R INNER JOIN restaurantes res ON R.nombre_restaurante = res.id_restaurante WHERE R.nombre_restaurante = $nombre_res");
                    $nombre = $nombre_restaurante->fetch_object()->nombre_restaurant;
                    $nombre_mayuscula = strtoupper($nombre);
                    ?>
                    <center><h1>RESERVACIONES DEL RESTAURANTE <?php echo $nombre_mayuscula ?></h1></center>
                    <?php
                }
               

                while($fila = $resultado->fetch_assoc()){
              ?>

         <tr>
             <th class="text-center"><?php echo utf8_decode($fila['id_reserva_R']) ?></th>
             <th class="text-center"><?php echo utf8_decode($fila['nombre_restaurant']) ?></th>
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