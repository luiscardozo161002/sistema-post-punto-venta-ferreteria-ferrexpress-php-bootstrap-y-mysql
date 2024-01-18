<?php

if (!empty($_POST["btnregistrar"])) {
    if (!empty($_POST["descripcion_producto"]) and !empty($_POST["cantidad_comprada"]) and !empty($_POST["nombre_proveedor"])) {

        $producto = $_POST["descripcion_producto"];
        $cantidad = $_POST["cantidad_comprada"];
        $proveedor = $_POST["nombre_proveedor"];

        $sqlExistencia = $conexion->prepare("SELECT existencia FROM productos WHERE descripcion = ?");
        $sqlExistencia->bind_param("s", $producto);
        $sqlExistencia->execute();

        $resultadoExistencia = $sqlExistencia->get_result();
        $existencia = $resultadoExistencia->fetch_assoc()['existencia'];

        if ($existencia + $_POST["cantidad_comprada"] >= 70) {
            echo '<div class="alert alert-danger">Existencia Máxima: ¡No se puede adquirir!</div>';
        } else {
            $sql = $conexion->query("CALL InsertarCompra('$producto', $cantidad,'$proveedor');");

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
