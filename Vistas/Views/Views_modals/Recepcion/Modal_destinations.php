<!-- Agregar reservacion -->
<div class="modal fade" id="destinations" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel"><i class="bx bx-plus"></i> Nueva reservación</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
            <div class="formulario">
              <form action="../../../Controladores/Destinations/Recepcion/agregar_reservacion.php" method="post" id="form_reservas_D">
                  <div class="contenido_inputs">
                    
                    <div class="inputs">
                    <label>Destination dining:</label>
                    <select name="nombre_destination" id="nombre_destination" class="input" required>
                        <option selected disabled>Selecciona un destination...</option>
                        <?php include('../../../Modelos/Base/base_datos.php'); 
                        $consulta = $conexion->query("SELECT * FROM destinations");
                        foreach($consulta as $destinations){
                          echo "<option value='".$destinations['id_destinations']."'>".$destinations['nombre_destination']."</option>";
                        }
                        ?>
                    </select>
                    </div>

                    <div class="inputs">
                    <label>Huesped:</label>
                    <input type="text" name="huesped" id="huesped" class="input" required>
                    </div>

                    <div class="inputs">
                    <label>Apellidos:</label>
                    <input type="text" name="apellidos" id="apellidos" class="input" required>
                    </div>

                    <div class="inputs">
                    <label>Villa:</label>
                    <input type="number" name="villa" id="villa" class="input" required>
                    </div>

                    <div class="inputs">
                    <label>Propiedad:</label>
                    <input type="text" name="propiedad" id="propiedad" class="input" required>
                    </div>

                    <div class="inputs">
                    <label>No. personas:</label>
                    <input type="number" name="no_personas" id="no_personas" class="input" required>
                    </div>

                    <div class="inputs">
                    <label>No. Niños:</label>
                    <input type="number" name="no_kids" id="no_kids" class="input" required>
                    </div>

                    <div class="inputs">
                    <label>Fecha de reservación:</label>
                    <input type="date" name="fecha" id="fecha" class="input" required>
                    </div>

                    <div class="inputs">
                    <label>Horario de reservación:</label>
                    <input type="time" name="horario" id="horario" class="input" required>
                    </div>

                    <div class="inputs">
                    <label>Comentarios:</label>
                    <input type="text" name="comentarios" id="comentarios" class="input" required>
                    </div>

                    <div class="inputs">
                    <label>¿Quién solicita la reservación?:</label>
                    <input type="text" name="solicitante" id="solicitante" class="input" required>
                    </div>
                    
                    <div class="inputs">
                    <input type="hidden" name="usuario" id="usuario" class="input" value="<?php echo $_SESSION['usuario']?>">
                    </div>
                    
                    </div>
                  </div>

                    <div class="btn_agregar">
                    <button type="submit" class="add_user"><i class="bx bx-user-plus"></i> Agregar</button>
                    </div>
              </form>   
            </div>
      </div>
    </div>
  </div>
</div>
<!--Fin-->

<!-- Agregar reservaciones siguientes -->
<div class="modal fade" id="destinations_siguientes" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel"><i class="bx bx-plus"></i> Nueva reservación</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
            <div class="formulario">
              <form action="../../../Controladores/Destinations/Recepcion/Consultar/Reservas_siguientes/agregar.php" method="post" id="form_reservas_S">
                  <div class="contenido_inputs">
                    
                    <div class="inputs">
                    <label>Destination dining:</label>
                    <select name="nombre_destination_siguiente" id="nombre_destination_siguiente" class="input" required>
                        <option selected disabled>Selecciona un destination...</option>
                        <?php include('../../../Modelos/Base/base_datos.php'); 
                        $consulta = $conexion->query("SELECT * FROM destinations");
                        foreach($consulta as $destinations){
                          echo "<option value='".$destinations['id_destinations']."'>".$destinations['nombre_destination']."</option>";
                        }
                        ?>
                    </select>
                    </div>

                    <div class="inputs">
                    <label>Huesped:</label>
                    <input type="text" name="huesped_siguiente" id="huesped_siguiente" class="input" required>
                    </div>

                    <div class="inputs">
                    <label>Apellidos:</label>
                    <input type="text" name="apellidos_siguiente" id="apellidos_siguiente" class="input" required>
                    </div>

                    <div class="inputs">
                    <label>Villa:</label>
                    <input type="number" name="villa_siguiente" id="villa_siguiente" class="input" required>
                    </div>

                    <div class="inputs">
                    <label>Propiedad:</label>
                    <input type="text" name="propiedad_siguiente" id="propiedad_siguiente" class="input" required>
                    </div>

                    <div class="inputs">
                    <label>No. personas:</label>
                    <input type="number" name="no_personas_siguiente" id="no_personas_siguiente" class="input" required>
                    </div>

                    <div class="inputs">
                    <label>No. Niños:</label>
                    <input type="number" name="no_kids_siguiente" id="no_kids_siguiente" class="input" required>
                    </div>

                    <div class="inputs">
                    <label>Fecha de reservación:</label>
                    <input type="date" name="fecha_siguiente" id="fecha_siguiente" class="input" required>
                    </div>

                    <div class="inputs">
                    <label>Horario de reservación:</label>
                    <input type="time" name="horario_siguiente" id="horario_siguiente" class="input" required>
                    </div>

                    <div class="inputs">
                    <label>Comentarios:</label>
                    <input type="text" name="comentarios_siguiente" id="comentarios_siguiente" class="input" required>
                    </div>

                    <div class="inputs">
                    <label>¿Quién solicita la reservación?:</label>
                    <input type="text" name="solicitante_siguiente" id="solicitante_siguiente" class="input" required>
                    </div>
                    
                    <div class="inputs">
                    <input type="hidden" name="usuario_siguiente" id="usuario_siguiente" class="input" value="<?php echo $_SESSION['usuario']?>">
                    </div>
                    
                    </div>
                  </div>

                    <div class="btn_agregar">
                    <button type="submit" class="add_user"><i class="bx bx-user-plus"></i> Agregar</button>
                    </div>
              </form>   
            </div>
      </div>
    </div>
  </div>
