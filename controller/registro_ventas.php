<?php

if (!empty($_POST["btnregistrar"])) {
    if (!empty($_POST["descripcion_producto"]) and !empty($_POST["cantidad_vendida"])) {

        $producto = $_POST["descripcion_producto"];
        $cantidad = $_POST["cantidad_vendida"];

        // Agregada
        $sqlExistencia = $conexion->prepare("SELECT existencia FROM productos WHERE descripcion = ?");
        $sqlExistencia->bind_param("s", $producto);
        $sqlExistencia->execute();

        $resultadoExistencia = $sqlExistencia->get_result();
        $existencia = $resultadoExistencia->fetch_assoc()['existencia'];

        // Verificar existencia y cantidad_vendida
        if ($existencia <= 15 || $_POST['cantidad_vendida'] > $existencia - 15) {
            echo '<div class="alert alert-danger">Existencia Mínima: ¡No se puede adquirir!</div>';
        } else {
            $sql = $conexion->query("CALL InsertarVenta('$producto', $cantidad);");

            if ($sql == 1) {
                echo '<div class="alert alert-success">¡Producto Registrado Correctamente!</div>';
            } else {
                echo '<div class="alert alert-danger">¡Error Registro Fallido!</div>';
            }
        }
    } else {
        echo '<div class="alert alert-danger">¡PORFAVOR LLENE TODOS LOS CAMPOS!</div>';
    }
}

?>






