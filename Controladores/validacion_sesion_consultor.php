<?php
session_start();

    if(!isset($_SESSION['rol']) && !isset($_SESSION['usuario'])){
            header ("location: ../../../index.php");    
    }else{

        if($_SESSION['rol'] != 3 && $_SESSION['usuario']){
            header ("location: ../../../Controladores/Login/validacion_registro.php");    
        }
        }
        ?>
