<?php
session_start();
session_destroy();
echo "
        <script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>
        <script language='JavaScript'>
        document.addEventListener('DOMContentLoaded', function() {
        Swal.fire(
            '¡Sesión cerrada!',
            'Regresa pronto!',
            'success',)
            .then(function() {
             window.location = '../index.php';
            })
            });
        </script>";
exit();
?>