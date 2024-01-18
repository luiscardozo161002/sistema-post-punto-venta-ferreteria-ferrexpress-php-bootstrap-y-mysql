<?php   
if(!empty($_GET["id"])){
    $id=$_GET["id"];
    $sql= $conexion->query("CALL EliminarVentaPorEstado($id);");

    if($sql == 1){
        header("location:ventas.php");
    }else{
        echo '<div class="alert alert-info">Error Al Eliminar</div>';
    }

}

?>