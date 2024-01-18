<?php
include "model/conexion.php";

if (!empty($_POST["descripcion_producto"])) {
    $descripcion_p = $_POST["descripcion_producto"];

    // Verificar existencia antes de procesar el formulario
    $sqlExistencia = $conexion->query("SELECT existencia FROM productos WHERE descripcion = '$descripcion_p';");

    // Obtener el resultado de la consulta
    $resultadoExistencia = $sqlExistencia->fetch_assoc();

    if ($resultadoExistencia['existencia'] <= 15) {
        echo 'existencia_minima';
    } else {
        echo 'ok';
    }
} else {
    echo 'error';
}
?>
