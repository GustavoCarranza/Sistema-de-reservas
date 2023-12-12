<?php include('../../../Controladores/validacion_sesion_admin.php'); ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--Css-->
    <link rel="stylesheet" href="../../css/sidebarr.css">
    <link rel="stylesheet" href="../../css/formulario_y_tablas.css">
    <!--Bootstrap V5-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <!--bx bx-icons-->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
     <!--Libreria de ajax-->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <title>Banyan Tree Mayakoba</title>
</head>
<body>
    
<!--Sidebar-->
    <nav class="nav containeer">
            <div class="nav_logo">
                <a href="Bienvenida_administrador.php"><h3 class="nav_titulo"><i class="bx bx-user"></i> Creación de usuarios</h3></a>
            </div>

            <ul class="nav_link nav_link--menu">
                <li class="nav_opciones">
                    <button type="submit" class="nav_links" data-bs-toggle="modal" data-bs-target="#usuarios"><i class="bx bx-plus"></i> Agregar usuarios </button>
                </li>
                <img src="../../img/svg/cerrar.svg" class="nav_cerrar" alt="">
            </ul>


            <!--Menu hamburguesa-->
            <div class="nav_menu">
                <img src="../../img/svg/desplegar_menuu.svg" class="nav_img" alt="">
            </div>
        </nav>
<!--Fin de sidebar-->

<!--Ventanas modales -->
    <?php include("../Views_modals/Administrador/Modal_usuarios.php");?> 
<!--Fin de ventanas-->

<!--Contenido de tabla-->
    <section class="contenido_tabla">
            <h2><i class="bx bx-table"></i> Usuarios</h2>
            <div class="tabla" id="reservas_restaurantes">
            <table>
        <thead>
            <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Apellidos</th>
            <th>Correo</th>
            <th>Usuario</th>
            <th>Telefono</th>
            <th>Cargo</th>
            <th>Fecha de creación</th>
            <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <?php
            include('../../../Modelos/Base/base_datos.php');
            $consulta = $conexion->query("SELECT * FROM usuarios u INNER JOIN roles r ON u.rol_usuario = r.id_rol");
            foreach($consulta as $usuarios){
            ?>

            <tr>
                <td><?php echo $usuarios['id_usuario']; ?></td>
                <td><?php echo $usuarios['nombre']; ?></td>
                <td><?php echo $usuarios['apellidos']; ?></td>
                <td><?php echo $usuarios['correo']; ?></td>
                <td><?php echo $usuarios['usuario']; ?></td>
                <td><?php echo $usuarios['telefono']; ?></td>
                <td><?php echo $usuarios['nombre_rol']; ?></td>
                <td><?php echo $usuarios['fecha_creacion']; ?></td>

                <td>
                <a href="../../../Controladores/Usuarios/eliminar_usuario.php?idusuario=<?php echo $usuarios['id_usuario'] ?>" class="btn_eliminar eliminar_usuario"><i class='bx bx-trash'></i></a>
                
                <button type="submit" class="btn_editar editar_user" data-bs-toggle="modal" data-bs-target="#editar_user"><i class='bx bx-edit'></i></button>

                <button type="submit" class="btn_passs editar_pas" data-bs-toggle="modal" data-bs-target="#editar_pass"><i class='bx bx-lock'></i></button>  
                
                <?php include("../Views_modals/Administrador/Modal_usuarios.php");?> <!--Modal para editar usuario-->
                </td>
            </tr>
            
            <?php
            }
            ?>
        </tbody>
        </table>    
			</div>
    </section>
    <!--Fin-->



</script>



<!--Bootstrap v5-->


<!--Libreria para alertas-->
<script src="../../Sweetalerts/dist/sweetalert2.all.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<!--Ion icons-->
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script> 
<!--Js de sidebar-->
<script src="../../js/sidebar.js"></script>
<script src="../../js/usuario.js"></script>
</body>
</html>