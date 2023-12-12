<!-- Agregar reservacion -->
<div class="modal fade" id="restaurantes" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel"><i class="bx bx-plus"></i> Nueva reservación</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
            <div class="formulario">
              <form action="../../../Controladores/Restaurantes/Administrador/agregar_reservacion.php" method="post" id="form_reservas_R">
                  <div class="contenido_inputs">
                    
                    <div class="inputs">
                    <label>Restaurante:</label>
                    <select name="nombre_restaurante" id="nombre_restaurante" class="input" required>
                        <option selected disabled>Selecciona un restaurante...</option>
                        <?php include('../../../Modelos/Base/base_datos.php'); 
                        $consulta = $conexion->query("SELECT * FROM restaurantes");
                        foreach($consulta as $restaurantes){
                          echo "<option value='".$restaurantes['id_restaurante']."'>".$restaurantes['nombre_restaurant']."</option>";
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
              <form action="../../../Controladores/Reportes/Restaurantes/Reporte_reservaciones_excel.php" method="post" id="form_reservas_R">
                  <div class="contenido_inputs">
                    
                  <div class="inputs">
                    <label>Restaurante:</label>
                    <select name="restaurante"  class="input" required >
                    <option selected disabled>Selecciona una opción</option>
                    <option value="todos">Todos los restaurantes</option>
                    <?php include('../../../Modelos/Base/Base_datos.php'); 
                    $consulta = $conexion->query("SELECT * FROM restaurantes");?>
                    <?php
                    while($restaurantes = $consulta->fetch_object()){ ?>
                    <option value="<?= $restaurantes->id_restaurante?>"><?= $restaurantes->nombre_restaurant ?></option>;
                    <?php
                  }
                    ?>
                    </select>
                    </div>

                    <div class="inputs">
                    <label>De la fecha:</label>
                    <input type="date" name="inicio" class="input" required>
                    </div>

                    <div class="inputs">
                    <label>Hasta la fecha:</label>
                    <input type="date" name="final" class="input" required>
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
              <form action="../../../Controladores/Reportes/Restaurantes/Reporte_reservaciones_pdf.php" method="post" target="_blank">
                  <div class="contenido_inputs">
                    
                  <div class="inputs">
                    <label>Restaurante:</label>
                    <select name="restaurante"  class="input" required >
                    <option selected disabled>Selecciona una opción</option>
                    <option value="todos">Todos los restaurantes</option>
                    <?php include('../../../Modelos/Base/Base_datos.php'); 
                    $consulta = $conexion->query("SELECT * FROM restaurantes");?>
                    <?php
                    while($restaurantes = $consulta->fetch_object()){ ?>
                    <option value="<?= $restaurantes->id_restaurante?>"><?= $restaurantes->nombre_restaurant ?></option>;
                    <?php
                  }
                    ?>
                    </select>
                    </div>

                    <div class="inputs">
                    <label>Ingresa la fecha:</label>
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

<!-- Editar reservacion -->
<div class="modal fade" id="editar_reserva" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel"><i class="bx bx-plus"></i> Editar reservación del restaurante:</h5> 
        
        <div class="contenido_nombre">
        <input type="text" class="nombre_input" id="nombre" disabled>
        </div>

        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
            <div class="formulario">
              <form action="../../../Controladores/Restaurantes/Administrador/editar_reservacion.php" method="post" id="editar_info_restaurante">
                  <div class="contenido_inputs">
                    
                    <input type="hidden" class="input" name="idreserva" id="idreserva">

                    <div class="inputs">
                    <label>Restaurante:</label>
                    <select name="editar_restaurante" id="editar_restaurante" class="input" required>
                                    <option selected disabled >Selecciona un restaurante</option>
                                    <option value="1">Cello</option>
                                    <option value="2">Copa</option>
                                    <option value="3">Oriente</option>
                                    <option value="4">Tomahawk</option>
                                    <option value="5">Ember</option>
                                    <option value="6">Saffron</option>
                                    <option value="7">Sands</option>
                    </select>
                    </div>

                    <div class="inputs">
                    <label>Huesped:</label>
                    <input type="text" name="editar_huesped" id="editar_huesped" class="input" >
                    </div>

                    <div class="inputs">
                    <label>Apellidos:</label>
                    <input type="text" name="editar_apellidos" id="editar_apellidos" class="input"  >
                    </div>

                    <div class="inputs">
                    <label>Villa:</label>
                    <input type="number" name="editar_villa" id="editar_villa" class="input" >
                    </div> 

                    <div class="inputs">
                    <label>Propiedad:</label>
                    <input type="text" name="editar_propiedad" id="editar_propiedad" class="input" >
                    </div>

                    <div class="inputs">
                    <label>No. personas:</label>
                    <input type="number" name="editar_no_personas" id="editar_no_personas" class="input" >
                    </div>

                    <div class="inputs">
                    <label>No. Niños:</label>
                    <input type="number" name="editar_no_kids" id="editar_no_kids" class="input" >
                    </div>

                    <div class="inputs">
                    <label>Fecha de reservación:</label>
                    <input type="date" name="editar_fecha" id="editar_fecha" class="input" >
                    </div>

                    <div class="inputs">
                    <label>Horario de reservación:</label>
                    <input type="time" name="editar_horario" id="editar_horario" class="input" >
                    </div>

                    <div class="inputs">
                    <label>Comentarios:</label>
                    <input type="text" name="editar_comentarios" id="editar_comentarios" class="input" >
                    </div>

                    <div class="inputs">
                    <label>¿Quién solicita la reservación?:</label>
                    <input type="text" name="editar_solicitante" id="editar_solicitante" class="input" >
                    </div>
                    
                    
                    </div>
                  </div>

                    <div class="btn_agregar">
                    <button type="submit" class="add_user"><i class="bx bx-user-edit"></i> Modificar</button>
                    </div>
              </form>   
            </div>
      </div>
    </div>
  </div>
</div>
<!--Fin-->
