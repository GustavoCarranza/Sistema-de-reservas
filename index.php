<?php
//Validamos si una sesion esta iniciada y quiere regresar al login redireccione siempre a su sesion dependiendo del usuario y rol que tenga 
session_start();
if(isset($_SESSION['usuario']) && $_SESSION['rol'] == 1){  
    header('location: Vistas/Views/Administrador/Bienvenida_administrador.php ');
}
else if (isset($_SESSION['usuario']) && $_SESSION['rol'] == 2){  
    header('location: Vistas/Views/Recepcionista/Bienvenida_recepcionista.php ');
}
else if (isset($_SESSION['usuario']) && $_SESSION['rol'] == 3){  
    header('location: Vistas/Views/Consultor/Bienvenida_consultor.php ');
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--Icono de pestaña-->
    <link rel="shortcut icon" href="Vistas/img/logo.jpg" />
    <!--Css-->
    <link rel="stylesheet" href="Vistas/css/loginn.css">
    <!--Bootstrap V5-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <!--bx bx-icons-->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <title>Banyan Tree Mayakoba</title>
</head>
<body>
    
    <!--Contenido del login general-->
    <div class="contenedor">
            <h1 class="titulo">Iniciar sesion </h1>
            <form action="Controladores/Login/validacion_registro.php" method="post">
                
                <div class="input">
                <i class="bx bx-user"></i><input type="text" name="usuario" id="">
                <label class="titulo_inputs">Ingresar usuario: </label>
                </div><br>
                
                <div class="input">
                <i class="bx bx-key"></i><input type="password" name="clave" id="">
                <label class="titulo_inputs">Ingresar contraseña: </label>
                </div><br><br>

                <button type="submit" class="btn_login"><i class="bx bx-check-circle"></i> Ingresar</button>
        </form>
    </div>
    <!--Fin de contenido-->

    <!--FOOTER-->
    <footer>
        <div class="contenido_footer">
            <h3>Sistema de reservaciones de restaurante Banyan Tree Mayakoba</h3>
            <p>Copyright <?php echo date('Y') ?> &#9400 Developed by Gustavo Carranza Rivera </p>
        </div>
    </footer>
    <!--Fin de Footer-->


<!--Bootstrap v5-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<!--Ion icons-->
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script> 
</body>
</html>