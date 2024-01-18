<?php   
if(!empty($_GET["id"])){
    $id=$_GET["id"];
    $sql= $conexion->query("CALL EliminarMarcaPorEstado($id)");

    if($sql == 1){
        header("location:marcas.php");
    }else{
        echo '<div class="alert alert-info">Error Al Eliminar</div>';
    }

}

?>