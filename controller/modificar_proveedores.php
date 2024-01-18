<?php
    if(!empty($_POST["btnactualizar"])){
        if(!empty($_POST["nombre"]) and !empty($_POST["telefono"] and !empty($_POST["direccion"]))){

            $nombre = $_POST["nombre"];
            $telefono = $_POST["telefono"];
            $direccion = $_POST["direccion"];

            $sql=$conexion->query("CALL ActualizarProveedor($id,'$nombre','$telefono','$direccion');");


            if($sql==1){
                header("location:proveedores.php");
            }else{
                echo '<div class="alert alert-danger">¡Error Actualización Fallida!</div>';
            }  
    


        }else{
            echo '<div class="alert alert-danger">¡PORFAVOR LLENE TODOS LOS CAMPOS!</div>';
        }
    }
?>
