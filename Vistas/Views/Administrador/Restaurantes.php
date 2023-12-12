<?php include('../../../Controladores/validacion_sesion_admin.php'); ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--Css-->
    <link rel="stylesheet" href="../../css/sidebarr.css">
    <link rel="stylesheet" href="../../css/formulario_y_tablas.css">
    <link rel="stylesheet" href="../../css/nombres_generales.css">
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
                <a href="Bienvenida_administrador.php"><h3 class="nav_titulo"><i class="bx bx-wine"></i> Reservaciones en restaurantes</h3></a>
            </div>

            <ul class="nav_link nav_link--menu">
                <li class="nav_opciones">
                    <button type="submit" class="nav_links" data-bs-toggle="modal" data-bs-target="#restaurantes"><i class="bx bx-plus"></i> Agregar </button>
                </li>
				
                <!--<li class="nav_opciones">
                    <button type="submit" class="nav_links" data-bs-toggle="modal" data-bs-target="#reservas"><i class="bx bx-table"></i> Reservaciones</button>
                </li>-->

                <li class="nav_opciones">
                    <button type="submit" class="nav_links" data-bs-toggle="modal" data-bs-target="#excel"><i class="bx bx-file"></i> Excel</button>
                </li>
				<li class="nav_opciones">
                    <button type="submit" class="nav_links" data-bs-toggle="modal" data-bs-target="#pdf"><i class="bx bx-file"></i> Pdf</button>
                </li>
                <!--<li class="nav_opciones">
                    <button type="submit" class="nav_links" data-bs-toggle="modal" data-bs-target="#ocupacion"><i class="bx bx-user-plus"></i> Consultar ocupacion</button>
                </li>-->
                <img src="../../img/svg/cerrar.svg" class="nav_cerrar" alt="">
            </ul>

            <!--Menu hamburguesa-->
            <div class="nav_menu">
                <img src="../../img/svg/desplegar_menuu.svg" class="nav_img" alt="">
            </div>
        </nav>
<!--Fin de sidebar-->
    
<!--Ventanas modales -->
    <?php include("../Views_modals/Administrador/Modal_restaurantes.php");?> 
<!--Fin de ventanas-->

<!--Buscador-->
    <section class="contenido_buscador">
    <input type="search" class="buscador"  id="buscar_reservaciones">
    </section>  
<!--Fin-->

<!--Contenido de tabla-->
    <section class="contenido_tabla">
            <h2><i class="bx bx-table"></i> Reservaciones</h2>
            <div class="tabla" id="mostrar_reservaciones">
                <!--Registros-->
			</div>
    </section>
<!--Fin-->




<!--Bootstrap v5-->

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
<script src="../../js/Restaurante.js"></script>
</body>
</html>