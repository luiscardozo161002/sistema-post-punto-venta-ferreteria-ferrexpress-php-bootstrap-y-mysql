<?php 
    include "model/conexion.php";

    //Recolectar el id 
    $id = $_GET["id"];

    $consulta_datos = $conexion->query("SELECT * FROM marcas WHERE id_marca = $id;");

    //Verifica si la consulta se ejecutó correctamente
    if(!$consulta_datos){
        die("Error en la consulta: " . mysqli_error($conexion));
    }
?>
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>🛠️ Ferreteria | Modificar Marca</title>
            <!--Bootstrap CSS-->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
            
            <!--Hoja de estilos-->
            <link rel="stylesheet" href="./src/css/style_productos.css">
        </head>
        <body>
        <nav class="navbar navbar-expand-lg navbar-light color_navbar p-3">
                <div class="container-fluid d-flex align-items-center justify-content-between">
                    <a class="navbar-brand" href="#" style="color:#843C0C; font-size:1.2rem;">
                        <img src="./src/images/logo_ferreteria.png" alt="" width="50" height="50" class="d-inline-block align-text-center">
                        Ferrexpress | Modificar Marca
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                      <span class="navbar-toggler-icon"></span>
                    </button>
                </div>
            
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav d-flex align-items-center justify-content-center"> 
                        <li class="nav-item">
                             <a class="nav-link active" aria-current="page" href="marcas.php" style="color:#843C0C;">Salir</a>
                        </li>
                    </ul>
                </div>
            </nav>
            
            <div class="container-fluid columns d-flex align-items-center justify-content-center">  
                <form class="col-sm-3 col-md-3 pt-4" method="POST">
                        <h3 class="text-center color_h3">Modificar Marcas</h3>
                        
                        <input type="hidden" name="id" value="<?php echo $_GET["id"]; ?>">

                        <?php
                            include "controller/modificar_marcas.php";
                            //Obtener una sola fila de resultados
                            while($datos=$consulta_datos->fetch_object()){ 
                        ?>
                        <div class="mb-1 mt-5">
                            <label for="exampleInputEmail1" class="form-label">Marca:</label>
                            <input type="text" class="form-control" name="marca" value="<?= $datos -> nombre_marca?>" onkeyup="mayus(this);"> 
                        </div>
                        <?php          
                            }
                        ?>
                        <div class="mb-1 d-flex align-items-center justify-content-center">
                        <button type="submit" class="btn mt-2" name="btnactualizar" value="ok" style="background-color:#813B0C; color:#ffffff;">Actualizar</button>    
                    </div>
                </form>
            </div>            
                        
            <!--Bootstrap JS-->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
            <!--CDN Iconicons-->
            <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
            <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
             
            <!--Script para los inputs pasarlos a MAYUSCULAS-->
            <script>
                function mayus(e) {
                    e.value = e.value.toUpperCase();
                }
            </script>                
    </body>
</html>