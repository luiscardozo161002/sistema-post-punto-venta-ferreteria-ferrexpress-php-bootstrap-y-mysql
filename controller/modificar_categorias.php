<?php
    if(!empty($_POST["btnactualizar"])){
        if(!empty($_POST["categoria"])){

            $id = $_POST["id"];
            $categoria = $_POST["categoria"];

            $sql = $conexion->query("CALL ActualizarCategoria('$categoria', $id);");

            if($sql==1){
                header("location:categorias.php");
            }else{
                echo '<div class="alert alert-danger">¡Error Actualización Fallida!</div>';
            }  
    


        }else{
            echo '<div class="alert alert-danger">¡PORFAVOR LLENE TODOS LOS CAMPOS!</div>';
        }
    }
?>
