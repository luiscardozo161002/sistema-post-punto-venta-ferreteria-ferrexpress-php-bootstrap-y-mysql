<?php   
if(!empty($_GET["id"])){
    $id=$_GET["id"];
    $sql= $conexion->query("CALL EliminarCompraPorEstado($id);");

    if($sql == 1){
        header("location:compras.php");
    }else{
        echo '<div class="alert alert-info">Error Al Eliminar</div>';
    }

}

?>