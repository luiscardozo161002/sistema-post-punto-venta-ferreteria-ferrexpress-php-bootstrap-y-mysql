<?php
    if(!empty($_POST["btnactualizar"])){
        if(!empty($_POST["marca"])){

            $id = $_POST["id"];
            $marca = $_POST["marca"];

            $sql = $conexion->query("CALL ActualizarMarca('$marca', $id);");

            if($sql==1){
                header("location:marcas.php");
            }else{
                echo '<div class="alert alert-danger">¡Error Actualización Fallida!</div>';
            }  
    


        }else{
            echo '<div class="alert alert-danger">¡PORFAVOR LLENE TODOS LOS CAMPOS!</div>';
        }
    }
?>
