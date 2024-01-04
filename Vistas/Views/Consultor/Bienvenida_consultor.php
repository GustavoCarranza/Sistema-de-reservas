<?php include('../../../Controladores/validacion_sesion_consultor.php'); ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--Icono de pestaña-->
    <link rel="shortcut icon" href="../../img/logo.jpg" />
    <!--css de pagina de bienvenida.php-->
    <link rel="stylesheet" href="../../css/Bienvenida_general.css">
    <!--Bootstrap V5-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <!--bx bx-icons-->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <title>Banyan Tree Mayakoba</title>
</head>
<body>
<?php include('../../../Modelos/Paneles_control.php'); ?>
<!--header-->
        <div class="contenido_header">
        <a href="../../../Controladores/destruir_sesion.php">
        <div class="name_user">
                <span><?php echo $_SESSION['usuario']?></span>
                <img src="../../img/logo.jpg" alt="">
        </div>
        </a>
        </div>
<!--Fin-->    

<!--CREACION DEL RELOJ-->
        <section class="contenido">
    <div class="seccion">
        <p id="fecha" class="fecha"> <!--Apartado de fecha--> </p>
        <p id="tiempo" class="horario"> <!--Apartado de horario--> </p>
    </div>
        </section>
<!--Fin de reloj-->

<!--Seccion para los botones href-->
        <div class="contenedor_botones">
   
    <a href="Restaurantes.php" class="link restaurantes">
    <div class="titulos_href">
            <p>Restaurantes</p>
            <span><?= $Generales['restaurantes']; ?></span>
    </div>
    </a>

    <a href="Eventos.php" class="link eventos">
    <div class="titulos_href">
            <p>Eventos</p>
            <span><?= $Generales['eventos']; ?></span>
    </div>
    </a>

    <a href="Destinations.php" class="link destinations">
    <div class="titulos_href">
            <p>Destinations</p>
            <span><?= $Generales['destinations']; ?></span>
    </div>
    </a>

    <button type="submit" class="link graficos" data-bs-toggle="modal" data-bs-target="#graficas">
    <div class="titulos_href">
            <p>Total de Paxs</p>
            <span></span>
    </div>
    </button>

    <button type="submit" class="link graficos2" data-bs-toggle="modal" data-bs-target="#graficas2">
    <div class="titulos_href">
            <p>Paxs por centro</p>
            <span></span>
    </div>
    </button>
        </div>
<!--Fin de botones-->

<?php include('../Views_modals/Modal_graficos.php'); ?><!--Modal graficos-->

<!--Libreria para alertas-->
<script src="../sweetsalert/dist/sweetalert2.all.min.js"></script>
<!--js de reloj-->
<script src="../../js/reloj.js"></script>
<!-- bootstrap v5-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

</body>
</html>