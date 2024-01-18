<?php

if (!empty($_POST["btnregistrar"])) {
    if (!empty($_POST["marcas"])) {

        $input_marcas = $_POST["marcas"];
        
        // Agrega comillas simples al valor de la categoría
        $sql = $conexion->query("CALL InsertarMarca('$input_marcas');");
        
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