</div>
<!--Fin-->


<!-- consultar reservacion -->
<div class="modal fade" id="reservas" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel"><i class="bx bx-plus"></i> Nueva reservación</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
            <div class="formulario">
              <div class="btn_consultar">
                 <a href="reservas_anteriores_D.php" class="consult"><i class="bx bx-table"></i> Reservas anteriores </a>
                 <a href="reservas_siguientes_D.php" class="consult"><i class="bx bx-table"></i> Reservas siguientes </a>
              </div>
            </div>
      </div>
    </div>
  </div>
</div>
<!--Fin-->

<!-- Exportar reservaciones en Excel -->
<div class="modal fade" id="excel" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel"><i class="bx bx-table"></i> Exportar reservaciones en archivo Excel</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
            <div class="formulario">
              <form action="../../../Controladores/Reportes/Destinations/Reporte_reservaciones_excel.php" method="post" id="form_reservas_R">
                  <div class="contenido_inputs">
                    
                  <div class="inputs">
                    <label>Destination:</label>
                    <select name="destination"  class="input" required >
                    <option selected disabled>Selecciona una opción</option>
                    <option value="todos">Todos los destinations</option>
                    <?php include('../../../Modelos/Base/Base_datos.php'); 
                    $consulta = $conexion->query("SELECT * FROM destinations");?>
                    <?php
                    while($destinations = $consulta->fetch_object()){ ?>
                    <option value="<?= $destinations->id_destinations?>"><?= $destinations->nombre_destination?></option>;
                    <?php
                  }
                    ?>
                    </select>
                    </div>

                    <div class="inputs">
                    <label>Ingresar fecha:</label>
                    <input type="date" name="inicio" class="input" required>
                    </div>

                    </div>
                  </div>

                    <div class="btn_agregar">
                    <button type="submit" class="add_user"><i class="bx bx-file"></i> Generar</button>
                    </div>
              </form>   
            </div>
      </div>
    </div>
  </div>
</div>
<!--Fin-->

<!-- Exportar reservaciones en PDF -->
<div class="modal fade" id="pdf" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel"><i class="bx bx-table"></i> Exportar reservaciones en archivo PDF</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
            <div class="formulario">
              <form action="../../../Controladores/Reportes/Destinations/Reporte_reservaciones_pdf.php" method="post" target="_blank">
                  <div class="contenido_inputs">
                    
                  <div class="inputs">
                    <label>Destination:</label>
                    <select name="destination" class="input" required >
                    <option selected disabled>Selecciona una opción</option>
                    <option value="todos">Todos los destinations</option>
                    <?php include('../../../Modelos/Base/Base_datos.php'); 
                    $consulta = $conexion->query("SELECT * FROM destinations");?>
                    <?php
                    while($destinations = $consulta->fetch_object()){ ?>
                    <option value="<?= $destinations->id_destinations?>"><?= $destinations->nombre_destination?></option>;
                    <?php
                  }
                    ?>
                    </select>
                    </div>

                    <div class="inputs">
                    <label>Ingrsar fecha:</label>
                    <input type="date" name="inicio" class="input" required>
                    </div>

                    </div>
                  </div>

                    <div class="btn_agregar">
                    <button type="submit" class="add_user"><i class="bx bx-file"></i> Generar</button>
                    </div>
              </form>   
            </div>
      </div>
    </div>
  </div>
</div>
<!--Fin-->

