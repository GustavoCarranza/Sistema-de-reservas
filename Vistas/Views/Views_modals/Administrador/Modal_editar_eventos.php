<!-- Editar reservacion -->
<div class="modal fade" id="editar_reserva" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-xl">
    <div class="modal-content">
      <div class="modal-header">
      <h5 class="modal-title" id="staticBackdropLabel"><i class="bx bx-plus"></i> Editar reservación en el  evento:</h5> 
        
        <div class="contenido_nombre">
        <input type="text" class="nombre_input" id="nombre" disabled>
        </div>

        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
            <div class="formulario">
              <form action="../../../Controladores/Destinations/Administrador/editar_reservacion.php" method="post" id="editar_info_evento">
                  <div class="contenido_inputs">
                    
                    <input type="hidden" class="input" name="idreserva_E" id="idreserva_E">

                    <div class="inputs">
                    <label>Eventos:</label>
                    <select name="editar_evento" id="editar_evento" class="input" required>
                                    <option selected disabled >Selecciona un evento</option>
                                    <option value="1">Navidad</option>
                    </select>
                    </div>

                    <div class="inputs">
                    <label>Huesped:</label>
                    <input type="text" name="editar_huesped" id="editar_huesped" class="input" >
                    </div>

                    <div class="inputs">
                    <label>Apellidos:</label>
                    <input type="text" name="editar_apellidos" id="editar_apellidos" class="input" >
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
                    <button type="submit" class="add_user"><i class="bx bx-edit"></i> Editar </button>
                    </div>
              </form>   
            </div>
      </div>
    </div>
  </div>
</div>
<!--Fin-->