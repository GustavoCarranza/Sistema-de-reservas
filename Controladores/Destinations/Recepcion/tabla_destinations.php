<?php 
include('../../../Modelos/Base/base_datos.php');//Conexion a la base de datos 
    $salida = "";
    $buscar_reservaciones = "SELECT * FROM reservas_destinations r INNER JOIN destinations nr ON r.name_destination = nr.id_destinations ORDER BY name_destination,horario_reserva,fecha_reserva" ; //Consulta para solicitar todos los datos de la tabla

    if(isset($_POST['consulta'])){
        $buscar_caracteres = $conexion->real_escape_string($_POST['consulta']);//Creamos una variable para agregarle la funcion real_escape_string la cual nos servira para prevenir ataques de inyeccion sql, como estamos buscando informacion en la BD con esto evitamos alguna inyeccion que pueda mostrar informacion no deseada de la base de datos

        //Creamos una variable donde alojamos una consulta que nos servira para que en cada columna al momento de ir ingresando caracteres vaya buscando por campo, estamos seleccionando cada una de las celdas existentes en esa tabla y concatenando a la variable $buscar_caracteres
        $buscar_reservaciones = "SELECT * FROM reservas_destinations r INNER JOIN destinations nr ON r.name_destination = nr.id_destinations WHERE CONCAT(nombre_destination, ' ' ,fecha_reserva) LIKE '%".$buscar_caracteres."%' OR huesped LIKE '%".$buscar_caracteres."%' OR apellidos LIKE '%".$buscar_caracteres."%' OR solicitante LIKE '%".$buscar_caracteres."%' ORDER BY fecha_reserva,horario_reserva";
    }
    //Alojamos la conexion y la consulta en un nueva variable
    $resultado = $conexion->query($buscar_reservaciones);
    if($resultado->num_rows > 0){
        $salida.= "<table>
        <thead>
            <tr>
            <th>ID</th>
            <th>Destination</th>
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
            <th>Acciones</th>
            </tr>
        </thead>
        <tbody>";
        while($arreglo = $resultado->fetch_assoc()){//creamos un arregalo y o asociamos con la variable que tiene alojada la consulta 
            $salida.="<tr>
                    <td>".$arreglo['id_reserva_D']."</td>
                    <td>".$arreglo['nombre_destination']."</td>
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
                    <td>
                    "./*Boton para eliminar descansos*/"
                    <a href='../../../Controladores/Destinations/Recepcion/eliminar_reservaciones.php?id_reserva=". $arreglo['id_reserva_D']."' class='btn_eliminar eliminar_desti'><i class='bx bx-trash'></i></a>
                    
                    "./*Boton para cambiar descanso*/"
                    <button type='submit' class='btn_editar editar_destinations' data-bs-toggle='modal' data-bs-target='#editar_reserva'><i class='bx bx-edit'></i></button> 

                    </td>
                    </tr>";
                    include('../../../Vistas/Views/Views_modals/Recepcion/Modal_destinations.php');//Modal para editar informacion del practicante 
                }
            $salida.="</tbody></table>";
        
        
    }else{
        $salida.="<h2 class='text-center'> No se encontraron registros en la base de datos </h2>";
    }
    echo $salida;
    $conexion->close();
?>
<!--js para editar y eliminar en destinations-->
<script src="../../../Vistas/js/Recepcion/Editar_info_destinations.js"></script>

