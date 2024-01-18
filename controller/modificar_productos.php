<?php
    if(!empty($_POST["btnactualizar"])){
        if(!empty($_POST["descripcion"]) and !empty($_POST["nombre_categoria"]) and !empty($_POST["nombre_marca"]) and !empty($_POST["nombre_proveedor"]) and !empty($_POST["precio_compra"]) and !empty($_POST["precio_venta"]) and !empty($_POST["numero_serie"]) and !empty($_POST["existencia"])){
            
            $input_id = $_POST["id"];
            $input_descripcion = $_POST["descripcion"];
            $input_nombre_categoria = $_POST["nombre_categoria"];
            $input_nombre_marca = $_POST["nombre_marca"];
            $input_nombre_proveedor = $_POST["nombre_proveedor"];
            $input_precio_compra = $_POST["precio_compra"];
            $input_precio_venta = $_POST["precio_venta"];
            $input_numero_serie = $_POST["numero_serie"];
            $input_existencia = $_POST["existencia"];

    
            $sql = $conexion->query("CALL ActualizarProducto($input_id,'$input_descripcion', '$input_nombre_categoria', '$input_nombre_marca', '$input_nombre_proveedor', $input_precio_compra, $input_precio_venta, '$input_numero_serie', $input_existencia);");
            //CALL InsertarProducto("FOCO AHORRADOR","ELECTRICA","PANDOQUIT","HUGO NOGUEZ", 30, 60, "BDEUBU3H734");


            if($sql==1){
                header("location:informacion_productos.php");
            }else{
                echo '<div class="alert alert-danger">¡Error Actualización Fallida!</div>';
            }  
    
    
        }else{
            echo '<div class="alert alert-danger">¡PORFAVOR LLENE TODOS LOS CAMPOS!</div>';
        }
    }
?>