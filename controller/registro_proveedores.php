<?php

if(!empty($_POST["btnregistrar"])){
    if(!empty($_POST["nombre"]) and !empty($_POST["telefono"]) and !empty($_POST["direccion"])){
        
        $nombre = $_POST["nombre"];
        $telefono = $_POST["telefono"];
        $direccion = $_POST["direccion"];

        $sql = $conexion->query("CALL InsertarProveedores('$nombre','$telefono','$direccion');");
        
        if($sql==1){
            echo '<div class="alert alert-success">¡Producto Registrado Correctamente!</div>';
        }else{
            echo '<div class="alert alert-danger">¡Error Registro Fallido!</div>';
        }    


    }else{
        echo '<div class="alert alert-danger">¡PORFAVOR LLENE TODOS LOS CAMPOS!</div>';
    }
}

?>