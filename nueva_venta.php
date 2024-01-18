<?php
    include "model/conexion.php"; 

    $sql = $conexion->query("UPDATE detalleventas SET estado = 0;");

            
    if($sql==1){
        echo '<div class="alert alert-success">¡Registra una nueva venta!</div>';
        header("location:ventas.php");
    }else{
        echo '<div class="alert alert-danger">¡Error al generar nueva venta!</div>';
    }    


?>