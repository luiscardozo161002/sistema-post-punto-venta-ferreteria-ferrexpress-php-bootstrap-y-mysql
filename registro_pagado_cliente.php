<?php

include "model/conexion.php";

if (!empty($_POST["btn_registrar_pago"])) {
    if (!empty($_POST["cantidad_pago"])) {

        $input_cantidad_pago = $_POST["cantidad_pago"];
        
        $sql = $conexion->query("UPDATE detalleventas SET pago = $input_cantidad_pago");
        
        if ($sql == 1) {
            echo '<div class="alert alert-danger">¡Pago Aplicado Correctamente!</div>';
        } else {
            echo '<div class="alert alert-danger">¡Error Registro Fallido!</div>';
        }

    } else {
        echo '<div class="alert alert-danger">¡PORFAVOR LLENE TODOS LOS CAMPOS!</div>';
    }
}

?>
