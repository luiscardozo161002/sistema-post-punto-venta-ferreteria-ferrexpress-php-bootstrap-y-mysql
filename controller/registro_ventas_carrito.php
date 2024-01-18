<?php
if (isset($_POST["btnregistrar"])) {
    if (!empty($_POST["descripcion_producto"]) && !empty($_POST["cantidad_vendida"])) {
        
        $producto = $_POST["descripcion_producto"];
        $cantidad = $_POST["cantidad_vendida"];

        $sql = $conexion->query("CALL InsertarVenta('$producto', $cantidad);");
        
        if ($sql == 1) {
            echo '<div class="alert alert-success">¡Producto Registrado Correctamente!</div>';
            header("location:carrito.php");
            exit(); 
        } else {
            echo '<div class="alert alert-danger">¡Error Registro Fallido!</div>';
        }    
    } else {
        echo '<div class="alert alert-danger">¡POR FAVOR LLENE LA CANTIDAD A COMPRAR!</div>';
    }
}
?>
