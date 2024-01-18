<?php
/*
if(!empty($_POST["btnregistrar"])){
    if(!empty($_POST["descripcion"]) and !empty($_POST["nombre_categoria"]) and !empty($_POST["nombre_marca"]) and !empty($_POST["nombre_proveedor"]) and !empty($_POST["precio_compra"]) and !empty($_POST["precio_venta"])  and !empty($_POST["numero_serie"]) and !empty($_POST["existencia"])){
        
        $input_descripcion      = $_POST["descripcion"];
        $input_nombre_categoria = $_POST["nombre_categoria"];
        $input_nombre_marca     = $_POST["nombre_marca"];
        $input_nombre_proveedor = $_POST["nombre_proveedor"];
        $input_precio_compra    = $_POST["precio_compra"];
        $input_precio_venta     = $_POST["precio_venta"];
        $input_numero_serie     = $_POST["numero_serie"];
        $input_existencia       = $_POST["existencia"];

        /*
        echo "Producto seleccionado: $input_descripcion";     
        echo "Categoria seleccionado: $input_nombre_categoria";
        echo "Marca seleccionado: $input_nombre_marca";    
        echo "Proveedor seleccionado: $input_nombre_proveedor";
        echo "Precio compra seleccionado: $input_precio_compra";   
        echo "Precio venta seleccionado: $input_precio_venta";    
        echo "Numero serie seleccionado: $input_numero_serie";    
        echo "Existencia seleccionado: $input_existencia";    


        $sql = $conexion->query("CALL InsertarProducto('$input_descripcion', '$input_nombre_categoria', '$input_nombre_marca ', ' $input_nombre_proveedor', $input_precio_compra, $input_precio_venta, '$input_numero_serie', $input_existencia);");
         
        if($sql==1){
            echo '<div class="alert alert-success text-center">¡Producto Registrado Correctamente!</div>';
            header("location:informacion_productos.php");
        }else{
            echo '<div class="alert alert-danger">¡Error Registro Fallido!</div>';
        } 


    }else{
        echo '<div class="alert alert-danger text-center">¡PORFAVOR LLENE TODOS LOS CAMPOS!</div>';
    }
}
*/
?>

<?php

if (!empty($_POST["btnregistrar"])) {
    if (!empty($_POST["descripcion"]) && !empty($_POST["nombre_categoria"]) && !empty($_POST["nombre_marca"]) && !empty($_POST["nombre_proveedor"]) && !empty($_POST["precio_compra"]) && !empty($_POST["precio_venta"]) && !empty($_POST["numero_serie"]) && !empty($_POST["existencia"])) {
        
        // Obtener valores del formulario
        $input_descripcion = $_POST["descripcion"];
        $input_nombre_categoria = $_POST["nombre_categoria"];
        $input_nombre_marca = $_POST["nombre_marca"];
        $input_nombre_proveedor = $_POST["nombre_proveedor"];
        $input_precio_compra = $_POST["precio_compra"];
        $input_precio_venta = $_POST["precio_venta"];
        $input_numero_serie = $_POST["numero_serie"];
        $input_existencia = $_POST["existencia"];

        // Preparar la sentencia SQL con marcadores de posición (?)
        $sql = $conexion->prepare("CALL InsertarProducto(?, ?, ?, ?, ?, ?, ?, ?)");

        // Vincular los parámetros a la sentencia
        $sql->bind_param("ssssddsi", $input_descripcion, $input_nombre_categoria, $input_nombre_marca, $input_nombre_proveedor, $input_precio_compra, $input_precio_venta, $input_numero_serie, $input_existencia);

        // Ejecutar la sentencia
        $sql->execute();

        // Verificar el resultado
        if ($sql->affected_rows == 1) {
            echo '<div class="alert alert-success text-center">¡Producto Registrado Correctamente!</div>';
            header("location:informacion_productos.php");
        } else {
            echo '<div class="alert alert-danger">¡Error Registro Fallido!</div>';
        }

        // Cerrar la sentencia
        $sql->close();

    } else {
        echo '<div class="alert alert-danger text-center">¡PORFAVOR LLENE TODOS LOS CAMPOS!</div>';
    }
}


?>