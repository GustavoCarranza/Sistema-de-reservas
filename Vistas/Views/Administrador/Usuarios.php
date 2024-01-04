<?php include('../../../Controladores/validacion_sesion_admin.php'); ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--Icono de pestaña-->
    <link rel="shortcut icon" href="../../img/logo.jpg" />
    <!--Css-->
    <link rel="stylesheet" href="../../css/sidebarr.css">
    <link rel="stylesheet" href="../../css/tablas_formularios.css">
    <link rel="stylesheet" href="../../css/nombres_generales.css">
    <!--Datatable-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.5.0/css/responsive.bootstrap5.min.css">
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
            <div class="tabla">
            <table id="tablas_generales" class="table table-striped nowrap" style="width:100%">
        <thead>
            <tr>
                <th class="text-center">#</th>
                <th class="text-center">Nombre</th>
                <th class="text-center">Apellidos</th>
                <th class="text-center">Correo electronico</th>
                <th class="text-center">Usuario</th>
                <th class="text-center">Telefono</th>
                <th class="text-center">Cargo</th>
                <th class="text-center">Fecha de creación</th>
                <th class="text-center">Acciones</th>
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

                    <button type="submit" class="btn_pass editar_pas" data-bs-toggle="modal" data-bs-target="#editar_pass"><i class='bx bx-lock'></i></button>  
                
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



<!--datatable-->
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.5.0/js/dataTables.responsive.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.5.0/js/responsive.bootstrap5.min.js"></script>
<!--Libreria para alertas-->
<script src="../../Sweetalerts/dist/sweetalert2.all.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<!--Ion icons-->
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script> 
<!--Js de sidebar-->
<script src="../../js/sidebar.js"></script>
<script src="../../js/usuarios.js"></script>
<script src="../../js/Datatable.js"></script>
</body>
</html>