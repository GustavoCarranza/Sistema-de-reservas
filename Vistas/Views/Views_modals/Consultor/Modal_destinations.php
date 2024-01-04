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
                    <label>De la fecha:</label>
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
                    <label>De la fecha:</label>
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
