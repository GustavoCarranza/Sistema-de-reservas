<?php include('../../../Controladores/validacion_sesion_recepcion.php'); ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--Icono de pestaña-->
    <link rel="shortcut icon" href="../../img/logo.jpg" />
    <!--Css-->
    <link rel="stylesheet" href="../../css/sidebarr.css">
    <link rel="stylesheet" href="../../css/formularios_tablas.css">
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
                <a href="Restaurantes.php"><h3 class="nav_titulo"><i class="bx bx-wine"></i> Reservaciones en restaurantes</h3></a>
            </div>

            <ul class="nav_link nav_link--menu">
                <li class="nav_opciones">
                    <button type="submit" class="nav_links" data-bs-toggle="modal" data-bs-target="#restaurantes_siguientes"><i class="bx bx-plus"></i> Agregar </button>
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
    <?php include("../Views_modals/Recepcion/Modal_restaurantes.php");?> 
<!--Fin de ventanas-->

<!--Contenido de tabla-->
    <section class="contenido_tabla">
            <h2><i class="bx bx-table"></i> Reservaciones</h2>
            <div class="tabla">
            
    <table id="tablas_generales" class="table table-striped nowrap" style="width:100%">
        <thead>
            <tr>
                <th class="text-center" style="background: #373737; color:#fff;">#</th>
                <th class="text-center" style="background: #373737; color:#fff;">Restaurante</th>
                <th class="text-center" style="background: #373737; color:#fff;">Huesped</th>
                <th class="text-center" style="background: #373737; color:#fff;">Apellidos</th>
                <th class="text-center" style="background: #373737; color:#fff;">Villa</th>
                <th class="text-center" style="background: #373737; color:#fff;">Propiedad</th>
                <th class="text-center" style="background: #373737; color:#fff;">adultos</th>
                <th class="text-center" style="background: #373737; color:#fff;">Niños</th>
                <th class="text-center" style="background: #373737; color:#fff;">Fecha</th>
                <th class="text-center" style="background: #373737; color:#fff;">Horario</th>
                <th class="text-center" style="background: #373737; color:#fff;">Comentarios</th>
                <th class="text-center" style="background: #373737; color:#fff;">Solicitante</th>
                <th class="text-center" style="background: #373737; color:#fff;">Fecha de creación</th>
                <th class="text-center" style="background: #373737; color:#fff;">En turno</th>
                <th class="text-center" style="background: #373737; color:#fff;">Fecha de edición</th>
                <th class="text-center" style="background: #373737; color:#fff;">Editado por</th>

                <th class="text-center" style="background: #373737; color:#fff;">Acciones</th>
            </tr>
        </thead>
        <tbody>
            <?php
            include('../../../Modelos/Base/base_datos.php');
            $consulta = $conexion->query("SELECT * FROM reservas_restaurante RE INNER JOIN restaurantes R ON RE.nombre_restaurante = r.id_restaurante WHERE fecha_reserva > CURDATE()");
            foreach($consulta as $reservas){
                ?>
                <tr>
                    <td><?php echo $reservas['id_reserva_R']; ?></td>
                    <td><?php echo $reservas['nombre_restaurant']; ?></td>
                    <td><?php echo $reservas['huesped']; ?></td>
                    <td><?php echo $reservas['apellidos']; ?></td>
                    <td><?php echo $reservas['villa']; ?></td>
                    <td><?php echo $reservas['propiedad']; ?></td>
                    <td><?php echo $reservas['numero_personas']; ?></td>
                    <td><?php echo $reservas['kids']; ?></td>
                    <td><?php echo $reservas['fecha_reserva']; ?></td>
                    <td><?php echo $reservas['horario_reserva']; ?></td>
                    <td><?php echo $reservas['comentarios']; ?></td>
                    <td><?php echo $reservas['solicitante']; ?></td>
                    <td><?php echo $reservas['fecha_creacion']; ?></td>
                    <td><?php echo $reservas['usuario']; ?></td>
                    <td><?php echo $reservas['fecha_edicion']; ?></td>
                    <td><?php echo $reservas['usuario_edita']; ?></td>

                    <td>
                        <a href="../../../Controladores/Restaurantes/Recepcion/Consultar/Reservas_siguientes/eliminar.php?id_reserva=<?php echo $reservas['id_reserva_R']; ?>" class="btn_eliminar eliminar_reservacion_siguiente"><i class="bx bx-trash"></i></a>

                        <button type="submit" class="btn_editar editar_reserva_siguiente" data-bs-toggle='modal' data-bs-target='#editar_reserva_siguientes'><i class="bx bx-edit"></i></button>
                    </td>

                </tr>
            <?php
            }
            ?>            
        </tbody>
    </table>
    <?php include('../Views_modals/Recepcion/modal_editar_restaurantes.php'); ?>
			</div>
    </section>
<!--Fin-->

<script src="../../js/reservas_siguientes/Recepcion/editar_eliminar_reserva_R.js"></script>

<!--datatable-->
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.5.0/js/dataTables.responsive.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.5.0/js/responsive.bootstrap5.min.js"></script>
<!--Libreria para alertas-->
<script src="../../Sweetalerts/dist/sweetalert2.all.min.js"></script>
<!--Bootstrap V5-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<!--Ion icons-->
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script> 
<!--Js de sidebar-->
<script src="../../js/sidebar.js"></script>
<!-- JS -->
<script src="../../js/reservas_siguientes/Recepcion/agregar_reservas_R.js"></script>
<script src="../../js/Datatable.js"></script>
</body>
</html>