<?php 
include('../../../../../Modelos/Base/base_datos.php');//Conexion a la base de datos 
    $salida = "";
    $buscar_reservaciones = "SELECT * FROM reservas_eventos E INNER JOIN eventos de ON E.name_evento = de.id_evento WHERE fecha_reserva > CURDATE() ORDER BY name_evento,horario_reserva" ; //Consulta para solicitar todos los datos de la tabla

    if(isset($_POST['consulta'])){
        $buscar_caracteres = $conexion->real_escape_string($_POST['consulta']);//Creamos una variable para agregarle la funcion real_escape_string la cual nos servira para prevenir ataques de inyeccion sql, como estamos buscando informacion en la BD con esto evitamos alguna inyeccion que pueda mostrar informacion no deseada de la base de datos

        //Creamos una variable donde alojamos una consulta que nos servira para que en cada columna al momento de ir ingresando caracteres vaya buscando por campo, estamos seleccionando cada una de las celdas existentes en esa tabla y concatenando a la variable $buscar_caracteres
        $buscar_reservaciones = "SELECT * FROM reservas_eventos E INNER JOIN eventos EV ON E.name_evento = EV.id_evento WHERE name_evento LIKE '%".$buscar_caracteres."%' OR name_evento LIKE '%".$buscar_caracteres."%' OR id_reserva_E LIKE '%".$buscar_caracteres."%' OR huesped LIKE '%".$buscar_caracteres."%' OR apellidos LIKE '%".$buscar_caracteres."%' OR villa LIKE '%".$buscar_caracteres."%' OR propiedad LIKE '%".$buscar_caracteres."%' OR fecha_reserva LIKE '%".$buscar_caracteres."%' OR horario_reserva LIKE '%".$buscar_caracteres."%' OR solicitante LIKE '%".$buscar_caracteres."%' OR usuario LIKE '%".$buscar_caracteres."%' AND fecha_reserva > CURDATE()";
    }
    //Alojamos la conexion y la consulta en un nueva variable
    $resultado = $conexion->query($buscar_reservaciones);
    if($resultado->num_rows > 0){
        $salida.= "<table>
        <thead>
            <tr>
            <th>ID</th>
            <th>Evento</th>
            <th>Huesped</th>
            <th>Apellidos</th>
            <th>Villa</th>
            <th>Propiedad</th>
            <th>Adultos</th>
            <th>Niños</th>
            <th>Fecha</th>
            <th>Horario</th>
            <th>Comentarios</th>
            <th>Solicitante</th>
            <th>Fecha de creación</th>
            <th>En turno</th>
            </tr>
        </thead>
        <tbody>";
        while($arreglo = $resultado->fetch_assoc()){//creamos un arregalo y o asociamos con la variable que tiene alojada la consulta 
            $salida.="<tr>
                    <td>".$arreglo['id_reserva_E']."</td>
                    <td>".$arreglo['nombre_evento']."</td>
                    <td>".$arreglo['huesped']."</td>
                    <td>".$arreglo['apellidos']."</td>
                    <td>".$arreglo['villa']."</td>
                    <td>".$arreglo['propiedad']."</td>
                    <td>".$arreglo['numero_personas']."</td>
                    <td>".$arreglo['kids']."</td>
                    <td>".$arreglo['fecha_reserva']."</td>
                    <td>".$arreglo['horario_reserva']."</td>
                    <td>".$arreglo['comentarios']."</td>
                    <td>".$arreglo['solicitante']."</td>
                    <td>".$arreglo['fecha_creacion']."</td>
                    <td>".$arreglo['usuario']."</td>
                    </tr>";
                }
            $salida.="</tbody></table>";
        
        
    }else{
        $salida.="<h2 class='text-center'> No se encontraron registros en la base de datos </h2>";
    }
    echo $salida;
    $conexion->close();
?>
<!--Script para eliminar usuarios a traves de js con alerta sweetalert-->
<script>
$('.eliminar_reservacion').on('click', function(e){
     e.preventDefault();
     const href = $(this).attr('href')
 
 Swal.fire({
 title: '¿Estas seguro de eliminar la reservación',
 text: "¡No se podra revertir esta accion!",
 icon: 'warning',
 showCancelButton: true,
 confirmButtonColor: '#3085d6',
 cancelButtonColor: '#d33',
 confirmButtonText: 'Si, eliminar reservación!',
 cancelButtonText: 'Cancelar!',
 }).then((result) => {
     if(result.value){
 if (result.isConfirmed) {
 Swal.fire({
     type: 'success',
     title: 'Correcto',
     showConfirmButton: false,
     timer: 5 // es ms (mili-segundos)
 })
 }
 document.location.href = href;
     }
 })
 })
    </script>