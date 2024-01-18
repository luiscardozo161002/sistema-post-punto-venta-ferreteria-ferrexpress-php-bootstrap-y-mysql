<?php
    if(!empty($_POST["btnactualizar"])){
        if(!empty($_POST["descripcion_producto"]) and  !empty($_POST["cantidad_comprada"]) and  !empty($_POST["nombre_proveedor"])){

            $producto = $_POST["descripcion_producto"];
            $cantidad = $_POST["cantidad_comprada"];
            $proveedor = $_POST["nombre_proveedor"];
                

            $sql=$conexion->query("CALL ActualizarCompra($id, '$producto',$cantidad, '$proveedor');");
            //CALL ActualizarCompra(5, "KG DE CABLE DE COBRE 220VLTS",15, 'HUGO NOGUEZ');

            if($sql==1){
                header("location:compras.php");
            }else{
                echo '<div class="alert alert-danger">¡Error Actualización Fallida!</div>';
            }  

        }else{
            echo '<div class="alert alert-danger">¡PORFAVOR LLENE TODOS LOS CAMPOS!</div>';
        }
    }
?>
 