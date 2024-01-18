<?php
    if(!empty($_POST["btnactualizar"])){
        if(!empty($_POST["cantidad_vendida"])){

            $cantidad_vendida = $_POST["cantidad_vendida"];

            $sql=$conexion->query("CALL ActualizarVenta($id,'$cantidad_vendida');");

            if($sql==1){
                header("location:ventas.php");
            }else{
                echo '<div class="alert alert-danger">¡Error Actualización Fallida!</div>';
            }  

        }else{
            echo '<div class="alert alert-danger">¡PORFAVOR LLENE TODOS LOS CAMPOS!</div>';
        }
    }
?>
