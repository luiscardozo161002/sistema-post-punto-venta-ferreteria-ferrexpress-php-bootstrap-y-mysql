<?php

if (!empty($_POST["btnregistrar"])) {
    if (!empty($_POST["descripcion"]) and !empty($_POST["direccion"]) and !empty($_POST["ubicacionproductos"])) {

        $descripcion = $_POST["descripcion"];
        $direccion = $_POST["direccion"];
        $ubicacionproductos = $_POST["ubicacionproductos"];
        
        $sql = $conexion->query("CALL InsertarAlmacen('$descripcion', '$direccion', '$ubicacionproductos');");
        
        if ($sql == 1) {
            echo '<div class="alert alert-success">¡Categoria Registrada Correctamente!</div>';
        } else {
            echo '<div class="alert alert-danger">¡Error Registro Fallido!</div>';
        }

    } else {
        echo '<div class="alert alert-danger">¡PORFAVOR LLENE TODOS LOS CAMPOS!</div>';
    }
}

?>
