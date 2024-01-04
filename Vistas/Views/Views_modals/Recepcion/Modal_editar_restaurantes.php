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
              <form action="../../../Controladores/Restaurantes/Recepcion/editar_reservacion.php" method="post" id="editar_info_restaurante">
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

                    <div class="inputs">
                    <input type="hidden" name="editar_creacion" id="editar_creacion" class="input" >
                    </div>

                    <div class="inputs">
                    <input type="hidden" name="usuario_edita" id="usuario_edita" class="input" value="<?php echo $_SESSION['usuario']?>">
                    
                    
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

<!-- Editar reservaciones siguientes-->
<div class="modal fade" id="editar_reserva_siguientes" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel"><i class="bx bx-plus"></i> Editar reservación del restaurante:</h5> 
        
        <div class="contenido_nombre">
        <input type="text" class="nombre_input" id="nombre_siguiente" disabled>
        </div>

        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
            <div class="formulario">
              <form action="../../../Controladores/Restaurantes/Recepcion/Consultar/Reservas_siguientes/editar.php" method="post" id="editar_siguientes">
                  <div class="contenido_inputs">
                    
                    <input type="hidden" class="input" name="idreserva_siguiente" id="idreserva_siguiente">

                    <div class="inputs">
                    <label>Restaurante:</label>
                    <select name="editar_restaurante_siguiente" id="editar_restaurante_siguiente" class="input" required>
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
                    <input type="text" name="editar_huesped_siguiente" id="editar_huesped_siguiente" class="input" >
                    </div>

                    <div class="inputs">
                    <label>Apellidos:</label>
                    <input type="text" name="editar_apellidos_siguiente" id="editar_apellidos_siguiente" class="input"  >
                    </div>

                    <div class="inputs">
                    <label>Villa:</label>
                    <input type="number" name="editar_villa_siguiente" id="editar_villa_siguiente" class="input" >
                    </div> 

                    <div class="inputs">
                    <label>Propiedad:</label>
                    <input type="text" name="editar_propiedad_siguiente" id="editar_propiedad_siguiente" class="input" >
                    </div>

                    <div class="inputs">
                    <label>No. personas:</label>
                    <input type="number" name="editar_no_personas_siguiente" id="editar_no_personas_siguiente" class="input" >
                    </div>

                    <div class="inputs">
                    <label>No. Niños:</label>
                    <input type="number" name="editar_no_kids_siguiente" id="editar_no_kids_siguiente" class="input" >
                    </div>

                    <div class="inputs">
                    <label>Fecha de reservación:</label>
                    <input type="date" name="editar_fecha_siguiente" id="editar_fecha_siguiente" class="input" >
                    </div>

                    <div class="inputs">
                    <label>Horario de reservación:</label>
                    <input type="time" name="editar_horario_siguiente" id="editar_horario_siguiente" class="input" >
                    </div>

                    <div class="inputs">
                    <label>Comentarios:</label>
                    <input type="text" name="editar_comentarios_siguiente" id="editar_comentarios_siguiente" class="input" >
                    </div>

                    <div class="inputs">
                    <label>¿Quién solicita la reservación?:</label>
                    <input type="text" name="editar_solicitante_siguiente" id="editar_solicitante_siguiente" class="input" >
                    </div>

                    <div class="inputs">
                    <input type="hidden" name="editar_creacion_siguiente" id="editar_creacion_siguiente" class="input" >
                    </div>
                    
                    <div class="inputs">
                    <input type="hidden" name="usuario_edita_siguiente" id="usuario_edita_siguiente" class="input" value="<?php echo $_SESSION['usuario']?>">
                    
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
