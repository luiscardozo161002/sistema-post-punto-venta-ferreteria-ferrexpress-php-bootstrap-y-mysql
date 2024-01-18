<?php   
if(!empty($_GET["id"])){
    $id=$_GET["id"];
    $sql= $conexion->query("CALL EliminarProductoPorEstado($id)");

    if($sql == 1){
        header("location:informacion_productos.php");
    }else{
        echo '<div class="alert alert-info">Error Al Eliminar</div>';
    }

}

?>