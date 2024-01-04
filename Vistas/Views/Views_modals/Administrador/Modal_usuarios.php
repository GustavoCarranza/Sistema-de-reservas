<!-- Agregar usuario -->
<div class="modal fade" id="usuarios" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel"><i class="bx bx-plus"></i> Nuevo usuario</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
            <div class="formulario">
              <form action="../../../Controladores/Usuarios/agregar_usuario.php" method="post" id="form_usuarios">
                  <div class="contenido_inputs">
                    
                
                    <div class="inputs">
                    <label>Nombre:</label>
                    <input type="text" name="nombre" id="nombre" class="input" required>
                    </div>

                    <div class="inputs">
                    <label>Apellidos:</label>
                    <input type="text" name="apellidos" id="apellidos" class="input" required>
                    </div>

                    <div class="inputs">
                    <label>Correo:</label>
                    <input type="email" name="correo" id="correo" class="input" required>
                    </div>

                    <div class="inputs">
                    <label>Usuario:</label>
                    <input type="text" name="usuarios" id="usuarios" class="input" required>
                    </div>

                    <div class="inputs">
                    <label>Contraseña:</label>
                    <input type="password" name="password" id="password" class="input" required>
                    </div>

                    <div class="inputs">
                    <label>Confimar contraseña:</label>
                    <input type="password" name="confirmar_password" id="confirmar_password" class="input" required>
                    </div>

                    <div class="inputs">
                    <label>Teléfono:</label>
                    <input type="number" name="telefono" id="telefono" class="input" required>
                    </div>

                    <div class="inputs">
                    <label>Cargo a desempeñar:</label>
                    <select name="tipo_rol" id="tipo_rol" class="input" required>
                        <option selected disabled>Selecciona un cargo...</option>
                        <?php include('../../../Modelos/Base/base_datos.php'); 
                        $consulta = $conexion->query("SELECT * FROM roles");
                        foreach($consulta as $usuarios){
                          echo "<option value='".$usuarios['id_rol']."'>".$usuarios['nombre_rol']."</option>";
                        }
                        ?>
                    </select>
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

<!-- Editar informacion del usuario -->
<div class="modal fade" id="editar_user" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel"><i class="bx bx-plus"></i> Editar información usuario con el rol de: </h5>
        <div class="contenido_nombre">
        <input type="text" class="nombre_input" id="nombres" disabled>
        </div>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
            <div class="formulario">
              <form action="../../../Controladores/Usuarios/editar_usuario.php" method="post" id="form_edit_user">
                  <div class="contenido_inputs">
                    
                    <input type="hidden" name="id_usuario" id="id_usuario">

                    <div class="inputs">
                    <label>Rol de usuario: </label>
                    <select name="editar_rol_usuario" id="editar_rol_usuario" class="input" required>
                                    <option selected disabled >Selecciona un rol</option>
                                    <option value="1">Administrador</option>
                                    <option value="2">Recepcionista</option>
                                    <option value="3">Consultor</option>
                    </select>
                    </div>

                    <div class="inputs">
                    <label>Nombre:</label>
                    <input type="text" name="editar_nombre" id="editar_nombre" class="input" required>
                    </div>

                    <div class="inputs">
                    <label>Apellidos:</label>
                    <input type="text" name="editar_apellidos" id="editar_apellidos" class="input" required>
                    </div>

                    <div class="inputs">
                    <label>Correo:</label>
                    <input type="email" name="editar_correo" id="editar_correo" class="input" required>
                    </div>

                    <div class="inputs">
                    <label>Teléfono:</label>
                    <input type="number" name="editar_telefono" id="editar_telefono" class="input" required>
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

<!-- Editar password-->
<div class="modal fade" id="editar_pass" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel"><i class="bx bx-plus"></i> Cambiar contraseña de usuario</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
            <div class="formulario">
              <form action="../../../Controladores/Usuarios/editar_password.php" method="post" id="form_edit_password">
                  <div class="contenido_inputs">
                    
                    <input type="hidden" name="id" id="id">

                    <div class="inputs">
                    <label>Nueva contraseña: </label>
                    <input type="password" name="editar_password" id="editar_password" class="input" required>
                    </div>

                    <div class="inputs">
                    <label>Confirmar contraseña:</label>
                    <input type="password" name="editar_confirmar" id="editar_confirmar" class="input" required>
                    </div>

                    </div>
                  </div>

                    <div class="btn_agregar">
                    <button type="submit" class="add_user"><i class="bx bx-lock"></i> cambiar</button>
                    </div>
              </form>   
            </div>
      </div>
    </div>
  </div>
</div>
<!--Fin-->